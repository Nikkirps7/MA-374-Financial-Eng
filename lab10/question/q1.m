%in the real world
n=10;
F1=zeros(1,n);
F2=zeros(1,n);
mu=0.1;
sigma=0.2;
j=1;
while(j<=n)
    S=100;
    U=zeros(1,501);
    R=normrnd(0,1,[1,1000]); %R is an array of variables belonging to normal distribution
    U(1)=S;
    T=[0:0.001:0.5];
    i=2;
    while(i<=501)
        U(i)=U(i-1)*exp((mu-((sigma*sigma)/2))*(T(i)-T(i-1))+(sigma*sqrt(T(i)-T(i-1))*(R(i-1))));
        i=i+1;
    end
    F1(j)=U(i-1);%storing the final value of the stock in each path
    F2(j)=U(i-1);
    plot(T,U);
    hold on;
    j=j+1;
end
%in the risk neutral world return=0.05;
figure;
mu=0.05;
sigma=0.2;
j=1;
F3=zeros(1,n);
F4=zeros(1,n);
while(j<=n)
    S=100;
    U1=zeros(1,501);
    R=normrnd(0,1,[1,1000]);% an array of 1000 standard normal random variables 
    U1(1)=S;
    T=[0:0.001:0.5];
    i=2;
    while(i<=501)
        U1(i)=U1(i-1)*exp((mu-((sigma*sigma)/2))*(T(i)-T(i-1))+(sigma*sqrt(T(i)-T(i-1))*(R(i-1))));
        i=i+1;
    end
    F3(j)=U1(i-1);%storing the final value of the stock in each path
    F4(j)=U1(i-1);
    plot(T,U1);
    hold on;
    j=j+1;
end
%call value calculation
K=90;
i=1;
while(i<=n)
    F1(i)=max((K-F1(i)),0);%call
    F2(i)=max((F2(i)-K),0);%put
    F3(i)=max((K-F3(i)),0);%call
    F4(i)=max((F4(i)-K),0);%put
    i=i+1;
end
display('call-real value');
(mean(F1))*exp(-1*0.5*0.05)
display('put-real value');
(mean(F2))*exp(-1*0.5*0.05)
display('call-riskfree value');
(mean(F3))*exp(-1*0.5*0.05)
display('put-riskfree value');
(mean(F4))*exp(-1*0.5*0.05)
