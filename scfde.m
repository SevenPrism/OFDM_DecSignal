function y=scfde()
% db=0;
% ibo=8;
num=sqrt(10);%sqrt((10/1)*10^(ibo/10));


mo=modem.qammod(16);
data1=randi(15,256,1); %��������������
x1=modulate(mo,data1)/num;
y=x1;