function getStartButton(gridLayout, label, row, column, bangDAQ, info, ...
    position, frameType)

startButton = uibutton(gridLayout);
startButton.Text = label;
startButton.FontWeight = 'bold';
startButton.FontSize = 24;
startButton.FontColor = 'k';
startButton.Layout.Row  = row;
startButton.Layout.Column = column;
startButton.BackgroundColor = 'g';
startButton.ButtonPushedFcn = {@startLoopingInputSignal, bangDAQ, info, ...
    position, frameType};

end  %End of the function getStartButton.m

function startLoopingInputSignal(src, event, bangDAQ, info, ...
    position, frameType)

%Loop the generation of the data.
while true
    handles = guidata(src);

    %Get the start and stop flags.
    startLoop = handles.params(position);
    stopLoop = handles.params(position + 1);

    if strcmp(frameType, 'Sine')
        %Generate the sine wave sweep.
        generateWave(handles, bangDAQ, info, frameType)
    end
    if strcmp(frameType, 'Square')
       %Generate the square wave sweep.
        generateWave(handles, bangDAQ, info, frameType);
    end
    if strcmp(frameType, 'Sawtooth')
        %Generate the sawtooth wave sweep.
        generateWave(handles, bangDAQ, info, frameType);
    end
    if strcmp(frameType, 'pulsePair')
        %Generate the pulse pair wave.
        generatePulsePairs(handles, bangDAQ, info, frameType);
    end
    
    %This is needed in order to see the stop interrupt.
%    pause(0.1);  

    %Check to see if the user has asked to stop.  If so we break out of the
    %while loop.
    if stopLoop
        break;
    end  %End of if statement.    

end  %End of the while loop

end  %End of the function startLoopingInputSignal.m
