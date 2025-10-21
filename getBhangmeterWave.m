function wave = getBhangmeterWave(numFeatures, amplitudeOffset, amplitude, ...
    dataPointsPerFeature, waveType);
%This function will generate a wave to be used for the bhangmeter.


%Find the period for each feature.    
T = 1.0/numFeatures;

%Set up a time vector.
time = linspace(0, T, dataPointsPerFeature)';

if strcmp(waveType, 'Chirp')

    %Set up a time vector.
    time = linspace(0, T, dataPointsPerFeature*numFeatures);

    %Now make the wave.  This does not have numFeatures.  I have no idea how to
    %make that happen.
    wave = amplitudeOffset + amplitude*chirp(time, 1, time(end), 1000);

elseif strcmp(waveType, 'Sine')
    %Lets generate a sine wave.  It will have an amplitude and an amplitude
    %offset.
    sineProfile = amplitudeOffset + amplitude*sin((2.0*pi/T)*time);

    wave = repmat(sineProfile', 1, numFeatures);

elseif strcmp(waveType, 'Random')

    %Set the seed of  random number generator.
    rng(0, 'twister')

    %Set the upper limit.
    upperLimit = amplitude + amplitudeOffset;

    %Set the lower limit.
    lowerLimit = -amplitude + amplitudeOffset;

    %Set the number of random samples.
    numSamples = numFeatures*dataPointsPerFeature;

    %Get the random numbers.
    wave = (upperLimit - lowerLimit).*rand(numSamples, 1) + lowerLimit;

elseif strcmp(waveType, 'Square')

    %Lets generate a square wave.  It will have an amplitude, an amplitude
    %offset and a temporal offset.
    %This function will start from the amplitude offset and at t =
    %timeOffset. It will rise instantly to A and travel to
    %0.5*timePerFeature.  It will then drop to -amplitude and go to
    %2*0.5*timePerFeature, where it will then return to amplitude offset.
    squareProfile = amplitudeOffset + [0; ...
        amplitude*ones(fix(dataPointsPerFeature/2) - 1, 1); ...
        -amplitude*ones(fix(dataPointsPerFeature/2) - 1, 1); ...
        0];

    wave = repmat(squareProfile', 1, numFeatures);

elseif strcmp(waveType, 'Sawtooth')

    %Determine the slope.
    slope = 2.0*amplitude/T;

    %Lets generate a sawtooth wave.  It will have an amplitude and an
    %amplitude offset. It will rise instantly to -A and travel to A over
    %the width of the period. It will then drop to -A and repeat.

    AValues = linspace(0, T, dataPointsPerFeature - 1);

    sawtoothProfile = amplitudeOffset + [-amplitude; ...
        slope*AValues' - amplitude];

    wave = repmat(sawtoothProfile', 1, numFeatures);

elseif strcmp(waveType, 'Triangle')

    %Now determine the slopes.
    m1 = 4.0*amplitude/T;
    m2 = -4.0*amplitude/T;

    %Lets generate a triangle wave.  It will have an amplitude and an
    %amplitude offset.
    %It will rise instantly to 0 and travel to A over the width of one
    %quarter of the period.  It will then drop to -A over half of the
    %period and  then rise up to zero and then repeat.
    m1Values = linspace(0, T/4, fix(dataPointsPerFeature/4.0))';
    m2Values = linspace(0, T/2, fix(dataPointsPerFeature/2.0) + 1)';

    triangleProfile = amplitudeOffset + [m1*m1Values; ...
        m2*m2Values + amplitude; ...
        m1*m1Values - amplitude];

    wave = repmat(triangleProfile', 1, numFeatures);

else  
    %The user has entered a wave that is not provided for.  Send error
    %message  
    disp('The wave type entered has no mechanism to be produced.')
    disp('You will need to either create a function to generate the')
    disp('wave you want or try one of the pre-generated wave types.')
end

end %End of the function getWave.m