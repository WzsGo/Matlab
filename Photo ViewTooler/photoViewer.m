
function varargout = photoViewer(varargin)
% PHOTOVIEWER MATLAB code for photoViewer.fig
%      PHOTOVIEWER, by itself, creates a new PHOTOVIEWER or raises the existing
%      singleton*.
%
%      H = PHOTOVIEWER returns the handle to a new PHOTOVIEWER or the handle to
%      the existing singleton*.
%
%      PHOTOVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHOTOVIEWER.M with the given input arguments.
%
%      PHOTOVIEWER('Property','Value',...) creates a new PHOTOVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before photoViewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to photoViewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help photoViewer

% Last Modified by GUIDE v2.5 24-Nov-2017 16:13:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @photoViewer_OpeningFcn, ...
                   'gui_OutputFcn',  @photoViewer_OutputFcn, ...
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


% --- Executes just before photoViewer is made visible.
function photoViewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to photoViewer (see VARARGIN)

% Choose default command line output for photoViewer

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes photoViewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = photoViewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function manger_Callback(hObject, eventdata, handles)
% hObject    handle to manger (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function fenxi_Callback(hObject, eventdata, handles)
% hObject    handle to fenxi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function make_Callback(hObject, eventdata, handles)
% hObject    handle to make (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function quitefile_Callback(hObject, eventdata, handles)
% hObject    handle to quitefile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);
% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'xTick',[]);
set(hObject,'ytick',[]);

% Hint: place code in OpeningFcn to populate axes1
% 打开文件按钮
function openfile_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.gif'}, 'Pick off file');%打开文件对话框
if isequal(filename,0) || isequal(pathname,0)
    disp('User pressed cancel')%判断读取的图像和路径是否为空
else
    disp(['User selected ', fullfile(pathname, filename)])%获取完整路径
end
global srcimg;
global fullpath;
fullpath = fullfile(pathname, filename);
srcimg = imread(fullfile(pathname, filename));%将读取的文件保存在srcimg（源图像）
axes(handles.axes1);%获取第一个图像显示框
imshow(srcimg)%显示图片
set(handles.text2,'string','目标图像');

%打开-转为灰度图像
function rgb2grey_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
axes(handles.axes2);
imshow(greyimg);
set(handles.text2,'string','灰度图像');

%编辑-缩放按钮
function suofang_Callback(hObject, eventdata, handles)
global srcimg;
[resize_num,resize_mtd] = resize;
switch resize_mtd
    case 1
        resize_ording = imresize(srcimg,resize_num,'nearest');
    case 2
        resize_ording = imresize(srcimg,resize_num,'bilinear');
    case 3
        resize_ording = imresize(srcimg,resize_num,'bicubic');
end
axes(handles.axes2);%获取第一个图像显示框
imshow(resize_ording)%显示图片
set(handles.text2,'string','缩放图像');
% set(handles.text1,'string',resize_num);
% set(handles.text2,'string',resize_mtd);

% 编辑-旋转按钮
function rotate_Callback(hObject, eventdata, handles)
global srcimg;
[rotate_ang,rotate_mtd] = rotateTooler;
switch rotate_mtd
    case 1
        rotate_ordimg = imrotate(srcimg,rotate_ang,'nearest');
    case 2
        rotate_ordimg = imrotate(srcimg,rotate_ang,'bilinear');
    case 3
        rotate_ordimg = imrotate(srcimg,rotate_ang,'bicubic');
end
axes(handles.axes2);%获取第一个图像显示框
imshow(rotate_ordimg)%显示图片
set(handles.text2,'string','旋转图像');

% 编辑-裁剪
function crop_Callback(hObject, eventdata, handles)
global srcimg;
axes(handles.axes1)
crop_ording = imcrop(srcimg);
axes(handles.axes2);
imshow(crop_ording);%显示图片
set(handles.text2,'string','裁剪图像');

% 分析-颜色选取
function impixel_Callback(hObject, eventdata, handles)

axes(handles.axes1);
rgb_num = impixel;
set(handles.text3,'string','当前位置的RGB值：');
set(handles.text4,'string',rgb_num);
set(handles.text2,'string','目标图像');

%分析-强度描述
function improfile_Callback(hObject, eventdata, handles)
axes(handles.axes1);%获取第一个图像显示框
improfile;
axes(handles.axes1);
set(handles.text2,'string','目标图像');

