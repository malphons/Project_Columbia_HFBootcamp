function Plot_SectorAllocation(PortWeights,PortRisk,FinData)

%% Setup x-Axis Labels
x_RiskText = num2cell(PortRisk*sqrt(252));
x_RiskText = cellfun(@(C)[num2str(C,'%10.2f') '%'],x_RiskText,'UniformOutput',false);

%% Calculate Sector Allocation
FinancialSectors = unique(FinData.Sector);
SectorWeights    = nan(length(FinancialSectors),size(PortWeights,2));
for i = 1:length(FinancialSectors)
    SectorWeights(i,:) = sum(PortWeights(FinData.SectorNominal == FinancialSectors{i},:));
end

%% Visualize
heatmap(SectorWeights, x_RiskText, FinancialSectors,'%10.2f%%','ShowAllTicks',true,'Colormap', 'spring', 'Colorbar', true,'GridLines', ':')
xlabel('\bf Low Risk -> High Risk')
ylabel('\bf Sector')
title('\bf Sector Allocation')