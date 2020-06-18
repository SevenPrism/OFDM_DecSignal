clear all

figure(1)
obj = get(gca,'children');
x1=get(obj(1),'xdata');
y1=get(obj(1),'ydata');

x10=get(obj(10),'xdata');
y10=get(obj(10),'ydata');

x2=get(obj(2),'xdata');
y2=get(obj(2),'ydata');

x3=get(obj(3),'xdata');
y3=get(obj(3),'ydata');

x4=get(obj(4),'xdata');
y4=get(obj(4),'ydata');

x5=get(obj(5),'xdata');
y5=get(obj(5),'ydata');

x6=get(obj(6),'xdata');
y6=get(obj(6),'ydata');

x7=get(obj(7),'xdata');
y7=get(obj(7),'ydata');

x8=get(obj(8),'xdata');
y8=get(obj(8),'ydata');

x9=get(obj(9),'xdata');
y9=get(obj(9),'ydata');

figure(2)
h1=semilogy(x1,y1);
hold on
h2=semilogy(x2,y2);
hold on
h3=semilogy(x3,y3);
hold on
h4=semilogy(x4,y4);
hold on
h5=semilogy(x5,y5);
hold on
h6=semilogy(x6,y6);
hold on
h7=semilogy(x7,y7);
hold on
h8=semilogy(x8,y8);
hold on
h9=semilogy(x9,y9);
hold on
h10=semilogy(x10,y10);
hold on