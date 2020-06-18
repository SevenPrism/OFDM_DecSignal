function [i,y] = BerPlot(n,method)
    len = length(n);
    ber = zeros(1,len);
    index = zeros(1,len);
    for i=0:1:n
        [BER,v1,v2,v3,p]=process(6,i,method);
%         ber(int64(i*500)+1)=BER;
%         index(int64(i*500)+1)=i;
        ber(i+1)=BER;
        index(i+1)=i;
    end
    y=ber;
    x2=linspace(min(index),max(index));
    y2=interp1(index,ber,x2,'cubic');
%     semilogy(index,ber);
    semilogy(x2,y2);
    hold on;
    i=index;
end

