function y=peak()
    ll=150;
    b=[];
    for m=1:ll
        a=reshape(dbplot(),41,1);
        b(m,:)=a;
    end
    y=b;
end