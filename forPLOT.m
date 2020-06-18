x1=mean(p1(1:5,1:11)')';
x2=mean(p2(1:5,1:11)')';
xxx=10*log10(x2'./x1')-(snr2(1:5)-snr1(1:5));
figure(2)
plot(xxx,'-o')