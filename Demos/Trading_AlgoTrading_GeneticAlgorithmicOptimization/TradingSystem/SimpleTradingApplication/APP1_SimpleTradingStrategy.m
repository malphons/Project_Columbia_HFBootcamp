function varargout = APP1_SimpleTradingStrategy(varargin)
% APP1_SIMPLETRADINGSTRATEGY MATLAB code for APP1_SimpleTradingStrategy.fig
%      APP1_SIMPLETRADINGSTRATEGY, by itself, creates a new APP1_SIMPLETRADINGSTRATEGY or raises the existing
%      singleton*.
%
%      H = APP1_SIMPLETRADINGSTRATEGY returns the handle to a new APP1_SIMPLETRADINGSTRATEGY or the handle to
%      the existing singleton*.
%
%      APP1_SIMPLETRADINGSTRATEGY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in APP1_SIMPLETRADINGSTRATEGY.M with the given input arguments.
%
%      APP1_SIMPLETRADINGSTRATEGY('Property','Value',...) creates a new APP1_SIMPLETRADINGSTRATEGY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before APP1_SimpleTradingStrategy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to APP1_SimpleTradingStrategy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help APP1_SimpleTradingStrategy

% Last Modified by GUIDE v2.5 20-Jun-2014 13:28:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @APP1_SimpleTradingStrategy_OpeningFcn, ...
                   'gui_OutputFcn',  @APP1_SimpleTradingStrategy_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before APP1_SimpleTradingStrategy is made visible.
function APP1_SimpleTradingStrategy_OpeningFcn(hObject, eventdata, handles, varargin) %#ok
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to APP1_SimpleTradingStrategy (see VARARGIN)

% Choose default command line output for APP1_SimpleTradingStrategy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes APP1_SimpleTradingStrategy wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% Setup Logo
I = imread('Images\Image_NYSE.jpg');
axes(handles.Axes_LOGO);
image(I)
set(handles.Axes_LOGO,'xtick',[],'ytick',[])

% --- Outputs from this function are returned to the command line.
function varargout = APP1_SimpleTradingStrategy_OutputFcn(hObject, eventdata, handles)  %#ok %#ok
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit3_Callback(hObject, eventdata, handles)  %#ok
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)  %#ok
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_LEAD_Callback(hObject, eventdata, handles)  %#ok
% hObject    handle to Edit_LEAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_LEAD as text
%        str2double(get(hObject,'String')) returns contents of Edit_LEAD as a double


% --- Executes during object creation, after setting all properties.
function Edit_LEAD_CreateFcn(hObject, eventdata, handles)  %#ok
% hObject    handle to Edit_LEAD (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Edit_LAG_Callback(hObject, eventdata, handles)  %#ok
% hObject    handle to Edit_LAG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Edit_LAG as text
%        str2double(get(hObject,'String')) returns contents of Edit_LAG as a double


% --- Executes during object creation, after setting all properties.
function Edit_LAG_CreateFcn(hObject, eventdata, handles)  %#ok
% hObject    handle to Edit_LAG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)  %#ok
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Recalculate_Strategy(handles)

% --- Executes on selection change in DropDown_Method.
function DropDown_Method_Callback(hObject, eventdata, handles)  %#ok
% hObject    handle to DropDown_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns DropDown_Method contents as cell array
%        contents{get(hObject,'Value')} returns selected item from DropDown_Method


% --- Executes during object creation, after setting all properties.
function DropDown_Method_CreateFcn(hObject, eventdata, handles)  %#ok
% hObject    handle to DropDown_Method (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles) %#ok
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles) %#ok
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Menu_File_Callback(hObject, eventdata, handles) %#ok
% hObject    handle to Menu_File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Menu_ImportFromExcel_Callback(hObject, eventdata, handles) %#ok
% hObject    handle to Menu_ImportFromExcel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Import Data
[FileName,PathName] = uigetfile('TheData\*.xlsx','Import data from XLS File');
Price = Importfile_LCOBrentCrudeOil([PathName,FileName]);
h = waitbar(0,['Please wait importing data from: ' FileName]);
steps = 1000;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h)
Data.Price = Price;
set(handles.figure1,'UserData',Data)

Recalculate_Strategy(handles)

function Recalculate_Strategy(handles)

%% Get Data
Data  = get(handles.figure1,'UserData');
Price = Data.Price; 

%% Setup Trading Rules based on Stragegy
annualScaling = sqrt(250);

NperiodLead = str2double(get(handles.Edit_LEAD,'String'));
MperiodLag  = str2double(get(handles.Edit_LAG,'String'));
[Signal,PandL,SharpeRatio,PricesLead,PricesLag] = Strategy_LeadLag(Price,NperiodLead,MperiodLag,annualScaling);

% PLOT #1
plot(handles.Axes_Prices,[Price PricesLead PricesLag])
legend(handles.Axes_Prices,{'Price','Lead','Lag'})
title('\bf Price Charts')

% PLOT #2
plot(handles.Axes_CumPerformance,PandL)
title(handles.Axes_CumPerformance,['\bf Strategy was able to produce a SharpeRatio = ' num2str(SharpeRatio)])


% --------------------------------------------------------------------
function Menu_ImportfFromDatafeed_Callback(hObject, eventdata, handles) %#ok
% hObject    handle to Menu_ImportfFromDatafeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('TheData\*.xlsx','Import data from XLS File');
Price = Importfile_LCOBrentCrudeOil([PathName,FileName]);
h = waitbar(0,'Please wait connecting to REUTERS');
steps = 1000;

for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h)
Data.Price = Price;
set(handles.figure1,'UserData',Data)


% --------------------------------------------------------------------
function Menu_ImportfFromYAHOO_Callback(hObject, eventdata, handles) %#ok
% hObject    handle to Menu_ImportfFromYAHOO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Answer = inputdlg({'Please type in the TICKER symbol of security for analysis','StartDate (mm/dd/yyyy)','EndDate (mm/dd/yyyy)'},'Download YAHOO Data',1,{'MSFT,CSCO,GOOG','06/20/2000','06/20/2014'});

Idx_Tickers = regexp(Answer{1},',');
