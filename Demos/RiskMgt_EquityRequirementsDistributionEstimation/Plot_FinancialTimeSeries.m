%% Plot Financial Time Series
%
% Customized fucntion to allow one to quickly evaluate a financial time series 
%
% Example
% Dates = add2
% h_Fig = figure;
% h_Axis = gca;
% Plot_FinancialTimeSeries(h_Fig,h_Axis,Dates,1e6*Prices,'mm/yy',10,10,'Million','Time Series')
function Plot_FinancialTimeSeries(h_Fig,h_Axis,Dates,Prices,DateFormat,NumOfXTicks,NumOfYTicks,Units_DollarOrOther,Title)

if nargin == 0
    h_Fig               = figure;
    h_Axis              = gca;
    c                   = yahoo;
    Data                = fetch(c,'ACWI','Close','Jan 1 2000',datestr(now,'mmm dd yyyy'));
    Dates               = Data(:,1);
    Prices              = Data(:,2);
    DateFormat          = 'mm/yy';
    NumOfXTicks         = 8;
    NumOfYTicks         = 8;
    Units_DollarOrOther = 'Dollar';
    Title               = '\bf Prices over Time';
elseif nargin < 3
    DateFormat          = 'mm/yy';
    NumOfXTicks         = 8;
    NumOfYTicks         = 8;
    Units_DollarOrOther = 'Dollar';
    Title               = '\bf Prices over Time';
elseif nargin < 4
    NumOfXTicks = 15;
    NumOfYTicks = 15;
    Units_DollarOrOther = 'Dollar';
    Title               = '\bf Prices over Time';
elseif nargin < 5
    NumOfYTicks = 15;
    Units_DollarOrOther = 'Dollar';
    Title               = '\bf Prices over Time';
elseif nargin < 6
    Units_DollarOrOther = 'Dollar';
    Title               = '\bf Prices over Time';
elseif nargin < 7
    Title               = '\bf Prices over Time';
end

%% Setup Basic Visualization
% h_Fig  = figure;
% h_Axis = gca;
plot(h_Axis,Dates,Prices);
axis(h_Axis,'tight')

%% Setup X-Axis Ticks
x_DateStep  = floor((max(Dates) - min(Dates))/NumOfXTicks);
x_Dates     = min(Dates):x_DateStep:max(Dates);
x_DatesSTR  = datestr(x_Dates,DateFormat);
set(h_Axis,'Xtick',x_Dates,'XtickLabel',x_DatesSTR)
xlabel(h_Axis,'Dates')

%% Setup Y-Axis Ticks
y_Prices = linspace(min(Prices(:)),max(Prices(:)),NumOfYTicks);
if strcmp(Units_DollarOrOther,'Dollar')
    y_PricesSTR = cur2str(y_Prices,2);
    ylabel(h_Axis,'Prices ($)')
elseif strcmp(Units_DollarOrOther,'Million')
    y_PricesSTR = cur2str(y_Prices/1e6,2);
    ylabel(h_Axis,'Prices (Millions $)')
elseif strcmp(Units_DollarOrOther,'Percent')
    y_PricesSTR = num2cell(y_Prices);
    y_PricesSTR = cellfun(@(X) [num2str(X,'%10.2f') '%'],y_PricesSTR,'UniformOutput',false);
    ylabel(h_Axis,'Percent')
else
    y_PricesSTR = num2cell(y_Prices);
    y_PricesSTR = cellfun(@(X)num2str(X,'%10.2f'),y_PricesSTR,'UniformOutput',false);
    ylabel(h_Axis,'Values')
end
set(h_Axis,'Ytick',y_Prices,'YtickLabel',y_PricesSTR)

%% Setup Title
title(h_Axis,Title)
grid('minor')

%% Setup DataTip
dcm_obj = datacursormode(h_Fig);

if strcmp(Units_DollarOrOther,'Dollar')
    set(dcm_obj,'DisplayStyle','datatip','UpdateFcn',@Set_DataTip_Dollar,'SnapToDataVertex','off','Enable','on')
elseif strcmp(Units_DollarOrOther,'Million')
    set(dcm_obj,'DisplayStyle','datatip','UpdateFcn',@Set_DataTip_Million,'SnapToDataVertex','off','Enable','on')
elseif strcmp(Units_DollarOrOther,'Percent')
    set(dcm_obj,'DisplayStyle','datatip','UpdateFcn',@Set_DataTip_Percent,'SnapToDataVertex','off','Enable','on')
else
    set(dcm_obj,'DisplayStyle','datatip','UpdateFcn',@Set_DataTip_Value,'SnapToDataVertex','off','Enable','on')
end
