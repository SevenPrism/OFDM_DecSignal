function y=prob(x1,x2,t)

%y=-t*x2*exp(-(t*x2)^2)+t*x1*exp(-(t*x1)^2)+sqrt(pi)/2*(erf(t*x2)-erf(t*x1));

y=t*x1*exp(-(t*x1)^2)-t*x2*exp(-(t*x2)^2)+(sqrt(pi)/2)*(erf(t*x2)-erf(t*x1));

