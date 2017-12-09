function varargout = imnoiseTooler(varargin)
% IMNOISETOOLER MATLAB code for imnoiseTooler.fig
%      IMNOISETOOLER, by itself, creates a new IMNOISETOOLER or raises the existing
%      singleton*.
%
%      H = IMNOISETOOLER returns the handle to a new IMNOISETOOLER or the handle to
%      the existing singleton*.
%
%      IMNOISETOOLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMNOISETOOLER.M with the given input arguments.
%
%      IMNOISETOOLER('Property','Value',...) creates a new IMNOISETOOLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imnoiseTooler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imnoiseTooler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imnoiseTooler

% Last Modified by GUIDE v2.5 24-Nov-2017 12:15:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imnoiseTooler_OpeningFcn, ...
                   'gui_OutputFcn',  @imnoiseTooler_OutputFcn, ...
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


% --- Executes just before imnoiseTooler is made visible.



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function imnoiseTooler_OpeningFcn(hObject, eventdata, handles, varargin)
uiwait(gcf);
global noise_par;
global noise_type;
handles.noise_par_output = noise_par;
handles.noise_type_output = noise_type;
guidata(hObject, handles);


function varargout = imnoiseTooler_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.noise_par_output;
varargout{2} = handles.noise_type_output;
delete(gcf);

function pushbutton1_Callback(hObject, eventdata, handles)
global noise_par;
global noise_type;
noise_par = str2num(get(handles.edit1,'string'));
noise_type = get(handles.listbox1,'value');
uiresume(gcf);
