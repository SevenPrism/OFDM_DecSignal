% function  stemplot()
a=peak();
b=sum(a);
figure
bar(b,'grouped');
axis([20 61 0 8000])
set(gca,'XTickLabel',4:12);
set(gca,'YTickLabel',0:2000:8000);
% end

