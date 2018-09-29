function varargout = GUI2048(varargin)
% GUI2048 MATLAB code for GUI2048.fig
%      GUI2048, by itself, creates a new GUI2048 or raises the existing
%      singleton*.
%
%      H = GUI2048 returns the handle to a new GUI2048 or the handle to
%      the existing singleton*.
%
%      GUI2048('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI2048.M with the given input arguments.
%
%      GUI2048('Property','Value',...) creates a new GUI2048 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI2048_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI2048_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI2048

% Last Modified by GUIDE v2.5 01-Jun-2017 19:30:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI2048_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI2048_OutputFcn, ...
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


% --- Executes just before GUI2048 is made visible.
function GUI2048_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI2048 (see VARARGIN)

% Choose default command line output for GUI2048
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI2048 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

a = [0 0 0 0; 0 0 0 0; 0 0 0 0; 0 0 0 0];
displayOnGUI(a, handles);
%Testing2048F(handles)


% --- Outputs from this function are returned to the command line.
function varargout = GUI2048_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.gameOverText.String = '';
handles.scoreText.String = '0';
Testing2048F(handles)


% --- Executes on button press in upButton.
function upButton_Callback(hObject, eventdata, handles)
% hObject    handle to upButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in leftButton.
function leftButton_Callback(hObject, eventdata, handles)
% hObject    handle to leftButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in downButton.
function downButton_Callback(hObject, eventdata, handles)
% hObject    handle to downButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in rightButton.
function rightButton_Callback(hObject, eventdata, handles)
% hObject    handle to rightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in keyboardButton.
function keyboardButton_Callback(hObject, eventdata, handles)
% hObject    handle to keyboardButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of keyboardButton


% --- Executes on button press in mouseButton.
function mouseButton_Callback(hObject, eventdata, handles)
% hObject    handle to mouseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mouseButton
