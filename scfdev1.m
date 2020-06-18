x_scfde=abs(scfde());
len=length(x_scfde);

for n=1:len
    p_scfde(n)=10*log10(x_scfde(n)).^2/(mean(abs(x_scfde).^2));
end

[papr_scfde,prob_scfde]=ccdf1(p_scfde,len);

figure(2)
semilogy(papr_scfde,prob_scfde,'-squre')