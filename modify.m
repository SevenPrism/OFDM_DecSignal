function j=modify(x)
k=1;
j=1;
for n=k:length(x)-k
    if (x(n)>0)||(x(n+k)>0)||(x(n-k)>0)
        j=j+1;
    end
end
