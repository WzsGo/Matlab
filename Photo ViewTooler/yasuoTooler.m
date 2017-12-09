function varargout = yasuoTooler(varargin)
% YASUOTOOLER MATLAB code for yasuoTooler.fig
%      YASUOTOOLER, by itself, creates a new YASUOTOOLER or raises the existing
%      singleton*.
%
%      H = YASUOTOOLER returns the handle to a new YASUOTOOLER or the handle to
%      the existing singleton*.
%
%      YASUOTOOLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YASUOTOOLER.M with the given input arguments.
%
%      YASUOTOOLER('Property','Value',...) creates a new YASUOTOOLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yasuoTooler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yasuoTooler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yasuoTooler

% Last Modified by GUIDE v2.5 24-Nov-2017 20:34:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yasuoTooler_OpeningFcn, ...
                   'gui_OutputFcn',  @yasuoTooler_OutputFcn, ...
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


% --- Executes just before yasuoTooler is made visible.
function yasuoTooler_OpeningFcn(hObject, eventdata, handles, varargin)

uiwait(gcf);
global raw_yasuobi;
handles.output = raw_yasuobi;
guidata(hObject, handles);


function varargout = yasuoTooler_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;
delete(gcf);


function slider1_Callback(hObject, eventdata, handles)
global raw_yasuobi;
raw_yasuobi = get(handles.slider1,'value');
yasuobi = (raw_yasuobi./255)*100;
set(handles.text2,'string',yasuobi);

function pushbutton1_Callback(hObject, eventdata, handles)

uiresume(gcf);


function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
