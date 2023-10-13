function [macdSignal,macdSignalNameEnding] = build_MACD_Signals(pricesTT)
%% MACD Signal Design
% The MACD is calculated by subtracting the 26-period (7.5%) exponential
% moving average from the 12-period (15%) moving average.

% The nine-period (20%) exponential moving average of the MACD line is used as the "signal" line. When the two lines are plotted, they can give you indications on when to buy or sell a stock, when overbought or oversold is occurring, and when the end of trend may occur. For example, when the MACD and the 20-day moving average line have crossed and the MACD line becomes below the other line, it is time to sell.
% Create a timetable of the MACD metric using the MACD function.
macdTT = macd(pricesTT);

%% Create the MACD indicator signal timetable.
macdSignalNameEnding = '_MACD';
symbols              = string(pricesTT.Properties.VariableNames);

macdSignal = timetable;
for i = 1:numel(symbols)
    symi = symbols(i);
    % Build a timetable for each symbol, then aggregate the symbols together.
    macdSignali = timetable(pricesTT.Dates,...
        double(macdTT.(symi) > 0),...
        'VariableNames',{sprintf('%s%s',symi,macdSignalNameEnding)});
    macdSignal = synchronize(macdSignal,macdSignali);
end