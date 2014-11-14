function[Y]=YieldCIR(t,T,beta,mu,sigma,r)
    h=sqrt((beta*beta)+(2*sigma*sigma));
    A=(2*h*exp((h+beta)*(T-t)*0.5))/((2*h)+(h+beta)*(exp(h*(T-t))-1));
    A=A^((2*beta*mu)/(sigma*sigma));
    B=(2*(exp(h*(T-t))-1))/((2*h)+(h+beta)*(exp(h*(T-t))-1));
    P=A*exp(-1*r*B);
    Y=-1*(log(P)/(T-t));
end