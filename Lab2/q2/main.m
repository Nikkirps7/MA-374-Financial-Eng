%driver to run the entire process
i=1;
S=100;K=100;T=1;M=100;r=0.08;sigma=0.2;%fixed parameters
display('displaying put option value');
optionvalueput(S,K,r,sigma,M)
display('displaying call option value');
optionvaluecall(S,K,r,sigma,M)
V=10;% varying upto V values each parameters
X=zeros(1,V);
X1=zeros(1,V);
Y=zeros(1,V);
%varying S
s1=50;
while(i<=V)
    X(i)=optionvalueput(s1,K,r,sigma,M);
    X1(i)=optionvaluecall(s1,K,r,sigma,M);
    Y(i)=s1;
    s1=s1+10;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying K
k1=50;i=1;
while(i<=V)
    X(i)=optionvalueput(S,k1,r,sigma,M);
    X1(i)=optionvaluecall(S,k1,r,sigma,M);
    Y(i)=k1;
    k1=k1+10;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying r
r1=0.04;i=1;
while(i<=V)
    X(i)=optionvalueput(S,K,r1,sigma,M);
    X1(i)=optionvaluecall(S,K,r1,sigma,M);
    Y(i)=r1;
    r1=r1+0.01;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying sigma
sigma1=0.1;i=1;
while(i<=V)
    X(i)=optionvalueput(S,K,r,sigma1,M);
    X1(i)=optionvaluecall(S,K,r,sigma1,M);
    Y(i)=sigma1;
    sigma1=sigma1+0.02;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying M, k=100
M1=50;i=1;
while(i<=V)
    X(i)=optionvalueput(S,K,r,sigma,M1);
    X1(i)=optionvaluecall(S,K,r,sigma,M1);
    Y(i)=M1;
    M1=M1+10;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying M, k=95
M1=50;i=1;K=95;
while(i<=V)
    X(i)=optionvalueput(S,K,r,sigma,M1);
    X1(i)=optionvaluecall(S,K,r,sigma,M1);
    Y(i)=M1;
    M1=M1+10;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);
figure
%varying M, k=105
K=105;
M1=50;i=1;
while(i<=V)
    X(i)=optionvalueput(S,K,r,sigma,M1);
    X1(i)=optionvaluecall(S,K,r,sigma,M1);
    Y(i)=M1;
    M1=M1+10;
    i=i+1;
end
plot(Y,X,'r');
hold on
plot(Y,X1);