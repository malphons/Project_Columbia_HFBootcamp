function FinData = Prep_EquityData(FinData)

%% Preprocess Key Variables
FinData.Ticker        = categorical(FinData.Ticker);
FinData.Company       = categorical(FinData.Company);
FinData.Sector        = regexprep(FinData.Sector,' ','');
FinData.SectorNominal = categorical(FinData.Sector);
FinData.Industry      = categorical(FinData.Industry);
FinData.Country       = categorical(FinData.Country);
