function [time, outputData] = getWaveFunction(info, waveType)

%Determine the frequency by looking at the sample rate.
frequency = info.sampleRate;

%Generate a sequence of values to be used as a time.
time = linspace(0, frequency, 2*frequency)';

%Generate a list of numbers to be used to generate the actual function.
%Due to the way Matlab generates the functions these have to be in radians
%as a function of pi.
g = linspace(0, frequency*pi, 2*frequency)';

%Now generate the wave.
if strcmp(waveType, 'Sine')
    amplitude = info.sineAmplitude;
    offset = info.sineOffset;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*sin(g) + offset;

elseif strcmp(waveType, 'Square')
    amplitude = info.squareAmplitude;
    offset = info.sineOffset;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*square(g) + offset;


elseif strcmp(waveType, 'Sawtooth')
    amplitude = info.sawtoothAmplitude;
    offset = info.sawtoothOffset;
    
    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.
    if amplitude > 5.0
        amplitude = 5.0;
    end

    if amplitude + offset > 5.0
        offset = 0  %We remove the offset.
    end

    outputData = amplitude*sawtooth(g) + offset;

else

    %Get the parameters.
    amplitude1 = info.pulsePairAmplitude1;
    offset1 = info.pulsePairOffset1;
    sigma1 = info.pulsePairSigma1;
    mu1 = info.pulsePairMu1;
    amplitude2 = info.pulsePairAmplitude2;
    offset2 = info.pulsePairOffset2;
    sigma2 = info.pulsePairSigma2;
    mu2 = info.pulsePairMu2;

    %Now ensure that the values fit within the number of samples we are
    %generating.
    mu1 = 0.3*info.pulsePairMu1*frequency;
    mu2 = 0.3*info.pulsePairMu2*frequency;
    sigma1 = 0.05*info.pulsePairSigma1*frequency;
    sigma2 = 0.05*info.pulsePairSigma2*frequency;

    %Check to see that the sum of the amplitude and offset are not greater
    %than 5 Volts.  First check the first pulse parameters.
    if amplitude1 > 5.0
        amplitude1 = 5.0;
    end

    if amplitude1 + offset1 > 5.0
        offset1 = 0  %We remove the offset.
    end

    %Now check the second pulse parameters.
    if amplitude2 > 5.0
        amplitude2 = 5.0;
    end

    if amplitude2 + offset2 > 5.0
        offset2 = 0  %We remove the offset.
    end

    %Generate the argument to the two exponents.
    e1Arg = -0.5*((time - mu1)/sigma1).^2;
    e2Arg = -0.5*((time - mu2)/sigma2).^2;

    sqrt2pi = sqrt(2.0*pi);

    %Generate the functions.
    f = offset1 + amplitude1*(1.0/(sigma1 * sqrt2pi))*exp(e1Arg);
    g = offset2 + amplitude2*(1.0/(sigma2 * sqrt2pi))*exp(e2Arg);

    outputData = f + g;

end  %End of if-elseif-else statement - if strcmp(waveType, 'Sine')

end  %End of the function getWaveFunction.m