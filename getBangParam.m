function getBangParam(gridLayout, initialValue, row, column, position)
%This function will get the paramater from the user and then change it.

param = uieditfield(gridLayout, 'numeric');
param.Value = initialValue;
param.FontSize = 16;
param.FontWeight = 'bold';
param.Layout.Row = row;
param.Layout.Column = column;
param.ValueChangedFcn = {@changeParam, position};

end  %End of the function getParam.m

function changeParam(src, event, position)

%Get the data out of the applicatin data of the figure object.
handles = guidata(src);

%Now put the new value into the appropriate handle structure.
handles.params(position) = event.Value;

%Store the handle structure in the application data of the figure object.
guidata(src, handles);

end %End of the function changeParam.m
