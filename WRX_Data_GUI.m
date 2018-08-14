function varargout = WRX_Data_GUI(varargin)
% WRX_DATA_GUI MATLAB code for WRX_Data_GUI.fig
%      WRX_DATA_GUI, by itself, creates a new WRX_DATA_GUI or raises the existing
%      singleton*.
%
%      H = WRX_DATA_GUI returns the handle to a new WRX_DATA_GUI or the handle to
%      the existing singleton*.
%
%      WRX_DATA_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WRX_DATA_GUI.M with the given input arguments.
%
%      WRX_DATA_GUI('Property','Value',...) creates a new WRX_DATA_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WRX_Data_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WRX_Data_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WRX_Data_GUI

% Last Modified by GUIDE v2.5 23-Apr-2018 16:29:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WRX_Data_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @WRX_Data_GUI_OutputFcn, ...
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

% --- Executes just before WRX_Data_GUI is made visible.
function WRX_Data_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WRX_Data_GUI (see VARARGIN)

% Choose default command line output for WRX_Data_GUI
handles.output = hObject;
handles.hold = false;
handles.prev = [];
handles.plotted = [];

[axes1,h1,h2] = plotyy(0,0,0,0);
linkaxes(axes1,'x');
handles.axes1 = axes1(1);
handles.axes2 = axes1(2);
% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using WRX_Data_GUI.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end

% UIWAIT makes WRX_Data_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WRX_Data_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% the axes BS
% fix the first axes

% axes(handles.axes1);

% ax_pos = handles.axes1.Position;

axes(handles.axes1);

hold(handles.axes1,'on');
hold(handles.axes2,'on');

% handles.axes1.Position = ax_pos;
% handles.axes2.Position = ax_pos;
handles.axes1.Color = 'none';
handles.axes2.Color = 'none';
handles.axes1.XLimMode  = 'auto';
handles.axes2.XLimMode  = 'auto';
handles.axes1.YLimMode  = 'auto';
handles.axes2.YLimMode  = 'auto';
handles.axes1.XTickMode = 'auto';
handles.axes2.XTickMode = 'auto';
handles.axes1.YTickMode = 'auto';
handles.axes2.YTickMode = 'auto';
handles.axes1.NextPlot  = 'add';
handles.axes2.NextPlot  = 'add';

%plotyy(handles.axes1,0,0,0,0)
%get(handles.axes1)
popup_sel_index = get(handles.popupmenu1, 'Value');

% Template for generalization
% plot_str = strcat('plot(handles.data.z.',handles.names{popup_sel_index},...
%     '_time - handles.ax, handles.data.z.',handles.names{popup_sel_index},')');
% eval(plot_str);
% xlabel('Time');

% so all 'plot' commands return a line that can be set invisible or not,
% and the axes they are plotted on is the 'Parent'; this is a nice
% alternative route, but does not fix the fucking problem of axes2 being
% deleted when the plot string is evaluated! must also set NextPlot to add
% so things are kept||always holding fixes the problem of deletion FUCK

if handles.hold
    %hold  on;
%     hold(handles.axes1,'on');
%     hold(handles.axes2,'on');
    
else
    % hold off;
%     hold(handles.axes1,'off');
%     hold(handles.axes2,'off');
    %handles.p.Visible = 'off';
    cla(handles.axes1);
    cla(handles.axes2);
    handles.prev = [];
    handles.plotted = [];
    %cla;
end

% save the previous numerical selections
handles.prev(end+1) = popup_sel_index;

