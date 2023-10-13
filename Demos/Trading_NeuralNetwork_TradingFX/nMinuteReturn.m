function returns = nMinuteReturn(tt , nMins)
%function out = nMinuteReturn(tt , nMins)
%
% Given the time series of one minute bar data, create the return...

data = tt.Mid;
returns = NaN(size(data,1),1);
returns(nMins+1:end) = data(nMins+1:end) ./ data(1:end-nMins) - 1;
return

%out = timetable(tt.Time , returns , 'VariableNames' , {['Return_' num2str(nMins)]});
