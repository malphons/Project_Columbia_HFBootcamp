%% Setting up a Parameter Sweep

%% Turn off warnings
warning off

%% Import Data
LCOClose      = Importfile_LCOBrentCrudeOil('Data_LCO_BrentCrudeOil.xlsx');
annualScaling = sqrt(250);

%% Using the LEADLAG function
[~,~,SharpeRatio] = leadlag(LCOClose,5,20,annualScaling);
disp(['The Sharpe Ratio = ' num2str(SharpeRatio)])

%% Exercise #2: Write a single for-loop to try different LEAD & LAG values
SharpeRatio = nan(100,1);

for m = 1:100
    [~,~,SharpeRatio(m)] = leadlag(LCOClose,1,m,annualScaling);
end
plot(SharpeRatio)

%% Exercise #2: Write a double for-loop to try different LEAD & LAG values
SharpeRatio = nan(100,100);

for m = 1:100
    for n = m:100
        [~,~,SharpeRatio(m,n)] = leadlag(LCOClose,m,n,annualScaling);
    end
end
sweepPlotMA(SharpeRatio)

%% Turn on warnings
warning on
