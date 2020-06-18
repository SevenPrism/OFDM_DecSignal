function y=s()
% db=0;
% ibo=8;
num=sqrt(10);%sqrt((10/1)*10^(ibo/10));


mo=modem.qammod(16);
data1=randint(256,1,16); %生成随机传输符号
x1=modulate(mo,data1)/num;
% x1=(x2)*(10^(db/20));

y1=ifft(x1)*sqrt(length(x1));
num=1;
% num=max(abs(y1))/sqrt(3);

y=y1/num;