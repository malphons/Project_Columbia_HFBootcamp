%% Build a BackTest

%% Portfolio Parameters
Equity     = 60e6;
Margin     = 0.30*Equity;

%% Import Market Data
D = Import_InvestmentData('Equity_MidCap');
D.FinData = Prep_EquityData(D.FinData);

%% Build a Portfolio
[SectorWeightsTable,PortWeights,PortRisk,PortReturns,Port] = Build_OptimalPortfolioGivenRisk(D.FinData,D.Returns,0.05/252,0.33);

%% Calculate Weighted Returns for BackTest
BackTestReturns = D.Returns*PortWeights;
Performance     = ret2tick(BackTestReturns,Equity);
MarketPrices    = ret2tick(D.Market,Equity);

%% Estimate distribution of returns
LookBackPeriod  = 22;
PortDist_Kernel = fitdist(BackTestReturns(end-LookBackPeriod:end),'Kernel');
PortDist_Normal = fitdist(BackTestReturns(end-LookBackPeriod:end),'Normal');
PortDist_EV     = fitdist(BackTestReturns(end-LookBackPeriod:end),'ExtremeValue');
x_values = min(BackTestReturns)-0.05*min(BackTestReturns):0.001:max(BackTestReturns)-0.05*max(BackTestReturns);
P_Kernel = pdf(PortDist_Kernel,x_values);
P_Normal = pdf(PortDist_Normal,x_values);
P_EV     = pdf(PortDist_EV,x_values);
[nelements,centers] = hist(BackTestReturns,30);
h_fig = figure;
subplot(2,1,1)
hist(BackTestReturns,30)
hold on
plot(x_values,P_Kernel*max(nelements)/max(P_Kernel),'r')
plot(x_values,P_Normal*max(nelements)/max(P_Normal),'g')
plot(x_values,P_EV*max(nelements)/max(P_EV),'m')
legend('Original Data Histogram','Fitted Distribution - Kernel','Fitted Distribution - Normal','Fitted Distribution - Extreme Value')

%% Create Forecast
Days2Forecast = 252;
PortReturnsForecast       = random(PortDist_EV,[Days2Forecast 100]);
PortReturnsForecastPrices = ret2tick(PortReturnsForecast,Performance(end));
PortReturnsForecastPrices = [nan(length(D.Dates),size(PortReturnsForecastPrices,2)); PortReturnsForecastPrices];
Dates2Plot = [D.Dates; daysadd(D.Dates(end),1:Days2Forecast+1)];

h_axis = subplot(2,1,2);
Plot_FinancialTimeSeries(h_fig,h_axis,D.Dates,[Performance MarketPrices],'mm/yy',10,10,'Million','Time Series')
legend({'Portfolio','Market Benchmark'})
hold on
Plot_FinancialTimeSeries(h_fig,h_axis,Dates2Plot,PortReturnsForecastPrices,'mm/yy',10,10,'Million','Time Series')
% axis([min(Dates2Plot) max(Dates2Plot) min(min([Performance MarketPrices])) max(max(PortReturnsForecastPrices))])
grid off
title('\bf Forecasting based on Kernel Distribution of Last 22 Days')

%% Calculate VaR & CVaR
VaR           = prctile(PortReturnsForecast(22,:),5);
I_LessThanVaR = PortReturnsForecast(22,:) < VaR;
CVaR          = mean(PortReturnsForecast(I_LessThanVaR,22));

%% Estimate Equity Requirements 
disp(['Worst Loss (VaR)    = ' num2str(VaR*100,'%10.2f') '%'])
disp(['Worst Loss (VaR)  $ = ' cur2str(VaR*Equity/1e6) 'M'])
disp(['Worst Loss (CVaR)   = ' num2str(CVaR*100,'%10.2f') '%'])
disp(['Worst Loss (CVaR) $ = ' cur2str(CVaR*Equity/1e6) 'M'])