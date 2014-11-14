clear;
clc;

[num,data] = xlsread('bsedata1.xlsx');
[n1 n2] = size(num);

for i = 1:(n1-1)
    m_temp(i,:) = (num(i+1,:)-num(i,:))./num(i,:);
end
for i = 1:n2
    m(i) = geomean(1+m_temp(:,i))-1;
end
m = ((1+m).^252)-1;
c = cov(num);
u = ones(1,n2);

w_opt = (u*inv(c))/(u*inv(c)*u');
m_opt = w_opt*m';
sig_opt = sqrt(w_opt*c*w_opt');

p1 = zeros(1500,2);
p1(1,1) = sig_opt;
p1(1,2) = m_opt;
for i = 2:1500
    p1(i,2) = m_opt+(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p1(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p1(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p1(i,1) = sqrt(w_temp*c*w_temp');
end
p2 = zeros(1500,2);
p2(1,1) = sig_opt;
p2(1,2) = m_opt;
for i = 2:1500
    p2(i,2) = m_opt-(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p2(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p2(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p2(i,1) = sqrt(w_temp*c*w_temp');
end

subplot(2,2,1);
plot(p1(:,1),p1(:,2));
hold on;
plot(p2(:,1),p2(:,2));
title('Markowitz Efficient Frontier & Capital Market Line');
xlabel('Standard Deviation');
ylabel('Mean');

r = 0.07;
w_temp = ((m-r*u)*inv(c))/((m-r*u)*inv(c)*u');
m_m = w_temp*m';
sig_m = sqrt(w_temp*c*w_temp');
x=[0,sig_m];
y=[0.07,m_m];
plot(x,y,'red');

rf = ((1+r)^(1/252))-1;
[num]=xlsread('sensex.xlsx');
for i = 1:(n1-1)
    mr(i)=(num(i+1)-num(i))/num(i);
end
for i = 1:n2
    temp = cov(m_temp(:,i),mr');
    beta(i) = temp(1,2)/var(mr);
end
temp = geomean(1+mr)-1;
er = rf+beta*(temp-rf);
subplot(2,2,2);
plot(beta,er);
title('Security Market Line');
xlabel('Beta value');
ylabel('Expected return');
rowhead = {'Actual beta';'Calculated beta'};
[num]=xlsread('bsebeta1.xlsx');
xlswrite('comparison_bsebeta.xlsx',data,'B1:K1');
xlswrite('comparison_bsebeta.xlsx',rowhead,'A2:A3');
xlswrite('comparison_bsebeta.xlsx',num,'B2:K2');
xlswrite('comparison_bsebeta.xlsx',beta,'B3:K3');

clear;
clc;

[num,data] = xlsread('nsedata1.xlsx');
[n1 n2] = size(num);

for i = 1:(n1-1)
    m_temp(i,:) = (num(i+1,:)-num(i,:))./num(i,:);
end
for i = 1:n2
    m(i) = geomean(1+m_temp(:,i))-1;
end
m = ((1+m).^252)-1;
c = cov(num);
u = ones(1,n2);

w_opt = (u*inv(c))/(u*inv(c)*u');
m_opt = w_opt*m';
sig_opt = sqrt(w_opt*c*w_opt');

p1 = zeros(1500,2);
p1(1,1) = sig_opt;
p1(1,2) = m_opt;
for i = 2:1500
    p1(i,2) = m_opt+(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p1(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p1(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p1(i,1) = sqrt(w_temp*c*w_temp');
end
p2 = zeros(1500,2);
p2(1,1) = sig_opt;
p2(1,2) = m_opt;
for i = 2:1500
    p2(i,2) = m_opt-(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p2(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p2(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p2(i,1) = sqrt(w_temp*c*w_temp');
end

subplot(2,2,3);
plot(p1(:,1),p1(:,2));
hold on;
plot(p2(:,1),p2(:,2));
title('Markowitz Efficient Frontier & Capital Market Line');
xlabel('Standard Deviation');
ylabel('Mean');

r = 0.07;
w_temp = ((m-r*u)*inv(c))/((m-r*u)*inv(c)*u');
m_m = w_temp*m';
sig_m = sqrt(w_temp*c*w_temp');
x=[0,sig_m];
y=[0.07,m_m];
plot(x,y,'red');

rf = ((1+r)^(1/252))-1;
[num]=xlsread('nifty.xlsx');
for i = 1:(n1-1)
    mr(i)=(num(i+1)-num(i))/num(i);
end
for i = 1:n2
    temp = cov(m_temp(:,i),mr');
    beta(i) = temp(1,2)/var(mr);
end
temp = geomean(1+mr)-1;
er = rf+beta*(temp-rf);
subplot(2,2,4);
plot(beta,er);
title('Security Market Line');
xlabel('Beta value');
ylabel('Expected return');
rowhead = {'Actual beta';'Calculated beta'};
[num]=xlsread('nsebeta1.xlsx');
xlswrite('comparison_nsebeta.xlsx',data,'B1:K1');
xlswrite('comparison_nsebeta.xlsx',rowhead,'A2:A3');
xlswrite('comparison_nsebeta.xlsx',num,'B2:K2');
xlswrite('comparison_nsebeta.xlsx',beta,'B3:K3');

ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 0.99,'\bf BSE','HorizontalAlignment','center','VerticalAlignment', 'top')
ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 0.5,'\bf NSE','HorizontalAlignment','center','VerticalAlignment', 'top')

clear;
clc;

[num,data] = xlsread('otherdata1.xlsx');
[n1 n2] = size(num);

for i = 1:(n1-1)
    m_temp(i,:) = (num(i+1,:)-num(i,:))./num(i,:);
end
for i = 1:n2
    m(i) = geomean(1+m_temp(:,i))-1;
end
m = ((1+m).^252)-1;
c = cov(num);
u = ones(1,n2);

w_opt = (u*inv(c))/(u*inv(c)*u');
m_opt = w_opt*m';
sig_opt = sqrt(w_opt*c*w_opt');

p1 = zeros(1500,2);
p1(1,1) = sig_opt;
p1(1,2) = m_opt;
for i = 2:1500
    p1(i,2) = m_opt+(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p1(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p1(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p1(i,1) = sqrt(w_temp*c*w_temp');
end
p2 = zeros(1500,2);
p2(1,1) = sig_opt;
p2(1,2) = m_opt;
for i = 2:1500
    p2(i,2) = m_opt-(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p2(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p2(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p2(i,1) = sqrt(w_temp*c*w_temp');
end

figure();
subplot(2,2,1);
plot(p1(:,1),p1(:,2));
hold on;
plot(p2(:,1),p2(:,2));
title('Markowitz Efficient Frontier & Capital Market Line');
xlabel('Standard Deviation');
ylabel('Mean');

r = 0.07;
w_temp = ((m-r*u)*inv(c))/((m-r*u)*inv(c)*u');
m_m = w_temp*m';
sig_m = sqrt(w_temp*c*w_temp');
x=[0,sig_m];
y=[0.07,m_m];
plot(x,y,'red');

rf = ((1+r)^(1/252))-1;
[num]=xlsread('sensex.xlsx');
for i = 1:(n1-1)
    mr(i)=(num(i+1)-num(i))/num(i);
end
for i = 1:n2
    temp = cov(m_temp(:,i),mr');
    beta(i) = temp(1,2)/var(mr);
end
temp = geomean(1+mr)-1;
er = rf+beta*(temp-rf);
subplot(2,2,2);
plot(beta,er);
title('Security Market Line');
xlabel('Beta value');
ylabel('Expected return');

clear;
clc;

[num,data] = xlsread('otherdata1.xlsx');
[n1 n2] = size(num);

for i = 1:(n1-1)
    m_temp(i,:) = (num(i+1,:)-num(i,:))./num(i,:);
end
for i = 1:n2
    m(i) = geomean(1+m_temp(:,i))-1;
end
m = ((1+m).^252)-1;
c = cov(num);
u = ones(1,n2);

w_opt = (u*inv(c))/(u*inv(c)*u');
m_opt = w_opt*m';
sig_opt = sqrt(w_opt*c*w_opt');

p1 = zeros(1500,2);
p1(1,1) = sig_opt;
p1(1,2) = m_opt;
for i = 2:1500
    p1(i,2) = m_opt+(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p1(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p1(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p1(i,1) = sqrt(w_temp*c*w_temp');
end
p2 = zeros(1500,2);
p2(1,1) = sig_opt;
p2(1,2) = m_opt;
for i = 2:1500
    p2(i,2) = m_opt-(i-1)*0.001;
    w_temp = (det([1 u*inv(c)*m';p2(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p2(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p2(i,1) = sqrt(w_temp*c*w_temp');
end

subplot(2,2,3);
plot(p1(:,1),p1(:,2));
hold on;
plot(p2(:,1),p2(:,2));
title('Markowitz Efficient Frontier & Capital Market Line');
xlabel('Standard Deviation');
ylabel('Mean');

r = 0.07;
w_temp = ((m-r*u)*inv(c))/((m-r*u)*inv(c)*u');
m_m = w_temp*m';
sig_m = sqrt(w_temp*c*w_temp');
x=[0,sig_m];
y=[0.07,m_m];
plot(x,y,'red');

rf = ((1+r)^(1/252))-1;
[num]=xlsread('nifty.xlsx');
for i = 1:(n1-1)
    mr(i)=(num(i+1)-num(i))/num(i);
end
for i = 1:n2
    temp = cov(m_temp(:,i),mr');
    beta(i) = temp(1,2)/var(mr);
end
temp = geomean(1+mr)-1;
er = rf+beta*(temp-rf);
subplot(2,2,4);
plot(beta,er);
title('Security Market Line');
xlabel('Beta value');
ylabel('Expected return');


ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 0.99,'\bf BSE with other stocks','HorizontalAlignment','center','VerticalAlignment', 'top')
ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.5, 0.5,'\bf NSE with other stocks','HorizontalAlignment','center','VerticalAlignment', 'top')