clear;
clc;

k=1;
T=1;
r=0.05;
sig=0.6;

w=[0; cumsum(randn(100000,1))]/sqrt(100000);
s0=0:0.04:2;
c=zeros(1,length(s0));
p=zeros(1,length(s0));
s=zeros(1,length(s0));
tt=[0 0.2 0.4 0.6 0.8 1];

for i=1:length(tt)
    t=tt(i);
    for j=1:51
        s(j)=s0(j)*exp(sig*w(t*1000+1)+(r-0.5*sig*sig)*t);
        d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        c(j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r*(T-t));
    end
    plot(s(:),c(:));
    hold on;
end
title('Variation of C(t,s) vs s for t=0,0.2,0.4,0.6,0.8,1');
xlabel('s');
ylabel('C(t,s)');
hold off;

figure();
for i=1:length(tt)
    t=tt(i);
    for j=1:51
        s(j)=s0(j)*exp(sig*w(t*1000+1)+(r-0.5*sig*sig)*t);
        d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        p(j)=normcdf(-d2)*k*exp(-r*(T-t))-normcdf(-d1)*s(j);
    end
    plot(s(:),p(:));
    hold on;
end
title('Variation of P(t,s) vs s for t=0,0.2,0.4,0.6,0.8,1');
xlabel('s');
ylabel('P(t,s)');
hold off;

clear all;

s0=0:0.04:2;
t=0:0.02:1;
k=1;
T=1;
r=0.05;
sig=0.6;
w=[0; cumsum(randn(100000,1))]/sqrt(100000);

figure();
for j=1:51
    for i=1:51
        s(j)=s0(j)*exp(sig*w(floor(t(i)+1))+(r-0.5*sig*sig)*t(i));
        d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        c(i,j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r*(T-t(i)));
    end
end
mesh(c);
title('Variation of C(t,s) as a function of t and s');
xlabel('t');
ylabel('s');
zlabel('C(t,s)');

figure();
for j=1:51
    for i=1:51
        s(j)=s0(j)*exp(sig*w(floor(t(i)+1))+(r-0.5*sig*sig)*t(i));
        d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t(i)))/(sig*sqrt(T-t(i)));
        p(i,j)=normcdf(-d2)*k*exp(-r*(T-t(i)))-normcdf(-d1)*s(j);
    end
end
mesh(p);
title('Variation of P(t,s) as a function of t and s');
xlabel('t');
ylabel('s');
zlabel('P(t,s)');
