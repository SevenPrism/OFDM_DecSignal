function [ power1,power2,power3,n1,n2,n3 ] = cubicNcout( x,v1,v2 )
    n1=0;
    n2=0;
    n3=0;
    for n=1:length(x)
        if abs(x(n))<v1
            power1(n)=abs(x(n))^2;
            n1=n1+1;
        elseif (abs(x(n))<sqrt(v1^2+v2^2))&&(abs(x(n))>v1)
            power2(n)=abs(x(n))^2;
            n2=n2+1;
        else%if (abs(x(n))<1.732)&&(abs(x(n))>1.414)
            power3(n)=abs(x(n))^2;
            n3=n3+1;
        end
    end

end




