function getStopButton(fig, gridLayout, Text, row, column, position)
%This function will generate the stop button.

stopButton = uibutton(gridLayout);
stopButton.Text = Text;
stopButton.FontWeight = 'bold';
stopButton.FontSize = 24;
stopButton.FontColor = [0 0 0];
stopButton.Layout.Row = row;
stopButton.Layout.Column = column;
stopButton.BackgroundColor = [1 0 0];
stopButton.ButtonPushedFcn = {@stopButtonFlag, fig, position};

end  %End of the function getStopButton.m

function stopButtonFlag(src, event, fig, position)
%This function sets the stop and start parameter flags to tell the 
%program to stop.

%First get the handles out of the figure object.
handles = guidata(src);

%Set the stop and start parameters.
handles.params(position) = 0;
handles.params(position + 1) = 1;

%Store the handle structure in the application data of the figure object.
guidata(fig, handles);

end %End of the function stopButtonFlag.m