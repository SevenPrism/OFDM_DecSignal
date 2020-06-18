% function [BER,p1,pg2,pg3,p]=process(ibo,snr,method)
% tic
% clear
snr='none';
ibo=0;
method='cubic';
dd=1;
% nc=(randn(1,256)+randn(1,256)*1i)/sqrt(2)/10;

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

Tab_a_a=ones(1,cap); %ʱ��Ԥʧ����Ȳ�ѯ��
Tab_p_a=zeros(1,cap); %ʱ��Ԥʧ����λ��ѯ��
address_a=zeros(1,N); %������

Tab_a_b=ones(1,cap); %ʱ��Ԥʧ����Ȳ�ѯ��
Tab_p_b=zeros(1,cap); %ʱ��Ԥʧ����λ��ѯ��
address_b=zeros(1,N); %������

Tab_a_c=ones(1,cap); %ʱ��Ԥʧ����Ȳ�ѯ��
Tab_p_c=zeros(1,cap); %ʱ��Ԥʧ����λ��ѯ��
address_c=zeros(1,N); %������
%--------------------------------------------����Ϊ���Զ���,֮��Ϊ�����ٶȶ���
Ina1_a=ones(1,N);
Outa_a=ones(1,N);
Outp_a=zeros(1,N);
Ina1_b=ones(1,N);
Outa_b=ones(1,N);
Outp_b=zeros(1,N);
Ina1_c=ones(1,N);
Outa_c=ones(1,N);
Outp_c=zeros(1,N);
%------------------------------------------------
for start=1:loop
    data=randint(1,N,16);
    data1=modulate(me,data);
    xo=data1/num;
    xT=addzeros(xo,dd);
    d=ifft(xT)*sqrt(N);
    %------------------------------------------
    switch method
        case 'average'
            [y1,y2,y3,p1,p2,p3]=average(d);
        case 'cubic'
            [y1,y2,y3,p1,p2,p3]=cubic(d);
    end
    %------------------------------------------
    %--------------------the first layer
    Ina_a=abs(y1);
    Inp_a=angle(y1);
    for uj=1:length(Ina_a)                          %ʱ��Ԥʧ��
        [address_a(uj),Ina1_a(uj)]=Q(Ina_a(uj),1,cap);% Q: adrress function
        Outa_a(uj)=Ina1_a(uj)*Tab_a_a(address_a(uj));
        Outp_a(uj)=Inp_a(uj)+Tab_p_a(address_a(uj));
    end
    
    [ya_a,yp_a]=uHPA(Outa_a,Outp_a,1);
    y_a=p2c(ya_a,(yp_a));
    
    for ui=1:length(address_a)    %ʱ��Ԥʧ����¹�ʽ
        Tab_a_a(address_a(ui))=Tab_a_a(address_a(ui))-aa*sigmoid(ya_a(ui)-Ina1_a(ui));
        Tab_p_a(address_a(ui))=Tab_p_a(address_a(ui))-bb*sigmoid(Ep(yp_a(ui)-Inp_a(ui)));
    end
    %-----------------------the second layer
    Ina_b=abs(y2);
    Inp_b=angle(y2);
    for uj=1:length(Ina_b)                          %ʱ��Ԥʧ��
        [address_b(uj),Ina1_b(uj)]=Q(Ina_b(uj),1,cap);% Q: adrress function
        Outa_b(uj)=Ina1_b(uj)*Tab_a_b(address_b(uj));
        Outp_b(uj)=Inp_b(uj)+Tab_p_b(address_b(uj));
    end
    
    [ya_b,yp_b]=uHPA(Outa_b,Outp_b,1);
    y_b=p2c(ya_b,(yp_b));
    
    for ui=1:length(address_b)    %ʱ��Ԥʧ����¹�ʽ
        Tab_a_b(address_b(ui))=Tab_a_b(address_b(ui))-aa*sigmoid((ya_b(ui)-Ina1_b(ui)));
        Tab_p_b(address_b(ui))=Tab_p_b(address_b(ui))-bb*sigmoid(Ep(yp_b(ui)-Inp_b(ui)));
    end
    %-----------------------the third layer
    Ina_c=abs(y3);
    Inp_c=angle(y3);
    for uj=1:length(Ina_c)                          %ʱ��Ԥʧ��
        [address_c(uj),Ina1_c(uj)]=Q(Ina_c(uj),1,cap);% Q: adrress function
        Outa_c(uj)=Ina1_c(uj)*Tab_a_c(address_c(uj));
        Outp_c(uj)=Inp_c(uj)+Tab_p_c(address_c(uj));
    end
    
    [ya_c,yp_c]=uHPA(Outa_c,(Outp_c),1);
    y_c=p2c(ya_c,yp_c);
    
    for ui=1:length(address_c)    %ʱ��Ԥʧ����¹�ʽ
        Tab_a_c(address_c(ui))=Tab_a_c(address_c(ui))-aa*sigmoid(ya_c(ui)-Ina1_c(ui));
        Tab_p_c(address_c(ui))=Tab_p_c(address_c(ui))-bb*sigmoid(Ep(yp_c(ui)-Inp_c(ui)));
    end
    %-----------------------------------------------��ʼ������
    y=y_a+y_b+y_c;
    %------------------------------------------------------------
    if strcmp(snr,'none')
        Yreceive=y;
    else
        Yreceive=awgn(y,snr,'measured');
    end
    
    Go=Yreceive;     %����
    
    Gone=fft(Go)/sqrt(N);  %������fft
    Gone=reshape(Gone,1,length(Gone));  %�����任
    % receive=Gone*num;
    
    Gone1=quitzero(Gone,N);
    Result=demodulate(de,Gone1*num);
%     z=Gone1*num;
    e(start)=mean(abs(Gone1-xo).^2);
    %     e(start)=mean(abs(z-data1(1:N/dd)).^2);
    [bes,ber(start)]=biterr(Result,data);
%     [ses,ser(start)]=symerr(Result,data);
end
BER=mean(ber(loop-2500:loop));
% SER=mean(ser(loop-2500:loop));

p1=mean(spower(y_a));
% p2=mean(spower(y_b));
% p3=mean(spower(y_c));
% 
% g2=length(ze(y_b))/length(y_b);
% g3=length(ze(y_c))/length(y_c);
% 
gp2=ze(y_b);
gp3=ze(y_c);

pg2=mean(spower(gp2));
pg3=mean(spower(gp3));
% 
% p=mean(spower(y)/3);
% p_n=(p1+pg2+pg3)/3;
p=mean(spower(y)/3);
plot(Gone1,'*')
% figure(2)
% plot(z,'*')
% toc