%分析-颜色条
function colorbar_Callback(hObject, eventdata, handles)
axes(handles.axes1);%获取第一个图像显示框
colorbar
set(handles.text2,'string','目标图像');

% 分析-轮廓图-------------------------------------------------------
function imcontour_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
axes(handles.axes2);
imshow(greyimg);
imcontour(greyimg,1);
set(handles.text2,'string','轮廓图');

% 分析灰度直方图
function imhist_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
axes(handles.axes2);
imhist(greyimg,200);
set(handles.text2,'string','灰度直方图');
%分析-边缘检测
function edge_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
[edge_thresh,edge_fiter] = edgeTooler;
switch edge_fiter
    case 1
        edgeimg = edge(greyimg,'sobel',edge_thresh);
        set(handles.text2,'string','sobel算子');
    case 2
        edgeimg = edge(greyimg,'prewitt',edge_thresh);
        set(handles.text2,'string','prewitt算子');
    case 3
        edgeimg = edge(greyimg,'roberts',edge_thresh);
        set(handles.text2,'string','roberts算子');
    case 4
        edgeimg = edge(greyimg,'log',edge_thresh);
        set(handles.text2,'string','log算子');
    case 5
        edgeimg = edge(greyimg,'sobel',edge_thresh);
        set(handles.text2,'string','canny算子');
end
axes(handles.axes2);
imshow(edgeimg);

%噪声
function imnoise_Callback(hObject, eventdata, handles)
global srcimg;
[noise_par,noise_type] = imnoiseTooler;
switch noise_type
    case 1
        noiseimg = imnoise(srcimg,'gaussian',noise_par);
        set(handles.text2,'string','高斯噪声');
    case 2
        noiseimg = imnoise(srcimg,'salt & pepper',noise_par); 
        set(handles.text2,'string','椒盐噪声');
    case 3
        noiseimg = imnoise(srcimg,'speckle',noise_par);
        set(handles.text2,'string','乘性噪声');
    case 4
        noiseimg = imnoise(srcimg,'poisson',noise_par);
        set(handles.text2,'string','泊松噪声');
end
axes(handles.axes2);
imshow(noiseimg);

% 滤波
function fliter_Callback(hObject, eventdata, handles)
[filt_hise,filt_type] = filterTooler;
hise = [filt_hise,filt_hise];
global srcimg;
greyimg = rgb2gray(srcimg);
switch filt_type
    case 1
        H = fspecial('average',hise);
        fiterimg = imfilter(srcimg,H,'replicate');
        set(handles.text2,'string','均值滤波');
    case 2
        H = fspecial('gaussian',hise,0.5);
        fiterimg = imfilter(srcimg,H,'replicate');
        set(handles.text2,'string','高斯滤波');
    case 3
        H = fspecial('log',hise);
        fiterimg = imfilter(srcimg,H,'replicate');
        set(handles.text2,'string','log滤波');
    case 4
        fiterimg = medfilt2(greyimg,hise);
        set(handles.text2,'string','均值滤波');
    case 5 
        fiterimg = wiener2(greyimg,hise);
        set(handles.text2,'string','自适应滤波');        
end
axes(handles.axes2);
imshow(fiterimg);

% function test_Callback(hObject, eventdata, handles)
% %global srcimg;
% global srcimg;
% f=immultiply(srcimg,33);   
% axes(handles.axes2);
% imshow(f);


% 傅里叶变换
function fft_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
F = fft2(greyimg,256,256);
F1 = fftshift(F);
F2 = log(abs(F1));
axes(handles.axes2);
imshow(F2,[-1 5],'InitialMagnification','fit');
set(handles.text2,'string','傅里叶变换'); 
colormap(jet); 
colorbar

% 利用离散余弦变换实现图像压缩
function DCT_Callback(hObject, eventdata, handles)
global srcimg;
greyimg = rgb2gray(srcimg);
dct = yasuoTooler;
%set(handles.text2,'string',dct); 
J = dct2(greyimg);
J(abs(J) < dct) = 0;
K = idct2(J);
axes(handles.axes2);
set(handles.text2,'string','压缩后'); 
imshow(K,[0 255])

%图像增强
function imadjst_Callback(hObject, eventdata, handles)
global srcimg;
[raw_high,raw_duibi] = adjstTooler;
hight = raw_high./100;
J_first = imadjust(srcimg,[0 1],[0 hight]);
J = immultiply(J_first,raw_duibi);
axes(handles.axes2);
imshow(J);
