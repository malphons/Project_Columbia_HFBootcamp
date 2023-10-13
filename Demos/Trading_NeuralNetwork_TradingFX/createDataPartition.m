function [timeIn,XpredictorsIn,yResponseIn,timeOut,XpredictorsOut,yResponseOut] = createDataPartition(prices,Year)
    [X,y] = createTechnicalSignalandResponse(prices,false);
    [timeIn,XpredictorsIn,yResponseIn]    = createDataSample(X,y,[Year '-01-01'] , [Year '-03-31']);
    [timeOut,XpredictorsOut,yResponseOut] = createDataSample(X,y,[Year '-04-01'] , [Year '-04-30']);
    figure; plot(X.Time,y.FutureReturn); hold on; plot(timeIn,yResponseIn.FutureReturn,'ko','MarkerFaceColor','green');
    plot(timeOut,yResponseOut.FutureReturn,'ko','MarkerFaceColor','red');
    legend('All Future Returns','In Sample','Out Of Sample')
end
