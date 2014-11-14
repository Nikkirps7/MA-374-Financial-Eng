close all;
clear;
clc;

[num1,data] = xlsread('bsedata1.xlsx');
[n1 n] = size(num1);

for i = 1:(n1-1)
    ret1(i,:) = log(num1(i+1,:)./num1(i,:));
end

for i = 1:n
    mu(i) = mean(ret1(:,i));
    sig(i) = std(ret1(:,i));
    ret1(:,i) = mu(i)+sig(i)*randn(n1-1,1);
end

num2(1,:) = num1(1,:);
for i = 1:n1-1
    num2(i+1,:) = num2(i,:).*exp(ret1(i,:));
end

for i = 1:n
    figure();
    plot(num1(:,i));
    hold on;
    plot(num2(:,i),'red');
    ylabel('Adjusted Closing Price of the stock');
    xlabel('Daily Time Axis');
    title(data(i));
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 0.03,'\bf BSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_' num2str(i) '.jpg']);
    close;
end

clear;
clc;

[num1,data] = xlsread('nsedata1.xlsx');
[n1 n] = size(num1);

for i = 1:(n1-1)
    ret1(i,:) = log(num1(i+1,:)./num1(i,:));
end

for i = 1:n
    mu(i) = mean(ret1(:,i));
    sig(i) = std(ret1(:,i));
    ret1(:,i) = mu(i)+sig(i)*randn(n1-1,1);
end

num2(1,:) = num1(1,:);
for i = 1:n1-1
    num2(i+1,:) = num2(i,:).*exp(ret1(i,:));
end

for i = 1:n
    figure();
    plot(num1(:,i));
    hold on;
    plot(num2(:,i),'red');
    ylabel('Adjusted Closing Price of the stock');
    xlabel('Daily Time Axis');
    title(data(i));
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 0.03,'\bf NSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_' num2str(i) '.jpg']);
    close;
end