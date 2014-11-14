clear;
clc;

k=1;
T=1;
r=0.05;
sig=0.6;
s0=1;
w=[0; cumsum(randn(10000,1))]/sqrt(10000);
t=0.5;

s0=0:0.04:2;
for j=1:51
    s(j)=s0(j)*exp(sig*w(t*1000+1)+(r-0.5*sig*sig)*t);
    d1=(log(s(j)/k)+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    d2=(log(s(j)/k)+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    c(j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r*(T-t));
    p(j)=normcdf(-d2)*k*exp(-r*(T-t))-normcdf(-d1)*s(j);
end
subplot(1,2,1);
plot(s(:),c(:));
title('Variation of C(t,s) vs s');
xlabel('s');
ylabel('C(t,s)');
subplot(1,2,2);
plot(s(:),p(:));
title('Variation of P(t,s) vs s');
xlabel('s');
ylabel('P(t,s)');
s0=1;

r=0:0.0002:0.01;
for j=1:51
    s(j)=s0*exp(sig*w(t*1000+1)+(r(j)-0.5*sig*sig)*t);
    d1=(log(s(j)/k)+(r(j)+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    d2=(log(s(j)/k)+(r(j)-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    c(j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r(j)*(T-t));
    p(j)=normcdf(-d2)*k*exp(-r(j)*(T-t))-normcdf(-d1)*s(j);
end
figure();
subplot(1,2,1);
plot(r(:),c(:));
title('Variation of C(t,s) vs r');
xlabel('r');
ylabel('C(t,s)');
subplot(1,2,2);
plot(r(:),p(:));
title('Variation of P(t,s) vs r');
xlabel('r');
ylabel('P(t,s)');
r=0.05;

sig=0:0.0024:0.12;
for j=1:51
    s(j)=s0*exp(sig(j)*w(t*1000+1)+(r-0.5*sig(j)*sig(j))*t);
    d1=(log(s(j)/k)+(r+0.5*sig(j)*sig(j))*(T-t))/(sig(j)*sqrt(T-t));
    d2=(log(s(j)/k)+(r-0.5*sig(j)*sig(j))*(T-t))/(sig(j)*sqrt(T-t));
    c(j)=normcdf(d1)*s(j)-normcdf(d2)*k*exp(-r*(T-t));
    p(j)=normcdf(-d2)*k*exp(-r*(T-t))-normcdf(-d1)*s(j);
end
figure();
subplot(1,2,1);
plot(sig(:),c(:));
title('Variation of C(t,s) vs sig');
xlabel('sig');
ylabel('C(t,s)');
subplot(1,2,2);
plot(sig(:),p(:));
title('Variation of P(t,s) vs sig');
xlabel('sig');
ylabel('P(t,s)');
sig=0.6;

k=0:0.02:1;
for j=1:51
    s=s0*exp(sig*w(t*1000+1)+(r-0.5*sig*sig)*t);
    d1=(log(s/k(j))+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    d2=(log(s/k(j))+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
    c(j)=normcdf(d1)*s-normcdf(d2)*k(j)*exp(-r*(T-t));
    p(j)=normcdf(-d2)*k(j)*exp(-r*(T-t))-normcdf(-d1)*s;
end
figure();
subplot(1,2,1);
plot(k(:),c(:));
title('Variation of C(t,s) vs K');
xlabel('K');
ylabel('C(t,s)');
subplot(1,2,2);
plot(k(:),p(:));
title('Variation of P(t,s) vs K');
xlabel('K');
ylabel('P(t,s)');
k=1;

k=0:0.02:1;
s0=0:0.04:2;
for i=1:51
    for j=1:51
        s(i)=s0(i)*exp(sig*w(t*1000+1)+(r-0.5*sig*sig)*t);
        d1=(log(s(i)/k(j))+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        d2=(log(s(i)/k(j))+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k(j)*exp(-r*(T-t));
        p(i,j)=normcdf(-d2)*k(j)*exp(-r*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs s and K');
xlabel('s');
ylabel('K');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs s and K');
xlabel('s');
ylabel('K');
zlabel('P(t,s)');
k=1;
s0=1;

s0=0:0.04:2;
r=0:0.0002:0.01;
for i=1:51
    for j=1:51
        s(i)=s0(i)*exp(sig*w(t*1000+1)+(r(j)-0.5*sig*sig)*t);
        d1=(log(s(i)/k)+(r(j)+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        d2=(log(s(i)/k)+(r(j)-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k*exp(-r(j)*(T-t));
        p(i,j)=normcdf(-d2)*k*exp(-r(k)*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs s and r');
xlabel('s');
ylabel('r');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs s and r');
xlabel('s');
ylabel('r');
zlabel('P(t,s)');
r=0.05;
s0=1;

s0=0:0.04:2;
sig=0:0.0024:0.12;
for i=1:51
    for j=1:51
        s(i)=s0(i)*exp(sig(j)*w(t*1000+1)+(r-0.5*sig(j)*sig(j))*t);
        d1=(log(s(i)/k)+(r+0.5*sig(j)*sig(j))*(T-t))/(sig(j)*sqrt(T-t));
        d2=(log(s(i)/k)+(r-0.5*sig(j)*sig(j))*(T-t))/(sig(j)*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k*exp(-r*(T-t));
        p(i,j)=normcdf(-d2)*k*exp(-r*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs s and sig');
xlabel('s');
ylabel('sig');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs s and sig');
xlabel('s');
ylabel('sig');
zlabel('P(t,s)');
sig=0.6;
s0=1;

sig=0:0.0024:0.12;
k=0:0.02:1;
for i=1:51
    for j=1:51
        s(i)=s0*exp(sig(i)*w(t*1000+1)+(r-0.5*sig(i)*sig(i))*t);
        d1=(log(s(i)/k(j))+(r+0.5*sig(i)*sig(i))*(T-t))/(sig(i)*sqrt(T-t));
        d2=(log(s(i)/k(j))+(r-0.5*sig(i)*sig(i))*(T-t))/(sig(i)*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k(j)*exp(-r*(T-t));
        p(i,j)=normcdf(-d2)*k(j)*exp(-r*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs sig and k');
xlabel('sig');
ylabel('k');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs sig and k');
xlabel('sig');
ylabel('k');
zlabel('P(t,s)');
sig=0.6;
k=1;

r=0:0.0002:0.01;
k=0:0.02:1;
for i=1:51
    for j=1:51
        s(i)=s0*exp(sig*w(t*1000+1)+(r(i)-0.5*sig*sig)*t);
        d1=(log(s(i)/k(j))+(r(i)+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        d2=(log(s(i)/k(j))+(r(i)-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k(j)*exp(-r(i)*(T-t));
        p(i,j)=normcdf(-d2)*k(j)*exp(-r(i)*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs r and k');
xlabel('r');
ylabel('k');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs r and k');
xlabel('r');
ylabel('k');
zlabel('P(t,s)');
r=0.05;
k=1;

r=0:0.0002:0.01;
sig=0:0.0024:0.12;
for i=1:51
    for j=1:51
        s(i)=s0*exp(sig(i)*w(t*1000+1)+(r(j)-0.5*sig(i)*sig(i))*t);
        d1=(log(s(i)/k)+(r(j)+0.5*sig(i)*sig(i))*(T-t))/(sig(i)*sqrt(T-t));
        d2=(log(s(i)/k)+(r(j)-0.5*sig(i)*sig(i))*(T-t))/(sig(i)*sqrt(T-t));
        c(i,j)=normcdf(d1)*s(i)-normcdf(d2)*k*exp(-r(j)*(T-t));
        p(i,j)=normcdf(-d2)*k*exp(-r(j)*(T-t))-normcdf(-d1)*s(i);
    end
end
figure();
subplot(1,2,1);
mesh(c);
title('Variation of C(t,s) vs sig and r');
xlabel('sig');
ylabel('r');
zlabel('C(t,s)');
subplot(1,2,2);
mesh(p);
title('Variation of P(t,s) vs sig and r');
xlabel('sig');
ylabel('r');
zlabel('P(t,s)');