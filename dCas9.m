function varargout = dCas9(varargin)
% DCAS9 MATLAB code for dCas9.fig
%      DCAS9, by itself, creates a new DCAS9 or raises the existing
%      singleton*.
%
%      H = DCAS9 returns the handle to a new DCAS9 or the handle to
%      the existing singleton*.
%
%      DCAS9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DCAS9.M with the given input arguments.
%
%      DCAS9('Property','Value',...) creates a new DCAS9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dCas9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dCas9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dCas9

% Last Modified by GUIDE v2.5 25-Aug-2018 12:25:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dCas9_OpeningFcn, ...
                   'gui_OutputFcn',  @dCas9_OutputFcn, ...
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


% --- Executes just before dCas9 is made visible.
function dCas9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dCas9 (see VARARGIN)

% Choose default command line output for dCas9
handles.output = hObject;
NGuides=2;
NMatchesGuide=7;
MinGCGuide=0.45;
MaxGCGuide=0.65;
PromLength=1000;
NMatchesProm=7;
MinGCProm=0.45;
MaxGCProm=0.65;
GuideSeq=[];
CatguideRNA=[];

GuideSeq=num2str(GuideSeq);




handles.NGuides=NGuides;
handles.NMatchesGuide=NMatchesGuide;
handles.MinGCGuide=MinGCGuide;
handles.MaxGCGuide=MaxGCGuide;
handles.PromLength=PromLength;
handles.NMatchesProm=NMatchesProm;
handles.MinGCProm=MinGCProm;
handles.MaxGCProm=MaxGCProm;
handles.GuideSeq=GuideSeq;
handles.CatguideRNA=CatguideRNA;


% Choose default command line output for untitled
 handles.output = hObject;
 % create the listener for the slider1
 handles.sliderListener = addlistener(handles.slider1GuideMin,'ContinuousValueChange', ...
                                      @(hFigure,eventdata) slider1ContValCallback(...
                                        hObject,eventdata));
% create the listener for the slider2
 handles.sliderListener = addlistener(handles.slider2GuideMax,'ContinuousValueChange', ...
                                      @(hFigure,eventdata) slider2ContValCallback(...
                                        hObject,eventdata));
 
                                    % create the listener for the slider2
 handles.sliderListener = addlistener(handles.slider3PromMinGC,'ContinuousValueChange', ...
                                      @(hFigure,eventdata) slider3ContValCallback(...
                                        hObject,eventdata));
                                    % create the listener for the slider2
 handles.sliderListener = addlistener(handles.slider4,'ContinuousValueChange', ...
                                      @(hFigure,eventdata) slider4ContValCallback(...
                                        hObject,eventdata));


                                    


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dCas9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dCas9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in NumOfGuides.
function NumOfGuides_Callback(hObject, eventdata, handles)
% hObject    handle to NumOfGuides (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Update handles structure
prompt = {'Enter the number of guides you want to generate: '};
title = 'Input';
dims = [1 35];
definput = {'2'};
x = inputdlg(prompt,title,dims,definput);
NGuides=cell2mat(x);
NGuides=str2double(NGuides);
handles.NGuides=NGuides;

guidata(hObject, handles);




% --- Executes on selection change in popupmenu1Guide.
function popupmenu1Guide_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1Guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val}
case '4' % User selects peaks.
   NMatchesGuide = '4';
case '5' % User selects membrane.
   NMatchesGuide = '5';
case '6' % User selects sinc.
   NMatchesGuide = '6';
case '7' % User selects sinc.
   NMatchesGuide = '7'; 
case '8' % User selects sinc.
   NMatchesGuide = '8'; 
end
handles.NMatchesGuide;
guidata(hObject, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1Guide contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1Guide


% --- Executes during object creation, after setting all properties.
function popupmenu1Guide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1Guide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SizeOfPromoter.
function SizeOfPromoter_Callback(hObject, eventdata, handles)
% hObject    handle to SizeOfPromoter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt = {'Enter the size of the promoter you want to generate: '};
title = 'Input';
dims = [1 35];
definput = {'1000'};
x = inputdlg(prompt,title,dims,definput);
PromLength=cell2mat(x);
PromLength=str2double(PromLength);
handles.PromLength=PromLength;
guidata(hObject, handles);



% --- Executes on selection change in popupmenu2Prom.
function popupmenu2Prom_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2Prom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject, 'String');
val = get(hObject,'Value');
% Set current data to the selected data set.
switch str{val}
case '4' % User selects peaks.
   NMatchesProm = '4';
case '5' % User selects membrane.
   NMatchesProm = '5';
case '6' % User selects sinc.
   NMatchesProm = '6';
case '7' % User selects sinc.
   NMatchesProm = '7'; 
case '8' % User selects sinc.
   NMatchesProm = '8'; 
end
handles.NMatchesProm=NMatchesProm;
guidata(hObject, handles);

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2Prom contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2Prom


% --- Executes during object creation, after setting all properties.
function popupmenu2Prom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2Prom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in GenerateGuide.
function GenerateGuide_Callback(hObject, eventdata, handles)
% hObject    handle to GenerateGuide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NGuides=handles.NGuides;
NMatchesGuide=handles.NMatchesGuide;
MinGCGuide=handles.MinGCGuide;
MaxGCGuide=handles.MaxGCGuide;
CatguideRNA=[];
for n=1:NGuides
guideRNA=rundCas9Guide(n,NMatchesGuide,MinGCGuide,MaxGCGuide,CatguideRNA);
CatguideRNA=cat(1,CatguideRNA,guideRNA);
end

