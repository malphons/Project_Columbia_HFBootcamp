function [X,y] = createTechnicalSignalandResponse(prices,Reload)

%% Calculate our predictor/response
%
% First, we want to create a function that generates our predictor/response
% tables which we can then use for regression or machine learning.
%
% We will take a number of different factors in our predictive model
%
% * N-Minute returns (over various window lengths)
% * Moving Average Convergence/Divergence
% * Relative Strength Index (over various window lengths)

if nargin < 2
    Reload = false;
end

if Reload
    % Define the traing frequency of 6- minutes
    tradingFrequency = 60;

    % These are the n-minute returns that we want to use to build our model
    nMinReturns = [5 10 15 20 25 30 60];

    % Other functions to use... Let's take a couple of toolbox functions

    % MACD technical indicator
    otherSignals = [];
    otherSignals(1).fnHand = 'macd';
    otherSignals(1).params = [];
    otherSignals(1).field  = 'Mid';

    % RSINDEX
    for i = [5 10 15 20 25 30 60]
        otherSignals(end+1).fnHand = 'rsindex';
        otherSignals(end).params   = i;
        otherSignals(end).field    = 'Mid';
    end

    % % MOMENTUM
    % for i = [5 10 15 20 25 30 60]
    %     otherSignals(end+1).fnHand = 'tsmom'; %#ok<SAGROW>
    %     otherSignals(end).params   = i;
    %     otherSignals(end).field    = 'Mid';
    % end

    downSample = true;
    [X , y] = fxAlgoMakeSignals(prices , nMinReturns , otherSignals , tradingFrequency , downSample);
else
    load('fxData.mat')
end