function y=nc(x)
y=zeros(1,21);
for n=1:21
    
y(n)=interp1(x(n,:),16:2:20,10E-5,'spline');
end