close all;
clear all;

[num] = xlsread('data.xlsx');
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

p1 = zeros(5000,2);
p1(1,1) = sig_opt;
p1(1,2) = m_opt;

for i = 2:5000
    p1(i,2) = m_opt+(i-1)*0.0001;
    w_temp = (det([1 u*inv(c)*m';p1(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p1(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
    p1(i,1) = sqrt(w_temp*c*w_temp');
end

plot(p1(:,1),p1(:,2))
title('Markowitz Efficient Frontier & Capital Market Line');
xlabel('Standard Deviation');
ylabel('Mean');
hold on;

disp('**************************************************');
s1 = (p1(1,2)-0.07)/p1(1,1);
j = 1;
for i = 2:5000
    s2 = (p1(i,2)-0.07)/p1(i,1);
    if(s2 > s1)
        j = i;
        s1 = s2;
    end
end
m_m=p1(j,2);
sig_m=p1(j,1);
fprintf('Market mean = ');
disp(m_m);
fprintf('Market Standard Deviation = ');
disp(sig_m);
x=[0,sig_m];
y=[0.07,m_m];
plot(x,y,'red')
hold off;
disp('**************************************************');

rf = (1.07^(1/252))-1;
[num]=xlsread('market.xlsx');
for i = 1:(n1-1)
    mr(i)=(num(i+1)-num(i))/num(i);
end
for i = 1:n2
    y = m_temp(:,i)-rf;
    x = [ones(n1-1,1) mr'-rf];
    temp = inv(x'*x)*x'*y;
    beta(i) = temp(2);
end
temp = geomean(1+mr)-1;
er = rf+beta*(temp-rf);
figure();
plot(beta,er)
title('Security Market Line');
xlabel('Beta value');
ylabel('Expected return');