function createMyPlot(Dates, Prices, Returns)
%CREATEFIGURE1(X1, Y1, DATA1)
%  X1:  vector of x data
%  Y1:  vector of y data
%  DATA1:  histogram data

%  Auto-generated by MATLAB on 10-Feb-2016 00:59:35

% Create figure
figure1 = figure('Color',[1 1 1]);

% Create subplot
subplot1 = subplot(2,1,1,'Parent',figure1);
hold(subplot1,'on');

% Create datetime plot
plot(Dates,Prices,'Parent',subplot1);

box(subplot1,'on');
% Set the remaining axes properties
set(subplot1,'Color',[1 0.968627452850342 0.921568632125854],'XGrid','on',...
    'YGrid','on');
% Create subplot
subplot2 = subplot(2,1,2,'Parent',figure1);

% Create histogram
histogram(Returns,'DisplayName','Returns','Parent',subplot2,...
    'BinMethod','auto');

box(subplot2,'on');
% Create textarrow
annotation(figure1,'textarrow',[0.521042084168334 0.637274549098195],...
    [0.634868421052629 0.717105263157894],'TextEdgeColor',[0 0 0],...
    'TextColor',[0 0.447058826684952 0.74117648601532],...
    'String',{'Price drop from MSCI AC World impact'},...
    'FontSize',11,...
    'FontName','Imprint MT Shadow');

