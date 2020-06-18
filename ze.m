function y=ze(x)
j=1;
for n=1:length(x)
    if abs(x(n))~=0
        y(j)=x(n);
        j=j+1;
    end
end

if j==1
    y=0;
end
