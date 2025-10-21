%Interactively run the Bhangmeter.

dbstop if error;
close all
clc
clear vars

%Create a string holding the path to where you want to place the output
%folders.
saveDataPath = "C:\Users\DF_Local\Bhangmeter\Data\";
savePlotPath = "C:\Users\DF_Local\Bhangmeter\Plots\";

%Create a variable that holds the sample rate for the digitizer. 
sampleRate = 10000.0;

%Generate an information structure.
info = generateBhangInfoStructure(saveDataPath, savePlotPath, sampleRate);

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

%Now call the gui functions.
handles = getBangHandles(bangDAQ, info);