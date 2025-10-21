function squareWave = getSquareWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Lets generate a square wave.  It will have an amplitude, an amplitude 
%offset and a temporal offset.
%This function will start from the amplitude offset and at t = timeOffset.
%It will rise instantly to A and travel to 0.5*timePerFeature.  It will
%then drop to -amplitude and go to 2*0.5*timePerFeature, where it will then
%return to amplitude offset.
squareProfile = amplitudeOffset + [0; ...
    amplitude*ones(fix(dataPointsPerFeature/2) - 1, 1); ...
    -amplitude*ones(fix(dataPointsPerFeature/2) - 1, 1); ...
    0];

squareWave = repmat(squareProfile', 1, numFeatures);

end  %End of the function getSquareWave.m