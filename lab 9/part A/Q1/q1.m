close all;
clear;
clc;

[num]=xlsread('NSEoptiondata.xlsx',1);
surf(num);
xlabel('T');
ylabel('K');
zlabel('Settling Price');
title('European Call for NIFTY');

figure();
[num]=xlsread('NSEoptiondata.xlsx',2);
surf(num);
xlabel('T');
ylabel('K');
zlabel('Settling Price');
title('European put for NIFTY');

figure();
[num]=xlsread('NSEoptiondata.xlsx',3);
plot(num(:,1),num(:,2));
xlabel('K');
ylabel('Settling Price');
title('European call for NIFTY');

figure();
[num]=xlsread('NSEoptiondata.xlsx',4);
plot(num(:,1),num(:,2));
xlabel('K');
ylabel('Settling Price');
title('European put for NIFTY');

figure();
[num]=xlsread('NSEoptiondata.xlsx',5);
plot(num(:,1),num(:,2));
xlabel('T');
ylabel('Settling Price');
title('European call for NIFTY');

figure();
[num]=xlsread('NSEoptiondata.xlsx',6);
plot(num(:,1),num(:,2));
xlabel('T');
ylabel('Settling Price');
title('European put for NIFTY');