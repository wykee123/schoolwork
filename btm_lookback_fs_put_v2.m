% Group 54 Kee Wee Yang A0099456L
% function for American floating strike lookback put (single-state BTM)
% call syntax: optval=btm_lookback_fs_put_v2(S0,r,T,sigma,q,N)
function optval=btm_lookback_fs_put_v2(S0,r,T,sigma,q,smax,N)
% set up lattice parameters
dt=T/N; dx=sigma*sqrt(dt);
u=exp(dx); d=1/u;
df=exp(-r*dt);     % discount factor 
p=(exp((r-q)*dt)-d)/(u-d);  % risk-neutral probability
% determine j
x0=log(max(S0,smax)/S0);
j=floor(x0/dx);
% initialization
kshift=1;
for k=max(j-N,0):j+N+1
    Wn(k+kshift)=exp(k*dx)-1;
end
% backward iterations
for n=N-1:-1:0
    Wnp1=Wn;
    if j-n<=0
    Wn(0+kshift)=max(df*(p*u*Wnp1(0+kshift)+(1-p)*d*Wnp1(1+kshift)),0);
    end
    for k=max(j-n,1):j+n+1;
        Wn(k+kshift)=max(df*(p*u*Wnp1(k-1+kshift)+(1-p)*d*Wnp1(k+1+kshift)),exp(k*dx)-1);
    end
end
% linear interpolation
y1=Wn(j+kshift)*S0;
y2=Wn(j+1+kshift)*S0;
x1=j*dx;
x2=(j+1)*dx;
x=x0;
y = y1 + (y2-y1)/(x2-x1) * (x-x1);
optval=y