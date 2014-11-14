clear all;
close all;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mean Variance Optimizer Inputs (Update this section with your own inputs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% S is matrix of security covariances
S=[0.005,-0.010,0.004;-0.010,0.040,-0.002;0.004,-0.002,0.023]
 
% Vector of security expected returns
zbar = [0.1;0.2;0.15]
 
% Target Return
mu_tar = 14
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculating Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Unity vector..must have same length as zbar
unity = ones(length(zbar),1)
 
% Vector of security standard deviations
stdevs = sqrt(diag(S))
 
A = unity'*S^-1*unity
B = unity'*S^-1*zbar
C = zbar'*S^-1*zbar
D = A*C-B^2
 
% Calculate Lambda and Gamma
lambda_target = (C - mu_tar*B)/D;
gamma_target =  (mu_tar*A-B)/D;
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Efficient Frontier
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mu = 1:200;
mu = mu/10;
 
minvar = ((A*mu.^2)-2*B*mu+C)/D;
minstd = sqrt(minvar);
 
plot(minstd,mu,stdevs,zbar,'*')
title('Efficient Frontier with Individual Securities','fontsize',18)
ylabel('Expected Return (%)','fontsize',18)
xlabel('Standard Deviation (%)','fontsize',18)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Global Minimum Variance Portfolio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Mean and Variance of Global Minimum Variance Portfolio
mu_g = B/A
var_g = 1/A
std_g = sqrt(var_g)
 
% Minimum Variance Portfolio Weights
w_g = (S^-1*unity)/A
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tangency Portfolio with a Risk Free Rate = 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Weights for Tangency Portfolio, R=0
w_d = (S^-1*zbar)/B
 
% Expected Return of Tangency Portfolio
mu_d = w_d'*zbar;
 
% Variance and Standard Deviation of Tangency Portfolio
var_d = w_d'*S*w_d;
std_d = sqrt(var_d);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Portfolio with Expected Return = 14%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Weights for portfolio with target return = 14%
 
w_s = (lambda_target*A)*w_g + (gamma_target*B)*w_d;
 
% Expected Return of Target Portfolio (should match target)
mu_s = w_s'*zbar;
 
% Variance and Standard Deviation of target portfolio
var_s = w_s'*S*w_s;
std_s = sqrt(var_s);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot Efficient Frontier and Key Points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
w_s