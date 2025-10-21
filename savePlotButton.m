function savePlotButton(gridLayout, Text, row, column, position)
%This function will set the savePlotButton flag.
        
savePlotButton = uicheckbox(gridLayout);
savePlotButton.Text = Text;
savePlotButton.FontWeight = "bold";
savePlotButton.FontSize = 16;
savePlotButton.FontColor = [0 0 0];
savePlotButton.Layout.Row = row;
savePlotButton.Layout.Column = column;
savePlotButton.ValueChangedFcn = {@savePlotButtonFlag, position};

end %End of the function savePlotButton.m

function savePlotButtonFlag(src, event, position)
%Here we will just send the controller the quit command.

%Get the data out of the application data of the figure object.
handles = guidata(src);

if handles.params(position) == 1  %savePlotButtonFlag is set to 1.
    handles.savePlotButton.UserData = 0;
end  %End of if statement.

if handles.params(position) == 0 %savePlotButtonFlag is set to 0.
    handles.params(position) = 1;    
end %End of if statement.

end  %End of the function savePlotButtonFlag.m