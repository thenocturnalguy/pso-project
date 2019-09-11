function varargout = psogui(varargin)
% PSOGUI MATLAB code for psogui.fig
%      PSOGUI, by itself, creates a new PSOGUI or raises the existing
%      singleton*.
%
%      H = PSOGUI returns the handle to a new PSOGUI or the handle to
%      the existing singleton*.
%
%      PSOGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSOGUI.M with the given input arguments.
%
%      PSOGUI('Property','Value',...) creates a new PSOGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before psogui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to psogui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help psogui

% Last Modified by GUIDE v2.5 30-Mar-2019 19:41:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @psogui_OpeningFcn, ...
                   'gui_OutputFcn',  @psogui_OutputFcn, ...
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


% --- Executes just before psogui is made visible.
function psogui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to psogui (see VARARGIN)

% Choose default command line output for psogui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes psogui wait for user response (see UIRESUME)
% uiwait(handles.PSO);


% --- Outputs from this function are returned to the command line.
function varargout = psogui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function nVar_Callback(hObject, eventdata, handles)
% hObject    handle to nVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nVar as text
%        str2double(get(hObject,'String')) returns contents of nVar as a double


% --- Executes during object creation, after setting all properties.
function nVar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nVar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function varMin_Callback(hObject, eventdata, handles)
% hObject    handle to varMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of varMin as text
%        str2double(get(hObject,'String')) returns contents of varMin as a double


% --- Executes during object creation, after setting all properties.
function varMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to varMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function varMax_Callback(hObject, eventdata, handles)
% hObject    handle to varMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of varMax as text
%        str2double(get(hObject,'String')) returns contents of varMax as a double


% --- Executes during object creation, after setting all properties.
function varMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to varMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MaxIter_Callback(hObject, eventdata, handles)
% hObject    handle to MaxIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MaxIter as text
%        str2double(get(hObject,'String')) returns contents of MaxIter as a double


% --- Executes during object creation, after setting all properties.
function MaxIter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MaxIter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nPop_Callback(hObject, eventdata, handles)
% hObject    handle to nPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nPop as text
%        str2double(get(hObject,'String')) returns contents of nPop as a double


% --- Executes during object creation, after setting all properties.
function nPop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nPop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sphere.
function sphere_Callback(hObject, eventdata, handles)
% hObject    handle to sphere (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sphere


% --- Executes on button press in rastrigin.
function rastrigin_Callback(hObject, eventdata, handles)
% hObject    handle to rastrigin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of rastrigin


% --- Executes on button press in ackley.
function ackley_Callback(hObject, eventdata, handles)
% hObject    handle to ackley (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ackley


% --- Executes on button press in griewank.
function griewank_Callback(hObject, eventdata, handles)
% hObject    handle to griewank (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of griewank


% --- Executes on button press in psomain.
function psomain_Callback(hObject, eventdata, handles)
% hObject    handle to psomain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
clc;

nVar=str2double(get(handles.nVar,'String'));
varMin=str2double(get(handles.varMin,'String'));
varMax=str2double(get(handles.varMax,'String'));
nPop=str2double(get(handles.nPop,'String'));
MaxIter=str2double(get(handles.MaxIter,'String'));
selectedFunc=get(handles.objFunction,'SelectedObject');
selectedFunc=get(selectedFunc,'String');

if strcmp(selectedFunc,'Sphere')
  costFunction=@(x) Sphere(x);
elseif strcmp(selectedFunc,'Rastrigin')
  costFunction=@(x) Rastrigin(x);
elseif strcmp(selectedFunc,'Ackley')
  costFunction=@(x) Ackley(x);
elseif strcmp(selectedFunc,'Griewank')
  costFunction=@(x) Griewank(x);
end

parameters.MaxIter=MaxIter;
parameters.nPop=nPop;
parameters.nVar=nVar;
parameters.varMax=varMax;
parameters.varMin=varMin;

bestCostfrom_spso=spso(costFunction,parameters);
bestCostfrom_cpso=cpso(costFunction,parameters);
bestCostfrom_gcpso=gcpso(costFunction,parameters);
bestCostfrom_cgbgcpso=cgbgcpso(costFunction,parameters);
bestCostfrom_cpbgcpso=cpbgcpso(costFunction,parameters);

% header=['SPSO' 'CSPO' 'GCSPO' 'CGBGCPSO' 'CPBGCPSO'];
% header
% result=[bestCostfrom_spso bestCostfrom_cpso bestCostfrom_gcpso bestCostfrom_cgbgcpso bestCostfrom_cpbgcpso];
% result
% resultArray=[header ; result];
% resultArray

figure;
semilogy(bestCostfrom_spso,'lineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
saveas(gcf,'spso.jpg');

figure;
semilogy(bestCostfrom_cpso,'lineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
saveas(gcf,'cpso.jpg');

figure;
semilogy(bestCostfrom_gcpso,'lineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
saveas(gcf,'gcpso.jpg');

figure;
semilogy(bestCostfrom_cgbgcpso,'lineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
saveas(gcf,'cgbgcpso.jpg');

figure;
semilogy(bestCostfrom_cpbgcpso,'lineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;
saveas(gcf,'cpbgcpso.jpg');

data(1,1)=mean(bestCostfrom_spso);
data(1,2)=mean(bestCostfrom_cpso);
data(1,3)=mean(bestCostfrom_gcpso);
data(1,4)=mean(bestCostfrom_cgbgcpso);
data(1,5)=mean(bestCostfrom_cpbgcpso);

data(2,1)=median(bestCostfrom_spso);
data(2,2)=median(bestCostfrom_cpso);
data(2,3)=median(bestCostfrom_gcpso);
data(2,4)=median(bestCostfrom_cgbgcpso);
data(2,5)=median(bestCostfrom_cpbgcpso);

data(3,1)=max(bestCostfrom_spso);
data(3,2)=max(bestCostfrom_cpso);
data(3,3)=max(bestCostfrom_gcpso);
data(3,4)=max(bestCostfrom_cgbgcpso);
data(3,5)=max(bestCostfrom_cpbgcpso);

data(4,1)=min(bestCostfrom_spso);
data(4,2)=min(bestCostfrom_cpso);
data(4,3)=min(bestCostfrom_gcpso);
data(4,4)=min(bestCostfrom_cgbgcpso);
data(4,5)=min(bestCostfrom_cpbgcpso);

data(5,1)=std(bestCostfrom_spso);
data(5,2)=std(bestCostfrom_cpso);
data(5,3)=std(bestCostfrom_gcpso);
data(5,4)=std(bestCostfrom_cgbgcpso);
data(5,5)=std(bestCostfrom_cpbgcpso);

set(handles.resultTable,'data',data)

% resultArray

% xlswrite('resultSheet.xlsx',resultArray);

% --- Executes during object creation, after setting all properties.
function resultTable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultTable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
