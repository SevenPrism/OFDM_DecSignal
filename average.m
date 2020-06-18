function [y1,y2,y3,p1,p2,p3]=average(x,V1,V2)
r=(1/(sqrt(3)))*(0.3660+0.8660*1i);

for n=1:length(x)
    if abs(x(n))<V1
        y1(n)=x(n);
        y2(n)=0;
        y3(n)=0;
    elseif (abs(x(n))<sqrt(V1^2+V2^2))&&(abs(x(n))>V1)
        y1(n)=(1+1i)*x(n)/2;
        y2(n)=(1-1i)*x(n)/2;
        y3(n)=0;
    else%if (abs(x(n))<1.732)&&(abs(x(n))>1.414)
        y3(n)=x(n)/sqrt(3);
        y2(n)=x(n)*(0.2113-0.5373*1i);
        y1(n)=x(n)*(0.2113+0.5373*1i);
    end
end

p1=funcpapr(y1);
p2=funcpapr(y2);
p3=funcpapr(y3);
