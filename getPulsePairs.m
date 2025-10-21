function pulsePairs = getPulsePairs(fig, bangDAQ)
%This function will generate a panel for the user to create a pair of
%pulses to send to the led light.

%Set up some initial pulse pair values.
amp1 = 2.5;
sigma1 = 1.0;
mu1 = 1.0;
offset1 = 0.0;
amp2 = 2.5;
sigma2 = 1.0;
mu2 = 1.0;
offset2 = 0.0;
startTime = 23;
stopTime = 1;

%Set a panel into the original gui.
pulsePairs = uipanel(fig);

%Set up the location of the panel into the original gui.
left = 0;  %The left edge of the panel.
bottom = 62; %The bottom edge of the panel.
width = 440;  %The width of the panel.
height = 535;   %The height of the panel.
pulsePairs.Position = [left, bottom, width, height];

%Now set up the grid layout.
rowHeight = {35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35};
columnWidth = {30, 170, 20, 150, 30};
pulsePairsGridLayout = uigridlayout(pulsePairs, [length(rowHeight) ...
    length(columnWidth)]);
pulsePairsGridLayout.RowHeight = rowHeight;
pulsePairsGridLayout.ColumnWidth = columnWidth;

%Set the title and its position, the fonts and the border width.
pulsePairs.TitlePosition = 'centertop';
pulsePairs.Title = 'Pulse Pairs';
pulsePairs.BorderWidth = 2;
pulsePairs.FontWeight = 'bold';
pulsePairs.FontSize = 15;

%Fill the UserData structure.
pulsePairs.UserData = struct('start', 1, ...
    'stop', 0, ...
    'amplitude1', amp1, ...
    'sigma1', sigma1, ...
    'mu1', mu1, ...
    'offset1', offset1, ...
    'amplitude2', amp2, ...
    'sigma2', sigma2, ...
    'mu2', mu2, ...
    'offset2', offset2, ...
    'startTime', startTime, ...
    'stopTime', stopTime);

%Set up a start time label.
label = 'Start Time(s) :';
row = 1;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the start time parameter.
row = 1;
column = 4;
getParam(pulsePairsGridLayout, startTime, row, column);

%Set up a first peak amplitude label.
label = 'Peak 1 Amplitude(V) :';
row = 2;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the peak 1 amplitude.
row = 2;
column = 4;
getParam(pulsePairsGridLayout, amp1, row, column);

%Set up a first peak sigma label.
label = 'Peak 1 Sigma : ';
row = 3;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the first peak sigma.
row = 3;
column = 4;
getParam(pulsePairsGridLayout, sigma1, row, column);

%Set up a first peak mu label.
label = 'Peak 1 Mu : ';
row = 4;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the first peak mu.
row = 4;
column = 4;
getParam(pulsePairsGridLayout, mu1, row, column);

%Set up a first peak offset label.
label = 'Peak 1 Offset (V) :';
row = 5;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the first peak offset.
row = 5;
column = 4;
getParam(pulsePairsGridLayout, offset1, row, column);

%Set up a stop time label.
label = 'Stop Time(s) :';
row = 6;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the stop time parameter.
row = 6;
column = 4;
getParam(pulsePairsGridLayout, stopTime, row, column);

%Set up a first peak amplitude label.
label = 'Peak 2 Amplitude(V) :';
row = 7;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the peak 2 amplitude.
row = 7;
column = 4;
getParam(pulsePairsGridLayout, amp2, row, column);

%Set up a second peak sigma label.
label = 'Peak 2 Sigma : ';
row = 8;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the second peak sigma.
row = 8;
column = 4;
getParam(pulsePairsGridLayout, sigma2, row, column);

%Set up a second peak mu label.
label = 'Peak 2 Mu : ';
row = 9;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the second peak mu.
row = 9;
column = 4;
getParam(pulsePairsGridLayout, mu2, row, column);

%Set up a second peak offset label.
label = 'Peak 2 Offset (V) :';
row = 10;
column = 2;
getParamLabel(pulsePairsGridLayout, label, row, column);

%Get the second peak offset.
row = 10;
column = 4;
getParam(pulsePairsGridLayout, offset2, row, column);

%Set up a second peak end time label.
label = 'Start';
row = 11;
column = 2;
getStartButton(pulsePairsGridLayout, label, row, column, bangDAQ);

%Set up a stop button.
label = 'Stop';
row = 11;
column = 4;
getStopButton(pulsePairsGridLayout, label, row, column);

end  %End of the function getPulsePairs.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function getStopButton(pulsePairsGridLayout, Text, ...
    row, column)
%This function will return the handle for the stop button.

stopButton = uibutton(pulsePairsGridLayout);
stopButton.Text = Text;
stopButton.FontWeight = 'bold';
stopButton.FontSize = 24;
stopButton.FontColor = [0 0 0];
stopButton.Layout.Row = row;
stopButton.Layout.Column = column;
stopButton.BackgroundColor = [1 0 0];
stopButton.ButtonPushedFcn = {@stopButtonFlag};

end  %End of the function getStopButton.m

function stopButtonFlag(src, event)
%This function sets the UserData flag to tell the program to stop.

%First get the handles out of the figure object.
handles = guidata(src);

%Set the start and stop values.
handles.pulsePairs.UserData.stop = 1;
handles.pulsePairs.UserData.start = 0;

end %End of the function stopButtonFlag.m


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function getStartButton(pulsePairsGridLayout, label, row, column, bangDAQ)

startButton = uibutton(pulsePairsGridLayout);
startButton.Text = label;
startButton.FontWeight = 'bold';
startButton.FontSize = 24;
startButton.FontColor = 'k';
startButton.Layout.Row  = row;
startButton.Layout.Column = column;
startButton.BackgroundColor = 'g';
startButton.ButtonPushedFcn = {@startLoopingInputSignal, bangDAQ};

end  %End of the function getStartButton.m

function startLoopingInputSignal(src, event, bangDAQ)

%First generate a figure.
fig = figure()

handles = guidata(src);

end  %End of the function startLoopingInputSignal.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function getParamLabel(pulsePairsGridLayout, name, row, column)

paramLabel = uilabel(pulsePairsGridLayout);
paramLabel.Text = name;
paramLabel.FontWeight = 'bold';
paramLabel.FontSize = 16;
paramLabel.FontColor = 'k';
paramLabel.Layout.Row = row;
paramLabel.Layout.Column = column;

end  %End of the function getParamLabel.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function getParam(pulsePairsGridLayout, initialValue, ...
    row, column)

param = uieditfield(pulsePairsGridLayout, 'numeric');
param.Value = initialValue;
param.FontSize = 16;
param.FontWeight = 'bold';
param.Layout.Row = row;
param.Layout.Column = column;
param.ValueChangedFcn = {@changeParams};

end  %End of the function getParam.m

function changeParam(src, event)

%Get the data out of the applicatin data of the figure object.
handles = guidata(src);

%handles.pulsePairs.UserData.
fred = 1;
end %End of the function changeParam.m














