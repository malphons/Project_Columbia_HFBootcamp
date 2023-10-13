function MarketIndex = Calculate_MarketCapWeightedIndex(Prices,MarketCap)

Weights = MarketCap/sum(MarketCap);
MarketIndex = table2array(Prices)*Weights;

