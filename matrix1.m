clear
clc

N=8;
s0=zeros(1,N);
s0(1)=1;
s0(N/2+1)=1;

s1=zeros(1,N);
s1(1)=1;
s1(N/2+1)=-1;

S0=[s0,s0];
S1=[s1,s1];

for n=1:N
    m(n)=(S0(n-1+N)-S1(n-3+N));
end
m=m'/2;

% M=fft(m)/sqrt(N);

% M1=[1,-exp(-1i*2*pi*3/8),exp(-1i*2*pi*2/8),-exp(-1i*2*pi*9/8),exp(-1i*2*pi*4/8),-exp(-1i*2*pi*15/8),exp(-1i*2*pi*6/8),-exp(-1i*2*pi*21/8)]/sqrt(8);

% m1=ifft(M1)/0.1768;

for k=1:N
    precode(:,k)=circshift(m,k-1);
end