%This script will generate the bhangmeter output without the gui.  I am
%writing this in the possibility that it runs faster.

dbstop if error;
close all
clc
clear vars

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Change these values only!!!!  %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a string holding the path to where you want to place the output
%folders.
saveDataPath = "C:\Users\DF_Local\Bhangmeter\Data\";
savePlotPath = "C:\Users\DF_Local\Bhangmeter\Plots\";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Lets choose the type of wave to be generated.  The options are : 
%PulsePair - The original bhangmeter wave depicting a nuclear detonation.
%Sine - A sine wave of amplitude and frequency.
%Square - A square wave of amplitude and frequency.
%Sawtooth - A sawtooth wave of amplitude and frequency.
waveType = 'Sine';

%Create a variable that holds the sample rate for the digitizer. 
sampleRate = 10000.0;

%Set the number of seconds to run the program.
numSecondsToRun = 120.0;

%Generate an information structure.
info = generateBhangInfoStructureNoGUI(saveDataPath, savePlotPath, ...
    sampleRate, waveType, numSecondsToRun);

%Create the data acquisition session.      
bangDAQ.s = daq('ni');
bangDAQ.Rate = sampleRate; 

%Add channels to the session.
bangDAQ.dev = 'Dev1';

inputChannelOneID = 'ai0';
measurementType = 'Voltage';

%Create the output channel.
bangDAQ.outputChannelOne = addoutput(bangDAQ.s, bangDAQ.dev, 'ao0', ...
    'Voltage');                                  

%Add input(to the NIDAQ box-i.e. input from instrument, not computer.)
%channel one. 
bangDAQ.inputChannelOne = addinput(bangDAQ.s, bangDAQ.dev, ...
    inputChannelOneID, measurementType); 
bangDAQ.inputChannelOne.TerminalConfig = 'SingleEnded';

%Lets generate a figure.
%Set up the figure size and location.
left = info.plotLeft;
bottom = info.plotBottom;
width = info.plotWidth;
height = info.plotHeight;

fig1 = figure();        
fig1.Position = [left bottom width height];

