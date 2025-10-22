%This script will input the bhangmeter data from Anna Harden and generate a
%new set of data that will enable us to output the data as a linear output
%to the bhangmeter LED box.

%First lets clear Matlab's memory.
close all;
clearvars;

%If there is an error stop Matlab and force it to point to the error.
dbstop if error;

%Read in the original Bhangmeter data.
time = [0.0001, 0.0002, 0.0003, 0.0004, 0.0005, 0.0006, 0.0007, 0.0008, ...
        0.0009, 0.001, 0.002, 0.003, 0.004, 0.005, 0.006, 0.007, 0.008, ...
        0.009, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, ...
        0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0, 2.0, 3.0, 4.0, ...
        5.0, 6.0, 7.0, 8.0, 9.0, 10.0];

Temp1 = [3000, 7000, 9900, 10000, 9700, 9100, 9000, 8700, 8200, 8000, ...
         6000, 5000, 4500, 4100, 3900, 3750, 3600, 3500, 3400, 3350, ...
         4000, 4450, 4800, 5500, 6300, 6800, 7000, 7400, 7900, 6300, ...
         5400, 4700, 4300, 3900, 3600, 3300, 3100, 2100, 1700, 1500, ...
         1400, 1300, 1200, 1100, 1000, 900];

%Normalize the temperature and set it to range over the requested
%offset.
maxVoltage = 5.0;
offset = 2.5;
range = maxVoltage - offset;

%Normalize and offset the data.
Temp1 = range*Temp1/max(Temp1) + offset;

%Now make a new time vector.  Since the delta time is 0.0001 seconds lets
%use that.
deltaT = time(2) - time(1);  %Units of seconds.
timeLength = 10.0;
newTime = 0.0 : deltaT : timeLength;

%Interpolate the old temperature and old time onto the new time vector.
newTemp1 = interp1(time, Temp1, newTime);

%Now plot the data.
%Set up a plot file name.
BhangMeterPlotFileName = '/SS1/Bhangmeter/Plots/BhangmeterInterpolatedData.png';

%Set up the size and position of the plotting object.
positionLeft = 750;
positionBottom = 25;
positionWidth = 1750;
positionHeight = 700;

%Set up the size and position of the plot inside the plotting object.
axesLeft = 0.08;
axesBottom = 0.12;
axesWidth = 0.9;
axesHeight = 0.78;

%Set up the font information.
fontWeight = 'bold';
fontSize = 18;

%Set up the figure handle/object.
fig2 = figure('DefaultAxesFontSize', fontSize);
ax = axes();
fig2.Position = [positionLeft, positionBottom, ...
                positionWidth, positionHeight];
ax.Position = [axesLeft, axesBottom, axesWidth, ...
                axesHeight];
ax.FontWeight = fontWeight;

%Make a semilog plot.
semilogx(time, Temp1, 'b-*', newTime, newTemp1, 'r')
xlabel('Temperature (K)')
ylabel('Time (s)')
title({'Plot of Temperature as a function of time'}, ...
        {'for Nuclear Detonation'})
legend('Original Data', 'Interpolated Data')

%Save the time series to a file.
saveas(fig2, BhangMeterPlotFileName);