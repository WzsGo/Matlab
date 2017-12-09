function varargout = fangdaTooler(varargin)
% FANGDATOOLER MATLAB code for fangdaTooler.fig
%      FANGDATOOLER, by itself, creates a new FANGDATOOLER or raises the existing
%      singleton*.
%
%      H = FANGDATOOLER returns the handle to a new FANGDATOOLER or the handle to
%      the existing singleton*.
%
%      FANGDATOOLER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FANGDATOOLER.M with the given input arguments.
%
%      FANGDATOOLER('Property','Value',...) creates a new FANGDATOOLER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fangdaTooler_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fangdaTooler_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fangdaTooler

% Last Modified by GUIDE v2.5 23-Nov-2017 11:55:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fangdaTooler_OpeningFcn, ...
                   'gui_OutputFcn',  @fangdaTooler_OutputFcn, ...
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





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes just before fangdaTooler is made visible.
function fangdaTooler_OpeningFcn(hObject, eventdata, handles, varargin)
uiwait(gcf);
global suofang_num;
global suofang_mtd;
handles.suofang_num_output = suofang_num;
handles.suofang_method_output = suofang_mtd;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = fangdaTooler_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.suofang_num_output;
varargout{2} = handles.suofang_method_output;
delete(gcf);

function pushbutton1_Callback(hObject, eventdata, handles)
global suofang_num;
global suofang_mtd;
suofang_num = str2num(get(handles.edit2,'string'));
suofang_mtd = get(handles.listbox2,'value');
uiresume(gcf);
close;
