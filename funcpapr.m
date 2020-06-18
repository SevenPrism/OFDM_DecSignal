%Çópapr
function y=funcpapr(x)
g=ones(1,1);
t=ones(1,1);
xmax=max(abs(x).^2);%POWmax

j=1;
for n=1:length(x)
    if (real(x(n))~=0)||(imag(x(n)~=0))
        g(j)=x(n);
        j=j+1;
    end
end

if g==t
    y=0;
else
    xmean=mean(abs(g).^2);
    y=10*log10(xmax/xmean);
end
