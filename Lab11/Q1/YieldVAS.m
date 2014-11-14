function[Y]=YieldVAS(t,T,beta,mu,sigma,r)
    A=(1-exp(-1*beta*(T-t)))/beta;
    D=((mu-(sigma*sigma/(2*beta*beta)))*(A-(T-t)))-((sigma*sigma*A*A)/(4*beta));
    B=exp((-A*r)+D);
    Y=-1*log(B)/(T-t);
    return
end