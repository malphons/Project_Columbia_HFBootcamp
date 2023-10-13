function SharpeRatio = MyLeadLagFun(LCOClose,annualScaling,n,m)

if n == m
    n = n+1;
elseif n > m
    temp = m;
    n = m;
    m = temp;
end
[~,~,SharpeRatio] = leadlag(LCOClose,n,m,annualScaling);