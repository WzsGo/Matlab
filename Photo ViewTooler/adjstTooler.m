function varargout = adjstTooler(varargin)
% ADJSTTOOLER MATLAB code for adjstTooler.fig
%      ADJSTTOOLER, by itself, creates a new ADJSTTOOLER or raises the existing
%      singleton*.
%
%      H = ADJSTTOOLER returns the handle to a new ADJSTTOOLER or the handle to
%      the existing singleton*.
%
%      ADJSTTOOLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ADJSTTOOLER.M with the given input arguments.
%
%      ADJSTTOOLER('Property','Value',...) creates a new ADJSTTOOLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before adjstTooler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to adjstTooler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help adjstTooler

% Last Modified by GUIDE v2.5 24-Nov-2017 13:41:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @adjstTooler_OpeningFcn, ...
                   'gui_OutputFcn',  @adjstTooler_OutputFcn, ...
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




% --- Executes on slider movement.


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes just before adjstTooler is made visible.
function adjstTooler_OpeningFcn(hObject, eventdata, handles, varargin)
uiwait(gcf);
global liang_num ;
global duibi_num;
handles.liang_num_output = liang_num;
handles.duibi_num_output = duibi_num;
guidata(hObject, handles);


function varargout = adjstTooler_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.liang_num_output;
varargout{2} = handles.duibi_num_output;
delete(gcf);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


uiresume(gcf);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global liang_num ;
liang_num = get(handles.slider1,'value');
set(handles.text2,'string',liang_num);


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global duibi_num ;
duibi_num = get(handles.slider2,'value');
set(handles.text4,'string',duibi_num);


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
