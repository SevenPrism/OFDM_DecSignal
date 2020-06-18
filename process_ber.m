function BER=process_ber(ibo,snr)
% ibo=6;
% snr=20;
N=4096;
dd=1;
num=sqrt((10/dd)*10^(ibo/10));
loop=100;
ber=zeros(1,loop);
me=modem.qammod(16);
de=modem.qamdemod(16);
%------------------------------------------------
for start=1:loop
    data=randi(16,N,1)-1;
    xo=modulate(me,data)/num;
    d=ifft(xo);
    yOFDM=d*sqrt(N);
    
    Ina_a=abs(yOFDM);
    Inp_a=angle(yOFDM);
 
    [ya,yp]=idear(Ina_a,Inp_a,sqrt(1.25));
    yOFDM_lim=p2c(ya,yp);
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=yOFDM_lim;
    else
        Yreceive=awgn(yOFDM_lim,snr,'measured');
    end 
    Go=Yreceive;     %反馈
    Gone=fft(Go)/sqrt(N);  %反馈做fft
    Gone1=reshape(Gone,1,length(Gone));  %串并变换
    Result=demodulate(de,Gone1*num);
    [bes,ber(start)]=biterr(Result,data');
end
BER=mean(ber);

