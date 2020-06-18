subplot(4,1,1)
plot(xa,'DisplayName','xa','YDataSource','xa');
xlabel('t');
ylabel('r(t)');
title('Original Signal');
axis([0 256 0 2])
subplot(4,1,2)
plot(yya1,'DisplayName','yya1','YDataSource','yya1');
xlabel('t');
ylabel('r(t)');
title('HDS');
axis([0 256 0 1])
subplot(4,1,3)
plot(yya2,'DisplayName','yya2','YDataSource','yya2');
xlabel('t');
ylabel('r(t)');
title('MDS');
axis([0 256 0 1])
subplot(4,1,4)
plot(yya3,'DisplayName','yya3','YDataSource','yya3');
xlabel('t');
ylabel('r(t)');
title('LDS');
axis([0 256 0 1])

