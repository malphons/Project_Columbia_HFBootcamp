function [pricesTT,symbols] = getDowPortfolio()

%% Load Data
% Load the adjusted price data for 15 stocks for the year 2006. This example uses a small set of investable assets for readability.
% Read a table of daily adjusted close prices for 2006 DJIA stocks.
T = readtable('dowPortfolio.xlsx');

%% For readability, use only 15 of the 30 DJI component stocks.
% Prune the table to hold only the dates and selected stocks.
symbols = ["AA","CAT","DIS","GM","HPQ","JNJ","MCD","MMM","MO","MRK","MSFT","PFE","PG","T","XOM"];
timeColumn = "Dates";
T = T(:,[timeColumn symbols]);

%% Convert the data to a timetable.
pricesTT = table2timetable(T,'RowTimes','Dates');