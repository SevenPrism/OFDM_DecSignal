p1s=zeros(1,len);
p2s=zeros(1,len);
p3s=zeros(1,len);
for n=1:len
    x=ofdm_signal();
    [y1,y2,y3,p1s(n),p2s(n),p3s(n)]=average(x,1,1);
end


[papr3,prob3]=ccdf1(p3s,len);




