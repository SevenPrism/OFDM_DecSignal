num=1;
for loop=1:5000
    load precode.mat
    len=1;
    p1s=zeros(1,len);
    p2s=zeros(1,len);
    p3s=zeros(1,len);
    p_scfde=zeros(1,len);
    p_pre=zeros(1,len);
    p=zeros(1,len);
    
    
    for n=1:len
        x=ofdm_signal();
        xa=abs(x);
        [y1,y2,y3,p1s(n),p2s(n),p3s(n)]=average(x,1,1);
        %     [yy1,yy2,yy3,pp1(n),pp2(n),pp3(n)]=cubic(x,1,1);
        p(n)=10*log10(max(xa).^2/(mean(xa.^2)));
    end
    pow=mean(xa.^2);
    pe_ofdm(num)=pow/3; 
    f1=(1-exp(-1/pow)); 
    f2=(exp(-1/pow)-exp(-2/pow));  
    f3=exp(-2/pow);%-exp(-3/pow); 
    
    p1=pow-(1+pow)*exp(-1/pow); %pow1
    p2=(1+pow)*exp(-1/pow)-(2+pow)*exp(-2/pow);%pow2
    p3=(2+pow)*exp(-2/pow);%-(3+pow)*exp(-3/pow);%pow3
    
    
    % PE T%
%     t_p1(num)=(p1+p2/2+p3/3)/(f1+f2+f3);
%     t_p2(num)=(p2/2+p3/3)/(f2+f3);
%     t_p3(num)=(p3/3)/(f3);
    
    t_p1(num)=10*log10(3*(p1+p2/2+p3/3)/(p1+p2+p3));
    t_p2(num)=10*log10(3*(p2/2+p3/3)/(f2+f3)*(p1+p2+p3));
    t_p3(num)=10*log10(p3/(f3)*(p1+p2+p3));
    
    %
    tt_p1=(p1+p2/2+p3/3);
    tt_p2=(p2/2+p3/3);
    tt_p3=(p3/3);
    
    
%     temp1(num)=mean(abs(y1).^2);
%     y_new2=ze(y2);
%     y_new3=ze(y3);
    
%     n1=length(y_new2);
%     zeros1=zeros(1,modify(y2));
%     y_new2_new=cat(2,y_new2,zeros1);
%     
%     n2=length(y_new2);
%     zeros1=zeros(1,ceil(n1/2));
%     y_new2_new=cat(2,y_new2,zeros1);
    % for k=1:length(y_new2)
    %     if abs(y_new2(k)>1)
    %         y_new2(k)=1;
    %     end
    % end
%     temp2(num)=mean(abs(y_new2).^2);
    
%     temp2_new(num)=mean(abs(y_new2_new).^2);
    % for k=1:length(y_new3)
    %     if abs(y_new3(k)>1)
    %         y_new3(k)=1;
    %     end
    % end
%     temp3(num)=mean(abs(y_new3).^2);
    num=num+1;
end
pe1=mean(t_p1);
pe2=mean(t_p2);
pe3=mean(t_p3);

% pe1=mean(tt_p1);
% pe2=mean(tt_p2);
% pe3=mean(tt_p3);

% spe1=mean(temp1);
% spe2=mean(temp2);
% spe3=mean(temp3);
% 
% sspe2=mean(temp2_new);