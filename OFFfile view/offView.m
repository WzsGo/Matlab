
function varargout = offView(varargin)
% OFFVIEW MATLAB code for offView.fig
%      OFFVIEW, by itself, creates a new OFFVIEW or raises the existing
%      singleton*.
%
%      H = OFFVIEW returns the handle to a new OFFVIEW or the handle to
%      the existing singleton*.
%
%      OFFVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OFFVIEW.M with the given input arguments.
%
%      OFFVIEW('Property','Value',...) creates a new OFFVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before offView_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to offView_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help offView

% Last Modified by GUIDE v2.5 31-Oct-2017 22:24:17

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @offView_OpeningFcn, ...
                   'gui_OutputFcn',  @offView_OutputFcn, ...
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


% --- Executes just before offView is made visible.
function offView_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to offView (see VARARGIN)

% Choose default command line output for offView
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes offView wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = offView_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function offfile_Callback(hObject, eventdata, handles)
% hObject    handle to offfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function orde_Callback(hObject, eventdata, handles)
% hObject    handle to orde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function xuanzhuan_Callback(hObject, eventdata, handles)
% hObject    handle to xuanzhuan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rotate3d on;

% --------------------------------------------------------------------
function suofang_Callback(hObject, eventdata, handles)
% hObject    handle to suofang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
zoom on;

% --------------------------------------------------------------------
function pingyi_Callback(hObject, eventdata, handles)
% hObject    handle to pingyi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pan on;

% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.off', 'Pick off file');%打开文件对话框
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')
else
    disp(['User selected ', fullfile(pathname, filename)])
end
[Fid,message] = fopen(fullfile(pathname, filename),'r');
    if Fid==-1
        disp (message)
    end;
s=fgetl(Fid);
[A,COUNT] = fscanf(Fid,'%d',3);

pointer_number = A(1);
surface_number = A(2);
 
B=zeros(3,pointer_number);
 for i = 1 : pointer_number;
    B(:,i) =  fscanf(Fid,'%f',3); 
 end
 B = B';
 
T= fscanf(Fid,'%f',surface_number*4); 
T = reshape(T,4,surface_number);
T(1,:) =[];
T = T +1;

trimesh(T', B(:,1), B(:,2), B(:,3))


% --------------------------------------------------------------------
function quite_Callback(hObject, eventdata, handles)
% hObject    handle to quite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
quite;

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
