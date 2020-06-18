len=50000;
p_scfde=zeros(1,len);
for n=1:len
    x_scfde=abs(scfde());
    p_scfde(n)=10*log10(max(abs(x_scfde)).^2/(mean(abs(x_scfde).^2)));
end
[papr_scfde,prob_scfde]=ccdf1(p_scfde,len);
figure(4) 
axis([0,20,10^(-5),1])
semilogy(papr,prob,'-o','linewidth',2,'markersize',6)
hold on
semilogy(papr_scfde,prob_scfde,'-d','linewidth',2,'markersize',6)