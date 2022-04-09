% Group 54 Kee Wee Yang A0099456L
% function for American floating strike lookback put (single-state BTM)
% call syntax: optval=btm_lookback_fs_put_v1(S0,r,T,sigma,q,N)
function optval=btm_lookback_fs_put_v1(S0,r,T,sigma,q,N)
% set up lattice parameters
dt=T/N; dx=sigma*sqrt(dt);
u=exp(dx); d=1/u;
df=exp(-r*dt);     % discount factor 
p=(exp((r-q)*dt)-d)/(u-d);  % risk-neutral probability
% initialization
kshift=1;
for k=0:N
    Wn(k+kshift)=exp(k*dx)-1;
end
% backward iterations
for n=N-1:-1:0
    Wnp1=Wn;
    Wn(0+kshift)=max(df*(p*u*Wnp1(0+kshift)+(1-p)*d*Wnp1(1+kshift)),0);
    for k=1:n
        Wn(k+kshift)=max(df*(p*u*Wnp1(k-1+kshift)+(1-p)*d*Wnp1(k+1+kshift)),exp(k*dx)-1);
    end
end
optval=Wn(0+kshift)*S0;