%Now get the signal.
if strcmp(waveType, 'Sine')

    %Generate the data.
    [time, outputData] = getWaveFunction(info, waveType);

    if info.savePlot

        %Make plots of the outputs sent to the bhangmeter.
        makeBhangmeterPlotsNoGUI(info, time, outputData, waveType);
    
        %Set the path.
        plotPath = makeBhangmeterDirectory(info.savePlotPath, ...
            waveType);

        %Generate the filename.
        plotFileName = strcat(plotPath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'), '.png');

        %Save the plot.
        saveas(fig1, plotFileName);

    end  %End of if statement - if info.savePlot

    if info.saveData
        savePath = makeBhangmeterDirectory(info.saveDataPath, waveType);
        fileName = strcat(savePath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
   
        outMatrix = [time; outputData']';
        writematrix(outMatrix, fileName);

    end  %End of if statement - if info.saveData

elseif strcmp(waveType, 'Sawtooth')

    [time, outputData] = getWaveFunction(info, waveType);

    if info.savePlot

        %Make plots of the outputs sent to the bhangmeter.
        makeBhangmeterPlotsNoGUI(info, time, outputData, waveType);
    
        %Set the path.
        plotPath = makeBhangmeterDirectory(info.savePlotPath, ...
            waveType);

        %Generate the filename.
        plotFileName = strcat(plotPath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'), '.png');

        %Save the plot.
        saveas(fig1, plotFileName);

    end  %End of if statement - if info.savePlot

    if info.saveData
        savePath = makeBhangmeterDirectory(info.saveDataPath, waveType);
        fileName = strcat(savePath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
   
        outMatrix = [time; outputData']';
        writematrix(outMatrix, fileName);

    end  %End of if statement - if info.saveData

elseif strcmp(waveType, 'Square')
    [time, outputData] = getWaveFunction(info, waveType);

    if info.savePlot

        %Make plots of the outputs sent to the bhangmeter.
        makeBhangmeterPlotsNoGUI(info, time, outputData, waveType);
    
        %Set the path.
        plotPath = makeBhangmeterDirectory(info.savePlotPath, ...
            waveType);

        %Generate the filename.
        plotFileName = strcat(plotPath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'), '.png');

        %Save the plot.
        saveas(fig1, plotFileName);

    end  %End of if statement - if info.savePlot

    if info.saveData
        savePath = makeBhangmeterDirectory(info.saveDataPath, waveType);
        fileName = strcat(savePath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
   
        outMatrix = [time; outputData']';
        writematrix(outMatrix, fileName);

    end  %End of if statement - if info.saveData

else
    [time, outputData] = getWaveFunction(info, waveType);
    
    if info.savePlot

        %Make plots of the outputs sent to the bhangmeter.
        makeBhangmeterPlotsNoGUI(info, time, outputData, waveType);
    
        %Set the path.
        plotPath = makeBhangmeterDirectory(info.savePlotPath, ...
            waveType);

        %Generate the filename.
        plotFileName = strcat(plotPath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'), '.png');

        %Save the plot.
        saveas(fig1, plotFileName);

    end  %End of if statement - if info.savePlot

    if info.saveData
        savePath = makeBhangmeterDirectory(info.saveDataPath, waveType);
        fileName = strcat(savePath, '\Bhangmeter_', ...
            datestr(now, 'yyyy-mm-dd_HH-MM-SS'));
   
        outMatrix = [time, outputData];
        writematrix(outMatrix, fileName);

    end  %End of if statement - if info.saveData

end

%Write the profile to the DAQ.  OutputData is data that is output to the
%bhangmeter. InputData is data that is read from bhangmeter.  At this time,
%we are not actually getting any input data from the bhangmeter.  I have
%put this in there on the chance that we will one day use it.  Its wave
%form should probably be just random noise.
%Loop over the number of seconds in the run.
for numSeconds = 1, info.numSecondsToRun
    [inputData, timeData] = readwrite(bangDAQ.s, outputData);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function info = generateBhangInfoStructureNoGUI(saveDataPath, savePlotPath, ...
    sampleRate, waveType, numSecondsToRun)
%This function will generate the info structure for the bhangmeter program.

info.saveDataPath = saveDataPath;
info.savePlotPath = savePlotPath;
info.sampleRate = sampleRate;
info.waveType = waveType;
info.numSecondsToRun = numSecondsToRun;

%Set up the parameters.
saveData = 1;
savePlot = 1;
info.saveData = saveData;
info.savePlot = savePlot;

%Set up some initial square wave values.
squareAmplitude = 2.5;
squareFrequency = sampleRate;
squareOffset = 0.0;
info.squareAmplitude = squareAmplitude;
info.squareFrequency = squareFrequency;
info.squareOffset = squareOffset;

%Set up some initial sine wave values.
sineAmplitude = 2.5;
sineFrequency = sampleRate;
sineOffset = 0.0;
info.sineAmplitude = sineAmplitude;
info.sineFrequency = sineFrequency;
info.sineOffset = sineOffset;

%Set up some initial sawtooth wave values.
sawtoothAmplitude = 2.5;
sawtoothFrequency = sampleRate;
sawtoothOffset = 0.0;
info.sawtoothAmplitude = sawtoothAmplitude;
info.sawtoothFrequency = sawtoothFrequency;
info.sawtoothOffset = sawtoothOffset;

%Set up some initial pulse pair values.
pulsePairAmplitude1 = 2.5;
pulsePairOffset1 = 0.001;
pulsePairSigma1 = 100.0;
pulsePairMu1 = 1000;
pulsePairAmplitude2 = 1.5;
pulsePairOffset2 = 0.002;
pulsePairSigma2 = 90.0;
pulsePairMu2 = 2000;
info.pulsePairAmplitude1 = pulsePairAmplitude1;
info.pulsePairOffset1 = pulsePairOffset1;
info.pulsePairSigma1 = pulsePairSigma1;
info.pulsePairMu1 = pulsePairMu1;
info.pulsePairAmplitude2 = pulsePairAmplitude2;
info.pulsePairOffset2 = pulsePairOffset2;
info.pulsePairSigma2 = pulsePairSigma2;
info.pulsePairMu2 = pulsePairMu2;

%Set the save data and save plots flags.
saveDataFlag = 1;
savePlotFlag = 1;
info.saveDataFlag = saveDataFlag;
info.savePlotFlag = savePlotFlag;

%Set up the plot window location for all the different plots.
plotLeft = 400;
plotBottom = 50;
plotWidth = 870;
plotHeight = 450;
info.plotLeft = plotLeft;
info.plotBottom = plotBottom;
info.plotWidth = plotWidth;
info.plotHeight = plotHeight;

end  %End of the function generateBhangInfoStructure.m

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [time, outputData] = getWaveFunction(info, waveType)

%Determine the frequency by looking at the sample rate.
frequency = info.sampleRate;

%Generate a sequence of values to be used as a time.
time = linspace(0, frequency, 2*frequency)';

%Generate a list of numbers to be used to generate the actual function.
%Due to the way Matlab generates the functions these have to be in radians
%as a function of pi.
g = linspace(0, frequency*pi, 2*frequency)';

%Now generate the wave.
if strcmp(waveType, 'Sine')
    amplitude = info.sineAmplitude;
    offset = info.sineOffset;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*sin(g) + offset;

elseif strcmp(waveType, 'Square')
    amplitude = info.squareAmplitude;
    offset = info.sineOffset;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*square(g) + offset;


elseif strcmp(waveType, 'Sawtooth')
    amplitude = info.sawtoothAmplitude;
    offset = info.sawtoothOffset;
    
    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*sawtooth(g) + offset;

else

    %Get the parameters.
    amplitude1 = info.pulsePairAmplitude1;
    offset1 = info.pulsePairOffset1;
    sigma1 = info.pulsePairSigma1;
    mu1 = info.pulsePairMu1;
    amplitude2 = info.pulsePairAmplitude2;
    offset2 = info.pulsePairOffset2;
    sigma2 = info.pulsePairSigma2;
    mu2 = info.pulsePairMu2;

    %Now ensure that the values fit within the number of samples we are
    %generating.
    mu1 = 0.3*info.pulsePairMu1*frequency;
    mu2 = 0.3*info.pulsePairMu2*frequency;
    sigma1 = 0.05*info.pulsePairSigma1*frequency;
    sigma2 = 0.05*info.pulsePairSigma2*frequency;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.  First check the first pulse parameters.
    if amplitude1 > 5.0
        amplitude1 = 5.0;
    end

    if amplitude1 + offset1 > 5.0
        offset1 = 0  %We remove the offset.
    end

    %Now check the second pulse parameters.
    if amplitude2 > 5.0
        amplitude2 = 5.0;
    end

    if amplitude2 + offset2 > 5.0
        offset2 = 0  %We remove the offset.
    end

    %Generate the argument to the two exponents.
    e1Arg = -0.5*((time - mu1)/sigma1).^2;
    e2Arg = -0.5*((time - mu2)/sigma2).^2;

    sqrt2pi = sqrt(2.0*pi);

    %Generate the functions.
    f = offset1 + amplitude1*(1.0/(sigma1 * sqrt2pi))*exp(e1Arg);
    g = offset2 + amplitude2*(1.0/(sigma2 * sqrt2pi))*exp(e2Arg);

    outputData = f + g;

end  %End of if-elseif-else statement - if strcmp(waveType, 'Sine')

end  %End of the function getWaveFunction.m
