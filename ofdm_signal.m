function y=ofdm_signal()
% db=0;
ibo=3;
num=sqrt((10/1)*10^(ibo/10));


mo=modem.qammod(16); %���ƽ������е�QAM������
data1=randi(16,256,1)-1; %��������������
x1=modulate(mo,data1)/num;%��QAM���������źŽ��е���
% x1=(x2)*(10^(db/20));

y1=ifft(x1)*sqrt(length(x1));

% num=max(abs(y1))/sqrt(3);

y=y1;