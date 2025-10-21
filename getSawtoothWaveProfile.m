function sawtoothWave = getSawtoothWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Lets get the period of the feature.
T = 1.0/numFeatures;

%Now determine the slope.
slope = 2.0*amplitude/T;

%Lets generate a sawtooth wave.  It will have an amplitude and an amplitude 
%offset.
%It will rise instantly to -A and travel to A over the width of the period.  
%It will then drop to -A and repeat.

AValues = linspace(0, T, dataPointsPerFeature - 1);

sawtoothProfile = amplitudeOffset + [-amplitude; ...
    slope*AValues' - amplitude];

sawtoothWave = repmat(sawtoothProfile', 1, numFeatures);
%sawtoothWave = sawtoothProfile;
%for i = 1 : numFeatures - 1
%    sawtoothWave = [sawtoothWave; sawtoothProfile];
%end


end  %End of the function getSquareWave.m