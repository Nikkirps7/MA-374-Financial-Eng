function[P]=americanput(S,K,T,M,r,sigma)
%S is the initial stock price
%K is the strike price of the option
%T is the expiry time period
%M refers to the number of time steps in the binomial model
%r is the risk free rate
%sigma is the volatility factor
%t=T/M;
%set1
%u=exp(sigma*sqrt(t));
%d=1/u;
%set2
%u=exp(sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
%d=exp(-1*sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
t=T/M;
%u=exp(sigma*sqrt(t));
%d=1/u;
u=exp(sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
d=exp(-1*sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
% create the price tree
U=zeros(M+1,M+1);
U(1,1)=S;% starting price
i=M+1;
while(i>=1)
    j=1;
    while(j<=i)
        U(j,i)=S*(u^(i-j))*(d^(j-1));
        j=j+1;
    end
    i=i-1;
end
%U%price tree
%calculate the risk neutral measure
p=(exp(r*t)-d)/(u-d);
%calculate the option prices
i=M+1;j=1;
while(j<=i)
    U(j,M+1)=max(0,(K-U(j,M+1)));%put formula applied
    j=j+1;
end
i=M;
while(i>=1)
    j=1;
    while(j<=i)
        A=(p*(U(j,i+1))+(1-p)*U(j+1,i+1))*(exp(-1*r*t));
        G=max(max((K-U(j,i)),0),A);
        U(j,i)=G;
        j=j+1;
    end
    i=i-1;
end
%U%option price tree
P=U(1,1);
end