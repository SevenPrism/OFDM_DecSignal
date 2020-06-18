len=50000;

for n=1:len
    x=ofdm_signal();
    xa=abs(x);
    p(n)=10*log10(max(xa).^2/(mean(xa.^2)));%%PAPRµÄ¼ÆËã
end

pow=mean(xa.^2);

[papr,prob]=ccdf1(p,len);

% 
% x=ofdm_signal();
% xa=abs(x);
% pow=mean(xa.^2);
f1=(1-exp(-1/pow));
f2=(exp(-1/pow)-exp(-2/pow));
f3=exp(-2/pow);
p1=pow-(1+pow)*exp(-1/pow);
p2=(1+pow)*exp(-1/pow)-(2+pow)*exp(-2/pow);
p3=(2+pow)*exp(-2/pow);

papr_cubic_hds=10*log10(1/p1+f2+f3);
papr_cubic_mds=10*log10(f2+f3/p2+f3-f2);
papr_ofdm=10*log10(1/pow);
deltaPAPR_hds=papr_cubic_hds-papr_ofdm;
deltaPAPR_mds=papr_cubic_mds-papr_ofdm;


figure(1)
hold on
semilogy(papr-papr_cubic_hds,prob,'o')
hold on
semilogy(papr-papr_cubic_mds,prob,'*')
hold on
% semilogy(papr-papr3,prob,'s')
% hold on 
%semilogy(ofdmpr+3,prob1,'d')
semilogy(papr,prob,'d')

axis([0,20,10^(-4),1]);