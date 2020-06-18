function [ya,yp]=idear(xa,xp,maxa)

for n=1:length(xa)
    if (xa(n)<maxa)||(xa(n)==maxa)
        ya(n)=xa(n);
        yp(n)=xp(n);
    else
        ya(n)=maxa;
        yp(n)=xp(n);
    end
end