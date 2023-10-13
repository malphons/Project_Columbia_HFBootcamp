function SetupPath(GUI_Name)

%% Setup GUI Name
if (nargin == 0)
    GUI_Name = 'MATLAB_HighFrequency_Workshop';
end

%% Check to see if Reset of PATH is wanted
ResetPathCheck = questdlg('Do you want to restore the path?','Restore Path?','Yes','No','No');
if strcmp(ResetPathCheck,'Yes')
    try
        warning('off')
        delete([GUI_Name 'Path.mat'])
        warning('on')
    catch 
    end
end
    
%% Setup Primary Path
restoredefaultpath
GUI_Name         = regexprep(GUI_Name,' ','');
PathVariableName = [GUI_Name 'Path'];
FileName         = [PathVariableName '.mat'];
FileExists = ~isempty(which(FileName));
if (FileExists == false)
    disp('Please wait this may take upto a minute...')
    CompletePath = genpath(pwd);
    save(FileName,'CompletePath')
    addpath(CompletePath,'-begin','-frozen')
else
    disp('Setting up path. Please wait...')
    load(FileName)
    addpath(CompletePath,'-begin','-frozen') %#ok Variable is loaded from load command
end

clear FileName FileExists CompletePath
clc
disp('Setting up path. Please wait...DONE!')
