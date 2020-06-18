function [BER,v]=cut(ibo,snr)
% snr='none';
% ibo=0;
dd=1;
% nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;

loop=10000;
ber=zeros(1,loop);
e=zeros(1,loop);
me=modem.qammod(16);
de=modem.qamdemod(16);
N=256;

num=sqrt((10/dd)*10^(ibo/10));



for start=1:loop
    data=randint(1,N,16);
    data1=modulate(me,data);
    xo=data1/num;
    xT=xo;
    d=ifft(xT)*sqrt(N);
    Ina=abs(d);
    Inp=angle(d);
    
    [ya,yp]=idear(Ina,Inp,sqrt(2));
    y=p2c(ya,yp);
    
    %-----------------------------------------------开始做反馈
    
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=y;
    else
        Yreceive=awgn(y,snr,'measured');
    end
    
    Go=Yreceive;     %反馈
    
    Gone=fft(Go)/sqrt(N);  %反馈做fft
    Gone=reshape(Gone,1,length(Gone));  %串并变换
    Result=demodulate(de,Gone*num);
    z=Gone*num;
    e(start)=mean(abs(Gone-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
    [bes,ber(start)]=biterr(Result,data);
%     [ses,ser(start)]=symerr(Result,data);
end
BER=mean(ber);
% SER=mean(ser(loop-2500:loop));
v=mean(abs(y)/sqrt(3));
% plot(z,'*')
