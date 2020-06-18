function [y1,y2,y3,p1,p2,p3]=cubic(x,v1,v2)

for n=1:length(x)
    if abs(x(n))<v1
        y1(n)=x(n);
        y2(n)=0;
        y3(n)=0;
    elseif (abs(x(n))<sqrt(v1^2+v2^2))&&(abs(x(n))>v1)
        y1(n)=x(n)/(1+a(x(n),1)*1i);
        y2(n)=x(n)-y1(n);
        y3(n)=0;
    else%if (abs(x(n))<1.732)&&(abs(x(n))>1.414)
        yy1(n)=x(n)/(1+a(x(n),sqrt(2))*1i);
        yy2(n)=x(n)-yy1(n);

        y1(n)=yy1(n)/(1+a(yy1(n),1)*1i);
        y2(n)=yy1(n)-y1(n);
        y3(n)=yy2(n);
    end
end

% g1=ze(y1);
% g2=ze(y2);
% g3=ze(y3);
p1=funcpapr(y1);
p2=funcpapr(y2);
p3=funcpapr(y3);
