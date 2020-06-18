function y=panduan(x)
a=zeros(1,length(x));
y=zeros(1,length(x));
N=length(x);

for n=1:N
    if x(n)>0
        a(n)=1;
    else
        a(n)=0;
    end
end

for n=1:N
    if n==1
        y(n)=or(or(a(1),a(1)),a(2));
    elseif n==N
        y(n)=or(or(a(N),a(N-1)),a(N-1));
    else
        y(n)=or(or(a(n),a(n+1)),a(n-1));
    end
end

