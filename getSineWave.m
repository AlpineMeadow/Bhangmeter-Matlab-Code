function sineWave = getSineWave(fig, bangDAQ)
%This function will generate a panel for the user to create a sine wave
%to send to the led light.

%Set up some initial sine wave values.
amp = 2.5;
period = 1.0;
phase = 1.0;
startTime = 0.0;
stopTime = 1.0;

%Set a panel into the original gui.
sineWave = uipanel(fig);

%Set up the location of the panel into the original gui.
left = 440;   %The left edge of the panel.
bottom = 62;  %The bottom edge of the panel.
width = 280;  %The width of the panel.
height = 535; %The height of the panel.
sineWave.Position = [left bottom width height];

%Now set up the grid layout.
rowHeight = {50, 50, 50, 50, 50, 50};
columnWidth = {110, 20, 100};
sineWaveGridLayout = uigridlayout(sineWave, [length(rowHeight) ...
    length(columnWidth)]);
sineWaveGridLayout.RowHeight = rowHeight;
sineWaveGridLayout.ColumnWidth = columnWidth;

%Set the title and its position, the fonts and the border width.
sineWave.TitlePosition = 'centertop';
sineWave.Title = 'Sine Wave';
sineWave.BorderWidth = 2;
sineWave.FontWeight = 'bold';
sineWave.FontSize = 15;

%Fill the UserData structure.
sineWave.UserData = struct('start', 1, ...
    'stop', 0, ...
    'amplitude', amp, ...
    'period', period, ...
    'phase', phase, ...
    'startTime', startTime, ...
    'stopTime', stopTime);

%Set up a start time label.
label = 'Start Time(s) :';
row = 1;
column = 1;
getParamLabel(sineWaveGridLayout, label, row, column);

%Get the start time parameter.
row = 1;
column = 3;
getParam(sineWaveGridLayout, startTime, row, column);

%Set up an amplitude label.
label = 'Amplitude(V) :';
row = 2;
column = 1;
getParamLabel(sineWaveGridLayout, label, row, column);

%Get the amplitude.
row = 2;
column = 3;
getParam(sineWaveGridLayout, amp, row, column);

%Set up a period label.
label = 'Period(mS) : ';
row = 3;
column = 1;
getParamLabel(sineWaveGridLayout, label, row, column);

%Get the period.
row = 3;
column = 3;
getParam(sineWaveGridLayout, period, row, column);

%Set up a phase label.
label = 'Phase(mS) : ';
row = 4;
column = 1;
getParamLabel(sineWaveGridLayout, label, row, column);

%Get the first peak mu.
row = 4;
column = 3;
getParam(sineWaveGridLayout, phase, row, column);

%Set up a second peak end time label.
label = 'Start';
row = 5;
column = [1 3];
getStartButton(sineWaveGridLayout, label, row, column, bangDAQ);

%Set up a stop button.
label = 'Stop';
row = 6;
column = [1 3];
getStopButton(sineWaveGridLayout, label, row, column);

end  %End of the function getSineWave.m


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


