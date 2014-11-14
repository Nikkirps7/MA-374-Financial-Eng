%*********************************************************************
% THE VASICEK MODEL
%*********************************************************************
%For the first set of parameters
%===============================
i=1;
U=zeros(1,10);
Z=[0.5:0.5:5];
while(i<=10)
    U(i)=YieldVAS(0,Z(i),5.9,0.2,0.3,0.1);
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
    U(i)=YieldVAS(0,Z(i),3.9,0.1,0.3,0.2);
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
    U(i)=YieldVAS(0,Z(i),0.1,0.4,0.11,0.1);
    i=i+1;
end
%the term structure upto ten time units
figure
plot(Z,U);
% now varying the r(0), parameter one
%====================================
figure
U=zeros(1,500);
Z=[0.005:0.005:2.5];%250 time points
i=1;
j=1;
rate=[0.05:0.05:0.5];
while(j<=10)
    i=1;
    while(i<=500)
        U(i)=YieldVAS(0,Z(i),5.9,0.2,0.3,rate(j));
        i=i+1;
    end
    plot(Z,U);
    hold on
    j=j+1;
end
% now varying the r(0), parameter two
%====================================
figure
U=zeros(1,500);
Z=[0.005:0.005:2.5];%250 time points
i=1;
j=1;
rate=[0.05:0.05:0.5];
while(j<=10)
    i=1;
    while(i<=500)
        U(i)=YieldVAS(0,Z(i),3.9,0.1,0.3,rate(j));
        i=i+1;
    end
    plot(Z,U);
    hold on
    j=j+1;
end
% now varying the r(0), parameter three
%======================================
figure
U=zeros(1,500);
Z=[0.005:0.005:2.5];%250 time points
i=1;
j=1;
rate=[0.05:0.05:0.5];
while(j<=10)
    i=1;
    while(i<=500)
        U(i)=YieldVAS(0,Z(i),0.1,0.4,0.11,rate(j));
        i=i+1;
    end
    plot(Z,U);
    hold on
    j=j+1;
end