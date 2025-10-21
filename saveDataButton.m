function saveDataButton(gridLayout, Text, row, column, position)
%This function will generate save data button.
   
saveDataButton = uicheckbox(gridLayout);
saveDataButton.Text = Text;
saveDataButton.FontWeight = "bold";
saveDataButton.FontSize = 16;
saveDataButton.FontColor = [0 0 0];
saveDataButton.Layout.Row = row;
saveDataButton.Layout.Column = column;
saveDataButton.ValueChangedFcn = {@saveDataButtonFlag2, position};

end %End of the function saveDataButton2.m

function saveDataButtonFlag2(src, event, position)
%Here we will just send the controller the quit command.    
%Get the data out of the application data of the figure object.
handles = guidata(src);

if handles.params(position) == 1  %saveDataButtonFlag is set to 1.
    handles.params(position) = 0;
end  %End  of if statement.
if handles.params(position) == 0  %SaveDataButtonFlag is set to 0.
    handles.params(position) = 1;
end %End of if statement.

end  %End of the function saveDataButtonFlag.m
