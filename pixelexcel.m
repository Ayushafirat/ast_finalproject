function varargout = pixelexcel(varargin)
% PIXELEXCEL MATLAB code for pixelexcel.fig
%      PIXELEXCEL, by itself, creates a new PIXELEXCEL or raises the existing
%      singleton*.
%
%      H = PIXELEXCEL returns the handle to a new PIXELEXCEL or the handle to
%      the existing singleton*.
%
%      PIXELEXCEL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIXELEXCEL.M with the given input arguments.
%
%      PIXELEXCEL('Property','Value',...) creates a new PIXELEXCEL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pixelexcel_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pixelexcel_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pixelexcel

% Last Modified by GUIDE v2.5 01-Mar-2017 01:22:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pixelexcel_OpeningFcn, ...
                   'gui_OutputFcn',  @pixelexcel_OutputFcn, ...
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

% --- Executes just before pixelexcel is made visible.
function pixelexcel_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pixelexcel (see VARARGIN)
% Choose default command line output for pixelexcel
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes pixelexcel wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = pixelexcel_OutputFcn(hObject, eventdata, handles) 
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
clc;
global gambar;
global gbrgray; % disable ini untuk baca citra komponen
[namafile, formatfile] = uigetfile('*.png; *.bmp; *.jpg', 'membuka gambar'); %memilih gambar
if formatfile == 0
    return;
end
gambar = imread([formatfile, namafile]);

% Baca nilai RGB
if size(gambar,3) == 3 %Jika citranya RGB, jadikan Grayscale
    gbrgray = rgb2gray(gambar);
    [row, col] = size(gbrgray);
    set(handles.uitable1,'data',gbrgray);
else
    %Baca nilai komponen Y
    if size(gambar,1) == 1
        [row, col] = size(gambar);
        set(handles.uitable1,'data',gambar);
    else
        %Baca nilai komponen Cb
        if size(gambar,2) == 1
            [row, col] = size(gambar);
            set(handles.uitable1,'data',gambar);
        else
            %Baca nilai komponen Cr
            if size(gambar,3) == 1
                [row, col] = size(gambar);
                set(handles.uitable1,'data',gambar);
            else
                %Baca nilai Ycbcr
                gbrgray = rgb2gray(ycbcr2rgb(gambar));
                [row, col] = size(gbrgray);
                set(handles.uitable1,'data',gbrgray);   
            end
        end
    end
end

%Baca nilai Ycbcr
%gbrgray = rgb2gray(ycbcr2rgb(gambar));
%[row, col] = size(gbrgray);
%set(handles.uitable1,'data',gbrgray);

%Baca nilai komponen Y, Cb, Cr
%[row, col] = size(gambar);
%set(handles.uitable1,'data',gambar);

set(handles.namaFile,'String',namafile);
set(handles.baris,'String',row);
set(handles.kolom,'String',col);
set(handles.pushbutton2,'Visible','on');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar;
global gbrgray;

[namafile, direktori] = uiputfile({'*.xlsx'}, 'menyimpan data piksel');
if direktori == 0
    return;
end
if size(gambar,3) == 3
    xlswrite(namafile,gbrgray);
else
    xlswrite(namafile,gambar);
end
msgbox('Data Piksel gambar berhasil disimpan','pemberitahuan');

function namaFile_Callback(hObject, eventdata, handles)
% hObject    handle to namaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of namaFile as text
%        str2double(get(hObject,'String')) returns contents of namaFile as a double

% --- Executes during object creation, after setting all properties.
function namaFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namaFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
global gambar2;
global gbrgray2; % disable ini untuk baca citra komponen
[namafile2, formatfile] = uigetfile('*.png; *.bmp; *.jpg', 'membuka gambar'); %memilih gambar
if formatfile == 0
    return;
end
gambar2 = imread([formatfile, namafile2]);

% Baca nilai RGB
if size(gambar2,3) == 3 %Jika citranya RGB, jadikan Grayscale
    gbrgray2 = rgb2gray(gambar2);
    [row, col] = size(gbrgray2);
    set(handles.uitable2,'data',gbrgray2);
else
    %Baca nilai komponen Y
    if size(gambar2,1) == 1
        [row, col] = size(gambar2);
        set(handles.uitable2,'data',gambar2);
    else
        %Baca nilai komponen Cb
        if size(gambar2,2) == 1
            [row, col] = size(gambar2);
            set(handles.uitable2,'data',gambar2);
        else
            %Baca nilai komponen Cr
            if size(gambar2,3) == 1
                [row, col] = size(gambar2);
                set(handles.uitable2,'data',gambar2);
            else
                %Baca nilai Ycbcr
                gbrgray2 = rgb2gray(ycbcr2rgb(gambar2));
                [row, col] = size(gbrgray2);
                set(handles.uitable2,'data',gbrgray2);
            end
        end
    end
end

% Baca nilai Ycbcr
%gbrgray = rgb2gray(ycbcr2rgb(gambar));
%[row, col] = size(gbrgray);
%set(handles.uitable2,'data',gbrgray);

% Baca nilai komponen Y, Cb, Cr
%[row, col] = size(gambar);
%set(handles.uitable2,'data',gambar);

set(handles.namaFile2,'String',namafile2);
set(handles.baris2,'String',row);
set(handles.kolom2,'String',col);
set(handles.pushbutton4,'Visible','on');

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global gambar2;
global gbrgray2;

[namafile2, direktori] = uiputfile({'*.xlsx'}, 'menyimpan data piksel');
if direktori == 0
    return;
end
if size(gambar2,3) == 3
    xlswrite(namafile2,gbrgray2);
else
    xlswrite(namafile2,gambar2);
end
msgbox('Data Piksel gambar berhasil disimpan','pemberitahuan');

function namaFile2_Callback(hObject, eventdata, handles)
% hObject    handle to namaFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namaFile2 as text
%        str2double(get(hObject,'String')) returns contents of namaFile2 as a double

% --- Executes during object creation, after setting all properties.
function namaFile2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namaFile2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end