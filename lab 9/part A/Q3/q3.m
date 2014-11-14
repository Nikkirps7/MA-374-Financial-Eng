close all;
clear;
clc;

s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
[num1]=xlsread('NSEoptiondata.xlsx',1);
[num2]=xlsread('NSEdata.xlsx');
n=length(num2);
ret=price2ret(num2,[],'Periodic');
n=n-1;
for i=1:length(num1)
    T=num1(i,1);
    k=num1(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T)-num1(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i,1)=sig;
            break;
        elseif(j==MAXIT)
            v(i,1)=NaN;
        end
    end
    ret_new=ret(floor(n-T*252+1):n);
    v(i,2)=sqrt(252*var(ret_new));
end
scatter3(num1(:,1),num1(:,2),v(:,1)','*');
xlabel('T');
ylabel('K');
zlabel('Implied Volatility');
title('European call for NIFTY');
hold on;
scatter3(num1(:,1),num1(:,2),v(:,2)','r*');

colhead={'Implied Volatility','Historical Volatility'};
xlswrite('comparison_sigma.xlsx',colhead,'A1:B1');
xlswrite('comparison_sigma.xlsx',v,'A2:B249');
legend('Implied Volatility','Historical Volatility');