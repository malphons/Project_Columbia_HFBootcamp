function FinData = Prep_EquityData(FinData)

%% Preprocess Key Variables
FinData.Ticker = nominal(FinData.Ticker);
FinData.Company = nominal(FinData.Company);
FinData.Sector  = regexprep(FinData.Sector,' ','');
FinData.Sector = nominal(FinData.Sector);
FinData.Industry = nominal(FinData.Industry);
FinData.Country = nominal(FinData.Country);
