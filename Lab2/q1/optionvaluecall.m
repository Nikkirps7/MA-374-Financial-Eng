function[P]=optionvaluecall(S,K,r,sigma,M)
U=zeros(M+1,M+1);
%defining a 2-d matrix containing only zeros
i=1;
T=1;% this is fixed
t=T/M;
u=exp(sigma*sqrt(t));
d=1/u;
%u=exp(sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
%d=exp(-1*sigma*sqrt(t)+t*(r-(sigma*sigma)/2));
while(i<=M+1)
    U(i,M+1)=S*(u^(M+1-i-1))*(d^(i-1)); 
    i=i+1;
end
%call/put option 
i=1;
while(i<=M+1)
    U(i,M+1)=max(+U(i,M+1)-K,0);%the formula 
    i=i+1;
end
%claculate the option value by backtracking
p=(exp(r*t)-d)/(u-d);
%risk-neutral probability p
i=M;
while(i>0)
    j=1;
    while(j<=M-(M-i))
        U(j,i)=((U(j,i+1)*p)+(U(j+1,i+1)*(1-p)))*exp(-1*r*t);
        j=j+1;
    end
    i=i-1;
end
%view the final option tree
%U
%option value at t=0
P=U(1,1);
end