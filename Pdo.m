% Group 54: Kee Wee Yang A0099456L
% function for European down-and-out put option price (exact solution)
% call syntax: optprice=Pdo(S0,X,T,r,q,sigma)
function optprice=Pdo(S0,X,H,T,r,q,sigma)
% normalize size of S0 and X
if length(S0)>1
    X=X*ones(1,length(S0));
elseif length(X)>1
    S0=S0*ones(1,length(X));
end
% calculate base variables
lambda=(r-q+sigma*sigma/2)/(sigma*sigma);
eta=sigma*sqrt(T);
x0=log(S0./X)./eta+lambda*eta;
x1=log(S0./H)./eta+lambda*eta;
y0=log(H*H./(S0.*X))./eta+lambda*eta;
y1=log(H./S0)./eta+lambda*eta;
% for each element in the vector, use if statement to check if X>H
% if X>H, calculates option price, else option price=0
for i=1:length(X)
if X(i)>H
    optprice(i)=X(i)*exp(-r*T)*(normcdf(-x0(i)+eta)-normcdf(-x1(i)+eta)...
        +(H/S0(i))^(2*lambda-2)*(normcdf(y0(i)-eta)-normcdf(y1(i)-eta)))...
        -S0(i)*exp(-q*T)*(normcdf(-x0(i))-normcdf(-x1(i))...
        +(H/S0(i))^(2*lambda)*(normcdf(y0(i))-normcdf(y1(i))));
else
    optprice(i)=0;
end
end
return
