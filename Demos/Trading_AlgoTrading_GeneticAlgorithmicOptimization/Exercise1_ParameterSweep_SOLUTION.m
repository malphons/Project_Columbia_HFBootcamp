%% Setting up a Parameter Sweep

%% Import Data
LCOClose      = Importfile_LCOBrentCrudeOil('Data_LCO_BrentCrudeOil.xlsx');
annualScaling = sqrt(250);

%% Using the LEADLAG function
[~,~,SharpeRatio] = leadlag(LCOClose,5,20,annualScaling);
disp(['The Sharpe Ratio = ' num2str(SharpeRatio)])

%% Exercise #1: Write a for-loop to try different LAG values with a fixed LAG of 1
SharpeRatio = nan(100,1);

for m = 1:100
    [~,~,SharpeRatio(m)] = leadlag(LCOClose,1,m,annualScaling);
end
plot(SharpeRatio)

%% Exercise #2: Write a double for-loop to try different LEAD & LAG values
SharpeRatio = nan(100,100);

tic
for n = 1:100
    for m = n:100
        [~,~,SharpeRatio(n,m)] = leadlag(LCOClose,n,m,annualScaling);
    end
end
toc
sweepPlotMA(SharpeRatio)
