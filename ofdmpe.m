x=scfde();

for n=1:length(x)
    if x(n)>sqrt(3)
        x(n)=sqrt(3);
    end
end

pe=mean(abs(x).^2)/3;