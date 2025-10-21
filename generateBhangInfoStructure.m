function info = generateBhangInfoStructure(saveDataPath, savePlotPath, ...
    sampleRate, waveType)
%This function will generate the info structure for the bhangmeter program.

info.saveDataPath = saveDataPath;
info.savePlotPath = savePlotPath;
info.sampleRate = sampleRate;
info.waveType = waveType;

%Set up the parameters.
saveData = 1;
savePlot = 1;
info.saveData = saveData;
info.savePlot = savePlot;

%Set up some initial square wave values.
squareAmp = 2.5;
squareFrequency = sampleRate;
squareOffset = 0.0;
info.squareAmp = squareAmp;
info.squareFrequency = squareFrequency;
info.squareOffset = squareOffset;

%Set up some initial sine wave values.
sineAmp = 2.5;
sineFrequency = sampleRate;
sineOffset = 0.0;
info.sineAmp = sineAmp;
info.sineFrequency = sineFrequency;
info.sineOffset = sineOffset;

%Set up some initial sawtooth wave values.
sawtoothAmp = 2.5;
sawtoothFrequency = sampleRate;
sawtoothOffset = 0.0;
info.sawtoothAmp = sawtoothAmp;
info.sawtoothFrequency = sawtoothFrequency;
info.sawtoothOffset = sawtoothOffset;

%Set up some initial pulse pair values.
pulsePairAmp1 = 2.5;
pulsePairOffset1 = 0.001;
pulsePairSigma1 = 100.0;
pulsePairMu1 = 1000;
pulsePairAmp2 = 1.5;
pulsePairOffset2 = 0.002;
pulsePairSigma2 = 90.0;
pulsePairMu2 = 2000;
info.pulsePairAmp1 = pulsePairAmp1;
info.pulsePairOffset1 = pulsePairOffset1;
info.pulsePairSigma1 = pulsePairSigma1;
info.pulsePairMu1 = pulsePairMu1;
info.pulsePairAmp2 = pulsePairAmp2;
info.pulsePairOffset2 = pulsePairOffset2;
info.pulsePairSigma2 = pulsePairSigma2;
info.pulsePairMu2 = pulsePairMu2;

%Lets set the start and stop flag.
startFlag = 1;
stopFlag = 0;
info.startFlag = startFlag;
info.stopFlag = stopFlag;

%Set the save data and save plots flags.
saveDataFlag = 1;
savePlotFlag = 1;
info.saveDataFlag = saveDataFlag;
info.savePlotFlag = savePlotFlag;

params = zeros(21, 1);

params(1) = sineAmp;
params(2) = sineFrequency;
params(3) = sineOffset;
params(4) = squareAmp;
params(5) = squareFrequency;
params(6) = squareOffset;
params(7) = sawtoothAmp;
params(8) = sawtoothFrequency;
params(9) = sawtoothOffset;
params(10) = pulsePairAmp1;
params(11) = pulsePairOffset1;
params(12) = pulsePairSigma1;
params(13) = pulsePairMu1;
params(14) = pulsePairAmp2;
params(15) = pulsePairOffset2;
params(16) = pulsePairSigma2;
params(17) = pulsePairMu2;
params(18) = startFlag;
params(19) = stopFlag;
params(20) = saveDataFlag;
params(21) = savePlotFlag;

info.params = params;

%Set up some common frame parameter values.
info.titlePosition = 'centertop';
info.borderWidth = 2;
info.fontWeight = 'bold';
info.fontSize = 15;

%Set the row heights and column widths for the wave frames.
waveRowHeight = {50, 50, 50, 50, 50, 50, 50, 50};
waveColumnWidth = {130, 20, 80};
info.waveRowHeight = waveRowHeight;
info.waveColumnWidth = waveColumnWidth;

%Set the row heights and column widths for the pairs frame.
pairsRowHeight = {35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35};
pairsColumnWidth = {30, 170, 20, 150, 30};
info.pairsRowHeight = pairsRowHeight;
info.pairsColumnWidth = pairsColumnWidth;

%Set up the parent gui location.  These values are in pixels from the lower
%left corner of the computer screen.
parentLeft  = 20;
parentBottom = 60;
parentWidth = 1280;
parentHeight = 605;

info.parentLeft = parentLeft;
info.parentBottom = parentBottom;
info.parentWidth = parentWidth;
info.parentHeight = parentHeight;

%Set up the plot window location for all the different plots.
plotLeft = 400;
plotBottom = 50;
plotWidth = 870;
plotHeight = 450;
info.plotLeft = plotLeft;
info.plotBottom = plotBottom;
info.plotWidth = plotWidth;
info.plotHeight = plotHeight;

%Set the location of the square wave panel into the original gui.
squarePanelLeft = 720;   %The left edge of the panel.
squarePanelBottom = 62;  %The bottom edge of the panel.
squarePanelWidth = 280;  %The width of the panel.
squarePanelHeight = 535; %The height of the panel.
info.squarePanelLeft = squarePanelLeft;
info.squarePanelBottom = squarePanelBottom;
info.squarePanelWidth = squarePanelWidth;
info.squarePanelHeight = squarePanelHeight;

%Set the location of the sawtooth wave panel into the original grid.
sawtoothPanelLeft = 1000;  %The left edge of the panel.
sawtoothPanelBottom = 62;  %The bottom of the panel.
sawtoothPanelWidth = 280;  %The width of the panel.
sawtoothPanelHeight = 535; %The height of the panel.
info.sawtoothPanelLeft = sawtoothPanelLeft;
info.sawtoothPanelBottom = sawtoothPanelBottom;
info.sawtoothPanelWidth = sawtoothPanelWidth;
info.sawtoothPanelHeight = sawtoothPanelHeight;

%Set up the location of the sine wave panel into the original gui.
sinePanelLeft = 440;   %The left edge of the panel.
sinePanelBottom = 62;  %The bottom edge of the panel.
sinePanelWidth = 280;  %The width of the panel.
sinePanelHeight = 535; %The height of the panel.
info.sinePanelLeft = sinePanelLeft;
info.sinePanelBottom = sinePanelBottom;
info.sinePanelWidth = sinePanelWidth;
info.sinePanelHeight = sinePanelHeight;

%Set up the location of the pulse pairs panel into the original gui.
pulsePairsPanelLeft = 0;  %The left edge of the panel.
pulsePairsPanelBottom = 62; %The bottom edge of the panel.
pulsePairsPanelWidth = 440;  %The width of the panel.
pulsePairsPanelHeight = 535;   %The height of the panel.
info.pulsePairsPanelLeft = pulsePairsPanelLeft;
info.pulsePairsPanelBottom = pulsePairsPanelBottom;
info.pulsePairsPanelWidth = pulsePairsPanelWidth;
info.pulsePairsPanelHeight = pulsePairsPanelHeight;

end  %End of the function generateBhangInfoStructure.m