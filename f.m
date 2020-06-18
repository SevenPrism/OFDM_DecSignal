

n=1;

% p=1.3;
N=256;
p=1;
po1=p-(1+p)*e(1,p);
po2=(1+p)*e(1,p)-(2+p)*e(2,p);
po3=(2+p)*e(2,p)-(3+p)*e(3,p);

p1=1-exp(-1);
p2=exp(-1)-exp(-2);
p3=exp(-2)-exp(-3);


papr1(n)=10*log10(3*(po1+po2/2+po3/3)/p);
papr2(n)=10*log10(3*(po2/2+po3/3)/(p2+p3)/p);
papr3(n)=10*log10(po3/p3/p);

% y1(n)=10*log10(1/(p1+f2+f3));
% y2(n)=10*log10((f2+f3)/(p2-f2+f3));
% for s=0.6:0.01:0.8
% y3(n)=10*log10(10^s/(10^s-2)*(p3/f3-2));
% n=n+1;
% end
% n=n+1;
eta1=po1+po2/2+po3/3;
eta2=(po2/2+po3/3)/(p2+p3);
eta3=(po3/3)/p3;

yita1=po1+po2/2+po3/3;
yita2=(po2/2+po3/3);
yita3=(po3/3);

yita=(po1+po2+po3)/3;





