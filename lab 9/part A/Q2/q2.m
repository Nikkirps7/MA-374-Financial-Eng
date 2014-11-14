close all;
clear;
clc;

s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
[num]=xlsread('NSEoptiondata.xlsx',1);
for i=1:length(num)
    T=num(i,1);
    k=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T)-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
scatter3(num(:,1),num(:,2),v(:),'*');
xlabel('T');
ylabel('K');
zlabel('Implied Volatility');
title('European call for NIFTY');

clear;
s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
figure();
[num]=xlsread('NSEoptiondata.xlsx',2);
for i=1:length(num)
    T=num(i,1);
    k=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
scatter3(num(:,1),num(:,2),v(:),'*');
xlabel('T');
ylabel('K');
zlabel('Implied Volatility');
title('European put for NIFTY');

clear;
s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
figure();
[num]=xlsread('NSEoptiondata.xlsx',3);
for i=1:length(num)
    T=num(i,1);
    k=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T)-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
plot(num(:,2),v(:));
xlabel('K');
ylabel('Implied Volatility');
title('European call for NIFTY');

clear;
s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
figure();
[num]=xlsread('NSEoptiondata.xlsx',4);
for i=1:length(num)
    T=num(i,1);
    k=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
plot(num(:,2),v(:));
xlabel('K');
ylabel('Implied Volatility');
title('European put for NIFTY');

clear;
s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
figure();
[num]=xlsread('NSEoptiondata.xlsx',5);
for i=1:length(num)
    k=num(i,1);
    T=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(d1)*s-normcdf(d2)*k*exp(-r*T)-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
plot(num(:,2),v(:));
xlabel('T');
ylabel('Implied Volatility');
title('European call for NIFTY');

clear;
s=4715.90;
r=0.05;
tol=10^-3;
MAXIT=100;
figure();
[num]=xlsread('NSEoptiondata.xlsx',6);
for i=1:length(num)
    k=num(i,1);
    T=num(i,2);
    sig=0.5;
    for j=1:MAXIT
        d1=(log(s/k)+(r+0.5*sig*sig)*T)/(sig*sqrt(T));
        d2=(log(s/k)+(r-0.5*sig*sig)*T)/(sig*sqrt(T));
        f=normcdf(-d2)*k*exp(-r*T)-normcdf(-d1)*s-num(i,3);
        df=s*sqrt(T)*normpdf(d1);
        dx=f/df;
        sig=sig-dx;
        if(abs(dx)<tol)
            v(i)=sig;
            break;
        elseif(j==MAXIT)
            v(i)=NaN;
        end
    end
end
plot(num(:,2),v(:));
xlabel('T');
ylabel('Implied Volatility');
title('European put for NIFTY');