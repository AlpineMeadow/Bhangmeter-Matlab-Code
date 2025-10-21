function triangleWave = getTriangleWaveProfile(numFeatures, amplitudeOffset, ...
    amplitude, dataPointsPerFeature)


%Lets get the period of the feature.
T = 1.0/numFeatures;

%Now determine the slopes.
m1 = 4.0*amplitude/T;
m2 = -4.0*amplitude/T;

%Lets generate a triangle wave.  It will have an amplitude and an amplitude 
%offset.
%It will rise instantly to 0 and travel to A over the width of one quarter
%of the period.  It will then drop to -A over half of the period and 
%then rise up to zero and then repeat.

m1Values = linspace(0, T/4, fix(dataPointsPerFeature/4.0))';
m2Values = linspace(0, T/2, fix(dataPointsPerFeature/2.0) + 1)';

triangleProfile = amplitudeOffset + [m1*m1Values; ...
    m2*m2Values + amplitude; ...
    m1*m1Values - amplitude];

triangleWave = repmat(triangleProfile', 1, numFeatures);


end  %End of the function gettriangleWaveProfile.m