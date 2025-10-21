function getBangParamLabel(gridLayout, name, row, column)
%This function will place the parameter label onto the frame.

paramLabel = uilabel(gridLayout);
paramLabel.Text = name;
paramLabel.FontWeight = 'bold';
paramLabel.FontSize = 16;
paramLabel.FontColor = 'k';
paramLabel.Layout.Row = row;
paramLabel.Layout.Column = column;

end  %End of the function getParamLabel.m
