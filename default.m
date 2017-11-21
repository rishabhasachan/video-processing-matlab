function varargout = default(varargin)
% DEFAULT MATLAB code for default.fig
%      DEFAULT, by itself, creates a new DEFAULT or raises the existing
%      singleton*.
%
%      H = DEFAULT returns the handle to a new DEFAULT or the handle to
%      the existing singleton*.
%
%      DEFAULT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEFAULT.M with the given input arguments.
%
%      DEFAULT('Property','Value',...) creates a new DEFAULT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before default_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to default_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help default

% Last Modified by GUIDE v2.5 14-Nov-2017 07:25:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @default_OpeningFcn, ...
                   'gui_OutputFcn',  @default_OutputFcn, ...
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


% --- Executes just before default is made visible.
function default_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to default (see VARARGIN)

% Choose default command line output for default
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes default wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = default_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in about.
function about_Callback(hObject, eventdata, handles)
% hObject    handle to about (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about

% --- Executes on button press in video.
function video_Callback(hObject, eventdata, handles)
% hObject    handle to video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.mp4','Select the Video file to import');
path=strcat(PathName,FileName);setappdata(0,'v_path',path);
set(handles.p,'String',path);
video = VideoReader(path);
nof=video.NumberOfFrames;
set(handles.f,'String',nof);


function fno_Callback(hObject, eventdata, handles)
% hObject    handle to fno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fno as text
%        str2double(get(hObject,'String')) returns contents of fno as a double
fno= str2num(get(handles.fno,'String'));
setappdata(0,'f_no',fno);

% --- Executes during object creation, after setting all properties.
function fno_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fno (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in input.
function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uigetfile('*.txt','Select the Video file to import');
path=strcat(PathName,FileName);
setappdata(0,'in_path',path);


% --- Executes on button press in output.
function output_Callback(hObject, eventdata, handles)
% hObject    handle to output (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f=getappdata(0,'f_no')
vp=getappdata(0,'v_path')
ip=getappdata(0,'in_path')

[ work_status ]=Video_processing(f,vp,ip);

if(work_status==1)
    disp('Text file has been created')
    winopen('output.txt'); 
    
    
end;
