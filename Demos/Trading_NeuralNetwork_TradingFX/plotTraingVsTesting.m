function plotTraingVsTesting(X,y,train_startDate,train_endDate,test_startDate,test_endDate)

%% Create Data subset
if nargin == 0
    [timeIn,XpredictorsIn,yResponseIn]    = createDataSample(X,y,'2008-01-01' , '2008-02-28');
    [timeOut,XpredictorsOut,yResponseOut] = createDataSample(X,y,'2008-03-01' , '2008-03-31');
else
    [timeIn,XpredictorsIn,yResponseIn]    = createDataSample(X,y,train_startDate ,train_endDate);
    [timeOut,XpredictorsOut,yResponseOut] = createDataSample(X,y,test_startDate , test_endDate);    
end
figure; plot(X.Time,y.FutureReturn); hold on; plot(timeIn,yResponseIn.FutureReturn,'ko','MarkerFaceColor','green');
plot(timeOut,yResponseOut.FutureReturn,'ko','MarkerFaceColor','red');
legend('All Future Returns','In Sample','Out Of Sample')
grid('on')