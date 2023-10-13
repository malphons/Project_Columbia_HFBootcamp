function [SectorWeightsTable,PortWeights,PortRisk,PortReturns,P] = Build_OptimalPortfolioGivenRisk(FinData,Returns,RiskFreeRate,MaxVolatilityPercent)

%% Create a Basic Portfolio object

% Step 1: Setup a baseline Portfolio
P = Portfolio('AssetList', cellstr(FinData.Ticker), 'RiskFreeRate', RiskFreeRate);

% Step 2: Setup Characteristics of Portfolio
P = P.estimateAssetMoments(Returns, 'missingdata', true);
P = P.setInitPort(1/P.NumAssets);

% Step 3: Setup Portfolio Constraints
P = P.setDefaultConstraints;

%% Setup Asset Bounds & Sector Bounds on Portfolios

% Step 1: Setup Asset Bounds
AssetLowerBounds = zeros(size(Returns,2),1);
AssetUpperBounds = 0.3*ones(size(Returns,2),1);
P = P.setBounds(AssetLowerBounds, AssetUpperBounds);

% Step 2: Setup Sector Bounds
FinSector = FinData.SectorNominal(:)';

P = P.setGroups(FinSector == 'BasicMaterials',0,0.05);
P = P.addGroups(FinSector == 'ConsumerGoods',0,0.3);
P = P.addGroups(FinSector == 'Financial',0,0.3);
P = P.addGroups(FinSector == 'Healthcare',0,0.3);
P = P.addGroups(FinSector == 'IndustrialGoods',0,0.05);
P = P.addGroups(FinSector == 'Services',0,0.1);
P = P.addGroups(FinSector == 'Technology',0,0.1);
P = P.addGroups(FinSector == 'Utilities',0,0.1);

%% Estimate Weights for Specfic Level of Risk
PortWeights = P.estimateFrontierByRisk(MaxVolatilityPercent/sqrt(252));
[PortRisk,PortReturns] = P.estimatePortMoments(PortWeights);

%% Create a Sector Weight Table
FinancialSectors = unique(FinData.Sector);
SectorWeights    = nan(length(FinancialSectors),size(PortWeights,2));
for i = 1:length(FinancialSectors)
    SectorWeights(i,:) = sum(PortWeights(FinData.SectorNominal == FinancialSectors{i},:));
end

SectorWeightsCell = cellfun(@(C) [C '%'],cellstr(num2str(SectorWeights*100,'%10.2f')),'UniformOutput',false);
SectorWeightsTable = cell2table(SectorWeightsCell);
SectorWeightsTable.Properties.RowNames = FinancialSectors;
SectorWeightsTable.Properties.VariableNames = {'SectorWeights'};