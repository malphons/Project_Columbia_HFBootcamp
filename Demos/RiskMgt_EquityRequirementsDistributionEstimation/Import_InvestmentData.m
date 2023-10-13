function D = Import_InvestmentData(FileName)

%% Import Data & Setup Key Variables
%
% >> summary(FinData)
D = load(FileName);
D.Cash      = D.LIBOR.Rates/sqrt(252);
D.Returns   = tick2ret(D.Prices{:,:});
D.Market    = tick2ret(Calculate_MarketCapWeightedIndex(D.Prices,D.FinData.MarketCap));
