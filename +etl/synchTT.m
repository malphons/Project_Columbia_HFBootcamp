function AdjClose = synchTT(sCells,AGG,sCellNames)

%% Synchronize Securities
AdjClose = table2timetable(sCells{1}(:,'AdjClose'),'RowTimes',sCells{1}.Date);

for i = 2:length(sCells)
    sec = table2timetable(sCells{i}(:,2:end),'RowTimes',sCells{i}.Date);
    AdjClose = synchronize(sec(:,'AdjClose'),AdjClose);
end

%% Add AGG
AGG = table2timetable(AGG(:,"AdjClose"),'RowTimes',AGG.Date);
AdjClose = synchronize(AdjClose,AGG);
AdjClose.Properties.VariableNames = [sCellNames,"AGG"];