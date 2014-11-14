clear;
clc;
close all;

[num1,data1]=xlsread('bsedata1.xlsx');
n=size(num1);
for i=1:n(2)
    ret1(:,i)=price2ret(num1(:,i),[],'Periodic');
end
n=size(ret1);
ret1_new=ret1(n(1)-20:n(1),1:n(2));
for i=1:n(2)
    vol1(i)=sqrt(252*var(ret1_new(:,i)));
end
bar(vol1);
set(gca,'XTickLabel',data1);
xlabel('\bfStocks');
ylabel('\bfVolatility');
title('\bfHistorical volatility for BSE stocks from last one month data');

figure();
[num2,data2]=xlsread('nsedata1.xlsx');
n=size(num2);
for i=1:n(2)
    ret2(:,i)=price2ret(num2(:,i),[],'Periodic');
end
n=size(ret2);
ret2_new=ret2(n(1)-20:n(1),1:n(2));
for i=1:n(2)
    vol2(i)=sqrt(252*var(ret2_new(:,i)));
end
bar(vol2);
set(gca,'XTickLabel',data2);
xlabel('\bfStocks');
ylabel('\bfVolatility');
title('\bfHistorical volatility for NSE stocks from last one month data');

a=0.5:0.1:1.5;
for i=1:n(2)
    r=0.05;
    T=0.5;
    sig=vol1(i);
    s=num1(n(1),i);
    for j=1:length(a)
        k=a(j)*s;
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        c(j,i)=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T);
        p(j,i)=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s;
    end
end
xlswrite('bse_call.xlsx',c,'B2:K12');
xlswrite('bse_call.xlsx',data1,'B1:K1');
xlswrite('bse_call.xlsx',a','A2:A12');
xlswrite('bse_call.xlsx','A','A1:A1');
xlswrite('bse_put.xlsx',p,'B2:K12');
xlswrite('bse_put.xlsx',data1,'B1:K1');
xlswrite('bse_put.xlsx',a','A2:A12');
xlswrite('bse_put.xlsx','A','A1:A1');

a=0.5:0.1:1.5;
for i=1:n(2)
    r=0.05;
    T=0.5;
    sig=vol2(i);
    s=num2(n(1),i);
    for j=1:length(a)
        k=a(j)*s;
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        c(j,i)=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T);
        p(j,i)=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s;
    end
end
xlswrite('nse_call.xlsx',c,'B2:K12');
xlswrite('nse_call.xlsx',data2,'B1:K1');
xlswrite('nse_call.xlsx',a','A2:A12');
xlswrite('nse_call.xlsx','A','A1:A1');
xlswrite('nse_put.xlsx',p,'B2:K12');
xlswrite('nse_put.xlsx',data2,'B1:K1');
xlswrite('nse_put.xlsx',a','A2:A12');
xlswrite('nse_put.xlsx','A','A1:A1');

r=0.05;
no=floor(n(1)/21);
v=zeros(no,n(2));
cc=zeros(no,n(2));
pp=zeros(no,n(2));
for i=1:no
    ret1_new=ret1(n(1)-21*i+1:n(1),1:n(2));
    for j=1:n(2)
        v(i,j)=sqrt(var(ret1_new(:,j)));
        T=0.5;
        sig=v(i,j);
        s=num1(n(1),j);
        k=s;
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        cc(i,j)=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T);
        pp(i,j)=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s;
    end
end
for i=1:n(2)
    figure();
    plot(v(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfVolatility');
    legend(data1(i));
    title('\bfBSE');
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_volatility_' num2str(i) '.jpg']);
    close;
    figure();
    plot(cc(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfCall Price');
    legend(data1(i));
    title('\bfBSE');
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_call_' num2str(i) '.jpg']);
    close;
    figure();
    plot(pp(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfPut Price');
    legend(data1(i));
    title('\bfBSE');
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_put_' num2str(i) '.jpg']);
    close;
end

r=0.05;
no=floor(n(1)/21);
v=zeros(no,n(2));
cc=zeros(no,n(2));
pp=zeros(no,n(2));
for i=1:no
    ret2_new=ret2(n(1)-21*i+1:n(1),1:n(2));
    for j=1:n(2)
        v(i,j)=sqrt(var(ret2_new(:,j)));
        T=0.5;
        sig=v(i,j);
        s=num2(n(1),j);
        k=s;
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        cc(i,j)=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T);
        pp(i,j)=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s;
    end
end
for i=1:n(2)
    figure();
    plot(v(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfVolatility');
    legend(data1(i));
    title('\bfNSE');
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_volatility_' num2str(i) '.jpg']);
    close;
    figure();
    plot(cc(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfCall Price');
    legend(data1(i));
    title('\bfNSE');
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_call_' num2str(i) '.jpg']);
    close;
    figure();
    plot(pp(:,i));
    xlabel('\bfMonths taken');
    ylabel('\bfPut Price');
    legend(data1(i));
    title('\bfNSE');
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_put_' num2str(i) '.jpg']);
    close;
end
