%% Trading Strategy

%% Import Section
[Date,Volume,Open,Close,High,Low] = importPriceData('Data_LCO_BrentCrudeOil.xlsx');

%% Estimate Technical Indicator
[Short,Long] = movavg(Close,5,20);

%% Setup Trading Signal
Signal = zeros(length(Close),1);
Signal(Short > Long) = 1;
Signal(Long > Short) = -1;
I_Buying = (Signal == 1);
I_Selling = (Signal == -1);

%% Visualization
figure; plot(Date(I_Buying),Close(I_Buying),'go');
hold on
plot(Date(I_Selling),Close(I_Selling),'r+');
plot(Date,Close,'k');
createfigure1(Date,Close,Date(2:end),returns)