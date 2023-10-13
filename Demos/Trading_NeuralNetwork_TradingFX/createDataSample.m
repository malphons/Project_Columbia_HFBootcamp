function [time,Xpredictors,yResponse] = createDataSample(X,y,StartDate,EndDate)

if nargin < 4
    StartDate = '2007-01-01';
    EndDate   = '2007-02-28';
end

tr              = timerange(StartDate , EndDate);
predictorSample = timetable2table(X(tr , :) , 'ConvertRowTimes' , false);
yResponse       = timetable2table(y(tr , :) , 'ConvertRowTimes' , false);
time             = X.Time(tr);

% Take the factors and create out predictor table
Xpredictors = predictorSample(:,4:end);