close all;  
clear;
clc;

[num,text]=xlsread('NIFTYoptiondata.xlsx',1);
r=0.05;
sig=sqrt(252)*std(price2ret(unique(num(:,5)),[],'periodic'));

j=1;
for i=1:length(num)
    if(num(i,9)~=max(num(:,9)))
        temp(j)=i;
        j=j+1;
    end
end
num(temp,:)=[];
text(temp+1,:)=[];

j=0;
for i=1:length(num)
    if(num(i,1)==0)
        j=j+1;
        q(j,:)=num(i,1:5);
    end
end

for i=1:length(num)
    if(num(i,4)==min(q(:,4)))
        K=num(i,2);
        T=text(i+1,7);
        break;
    end
end
    
j=0;
for i=1:length(num)
    if(num(i,2)==K && strcmp(text(i+1,7),T))
        j=j+1;
        p(j,:)=num(i,1:5);
    end
end

d1=(log(p(1,5)/K)+(r+0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
d2=(log(p(1,5)/K)+(r-0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
delta_bsm=normcdf(d1);
theta_bsm=((-0.5*p(1,5)*normpdf(d1)*sig)/(sqrt(p(1,4))))-(r*K*exp(-r*p(1,4))*normcdf(d2));
delta=diff(p(:,3))./diff(p(:,5));
theta=diff(p(:,3))./diff(p(:,1));

subplot(1,2,1);
plot(p(2:length(p)),delta);
hold on;
plot(p(2:length(p)),delta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('delta');
title('Call option with low maturity period');
hold off;
subplot(1,2,2);
plot(p(2:length(p)),theta);
hold on;
plot(p(2:length(p)),theta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('theta');
title('Call option with low maturity period');
hold off;

for i=1:length(num)
    if(num(i,4)==median(q(:,4)))
        K=num(i,2);
        T=text(i+1,7);
        break;
    end
end
    
j=0;
for i=1:length(num)
    if(num(i,2)==K && strcmp(text(i+1,7),T))
        j=j+1;
        p(j,:)=num(i,1:5);
    end
end

d1=(log(p(1,5)/K)+(r+0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
d2=(log(p(1,5)/K)+(r-0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
delta_bsm=normcdf(d1);
theta_bsm=((-0.5*p(1,5)*normpdf(d1)*sig)/(sqrt(p(1,4))))-(r*K*exp(-r*p(1,4))*normcdf(d2));
delta=diff(p(:,3))./diff(p(:,5));
theta=diff(p(:,3))./diff(p(:,1));

figure();
subplot(1,2,1);
plot(p(2:length(p)),delta);
hold on;
plot(p(2:length(p)),delta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('delta');
title('Call option with medium maturity period');
hold off;
subplot(1,2,2);
plot(p(2:length(p)),theta);
hold on;
plot(p(2:length(p)),theta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('theta');
title('Call option with medium maturity period');
hold off;

for i=1:length(num)
    if(num(i,4)==max(q(:,4)))
        K=num(i,2);
        T=text(i+1,7);
        break;
    end
end
    
j=0;
for i=1:length(num)
    if(num(i,2)==K && strcmp(text(i+1,7),T))
        j=j+1;
        p(j,:)=num(i,1:5);
    end
end

d1=(log(p(1,5)/K)+(r+0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
d2=(log(p(1,5)/K)+(r-0.5*sig*sig)*p(1,4))/(sig*sqrt(p(1,4)));
delta_bsm=normcdf(d1);
theta_bsm=((-0.5*p(1,5)*normpdf(d1)*sig)/(sqrt(p(1,4))))-(r*K*exp(-r*p(1,4))*normcdf(d2));
delta=diff(p(:,3))./diff(p(:,5));
theta=diff(p(:,3))./diff(p(:,1));

figure();
subplot(1,2,1);
plot(p(2:length(p)),delta);
hold on;
plot(p(2:length(p)),delta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('delta');
title('Call option with high maturity period');
hold off;
subplot(1,2,2);
plot(p(2:length(p)),theta);
hold on;
plot(p(2:length(p)),theta_bsm*ones(length(p)-1));
xlabel('t');
ylabel('theta');
title('Call option with high maturity period');
hold off;