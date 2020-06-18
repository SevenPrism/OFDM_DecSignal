clear
clc
% load precode.mat
len=100000;
% len=5000;
% p1s=zeros(1,len);
% p2s=zeros(1,len);
% p3s=zeros(1,len);
% p_scfde=zeros(1,len);
% p_pre=zeros(1,len);
% p=zeros(1,len);
% p_Tofdm=zeros(1,len);


for n=1:len
    x=ofdm_signal();
    xa=abs(x);
%     x_pre=pre_ofdm_signal();
%     [y1,y2,y3,p1s(n),p2s(n),p3s(n)]=average(x,0.5,1);%p1s(n)为y1的PAPR，以此类推
     [yy1,yy2,yy3,pp1(n),pp2(n),pp3(n)]=cubic(x,1,1);
%     p(n)=10*log10(max(xa).^2/(mean(xa.^2)));%原始OFDM信号x的PAPR
%      p_pre(n)=10*log10(max(abs(x_pre)).^2/(mean(abs(x_pre).^2)));
end

% ya1=abs(y1);
% ya2=abs(y2);
% ya3=abs(y3);

yya1=abs(yy1);
yya2=abs(yy2);
yya3=abs(yy3);

% [papr,prob]=ccdf1(p,len);
% [papr_pre,prob_pre]=ccdf1(p_pre,len);
% for n=1:len
% %     x_scfde=abs(scfde());
% %     p_scfde(n)=10*log10(max(abs(x_scfde)).^2/(mean(abs(x_scfde).^2)));
%     x_Tofdm=Tofdm_signal(256);
%     xa_Tofdm=abs(x_Tofdm);
%     p_Tofdm(n)=10*log10(max(xa_Tofdm).^2/(mean(xa_Tofdm.^2)));
% end

% [papr_scfde,prob_scfde]=ccdf1(p_scfde,len);
% [papr_Tofdm,prob_Tofdm]=ccdf1(p_Tofdm,len);
% 
% [papr1,prob1]=ccdf1(p1s,len);
% [papr2,prob2]=ccdf1(p2s,len);
% [papr3,prob3]=ccdf1(p3s,len);
% 
% [papr_cubic1,prob_cubic1]=ccdf1(pp1,len);
% [papr_cubic2,prob_cubic2]=ccdf1(pp2,len);
% [papr_cubic3,prob_cubic3]=ccdf1(pp3,len);
% 
% figure(2)
% semilogy(papr,prob,'-o')
% axis([0,20,10^(-5),1])
% hold on
% semilogy(papr1,prob1,'-ro')
% hold on
% semilogy(papr2,prob2,'-go')
% hold on
% semilogy(papr3,prob3,'-yo')
% hold on
% semilogy(papr_pre,prob_pre,'-squre')
% hold on
% % semilogy(papr_cubic1,prob_cubic1,'-^')
% semilogy(papr_cubic1,prob_cubic1,'-^','linewidth',1,'markersize',6)
% hold on
% % semilogy(papr_cubic2,prob_cubic2,'-r^')
% semilogy(papr_cubic2,prob_cubic2,'-r^','linewidth',1,'markersize',6)
% hold on
% % semilogy(papr_cubic3,prob_cubic3,'-g^')
% semilogy(papr_cubic3,prob_cubic3,'-g^','linewidth',1,'markersize',6)
% hold on
% semilogy(papr_Tofdm,prob_Tofdm,'-r')




