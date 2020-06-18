figure(1)
h1=semilogy(papr,prob,'-o','linewidth',2,'markersize',6);
axis([0,14,10^(-5),1])
hold on
h2=semilogy(papr1,prob1,'linewidth',1,'markersize',6);
hold on
h3=semilogy(papr2,prob2,'g','linewidth',1,'markersize',6)
hold on
h4=semilogy(papr3,prob3,'r','linewidth',1,'markersize',6)
hold on
h6=semilogy(papr_cubic1,prob_cubic1,'-^','linewidth',2,'markersize',6);
hold on
h7=semilogy(papr_cubic2,prob_cubic2,'-g^','linewidth',2,'markersize',6);
hold on
h8=semilogy(papr_cubic3,prob_cubic3,'-r^','linewidth',2,'markersize',6);
%hold on
%semilogy(papr_scfde,prob_scfde,'-x','linewidth',2,'markersize',6)
hold on

legend([h1,h2,h3,h4,h6,h7,h8],'OFDM','SUSD HDS','SUSD MDS','SUSD LDS','OSID HDS','OSID MDS','OSID LDS')

xlabel('D(dB)');
ylabel('Prob(PAPR>D)');