[filename pathname] = uiputfile('*.txt');
destino1=strcat(pathname,'guideRNA',filename);
fid = fopen(destino1,'wt');
for ii = 1:size(CatguideRNA,1)
    fprintf(fid,'%s\n',CatguideRNA(ii,:));
end   
fclose(fid);




guidata(hObject, handles);





% --- Executes on button press in EnterGuideSeq.
function EnterGuideSeq_Callback(hObject, eventdata, handles)
% hObject    handle to EnterGuideSeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

NGuides=handles.NGuides;
CatguideRNA=handles.CatguideRNA;
for n=1:NGuides
prompt = {'Enter the sequence of your guide RNA: '};
title = 'Input';
dims = [1 35];

x = inputdlg(prompt,title,dims);
Guideseq=cell2mat(x);
CatguideRNA=cat(1,CatguideRNA,Guideseq);

end


handles.CatguideRNA=CatguideRNA;


guidata(hObject, handles);


% --- Executes on button press in GeneratePromoter.
function GeneratePromoter_Callback(hObject, eventdata, handles)
% hObject    handle to GeneratePromoter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CatguideRNA=handles.CatguideRNA;
if isempty(CatguideRNA)
  NGuides=handles.NGuides;
NMatchesGuide=handles.NMatchesGuide;
MinGCGuide=handles.MinGCGuide;
MaxGCGuide=handles.MaxGCGuide;
CatguideRNA=[];
    for n=1:NGuides
guideRNA=rundCas9Guide(n,NMatchesGuide,MinGCGuide,MaxGCGuide,CatguideRNA);
CatguideRNA=cat(1,CatguideRNA,guideRNA);
    end  
end


NMatchesProm=handles.NMatchesProm;
PromLength=handles.PromLength;
MinGCProm=handles.MinGCProm;
MaxGCProm=handles.MaxGCProm;

PromDNA=rundCas9Prom(PromLength,NMatchesProm,MinGCProm,MaxGCProm,CatguideRNA);

[filename pathname] = uiputfile('*.txt');
destino1=strcat(pathname,'guides',filename);
destino2=strcat(pathname,'Prom',filename);


fid = fopen(destino1,'wt');
for ii = 1:size(CatguideRNA,1)
    fprintf(fid,'%s\n',CatguideRNA(ii,:));
end   
fclose(fid);

fid = fopen(destino2,'wt');
for ii = 1:size(PromDNA,1)
    fprintf(fid,'%s\n',PromDNA(ii,:));
end   
fclose(fid);

guidata(hObject, handles);


% --- Executes on slider movement.
function slider1GuideMin_Callback(hObject, eventdata, handles)
% hObject    handle to slider1GuideMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(hObject, 'min', 0.2);
% set(hObject, 'max', 0.8);
set(hObject, 'Value'); % Somewhere between max and min.
MinGCGuide=get(hObject,'Value');
handles.MinGCGuide=MinGCGuide;

guidata(hObject, handles);



% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1GuideMin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1GuideMin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2GuideMax_Callback(hObject, eventdata, handles)
% hObject    handle to slider2GuideMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(hObject, 'min', 0.2);
% set(hObject, 'max', 0.8);
set(hObject, 'Value'); % Somewhere between max and min.
MaxGCGuide=get(hObject,'Value');
handles.MaxGCGuide=MaxGCGuide;


guidata(hObject, handles);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2GuideMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2GuideMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3PromMinGC_Callback(hObject, eventdata, handles)
% hObject    handle to slider3PromMinGC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(hObject, 'min', 0.2);
% set(hObject, 'max', 0.8);
set(hObject, 'Value'); % Somewhere between max and min.
MinGCProm=get(hObject,'Value');
handles.MinGCProm=MinGCProm;


guidata(hObject, handles);


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3PromMinGC_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3PromMinGC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(hObject, 'min', 0.2);
% set(hObject, 'max', 0.8);
set(hObject, 'Value'); % Somewhere between max and min.
MaxGCProm=get(hObject,'Value');
handles.MaxGCProm=MaxGCProm;


guidata(hObject, handles);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end





function slider1ContValCallback(hFigure,eventdata)
 % test it out - get the handles object and write the current value
 % to the edit box
 handles = guidata(hFigure);
 sliderValue = get(handles.slider1GuideMin,'Value');
 set(handles.edit2,'String',num2str(sliderValue));

function slider2ContValCallback(hFigure,eventdata)
 % test it out - get the handles object and write the current value
 % to the edit box
 handles = guidata(hFigure);
 sliderValue = get(handles.slider2GuideMax,'Value');
 set(handles.edit3,'String',num2str(sliderValue));

 function slider3ContValCallback(hFigure,eventdata)
 % test it out - get the handles object and write the current value
 % to the edit box
 handles = guidata(hFigure);
 sliderValue = get(handles.slider3PromMinGC,'Value');
 set(handles.edit4,'String',num2str(sliderValue));

  function slider4ContValCallback(hFigure,eventdata)
 % test it out - get the handles object and write the current value
 % to the edit box
 handles = guidata(hFigure);
 sliderValue = get(handles.slider4,'Value');
 set(handles.edit5,'String',num2str(sliderValue));


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
