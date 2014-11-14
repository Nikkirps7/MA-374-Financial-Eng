function[P]=optionval(M,t1)
    P=0;
    S=9;
    K=10;
    T=3;
    r=0.06;
    %sigma=0.3;
    t=T/M;
    u=exp((0.3*sqrt(t))+(r-(0.09/2))*t);
    d=exp((-0.3*sqrt(t))+(r-(0.09/2))*t);
    %the probability for risk neutral measure
    p=(exp(r*t)-d)/(u-d);
    i=1;
    l=0;
    while(i<=M)
        l=S*(u^i)*(d^(M-i));
        l=K-l;%the strike price
        l=max(1,0);
        P=P+l*(p^i)*((1-p)^(M-i));
        i=i+1;
    end
    P=P*exp(-r*(T));%discounted price till t=0
end
