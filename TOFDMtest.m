len=50000;
p_Tofdm=zeros(1,len);

for n=1:len
   x_Tofdm=Tofdm_signal(256);
   xa_Tofdm=abs(x_Tofdm);
   p_Tofdm(n)=10*log10(max(xa_Tofdm).^2/(mean(xa_Tofdm.^2)));
end

[papr_Tofdm,prob_Tofdm]=ccdf1(p_Tofdm,len);

figure(1)
semilogy(papr_Tofdm,prob_Tofdm,'-o')
axis([0,20,10^(-5),1])