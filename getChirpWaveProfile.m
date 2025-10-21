function chirpWave = getChirpWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Find the period for each feature.
T = 1.0/numFeatures;

%Set up a time vector.
time = linspace(0, T, dataPointsPerFeature*numFeatures);

%Now make the wave.  This does not have numFeatures.  I have no idea how to
%make that happen.
chirpWave = amplitudeOffset + amplitude*chirp(time, 1, time(end), 1000);


end  %End of the function getchirpWaveProfile.m