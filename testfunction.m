x_ofdm=linspace(min(index_ofdm),max(index_ofdm));
y_ofdm=interp1(index_ofdm,ber_ofdm,x_ofdm,'cubic');
h1=semilogy(x_ofdm,y_ofdm,'-*','linewidth',1,'markersize',6);
axis([0,30,10^(-8),1]);
hold on;
% semilogy(x_ofdm,y_ofdm,'*');
% hold on;
% scatter(x_ofdm,y_ofdm);
% hold on;

x_cubic=linspace(min(index_cubic),max(index_cubic));
y_cubic=interp1(index_cubic,ber_cubic,x_cubic,'cubic');
h2=semilogy(x_cubic,y_cubic,'-o','linewidth',1,'markersize',6);
hold on;

x_average=linspace(min(index_average),max(index_average));
y_average=interp1(index_average,ber_average,x_average,'cubic');
h3=semilogy(x_average,y_average,'-v','linewidth',1,'markersize',6);
grid on;

legend([h1,h2,h3],'OFDM','OSID','SUSD');
xlabel('EbN0[dB]');
ylabel('BER');