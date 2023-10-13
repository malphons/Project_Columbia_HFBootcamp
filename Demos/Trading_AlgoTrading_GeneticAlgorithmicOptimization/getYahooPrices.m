function [Dates,Prices,Returns] = getYahooPrices(Ticker)

%% Input Checking
if nargin == 0
    Ticker = 'IBM';
end

%% Setup Connection
c = yahoo;

%% Import Data
d = fetch(c,Ticker,'adj close',now-10*252,now,'d');
Dates = datetime(d(:,1),'ConvertFrom','datenum');
Prices = d(:,2);
Returns = tick2ret(Prices);

%% Visualization
if nargout == 0
    plot(Dates,Prices)
end