function [returns , trades] = fxNeuralModel(xInSample , yInSample , xOutSample , yOutSample , tc)

xInSample  = xInSample';
yInSample  = yInSample';
xOutSample = xOutSample';

xInSample = con2seq(xInSample);
yInSample = con2seq(yInSample);
xOutSample = con2seq(xOutSample);

% Build the neural network
rnnLayer = 20;
net = layrecnet(1:10, rnnLayer);
net.trainFcn = 'trainscg';
net.trainParam.showWindow = false;
[Xs,Xi,Ai,Ts] = preparets(net,xInSample,yInSample);
net = train(net,Xs,Ts,Xi,Ai);
[~,Xf,Af] = net(Xs,Xi,Ai);
retPred = sim(net, xOutSample, Xf, Af);
retPred = cell2mat(retPred);
retPred = retPred(:);

% Calculate the performance in the out of sample
positions=zeros(size(yOutSample,1), 1);
positions(retPred > 0)=1;
positions(retPred < 0)=-1;
returns = positions .* yOutSample - tc;

trades = positions;
