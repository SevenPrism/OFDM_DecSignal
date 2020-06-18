% function [BER,p]=tdpdproess(ibo,snr)
snr='none';
ibo=3.23;
dd=1;
% nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;
method='average';
loop=10000;
ber=zeros(1,loop);
e=zeros(1,loop);
me=modem.qammod(16);
de=modem.qamdemod(16);
N=256;
cap=N;
num=sqrt((10/dd)*10^(ibo/10));
aa=0.1;
bb=0.1;

Tab_a=ones(1,cap); %ʱ��Ԥʧ����Ȳ�ѯ��
Tab_p=zeros(1,cap); %ʱ��Ԥʧ����λ��ѯ��
address=zeros(1,N); %������
%--------------------------------------------����Ϊ���Զ���,֮��Ϊ�����ٶȶ���
% Ina=ones(1,N);
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
        [address(uj),Ina1(uj)]=Q(Ina(uj),sqrt(3),cap);% Q: adrress function
        Outa(uj)=Ina1(uj)*Tab_a(address(uj));
        Outp(uj)=Inp(uj)+Tab_p(address(uj));
    end
    
    d1=p2c(Ina1,Inp);
    switch method
        case 'average'
            [y1,y2,y3,p1,p2,p3]=average(d1);
        case 'cubic'
            [y1,y2,y3,p1,p2,p3]=cubic(d1);
    end
    %------------------------------------------
    %--------------------the first layer
    Ina_a=abs(y1);
    Inp_a=angle(y1);
    
    [ya_a,yp_a]=HPA(Ina_a,Inp_a);
    y_a=p2c(ya_a,(yp_a));
    
    %-----------------------the second layer
    Ina_b=abs(y2);
    Inp_b=angle(y2);
    
    [ya_b,yp_b]=HPA(Ina_b,Inp_b);
    y_b=p2c(ya_b,(yp_b));
    
    %-----------------------the third layer
    Ina_c=abs(y3);
    Inp_c=angle(y3);
    
    [ya_c,yp_c]=HPA(Ina_c,Inp_c);
    y_c=p2c(ya_c,yp_c);
    %-------------------------------
    y=y_a+y_b+y_c;
    %-----------------------------------------------��ʼ������
    ya=abs(y);
    yp=angle(y);
    
    for ui=1:length(address)    %ʱ��Ԥʧ����¹�ʽ
        Tab_a(address(ui))=Tab_a(address(ui))-aa*(ya(ui)-Ina1(ui));
        Tab_p(address(ui))=Tab_p(address(ui))-bb*Ep(yp(ui)-Inp(ui));
    end
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=y;
    else
        Yreceive=awgn(y,snr,'measured');
    end
    
    Go=Yreceive;     %����
    
    Gone=fft(Go)/sqrt(N);  %������fft
    Gone=reshape(Gone,1,length(Gone));  %�����任
    Result=demodulate(de,Gone*num);
    z=Gone*num;
    e(start)=mean(abs(Gone-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
    [bes,ber(start)]=biterr(Result,data);
    %     [ses,ser(start)]=symerr(Result,data);
end
BER=mean(ber(loop-2500:loop));
% SER=mean(ser(loop-2500:loop));
p=mean(spower(y)/3);
plot(z,'*')
