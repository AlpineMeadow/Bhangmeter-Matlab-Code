%This script will test the various Matlab waves.

close all;
clearvars;

dbstop if error; 

%Set a parameter that determines the number of data points per feature.
dataPointsPerFeature = 50;

%Let numFeatures be the number of features in 1 second.
numFeatures = 10;

%Set an amplitude and offset in time and amplitude.
amplitude = 1.5;  %Volts
amplitudeOffset = 0.1;

waveType = 'Square';
wave = getBhangmeterWave(numFeatures, amplitudeOffset, amplitude, ...
    dataPointsPerFeature, waveType);

%Now plot the wave.
plot(time, wave, 'b')
ylim([-2 2])