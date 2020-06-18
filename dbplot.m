function y=dbplot()
    leng=500;
    numX = zeros(1,41);
%     xo=ofdm_signal();
%     xoA=abs(10*log10(xo.^2));
%     for i=1:256
%         for n=0:1:16
%             if (xoA(i)>=n && xoA(i)<(n+0.2))
%                 numX(int64(n)+1)=numX(int64(n)+1)+1;
%             end
%         end
%     end

%% OFDM
%     for n=1:leng
%         xo=ofdm_signal();
%         xoA=abs(xo);
%         p(n)=10*log10(max(xoA).^2/(mean(xoA.^2)));%原始OFDM信号x的PAPR
%     end

%% T-OFDM
%     for n=1:leng
%         xo=Tofdm_signal(256);
%         xoA=abs(xo);
%         p(n)=10*log10(max(xoA).^2/(mean(xoA.^2)));
%     end

%% author1
%     for m=1:leng
%         x=ofdm_signal();
%         [y1,y2,y3,p1s(m),p2s(m),p3s(m)]=average(x,1,1);
%     end

%% author2
    for m=1:leng
        x=ofdm_signal();
        [y1,y2,y3,p1s(m),p2s(m),p3s(m)]=cubic(x,1,1);
    end

    for i=1:leng
        for n=4:0.2:12
            if (p1s(i)>=n && p1s(i)<(n+0.2))
                numX(int64((n-4)*5)+1)=numX(int64((n-4)*5)+1)+1;
            end
        end
    end
    
    y=numX;
end

