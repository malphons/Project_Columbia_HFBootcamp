function plotGrowths(ax,time,Growth,growthLegends,titleName)

time = [time; time(end) + hours(1)];
hold(ax,'on')
for i = 1:size(Growth,2)
    plot(ax,time,Growth(:,i))
    LegendLabels{i} = [growthLegends{i} ' | ' num2str(100*tick2ret([100;Growth(end,i)]),'%10.2f') '%'];
end
legend(ax,LegendLabels,'Location','northwest')
% legend([GrowthLegends {i} ' | ' num2str(100*tick2ret([100;Growth100_LinearIn(end)]),'%10.2f') '%'], ...
%        [GrowthLegends' | ' num2str(100*tick2ret([100;Growth100_StepwiseIn(end)]),'%10.2f') '%'])
title(ax,titleName)
grid(ax,'on')