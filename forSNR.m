function y=forSNR(ber,snr,x)

y=interp1(ber,snr,x,'spline');