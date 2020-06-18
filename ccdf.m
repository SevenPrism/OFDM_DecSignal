function [papr0,pp]=ccdf(p)

N=length(p);
papr0=0:0.5:20;
prob=zeros(1,length(papr0));
for n=1:N
    for papr=0:0.5:20
        if p(n)<papr
            prob(papr*2+1)=prob(papr*2+1)+1;
        end
    end
end

pp=prob/5000;