%% end axes BS
switch popup_sel_index
    case 1 
        m =  0.0102;
        b = -5.1574;
    case 2
        m =  0.0105;
        b = -5.3333;
    case 3
        m =  0.0254;
        b = -5.2340;
    case 12
        m =  -0.2339;
        b = 236.8419;
    case 13
        m =  -0.2345;
        b = 237.1991;
    case 14
        m =  -0.2315;
        b = 235.4488;
    case 15
        m =  -0.2505;
        b = 222.9836;
    case 16
        m =  -0.2312;
        b = 235.1492;
    case 17
        m =  -0.2314;
        b = 235.2897;
    case 18
        m =  -0.2317;
        b = 235.4980;
    case 19
        m =  -0.2318;
        b = 235.6265;
    case 26
        m =  0.0119;
        b = 22.0310;
    case 27
        m = 0.0353;
        b = 0.1995;
    case 28
        m =  0.0096;
        b = -0.0102;
    case 33
        m =  0.0100;
        b = 21.3426;
    case 34
        m =  0.0101;
        b = 22.1461;
    case 35
        m =  0.0100;
        b = 22.6732;
    case 36
        m =  0.0101;
        b = 22.1203;
    case 37
        m =  0.0100;
        b = 22.2475;
    case 38
        m =  0.0100;
        b = 22.0928;
    case 39
        m =  0.0100;
        b = 22.0111;
    case 45
        m =  0.0048;
        b = -0.0403;
    case 46
        m =  0.0025;
        b = -0.0117;
    case 47
        m =  0.0049;
        b = -0.0641;
    case 116
        m =  0.0293;
        b = -0.0472;
    case 118
        m =  0.0101;
        b = 21.9824;
    case 138
        m = (150/1023);
        b = 0;
    case 157
        m = 2*(5/1023);
        b = 0;
    case 158
        m = 2*(5/1023);
        b = 0;
    case 159
        m = (150/1023);
        b = 0;
    otherwise
        m = 1;
        b = 0;
end

