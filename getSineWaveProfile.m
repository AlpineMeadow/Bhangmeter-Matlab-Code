function sineWave = getSineWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Find the period for each feature.
T = 1.0/numFeatures;

%Set up a time vector.
time = linspace(0, T, dataPointsPerFeature)';

%Lets generate a sine wave.  It will have an amplitude and an amplitude 
%offset.
sineProfile = amplitudeOffset + amplitude*sin((2.0*pi/T)*time);

sineWave = repmat(sineProfile', 1, numFeatures);
%sineWave = sineProfile;
%for i = 1 : numFeatures - 1
%    sineWave = [sineWave; sineProfile];
%end


end  %End of the function getSineWaveProfile.m