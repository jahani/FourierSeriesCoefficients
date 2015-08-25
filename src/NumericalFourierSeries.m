function varargout = NumericalFourierSeries(varargin)
% NUMERICALFOURIERSERIES MATLAB code for NumericalFourierSeries.fig
%      NUMERICALFOURIERSERIES, by itself, creates a new NUMERICALFOURIERSERIES or raises the existing
%      singleton*.
%
%      H = NUMERICALFOURIERSERIES returns the handle to a new NUMERICALFOURIERSERIES or the handle to
%      the existing singleton*.
%
%      NUMERICALFOURIERSERIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NUMERICALFOURIERSERIES.M with the given input arguments.
%
%      NUMERICALFOURIERSERIES('Property','Value',...) creates a new NUMERICALFOURIERSERIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before NumericalFourierSeries_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to NumericalFourierSeries_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help NumericalFourierSeries

% Last Modified by GUIDE v2.5 27-Jun-2012 03:25:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @NumericalFourierSeries_OpeningFcn, ...
                   'gui_OutputFcn',  @NumericalFourierSeries_OutputFcn, ...
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


% --- Executes just before NumericalFourierSeries is made visible.
function NumericalFourierSeries_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to NumericalFourierSeries (see VARARGIN)

% Choose default command line output for NumericalFourierSeries
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes NumericalFourierSeries wait for user response (see UIRESUME)
% uiwait(handles.figure1);


set(handles.uitable,'ColumnWidth',{110});
set(handles.uitable,'ColumnName',{'a','b'});



% --- Outputs from this function are returned to the command line.
function varargout = NumericalFourierSeries_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function result = SimpsonIntegral(f, a, b, n)

% n should be even
if (mod(n,2)==1)
    n = n+1;
end

h=(b-a)/n;
x=a:h:b;

Z = subs(f,a) + subs(f,b);

temp = 0;
for i=1:(n/2)-1
    temp = temp + subs(f,x(2*i +1));
end
Z = Z + 2*temp;

temp = 0;
for i=0:(n/2)-1
    temp = temp + subs(f,x(2*i+1 +1));
end
Z = Z + 4*temp;

Z = Z*(h/3);
result = Z;

function functionOfX = NewtonInterpolation(Matrix_X,Matrix_Y)

X=Matrix_X;
Y=Matrix_Y;

n=length(X);

Df=zeros(n,n);

for i=1:n
    Df(i,1)=Y(i);
end


for i=2:n
    for j=1:(n-i+1)
        Df(j,i)= ( Df(j+1,i-1) - Df(j,i-1) )/( X(j+i-1) - X(j) );
    end
end


C=Df(1,:);

syms 'x'

Z= C(1);

for i=2:n
    temp = C(i);
    for j=1:i-1
        temp = temp*(x-X(j));
    end
    Z = Z+temp;
end

functionOfX = Z;

function [a,b] = FourierSeriesCoefficient(functionOfX, periodT, step, integralAccuracy)

f = functionOfX;

L=periodT/2;

syms 'x'

a = (1/L)*SimpsonIntegral(f*cos(step*pi*x/L),-L,L,integralAccuracy);
b = (1/L)*SimpsonIntegral(f*sin(step*pi*x/L),-L,L,integralAccuracy);



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



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uitable1, 'data', zeros(10,2));


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

T=str2double(get(handles.edit1, 'String'));
SimpsonAccuracy=str2double(get(handles.edit2, 'String'));
NewtonAccuracy=str2double(get(handles.edit3, 'String'));
NumberOfFourierSeries=str2double(get(handles.edit4, 'String'));
f=get(handles.edit5, 'String');
syms 'x';

%FourierSeriesCoefficient
%NewtonInterpolation
%SimpsonIntegral

AB = zeros(NumberOfFourierSeries,2);
for i=1:NumberOfFourierSeries
    [a,b] = FourierSeriesCoefficient(f,T,i,SimpsonAccuracy);
    AB(i,1) = a;
    AB(i,2) = b;
end
set(handles.uitable, 'Data', AB);

hold off;
fx = -(T/2):T/500:(T/2);

if (get(handles.text11, 'value'))
    fy = subs(f,fx);
    plot(fx,fy,'--r');
    hold on;
end


NewtonX = -(T/2):T/NewtonAccuracy:(T/2);
NewtonY = subs(f,NewtonX);
Newtonf = NewtonInterpolation(NewtonX,NewtonY);
set(handles.edit7, 'String', char(Newtonf));

if (get(handles.text13, 'value'))
    fy = subs(Newtonf,fx);
    plot(fx,fy,'-b');
    hold on;
end

if (get(handles.text16, 'value'))
    L=T/2;
    a0 = (1/L)*SimpsonIntegral(f,-L,L,SimpsonAccuracy);
    Fourierf = a0/2;
    for i=1:NumberOfFourierSeries
        Fourierf = Fourierf + AB(i,1)*cos(i*pi*x/L);
        Fourierf = Fourierf + AB(i,2)*sin(i*pi*x/L);
    end
    fy = subs(Fourierf,fx);
    plot(fx,fy,'-g');
    hold on;
end
    



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