if (popup_sel_index >= 1) && (popup_sel_index <= 3)
    % the G forces
    y_lab = 'ylabel(''Force in G''''s'')';
    
    % append to the list, say it is a plotted force
    handles.plotted(end+1) = 1;

elseif (popup_sel_index >= 12) && (popup_sel_index <= 19)
    % the temperatures
    y_lab = 'ylabel(''Degrees F'')';
    
    % append to the list, say it is a plotted temperature
    handles.plotted(end+1) = 2;
    
elseif (popup_sel_index == 26)||(popup_sel_index == 27)||(popup_sel_index == 118)||...
       ((popup_sel_index >= 33)&&(popup_sel_index <= 39))
    % the voltages
    y_lab = 'ylabel(''Volts'')';
        
    % append to the list, say it is a plotted voltage
    handles.plotted(end+1) = 3;
    
elseif (popup_sel_index == 28)||((popup_sel_index >= 45)&&(popup_sel_index <= 47)) 
    % the amperes
    y_lab = 'ylabel(''Amps'')';
        
    % append to the list, say it is a plotted current
    handles.plotted(end+1) = 4;
    
elseif (popup_sel_index == 116)||(popup_sel_index == 161)||...
       (popup_sel_index == 159)||(popup_sel_index == 138)
    % absolute (lbs/in^2)
    y_lab = 'ylabel(''PSIA'')';

    % append to the list, say it is a plotted pressure
    handles.plotted(end+1) = 5;

elseif (popup_sel_index == 157)||(popup_sel_index == 158)
    % Ted wants Torr
    y_lab = 'ylabel(''Torr'')';
    
    % append to the list, say it is a plotted pressure in Torr
    handles.plotted(end+1) = 6;
    
else 
    % counts and such
    y_lab = 'ylabel(''Counts'')';
    
    % append to the list, say it has no units yet
    handles.plotted(end+1) = 0;
    
end

% if I need the logspace
if (popup_sel_index == 157)||(popup_sel_index == 158)
    % needs its own BS plot string
    y_str = strcat('10.^(m.*handles.data.z.', handles.names{popup_sel_index}, '-6)');
else
    %y = m * handles.data.z.whatever + b
    y_str = strcat('m * handles.data.z.', handles.names{popup_sel_index}, ' + b');
end
y = eval(y_str);

% easier to cascade than to combine
if handles.hold
    if ~all(handles.plotted(1:end-1) == handles.plotted(end))
        % make a second in the same place
        plot_str = strcat('handles.p = plot(handles.axes2,handles.data.z.',handles.names{popup_sel_index},...
            '_time - handles.ax, y)');
        y_lab = strcat(y_lab(1:7),'handles.axes2,',y_lab(8:end));
        % if I need the logspace
        if (popup_sel_index == 157)||(popup_sel_index == 158)
            handles.axes2.YScale = 'log';
        else
            handles.axes2.YScale = 'linear';
        end
    else 
        plot_str = strcat('handles.p = plot(handles.axes1,handles.data.z.',handles.names{popup_sel_index},...
            '_time - handles.ax, y)');
        ylabel(handles.axes2,'');
        % if I need the logspace
        if (popup_sel_index == 157)||(popup_sel_index == 158)
            handles.axes1.YScale = 'log';
        else
            handles.axes1.YScale = 'linear';
        end
    end
else
    plot_str = strcat('handles.p = plot(handles.axes1,handles.data.z.',handles.names{popup_sel_index},...
        '_time - handles.ax, y)');
    ylabel(handles.axes2,'');
    % if I need the logspace
    if (popup_sel_index == 157)||(popup_sel_index == 158)
        handles.axes1.YScale = 'log';
    else
        handles.axes1.YScale = 'linear';
    end
end
% AXES EXISTS
% plot_str = strcat('plot(handles.data.z.',handles.names{popup_sel_index},...
%     '_time - handles.ax, y)');
eval(plot_str); % this line deletes my shit
% AXES DELETED
xlabel('Time');

% use the ylabel
eval(y_lab);

% set legend
sp = size(handles.prev);
% only care about part of it
sp = sp(2);
% need an array to start
legs = [];
% for all in previous
for i = 1:sp
    % save the name
    legs{i} = handles.names{handles.prev(i)};
end
% start the legend making string
leg_str = strcat('legend({');
% for all datas
for j = 1:sp
    % append to the string the next data names
    leg_str = strcat(leg_str, '''',legs{j},'''');
    
    % if not at the end
    if (j ~= sp)
        % comma that shit
        leg_str = strcat(leg_str, ',');
    end
end
% close the string command
leg_str = strcat(leg_str,'},''Interpreter'', ''none'')');
% make the legend
eval(leg_str);
% save all the datas
guidata(hObject, handles);

% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

% retreive the data
handles.data = load('36330 McEntaffer Flight Realtime on 4_4_2018', '-mat');
% and the GPS data
GPS = xlsread('36330GPS.xlsx');
GPStime = GPS(:,1);
GPSalt  = GPS(:,3);

z = handles.data.z;
fn = fieldnames(z);
s = size(fn);
for g = 1:s(1)
    names{g} = char(fn(g));
end

% fix the x-axis
zer = find(z.A029_LOLO3 == 0);
ax = z.A029_LOLO3_time(zer(1));

% save the names to the data
handles.names = names(2:2:160*2);
handles.ax = ax;


% atmospheric pressure object
handles.PSIA = [14.696, 14.43, 14.16, 13.91, 13.66, 13.41, 13.17, 12.93,...
    12.69, 12.46, 12.23, 11.78, 11.34, 10.91, 10.5, 10.1, 8.29, 6.76,...
    5.46, 4.37, 3.47, 2.73, 2.15, 1.69, 1.33, 1.05, 0.651, 0.406, 0.255,...
    0.162, 2.1e-3, 3.27e-3, 1.47e-5, 7.22e-8, 7.0e-11];
% altitude in meters for corresponding pressure
handles.ALT = [0 153 305 458 610 763 915 1068 1220 1373 1526 1831 2136 ...
    2441 2746 3050 4577 6102 7628 9153 10679 12204 13730 15255 16781 ...
    18306 21357 24408 27459 30510 45720 60960 91440 152400 609600];

handles.alt2press = @(alt)interp1(handles.ALT,handles.PSIA,alt);

% to avoid making ifs and shit later
handles.data.z.A161_ATM_PRESSURE_time = GPStime + ax;
handles.data.z.A161_ATM_PRESSURE = handles.alt2press(GPSalt);

handles.names(end+1) = {'A161_ATM_PRESSURE'};

% set the pop-up menu items, the second item skipping one
set(hObject, 'String', handles.names);

% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.hold = get(hObject,'Value');
guidata(hObject, handles);
% Hint: get(hObject,'Value') returns toggle state of checkbox1
