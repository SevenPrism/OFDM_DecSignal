function [BER]=tested(ibo)
% snr='none';
% ibo=0;
dd=1;
nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;

loop=2000;
e=zeros(1,loop);
me=modem.qammod(16);
de=modem.qamdemod(16);
N=256;
cap=N;
num=sqrt((10/dd)*10^(ibo/10));
aa=0;
bb=0;

Tab_a=ones(1,cap); %ʱ��Ԥʧ����Ȳ�ѯ��
Tab_p=zeros(1,cap); %ʱ��Ԥʧ����λ��ѯ��
address=zeros(1,N); %������
%--------------------------------------------����Ϊ���Զ���,֮��Ϊ�����ٶȶ���
Ina=ones(1,N);
Ina1=ones(1,N);
Outa=ones(1,N);
Outp=zeros(1,N);



for start=1:loop
    data=randint(1,N,16);
    data1=modulate(me,data);
    xo=data1/num;
    xT=xo;
    d=ifft(xT)*sqrt(N);
    Ina=abs(d);
    Inp=angle(d);
    for uj=1:length(Ina)                          %ʱ��Ԥʧ��
        [address(uj),Ina1(uj)]=Q(Ina(uj),sqrt(1),cap);% Q: adrress function
    end
    
    [ya,yp]=HPA(Ina1,Inp);
    y=p2c(ya,yp);
    
    
    %-----------------------------------------------��ʼ������
    
    %------------------------------------------------------------
%     if strcmp(snr,'none')
%         Yreceive=y;
%     else
%         Yreceive=awgn(y,snr,'measured');
        Yreceive=y+nc;
%     end
    
    Go=Yreceive;     %����
    
    Gone=fft(Go)/sqrt(N);  %������fft
    Gone=reshape(Gone,1,length(Gone));  %�����任
    Result=demodulate(de,Gone*num);
    z=Gone*num;
    e(start)=mean(abs(Gone-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
    [bes,ber(start)]=biterr(Result,data);
    [ses,ser(start)]=symerr(Result,data);
end
% BER=mean(ber(loop-2500:loop));
BER=mean(ber);
e0nc=10*log10(spower(y)/spower(nc))
% SER=mean(ser(loop-2500:loop));
% p=mean(spower(y)/3);
% plot(z,'*')
