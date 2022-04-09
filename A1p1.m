% Group 54: Kee Wee Yang A0099456L
%
% Question A1.1 (ii)
X=0.7:0.05:1.5;
Pdo=Pdo(1,X,0.8,0.5,0.04,0.01,0.35)
plot(X,Pdo,'b-')
hold on
xlabel('Strike Price ($)')
ylabel('Option Price ($)')
title('Option Price vs Strike Price for Barrier H=$0.8')
%
% Question A1.1 (iii)
Pput=bs_put(1,X,0.04,0.5,0.35,0.01)
plot(X,Pdo,'b-',X,Pput,'r-')
hold on
xlabel('Strike Price ($)')
ylabel('Option Price ($)')
title('Option Price vs Strike Price for Barrier H=$0.8')
%
clear
% Question A1.1 (iv)
S0=0.8:0.05:2.5
Pdo=Pdo(S0,1.1,0.8,0.5,0.04,0.01,0.35)
Pput=bs_put(S0,1.1,0.04,0.5,0.35,0.01)
plot(S0,Pdo,'b-',S0,Pput,'r-')
hold on
xlabel('Initial Price ($)')
ylabel('Option Price ($)')
title('Option Price vs Initial Price for Barrier H=$0.8')
%
clear
% Question A1.1 (v)
N=3050:3250
for i=1:length(N)
    Pdobtm(i)=btm_dnoput(1,1.1,0.8,0.04,0.5,0.35,0.01,N(i));
end
Pdo=Pdo(1,1.1,0.8,0.5,0.04,0.01,0.35);
abserror=Pdobtm-Pdo;
plot(N,abserror,'b-')
hold on
xlabel('N')
ylabel('Absolute error ($)')
title('Absolute error ($) vs N')

