function prices = loadTickData(currPair)

s = load(['.' filesep 'Data' filesep currPair]);
prices = s.prices;
figure;
hold on;
plot(prices.Time , prices.Mid)
title(['Currency Pair ' currPair]);
box on;