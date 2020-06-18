cy1=0;
cy2=0;
cy3=0;

x=abs(d);
for n=1:length(x)
    if (x(n)<1)||(x(n)==1)
        cy1=cy1+1;
    elseif (x(n)<sqrt(2))||(x(n)==sqrt(2))
       cy2=cy2+1;
    else
        cy3=cy3+1;
    end
end