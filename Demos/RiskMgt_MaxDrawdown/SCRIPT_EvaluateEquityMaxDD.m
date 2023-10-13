%% Build a BackTest

%% Portfolio Parameters
Equity     = 60e6;
Margin     = 0.30*Equity;

%% Import Market Data
D = Import_InvestmentData('Equity_MidCap');
D.FinData = Prep_EquityData(D.FinData);

%% Build a Backtest
[SectorWeightsTable,PortWeights,PortRisk,PortReturns,Port] = Build_OptimalPortfolioGivenRisk(D.FinData,D.Returns,0.05/252,0.33);

%% Calculate Weighted Returns for BackTest
BackTestReturns = D.Returns*PortWeights;
Performance     = ret2tick(BackTestReturns,Equity);
MarketPrices    = ret2tick(D.Market,Equity);
Plot_FinancialTimeSeries(figure,gca,D.Dates,[Performance MarketPrices],'mm/yy',10,10,'Million','Time Series')
hold on
[MaxDD, MaxDDIndex] = maxdrawdown(Performance, 'arithmetic');
title('\bf Max Drawdown: Portfolio Performance Vs. Benchmark')

%% Visualize Max DrawDown
plot(D.Dates(MaxDDIndex(1):MaxDDIndex(end)),Performance(MaxDDIndex(1):MaxDDIndex(end)),'r')
legend({'Portfolio','Market Benchmark','Max Drawdown'})
Loss = (Performance(MaxDDIndex(end)) - Performance(MaxDDIndex(1)))/Performance(MaxDDIndex(1));

disp(['Max DrawDown (%)       = ' num2str(Loss*100,'%10.2f') '%'])
disp(['Max DrawDown (Equity)  = $' num2str(Loss*Equity/1e6,'%10.2f') 'M'])
