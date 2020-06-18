function [BER,v1,v2,v3,p]=process(ibo,snr,method)
% tic
% clear
N=4096;
% snr=20;
% ibo=-3;
% method='average';
dd=1;
num=sqrt((10/dd)*10^(ibo/10));

loop=100;
ber=zeros(1,loop);
% e=zeros(1,loop);
me=modem.qammod(16);
%     xT=addzeros(xo,dd);
de=modem.qamdemod(16);


%------------------------------------------------
for start=1:loop
%     data=r(xT)*sqrt(N);
    data=randi(16,N,1)-1;
    xo=modulate(me,data)/num;
    d=ifft(xo);
    yOFDM=d*sqrt(N);
    Ina=abs(yOFDM);
    %------------------------------------------
    switch method
        case 'average'
            [y1,y2,y3,p1,p2,p3]=average(yOFDM,1,1);
        case 'cubic'
            [y1,y2,y3,p1,p2,p3]=cubic(yOFDM,1,1);
        case 'cubic_delta'
            [y1,y2,y3,p1,p2,p3]=cubic_delta(yOFDM);
    end
    %------------------------------------------
    %--------------------the first layer
    Ina_a=abs(y1);
    Inp_a=angle(y1);
 
    [ya_a,yp_a]=idear(Ina_a,Inp_a,sqrt(2));
    y_a=p2c(ya_a,yp_a);
    
    %-----------------------the second layer
    Ina_b=abs(y2);
    Inp_b=angle(y2);
    
    [ya_b,yp_b]=idear(Ina_b,Inp_b,sqrt(2));
    y_b=p2c(ya_b,(yp_b));
    %-----------------------the third layer
    Ina_c=abs(y3);
    Inp_c=angle(y3);
    
    [ya_c,yp_c]=idear(Ina_c,Inp_c,sqrt(2));
    y_c=p2c(ya_c,yp_c);
    %-----------------------------------------------开始做反馈
    y=y_a+y_b+y_c;
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=y;
    else
        Yreceive=awgn(y,snr,'measured');
    end
    
    Go=Yreceive;     %反馈
    
    Gone=fft(Go)/sqrt(N);  %反馈做fft
    Gone1=reshape(Gone,1,length(Gone));  %串并变换
    % receive=Gone*num;
    
%     Gone1=quitzero(Gone,N);
    Result=demodulate(de,Gone1*num);
%     z=Gone1*num;
%     e(start)=mean(abs(Gone1-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
%     [bes,ber(start)]=biterr(Result,data);
    [bes,ber(start)]=biterr(Result,data');
%     [ses,ser(start)]=symerr(Result,data);
end

BER=mean(ber);
xiaohao_a=mean(panduan(abs(y_a)),2);
xiaohao_b=mean(panduan(abs(y_b)),2);
xiaohao_c=mean(panduan(abs(y_c)),2);
shuchu_a=mean(abs(y_a));
shuchu_b=mean(abs(y_b));
shuchu_c=mean(abs(y_c));
v1=shuchu_a/xiaohao_a;
v2=shuchu_b/xiaohao_b;
v3=shuchu_c/xiaohao_c;
p=(v1+v2+v3)/3;


% gp2=ze(y_b);
% gp3=ze(y_c);
% v1=mean(abs(y_a)/1);
% v2=mean(abs(gp2)/1);
% v3=mean(abs(gp3)/1);
% p=(v1+v2+v3)/3;