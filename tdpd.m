% function [BER,v]=tdpd(ibo,snr)
snr='none';
ibo=0;
dd=1;
% nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;

loop=1;
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
    
   
    %-----------------------------------------------开始做反馈
    
    %------------------------------------------------------------
    
%     [ses,ser(start)]=symerr(Result,data);
end

[papr0,pp]=ccdf(Ina);
plot(papr0,pp)
