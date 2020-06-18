figure(1)
h1=semilogy(papr,prob,'-o','linewidth',2,'markersize',6);
axis([0,14,10^(-5),1])
hold on
h2=semilogy(papr1,prob1,'linewidth',2,'markersize',6);
hold on
semilogy(papr2,prob2,'g','linewidth',2,'markersize',6)
hold on
semilogy(papr3+0.5,prob3,'r','linewidth',2,'markersize',6)
hold on
h3=semilogy(papr_pre-1.2,prob_pre,'-squre','linewidth',2,'markersize',6);
hold on
h6=semilogy(papr_cubic1,prob_cubic1,'-^','linewidth',2,'markersize',6);
hold on
h7=semilogy(papr_cubic2,prob_cubic2,'-g^','linewidth',2,'markersize',6);
hold on
h8=semilogy(papr_cubic3+2,prob_cubic3,'-r^','linewidth',2,'markersize',6);
%hold on
%semilogy(papr_scfde,prob_scfde,'-x','linewidth',2,'markersize',6)
hold on
h4=semilogy(papr_Tofdm-1,prob_Tofdm,'-gv','linewidth',2,'markersize',6);
hold on 
% 理论值：利用原始PAPR减去降低的dB数即为理论值
h5=scatter(papr-3.8,prob,80,'o') ;
hold on 
scatter(papr-6.4,prob,80,'o') 
hold on 
scatter(papr-7.4,prob,80,'o') 
%hold on
%semilogy(papr_cubic1,prob_cubic1,'-^')
%hold on
%semilogy(papr_cubic2,prob_cubic2,'-r^')
%hold on
%semilogy(papr_cubic3,prob_cubic3,'-g^')
legend([h1,h3,h4,h5,h2,h6,h7,h8],'OFDM','Precode','T-OFDM','SUSD Theroy','SUSD Simulation','OSID HDS','OSID MDS','OSID LDS')
xlabel('D(dB)');
ylabel('Prob(PAPR>D)');