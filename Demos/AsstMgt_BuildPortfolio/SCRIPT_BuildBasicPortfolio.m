%% Build a Simple Portfolio

%% Import Data & Setup Key Variables
%
% >> summary(FinData)
load('Equity_MidCap.mat')
Returns   = tick2ret(Prices{:,:});
Cash      = LIBOR.Rates/sqrt(252);
Market    = tick2ret(Calculate_MarketCapWeightedIndex(Prices,FinData.MarketCap));

%% Create a Portfolio object
%
% Create a Portfolio object with the Portfolio constructor and estimate the mean and covariance of
% asset returns with the method |estimateAssetMoments|. Include the risk-free rate using the most
% recent cash return and specify an equally-weighted initial portfolio with the method
% |setInitPort|. The first figure shows the distribution of risk and return for the assets in the
% universe along with market, cash, and equal-weight risks and returns.

% Step 1: Setup a baseline Portfolio
P = Portfolio('AssetList', FinData.Ticker, 'RiskFreeRate', Cash(end));

% Step 2: Setup Characteristics of Portfolio
P = P.estimateAssetMoments(Returns, 'missingdata', true);
P = P.setInitPort(1/P.NumAssets);

% Step 3: Setup Portfolio Constraints
P = P.setDefaultConstraints;

%% Optimize Portfolio

% Step 1: Optimize Portfolio
PortWeights = P.estimateFrontier;
[PortRisk,PortReturn] = P.estimatePortMoments(PortWeights);

% Step 2: Optimize for a Level of Volatility
PortTargetWeights = P.estimateFrontierByRisk(1.2/sqrt(252));
[PortRiskTarget,PortReturnTarget] = P.estimatePortMoments(PortTargetWeights);

%% Sector Exposures
disp(num2str(['Exposure to Services Industry = ' num2str(100*sum(PortTargetWeights(categorical(FinData.Sector) == 'Services')),'%10.2f') '%']))

%% Visualization of Asset Risks vs Returns
ScatterPlot_Custom('Asset Risks and Returns', ...
                  {'line',PortRisk,PortReturn}, ...
                  {'scatter', PortRiskTarget,PortReturnTarget,{'Target'},'og'}, ...
                  {'scatter', std(Market), mean(Market), {'Market'}}, ...
                  {'scatter', std(Cash),    mean(Cash), {'Cash'}}, ...
                  {'scatter', sqrt(diag(P.AssetCovar)), P.AssetMean, P.AssetList, '.r'});
