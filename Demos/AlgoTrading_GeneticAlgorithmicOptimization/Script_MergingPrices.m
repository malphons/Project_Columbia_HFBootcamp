%% Merging Different Prices

%% Import Data from Yahoo
c = yahoo;
Data1 = fetch(c,'IBM','Close','08/01/99',today);
Data2 = fetch(c,'MSFT','Close','08/01/99',today);

Data2(4,:) = [];

%% Cleanup Dates
Dates1 = datetime(Data1(:,1),'ConvertFrom','datenum');
Dates2 = datetime(Data2(:,1),'ConvertFrom','datenum');
[C,ia,ib] = setxor(Dates1,Dates2);

%% Delete Missing Dates
Data1(ia,:) = [];
Data2(ib,:) = [];
Dates1(ia)  = [];
Dates2(ib)  = [];

%% Create a Table
T = table;
T.Dates = Dates1;
T.Prices1 = Data1(:,2);
T.Prices2 = Data2(:,2);

%% Visualization
plot(T.Dates,T.Prices1,'DisplayName','T.Prices1');hold on;plot(T.Dates,T.Prices2,'DisplayName','T.Prices2');hold off;

