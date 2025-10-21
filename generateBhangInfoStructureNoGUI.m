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