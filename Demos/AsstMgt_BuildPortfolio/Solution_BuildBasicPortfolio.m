%% Build a Simple Portfolio

%% Import Data & Setup Key Variables
%
% >> summary(FinData)
load('Equity_SmallCap.mat')
Returns   = tick2ret(Prices{:,:});
Cash      = LIBOR.Rates/sqrt(252);
Market    = tick2ret(Calculate_MarketCapWeightedIndex(Prices,FinData.MarketCap));

%% Step #1: Create a Baseline Portfolio
P = Portfolio('AssetList', FinData.Ticker, 'RiskFreeRate', Cash(end));

%% [EXERCISE] Step #2: Setup Characteristics of Portfolio
%  ------------------------------------------------------
% Setup Portfolio Characteristics using the estimateAssetMoments method
% 1) >> doc estimateAssetMoments
% 2) Try setting it up using the 
%**************************************************************************

%REPLACE THIS LINE WITH YOUR CODE

%**************************************************************************

%% Step 3: Setup Portfolio Constraints [No Shorting & sum(Weights) = 1]
P = P.setDefaultConstraints;

%% Optimize Portfolio

% Step 1: Optimize Portfolio
PortWeights = P.estimateFrontier;
[PortRisk,PortReturn] = P.estimatePortMoments(PortWeights);

% Step 2: Optimize for a Level of Volatility
PortTargetWeights = P.estimateFrontierByRisk(1.2/sqrt(252));
[PortRiskTarget,PortReturnTarget] = P.estimatePortMoments(PortTargetWeights);

%% Visualization of Asset Risks vs Returns
ScatterPlot_Custom('Asset Risks and Returns', ...
                  {'line',PortRisk,PortReturn}, ...
                  {'scatter', PortRiskTarget,PortReturnTarget,{'Target'},'og'}, ...
                  {'scatter', std(Market), mean(Market), {'Market'}}, ...
                  {'scatter', std(Cash),    mean(Cash), {'Cash'}}, ...
                  {'scatter', sqrt(diag(P.AssetCovar)), P.AssetMean, P.AssetList, '.r'});
