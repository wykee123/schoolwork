% Group 54 Kee Wee Yang A0099456L
% BTM for European down-and-out put options
% call syntax: OptVal=btm_dnoput(S0,X,H,r,T,sigma,q,N)
function OptVal=btm_dnoput(S0,X,H,r,T,sigma,q,N)
% set up lattice parameters
dt=T/N; dx=sigma*sqrt(dt);
u=exp(dx); d=1/u;
df=exp(-r*dt);     % discount factor 
p=(exp((r-q)*dt)-d)/(u-d);  % risk-neutral probability
i=ceil(log(H/S0)/(sigma*sqrt(T/N))); % find i for barrier in BTM
H=S0*exp(i*sigma*sqrt(T/N));
% initialization
j = 0:1:N;  jshift = 1; % range of index for price states
Vn(j+jshift)=logical(S0*u.^(2*j-N)>H).*...
max(X-S0*u.^(2*j-N),0);
% backward recursive through time
for n=N-1:-1:0   
   Vnp1=Vn;
   j = 0:1:n; 
   Vn=logical(S0*u.^(2*j-n)>H).*...
   df.*(p.*Vnp1(j+1+jshift)+(1-p).*Vnp1(j+jshift));
end
OptVal=Vn(0+jshift)


