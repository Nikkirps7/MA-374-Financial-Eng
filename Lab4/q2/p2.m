clear all;
data=xlsread('data.xlsx');
data
%ten stocks in ten columns each with value at fifty data points
% i=1;
% while(i<10)
%     plot(data(:,i));
%     hold on;
%     i=i+1;
% end
% plot(data(:,10));
%plot of all the ten stocks at fifty time points
S=cov(data);%covariance matrix calculated
% now to calculate the mean return vector
i=1;
m1=zeros(49,10);
while(i<=49)
    m1(i,:)=(data(i+1,:)-data(i,:))./data(i,:);
    i=i+1;
end
m2=mean(m1);
% now we have the covariance matrix and the mean return vector, now to
% calculate the CAPM
%--------------------------------------------------------------------------
% PART A: The Markowitz Efficient Frontier
%--------------------------------------------------------------------------
unity=ones(1,10);
A=unity*(S)*unity';
B=unity*(S)*m2';
C=m2*(S)*m2';
delta=A*C-(B*B);
if(delta>0)
    display('proceeding to calculate the efficient frontier');
end
if(delta<=0)
    display('error in data');
end
i=1;
ret=(1:40)/100;% contains 40 values of return
sigma=zeros(1,40);
while(i<41)
    sigma(i)=sqrt(((A*ret(i)*ret(i))-(2*B*ret(i))+C))./sqrt(delta);% applying the formula
    i=i+1;
end
figure
 plot(ret,sigma);
%--------------------------------------------------------------------------
% PART B: The Market Portfolio
%--------------------------------------------------------------------------
%global minimum portfolio
display('gmp');
wg=(S^(-1)*unity')/A;
wg
%tangency portfolio
display('the market portfolio');
wt=(S^(-1)*m2')/B;
wt
Zt=m2*wt;
sigmat=sqrt(wt'*S*wt);
%--------------------------------------------------------------------------
% PART C: The Capital Market Line
%--------------------------------------------------------------------------
R=0.07;
%the risk free rate
i=1;
sigmac=(0:50)/100;
retc=zeros(1,51);
while(i<52)
    retc(i)=R+((Zt-R)*(sigmac(i)/sigmat));
    i=i+1;
end
figure
%plot(sigmac,retc);% this wa the capital market line
beta=sigmac./sigmat;
plot(beta,retc);% this was the security market line