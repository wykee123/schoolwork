% Black-Scholes formulae for European vanilla put
% call syntax: c = bs_put(S0, X, r, T, sigma, q)
%
function  c = bs_put(S0, X, r, T, sigma, q)
d1=(log(S0./X)+(r-q+sigma^2/2)*T)/sigma/sqrt(T);
d2=d1-sigma*sqrt(T);
c=X.*exp(-r*T).*normcdf(-d2)-exp(-q*T).*S0.*normcdf(-d1);
return

