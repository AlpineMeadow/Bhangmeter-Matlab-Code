function generatePulsePairs(handles, bangDAQ, info, frameType)
%This function will generate the pulse pairs.  It is called by
%getStartButton.

%First generate a figure.
%Set up the figure size and location.
left = info.plotLeft;
bottom = info.plotBottom;
width = info.plotWidth;
height = info.plotHeight;

fig1 = figure();        
fig1.Position = [left bottom width height];

%Set up the data save path.
saveDataPath = info.saveDataPath;
absoluteSavePath = makeBhangmeterDirectory(saveDataPath, frameType);
            
%Set up a plotting directory.        
savePlotPath = info.savePlotPath;
absolutePlotPath = makeBhangmeterDirectory(savePlotPath, frameType);

%Set the handles.params fields to the variable params.
params = handles.params;

%Get the save data and plot flags.
saveDataFlag = params(20);
savePlotFlag = params(21);

%Set the frequency.
frequency = info.sampleRate;

%Generate the pulses.  The variable f corresponds to the first pulse.  The
%variable g corresponds to the second pulse and the variable t corresponds
%to the time values plugged into the Gaussian functions.
[f, g, time] = generatePulses(params, info);

%Generate the final pulse which is the summation of the two individual
%pulses labeled f and g.
pulse = f + g;
outputData = pulse;

%Given the frequency we want to set the sample rate of the data aquisition
%model to be twice that.
bangDAQ.Rate = 2*frequency;

%Write the pulse shape to the NIDAC board.
[inputData, timeData] = readwrite(bangDAQ.s, outputData);

%Make a plot of the data.
generatePulsePairPlot(fig1, time, outputData, params)

%Write the plot to a file
%Set up a plot file name.
if savePlotFlag
    plotFileName = strcat(absolutePlotPath, '\Bhangmeter_', ...
        datestr(now, 'yyyy-mm-dd_HH-MM-SS'), '.png');
    saveas(fig1, plotFileName);
end

%Write the data file if the user requests
if saveDataFlag
    fileName = strcat(absoluteSavePath, '\Bhangmeter_', ...
        datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
    outMatrix = [time, outputData];
    writematrix(outMatrix, fileName);
end

end  %End of the function generatePulsePairs.m