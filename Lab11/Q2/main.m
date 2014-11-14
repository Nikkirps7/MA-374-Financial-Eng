clear all
%*********************************************************************
% THE CIR MODEL
%*********************************************************************
%For the first set of parameters
%===============================
i=1;
U=zeros(1,10);
Z=[0.5:0.5:5];
while(i<=10)
    U(i)=YieldCIR(0,Z(i),0.02,0.7,0.02,0.1);
    i=i+1;
end
%the term structure upto ten time units
plot(Z,U);
%For the second set of parameters
%===============================
i=1;
U=zeros(1,10);
Z=[0.5:0.5:5];
while(i<=10)
    U(i)=YieldCIR(0,Z(i),0.7,0.1,0.3,0.2);
    i=i+1;
end
%the term structure upto ten time units
figure
plot(Z,U);
%For the third set of parameters
%===============================
i=1;
U=zeros(1,10);
Z=[0.5:0.5:5];
while(i<=10)
    U(i)=YieldCIR(0,Z(i),0.06,0.09,0.5,0.02);
    i=i+1;
end
%the term structure upto ten time units
figure
plot(Z,U);
% now varying the r(0), parameter one
%====================================
figure
U=zeros(1,600);
Z=[0.005:0.005:3];%600 time points
i=1;
j=1;
rate=[0.1:0.1:1];
while(j<=10)
    i=1;
    while(i<=600)
        U(i)=YieldCIR(0,Z(i),0.02,0.7,0.02,rate(j));
        i=i+1;
    end
    plot(Z,U);
    hold on
    j=j+1;
end
