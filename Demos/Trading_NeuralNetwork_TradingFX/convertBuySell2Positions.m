function positions = convertBuySell2Positions(predicted)

positions = zeros(length(predicted),1);
positions(predicted == 'Buy') = 1;
positions(predicted == 'Sell') = -1;
positions(predicted == 'Hold') = 0;