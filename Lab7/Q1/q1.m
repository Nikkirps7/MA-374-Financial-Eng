clear;
clc;

s0=input('Enter the initial stock price : ');
k=input('Enter the strike price : ');
T=input('Enter the maturity period : ');
r=input('Enter the risk free rate of return for the period : ');
sig=input('Enter the standard deviation of the stock on which option is written : ');

t=input('Enter the time at which you want to find the call and put price : ');
w=[0; cumsum(randn(100000,1))]/sqrt(100000);
s=s0*exp(sig*w(t*1000)+(r-0.5*sig*sig)*t);
d1=(log(s/k)+(r+0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
d2=(log(s/k)+(r-0.5*sig*sig)*(T-t))/(sig*sqrt(T-t));
c=normcdf(d1)*s-normcdf(d2)*k*exp(-r*(T-t));
disp(['Call price = ' num2str(c)]);
p=normcdf(-d2)*k*exp(-r*(T-t))-normcdf(-d1)*s;
disp(['Put price = ' num2str(p)]);