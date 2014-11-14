close all;
clear;
clc;

[num,data] = xlsread('bsedata1.xlsx');
[n1 n2] = size(num);
n3 = floor(n1/5);
n4 = floor(n1/21);
temp1 = 5*(linspace(1,n3,n3)-1)+1;
temp2 = 21*(linspace(1,n4,n4)-1)+1;

for i = 1:n2
    figure();
    subplot(1,3,1);
    plot(num(:,i));
    xlabel('Daily Time Axis');
    ylabel('Adjusted closing price of the stock');
    subplot(1,3,2);
    plot(num(temp1,i));
    xlabel('Weekly Time Axis');
    ylabel('Adjusted closing price of the stock');
    subplot(1,3,3);
    plot(num(temp2,i));
    xlabel('Monthly Time Axis');
    ylabel('Adjusted closing price of the stock');
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 0.99,data(i),'HorizontalAlignment','center','VerticalAlignment', 'top')
    text(0.5, 0.03,'\bf BSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_' num2str(i) '.jpg']);
    close;
end

clear;
[num,data] = xlsread('nsedata1.xlsx');
[n1 n2] = size(num);
n3 = floor(n1/5);
n4 = floor(n1/21);
temp1 = 5*(linspace(1,n3,n3)-1)+1;
temp2 = 21*(linspace(1,n4,n4)-1)+1;
for i = 1:n2
    figure();
    subplot(1,3,1);
    plot(num(:,i));
    xlabel('Daily Time Axis');
    ylabel('Adjusted closing price of the stock');
    subplot(1,3,2);
    plot(num(temp1,i));
    xlabel('Weekly Time Axis');
    ylabel('Adjusted closing price of the stock');
    subplot(1,3,3);
    plot(num(temp2,i));
    xlabel('Monthly Time Axis');
    ylabel('Adjusted closing price of the stock');
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 0.99,data(i),'HorizontalAlignment','center','VerticalAlignment', 'top')
    text(0.5, 0.03,'\bf NSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_' num2str(i) '.jpg']);
    close;
end
