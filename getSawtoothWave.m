function sawtoothWave = getSawtoothWave(fig, bangDAQ)


%Set up some initial sine wave values.
amp = 2.5;
period = 1.0;
phase = 1.0;
startTime = 0.0;
stopTime = 1.0;

sawtoothWave = uipanel(fig);
sLeft = 1000;
sBottom = 62;
sWidth = 280;
sHeight = 535;
sawtoothWave.Position = [sLeft sBottom sWidth sHeight];

%Now set up the grid layout.
rowHeight = {50, 50, 50, 50, 50, 50};
columnWidth = {110, 20, 100};
sawtoothWaveGridLayout = uigridlayout(sawtoothWave, [length(rowHeight) ...
    length(columnWidth)]);
sawtoothWaveGridLayout.RowHeight = rowHeight;
sawtoothWaveGridLayout.ColumnWidth = columnWidth;


sawtoothWave.TitlePosition = 'centertop';
sawtoothWave.Title = 'Sawtooth Wave';
sawtoothWave.BorderWidth = 2;
sawtoothWave.FontWeight = 'bold';
sawtoothWave.FontSize = 15;


%Fill the UserData structure.
sawtoothWave.UserData = struct('start', 1, ...
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
getParamLabel(sawtoothWaveGridLayout, label, row, column);

%Get the start time parameter.
row = 1;
column = 3;
getParam(sawtoothWaveGridLayout, startTime, row, column);

%Set up an amplitude label.
label = 'Amplitude(V) :';
row = 2;
column = 1;
getParamLabel(sawtoothWaveGridLayout, label, row, column);

%Get the amplitude.
row = 2;
column = 3;
getParam(sawtoothWaveGridLayout, amp, row, column);

%Set up a period label.
label = 'Period(mS) : ';
row = 3;
column = 1;
getParamLabel(sawtoothWaveGridLayout, label, row, column);

%Get the period.
row = 3;
column = 3;
getParam(sawtoothWaveGridLayout, period, row, column);

%Set up a phase label.
label = 'Phase(mS) : ';
row = 4;
column = 1;
getParamLabel(sawtoothWaveGridLayout, label, row, column);

%Get the first peak mu.
row = 4;
column = 3;
getParam(sawtoothWaveGridLayout, phase, row, column);

%Set up a second peak end time label.
label = 'Start';
row = 5;
column = [1 3];
getStartButton(sawtoothWaveGridLayout, label, row, column, bangDAQ);

%Set up a stop button.
label = 'Stop';
row = 6;
column = [1 3];
getStopButton(sawtoothWaveGridLayout, label, row, column);

end  %End of the function getSawtoothWave.m


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


