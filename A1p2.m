% Group 54: Kee Wee Yang A0099456L
%
% Question A1.2 (i)
N=200:200:10000;
for i=1:length(N)
    optval(i)=btm_lookback_fs_put_v1(5,0.05,0.5,0.37,0.01,N(i));
end
plot(N,optval,'b-')
hold on
xlabel('N')
ylabel('Option Value ($)')
title('Option Value vs N')
%
clear
%
% Question A1.2 (ii)
N=200:200:10000;
for i=1:length(N)
    optval(i)=btm_lookback_fs_put_v2(5,0.05,0.5,0.37,0.01,5.8,N(i));
end
plot(N,optval,'b-')
hold on
xlabel('N')
ylabel('Option Value ($)')
title('Option Value vs N')
%
clear
%
% Question A1.2 (iii)
S0=5:0.05:6.5;
for i=1:length(S0)
optval(i)=btm_lookback_fs_put_v2(S0(i),0.05,0.5,0.37,0.01,5.8,5000);
end
plot (S0,optval,'b-')
hold on
xlabel('S0 ($)')
ylabel('Option Value ($)')
title('Option Value vs S0')