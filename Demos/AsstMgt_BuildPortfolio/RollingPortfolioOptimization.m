%% Build a Trading Strategy

%% Import Data
Data = load('Equity_MidCap');
FinData = Data.FinData;
Prices  = Data.Prices;
Dates   = Data.Dates;
Prices = Prices{:,1:144};

Returns = tick2ret(Prices);

%% Setup Financial Time Series Object
[mid, uppr, lowr] = bollinger(Prices, 22);

%% Simple Rolling Strategy
WindowSize = 22;
P = Portfolio;
m = mean(Returns);
C = cov(Returns);
P = P.setAssetMoments(m,C);
P = P.setDefaultConstraints;
Pweights = nan(size(Prices,2),269);
P = P.estimateAssetMoments(Prices,'DataFormat','Prices');



for i = 1:length(Dates) - WindowSize
    disp(['Processing Portfolio #' num2str(i)])
    P        = P.estimateAssetMoments(Prices(i:i+WindowSize-1,:),'DataFormat','Prices');
    Pweights(:,i) = P.estimateFrontierByRisk(0.03);
end