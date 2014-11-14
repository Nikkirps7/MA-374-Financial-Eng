% Mean Variance Optimizer
 
% S is matrix of security covariances
S = [0.005,-0.010,0.004;-0.010,0.040,-0.002;0.004,-0.002,0.023]
 
% Vector of security expected returns
zbar = [0.1;0.2;0.15]
 
% Unity vector..must have same length as zbar
unity = ones(length(zbar),1)
 
% Vector of security standard deviations
stdevs = sqrt(diag(S))
 
% Calculate Efficient Frontier
A = unity'*S^-1*unity
B = unity'*S^-1*zbar
C = zbar'*S^-1*zbar
D = A*C-B^2
 
% Efficient Frontier
mu = (1:100)/100;
 
% Plot Efficient Frontier
minvar = ((A*mu.^2)-2*B*mu+C)/D;
minstd = sqrt(minvar);
 
plot(minstd,mu,stdevs,zbar,'*')
title('Efficient Frontier with Individual Securities','fontsize',18)
ylabel('Expected Return (%)','fontsize',18)
xlabel('Standard Deviation (%)','fontsize',18)