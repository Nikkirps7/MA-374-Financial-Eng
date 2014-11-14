close all;
clear;
clc;

[num,data] = xlsread('bsedata1.xlsx');
[n1 n] = size(num);
n2 = floor(n1/5);
n3 = floor(n1/21);
temp1 = 5*(linspace(1,n2,n2)-1)+1;
temp2 = 21*(linspace(1,n3,n3)-1)+1;

for i = 1:(n1-1)
    ret1(i,:) = log(num(i+1,:)./num(i,:));
end
for i = 1:(n2-1)
    ret2(i,:) = log(num(temp1(i+1),:)./num(temp1(i),:));
end
for i = 1:(n3-1)
    ret3(i,:) = log(num(temp2(i+1),:)./num(temp2(i),:));
end

m = 0;
sd = 1;
ix = -3*sd:1e-3:3*sd;
iy = pdf('normal', ix, m, sd);

for i = 1:n
    figure();
    subplot(1,3,1);
    mu(i) = mean(ret1(:,i));
    sig(i) = std(ret1(:,i));
    ret1(:,i) = (ret1(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret1(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Daily data');
    subplot(1,3,2);
    mu(i) = mean(ret2(:,i));
    sig(i) = std(ret2(:,i));
    ret2(:,i) = (ret2(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret2(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Weekly data');
    subplot(1,3,3);
    mu(i) = mean(ret3(:,i));
    sig(i) = std(ret3(:,i));
    ret3(:,i) = (ret3(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret2(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Monthly data');
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1, data(i),'HorizontalAlignment','center','VerticalAlignment', 'top')
    text(0.5, 0.03,'\bf BSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['BSE_' num2str(i) '.jpg']);
    close;
end

clear;
clc;

[num,data] = xlsread('nsedata1.xlsx');
[n1 n] = size(num);
n2 = floor(n1/5);
n3 = floor(n1/21);
temp1 = 5*(linspace(1,n2,n2)-1)+1;
temp2 = 21*(linspace(1,n3,n3)-1)+1;

for i = 1:(n1-1)
    ret1(i,:) = log(num(i+1,:)./num(i,:));
end
for i = 1:(n2-1)
    ret2(i,:) = log(num(temp1(i+1),:)./num(temp1(i),:));
end
for i = 1:(n3-1)
    ret3(i,:) = log(num(temp2(i+1),:)./num(temp2(i),:));
end

m = 0;
sd = 1;
ix = -3*sd:1e-3:3*sd;
iy = pdf('normal', ix, m, sd);

for i = 1:n
    figure();
    subplot(1,3,1);
    mu(i) = mean(ret1(:,i));
    sig(i) = std(ret1(:,i));
    ret1(:,i) = (ret1(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret1(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Daily data');
    subplot(1,3,2);
    mu(i) = mean(ret2(:,i));
    sig(i) = std(ret2(:,i));
    ret2(:,i) = (ret2(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret2(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Weekly data');
    subplot(1,3,3);
    mu(i) = mean(ret3(:,i));
    sig(i) = std(ret3(:,i));
    ret3(:,i) = (ret3(:,i)-mu(i))/sig(i);
    [nn,xout] = hist(ret2(:,i),20);
    bar(xout,nn/sum(nn));
    hold on;
    plot(ix,iy,'red');
    title('Monthly data');
    ha = axes('Position',[0 0 1 1],'Xlim',[0 1],'Ylim',[0 1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
    text(0.5, 1, data(i),'HorizontalAlignment','center','VerticalAlignment', 'top')
    text(0.5, 0.03,'\bf NSE','HorizontalAlignment','center','VerticalAlignment', 'top')
    f = getframe(gcf);
    imwrite(f.cdata,['NSE_' num2str(i) '.jpg']);
    close;
end
