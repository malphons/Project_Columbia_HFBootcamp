function position = createPositionOnFutureReturns(FutureReturns,minimumReturn)

%% Responses
% Let's categorise the responses as buy, sell or hold. We will use the
% value of the return to classify the responses in our supervised learning
% problem.
%
% We want to classify the problem into three different states. We will use
% the median bid/offer spread to define a minimum predicted return at which
% we wouldn't trade.
% minRet = nanmedian(prices.Ask - prices.Bid);
% 
% % Let's round this to the nearest pip...
% minRet = roundUpTo(minRet , 0.0001);

% Now we can classify our responses...

position = zeros(size(FutureReturns));
position(FutureReturns > minimumReturn) = 1;
position(FutureReturns < -minimumReturn) = -1;

% Add the response to the table
% predictorTable.response = response;
