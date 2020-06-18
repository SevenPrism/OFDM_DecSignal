function [y1,y2,y3,p1,p2,p3]=segment(x)

[a,p]=c2p(x);

for n=1:length(x)
    if a(n)<0.5
        y1(n)=p2c(a(n),p(n));
        y2(n)=0;
        y3(n)=0;
    elseif ((a(n)>0.5)&&(a(n)<1.5))
        y1(n)=p2c(0.5,p(n));
        y2(n)=p2c(a(n)-0.5,p(n));   
        y3(n)=0;
    else
        y1(n)=p2c(0.5,p(n));   
        y2(n)=p2c(1,p(n));
        y3(n)=p2c(a(n)-1.5,p(n));  
    end
end

p1=funcpapr(y1);
p2=funcpapr(y2);
p3=funcpapr(y3);
