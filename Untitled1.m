for n=1:length(x1)
    if (x1(n)>0.5)&&(x1(n)<1.5)
        x1(n)=x1(n);
    else
        x1(n)=0;
    end
end

t=ze(x1);

figure(1)
subplot(3,1,1);
plot(abs(x))
axis([0,256,0,2])
title('(a) Original Signal')
xlabel('t')
ylabel('r(t)')

subplot(3,1,2);
plot(x1)
axis([0,256,0,2])
title('(b) Amplitudes of signal among the interval [r_a, r_b]')
xlabel('t')
ylabel('r(t)')

subplot(3,1,3)
plot(abs(t))
axis([0,256,0,2])
title('(c) S_{new}')
xlabel('t')
ylabel('r(t)')

