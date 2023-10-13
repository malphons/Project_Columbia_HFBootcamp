function [smaSignal,smaSignalNameEnding] = build_MovAvg_5_20_Signals(pricesTT)

%% Create SMA timetables using the movavg function.
sma5  = movavg(pricesTT,'simple',5);
sma20 = movavg(pricesTT,'simple',20);

%% Create the SMA indicator signal timetable.
smaSignalNameEnding = '_SMA5over20';
symbols             = string(pricesTT.Properties.VariableNames);

smaSignal = timetable;
for i = 1:numel(symbols)
    symi = symbols(i);
    % Build a timetable for each symbol, then aggregate them together.
    smaSignali = timetable(pricesTT.Dates,double(sma5.(symi) > sma20.(symi)),'VariableNames',{sprintf('%s%s',symi,smaSignalNameEnding)});
    % Use the synchronize function to merge the timetables together.
    smaSignal = synchronize(smaSignal,smaSignali);
end