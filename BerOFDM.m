function [i,y] = BerOFDM(n)
    len = length(n);
    ber = zeros(1,len);
    index = zeros(1,len);
    for i=0:1:n
        BER=process_ber(6,i);
        ber(i+1)=BER;
        index(i+1)=i;
    end
    y=ber;
    x2=linspace(min(index),max(index));
    y2=interp1(index,ber,x2,'cubic');
%     semilogy(index,ber);
    semilogy(x2,y2);
    i=index;
end

