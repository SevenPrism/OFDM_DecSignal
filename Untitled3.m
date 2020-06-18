% 


% yitayita1=mean(abs(y1).^2);
% yitayita2=mean(abs(y2).^2);
% yitayita3=mean(abs(y3).^2);

for n=1:length(y1)
    if abs(y1(n))>1
        y1e(n)=1;
    else
        y1e(n)=y1(n);
    end
end


for n=1:length(y1)
    if abs(y2(n))>1
        y2e(n)=1;
    else
        y2e(n)=y2(n);
    end
end


for n=1:length(y1)
    if abs(y1(n))>1
        y3e(n)=1;
    else
        y3e(n)=y3(n);
    end
end

yitayita1=mean(abs(y1e).^2);
yitayita2=mean(abs(y2e).^2);
yitayita3=mean(abs(y3e).^2);

m=0;
count=0;
for n=1:length(y3)
    if abs(y3e(n))>0.0001
        m=m+abs(y3(n))^2;
        count=count+1;
    end
end

m/count
% 
% subplot(3,1,1)
% plot(abs(y1e))
% subplot(3,1,2)
% plot(abs(y2e))
% subplot(3,1,3)
% plot(abs(y3e))