function randomWave = getRandomWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Set the seed of  random number generator.
rng(0, 'twister')


%Set the upper limit.
upperLimit = amplitude + amplitudeOffset;

%Set the lower limit.
lowerLimit = -amplitude + amplitudeOffset;

%Set the number of random samples.
numSamples = numFeatures*dataPointsPerFeature;

%Get the random numbers.
randomWave = (upperLimit - lowerLimit).*rand(numSamples, 1) + lowerLimit;

end  %End of the function getRandomWaveProfile.m