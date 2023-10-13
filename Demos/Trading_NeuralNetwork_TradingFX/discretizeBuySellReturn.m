function positions = discretizeBuySellReturn(returnPrediction)

positions = zeros(size(returnPrediction));
positions(returnPrediction > 0) = 1;
positions(returnPrediction < 0) = -1;
