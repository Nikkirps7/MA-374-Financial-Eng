close all;
clear;
clc;

s0=0:0.04:2;
t=0:0.02:1;
k=1;
T=1;
r=0.05;
sig=0.6;
w=[0; cumsum(randn(100000,1))]/sqrt(100000);

for j=1:51
    for i=1:51
        s(j)=s0(j)*exp(sig*w(floor(t(i)+1))+(r-0.5*sig*sig)*t(i));
        d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        c(i,j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r*(T-t(i)));
        p(i,j)=normcdf(-d2)*k*exp(-r*(T-t(i)))-normcdf(-d1)*s(j);
    end
end
mesh(c);
hold on;
mesh(p);
title('Variation of C(t,s) & P(t,s) as a function of t and s');
xlabel('t');
ylabel('s');
zlabel('C(t,s) & P(t.s)');
hold off;