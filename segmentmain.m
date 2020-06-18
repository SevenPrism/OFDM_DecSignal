function [BER,v1,v2,v3,p,p2]=segmentmain(ibo,snr)
% tic

dd=1;
% nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;
% ibo=0;
% snr='none';

loop=1000;
ber=zeros(1,loop);
e=zeros(1,loop);
me=modem.qammod(16);
de=modem.qamdemod(16);
N=256;
num=sqrt((10/dd)*10^(ibo/10));
%------------------------------------------------
for start=1:loop
    data=randint(1,N,16);
    data1=modulate(me,data);
    xo=data1/num;
    xT=addzeros(xo,dd);
    d=ifft(xT)*sqrt(N);
    %------------------------------------------
    [y1,y2,y3,p1,p2,p3]=segment(d);
    %------------------------------------------
    %--------------------the first layer
    Ina_a=abs(y1);
    Inp_a=angle(y1);

    [ya_a,yp_a]=idear(Ina_a,Inp_a,0.5);
    y_a=p2c(ya_a,(yp_a));

    %-----------------------the second layer
    Ina_b=abs(y2);
    Inp_b=angle(y2);

    [ya_b,yp_b]=idear(Ina_b,Inp_b,1);
    y_b=p2c(ya_b,(yp_b));
    %-----------------------the third layer
    Ina_c=abs(y3);
    Inp_c=angle(y3);

    [ya_c,yp_c]=idear(Ina_c,Inp_c,sqrt(1.75));
    y_c=p2c(ya_c,yp_c);
    %-----------------------------------------------开始做反馈
    y=(y_a+y_b+y_c);
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=y;
    else
        Yreceive=awgn(y,snr,'measured');
    end

    Go=Yreceive;     %反馈

    Gone=fft(Go)/sqrt(N);  %反馈做fft
    Gone=reshape(Gone,1,length(Gone));  %串并变换
    % receive=Gone*num;

    Gone1=quitzero(Gone,N);
    Result=demodulate(de,Gone1*num);
    z=Gone1*num;
    e(start)=mean(abs(Gone1-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
    [bes,ber(start)]=biterr(Result,data);
    %     [ses,ser(start)]=symerr(Result,data);
end
BER=mean(ber);

ypa=mean(abs(y_a)/0.5);
ypb=mean(ze(abs(y_b))/1);
ypc=mean(ze(abs(y_c))/sqrt(1.75));
p2=(ypa+ypb+ypc)/3;

v1=mean(abs(y_a)/0.5);
v2=mean(abs(y_b)/1);
v3=mean(abs(y_c)/sqrt(1.75));
p=(v1+v2+v3)/3;