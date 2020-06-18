%function [ F,W,T,T1 ] = matrixWF( N )
function y=Tofdm_signal(N)
a=(0:N-1)'*(0:N-1);
F=exp(-2*pi*1i*a/N)/sqrt(N);%Éú³ÉDFT¾ØÕó¡ª¡ªF¾ØÕó

W=hadamard(N);

T=(1/N)*F*W;
%T1=(1/N)*W*F';

x_ofdm=ofdm_signal();

x=x_ofdm'*T;

y=x;

%E_TOFDM=(1/N)*()

end

