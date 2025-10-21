function generateWave(handles, bangDAQ, info, frameType)
%This function will generate the sawtooth wave voltage profile.
%This function is called by getStartButton, getLoopingInputSignal.m

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

%Use the frame type value to determine the parameter array indices.
if strcmp(frameType, 'Sine')
    amplitudeIndex = 1;
    frequencyIndex = 2;
    offsetIndex = 3;
end

if strcmp(frameType, 'Square')
    amplitudeIndex = 4;
    frequencyIndex = 5;
    offsetIndex = 6;
end

if strcmp(frameType, 'Sawtooth')
    amplitudeIndex = 7;
    frequencyIndex = 8;
    offsetIndex = 9;
end


%Lets make the parameters more understandable.
amplitude = handles.params(amplitudeIndex);  %Units are in Volts.
frequency = handles.params(frequencyIndex);  %Units are in hz.
offset = handles.params(offsetIndex); %Units are in volts.

%Get the save data and plot flags.
saveDataFlag = handles.params(20);
savePlotFlag = handles.params(21);

%Check to see that the sum of the amplitude and offset are not greater than
%5 Volts.
if amplitude > 5.0
    amplitude = 5.0;
end

if amplitude + offset > 5.0
    offset = 0  %We remove the offset.
end

%Now generate a square wave.
g = linspace(0, frequency*pi, 2*frequency)';

%Use the frame type to determine the kind of function to generate for the
%output to the NiDAQ box.
if strcmp(frameType, 'Sine')
    pulse = amplitude*sin(g) + offset;
end

if strcmp(frameType, 'Square')
    pulse = amplitude*square(g) + offset;
end

if strcmp(frameType, 'Sawtooth')
    pulse = amplitude*sawtooth(g) + offset;
end

outputData = pulse;
time = 1 : 2*frequency;

%Given the frequency we want to set the sample rate of the data aquisition
%model to be twice that.
bangDAQ.Rate = 2*frequency;

%Write the profile to the DAQ.  OutputData is data that is output to the
%bhangmeter. InputData is data that is read from bhangmeter.  At this time,
%we are not actually getting any input data from the bhangmeter.  I have
%put this in there on the chance that we will one day use it.  Its wave
%form should probably be just random noise.
[inputData, timeData] = readwrite(bangDAQ.s, outputData);   

%Make plots of the outputs sent to the bhangmeter.
generateBhangmeterPlots(fig1, time, outputData, amplitude, ...
    frequency, offset)

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
    outMatrix = [time; outputData']';
    writematrix(outMatrix, fileName);
end

end  %End of the function generateSawtoothWave.m