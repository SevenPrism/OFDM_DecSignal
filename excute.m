tic
m=1;
BER1=zeros(5,11);
BER2=zeros(5,11);
BER3=zeros(5,11);
BER4=zeros(5,11);
BER5=zeros(5,11); 

p1=zeros(5,11);

p21=zeros(5,11);
p22=zeros(5,11);
p23=zeros(5,11);
p2x=zeros(5,11);

p31=zeros(5,11);
p32=zeros(5,11);
p33=zeros(5,11);
p3x=zeros(5,11);

p41=zeros(5,11);
p42=zeros(5,11);
p43=zeros(5,11);
p4x=zeros(5,11);
p4y=zeros(5,11);

p5=zeros(5,11);

snr5=zeros(1,5);
snr4=zeros(1,5);
snr3=zeros(1,5);
snr2=zeros(1,5);
snr1=zeros(1,5);
%---------------------------------------------
ber0=1E-4;
snr='none';
for ibo=4:-1:0
    n=1;
    for snr=0:2:20
        [BER3(m,n),p31(m,n),p32(m,n),p33(m,n),p3x(m,n)]=process(ibo,snr,'average');
        [BER2(m,n),p21(m,n),p22(m,n),p23(m,n),p2x(m,n)]=process(ibo,snr,'cubic');
        [BER1(m,n),p1(m,n)]=tdpd(ibo,snr);
%         [BER5(m,n),p5(m,n)]=cut(ibo,snr);
        n=n+1;
    end
    snr3(m)=forSNR(BER3(m,1:11),0:2:20,ber0);
    snr2(m)=forSNR(BER2(m,1:11),0:2:20,ber0);
    snr1(m)=forSNR(BER1(m,1:11),0:2:20,ber0);
%     snr5(m)=forSNR(BER5(m,1:11),0:2:20,ber0);
    m=m+1;
end
% 
% m=1;
% for ibo=0:-1:-8
%     n=1;
%     for snr=0:2:20
%         [BER4(m,n),p41(m,n),p42(m,n),p43(m,n),p4x(m,n),p4y(m,n)]=segmentmain(ibo,snr);
%         n=n+1;
%     end
%     snr4(m)=forSNR(BER4(m,1:11),0:2:20,ber0);
%     m=m+1;
% end
p1=(pi/4)*(mean(p1,2));
p2=(pi/4)*(mean(p2x,2));
p3=(pi/4)*mean(p3x,2);
% p4=(pi/4)*(mean(p4x,2));
% p4u=(pi/4)*(mean(p4y,2));
% p5=(pi/4)*(mean(p5,2));
save 20100518_curve.mat
toc