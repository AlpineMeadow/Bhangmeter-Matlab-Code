function [f, g, t] = generatePulses(params, info)
%This function is called by generatePulsePairs and will actually create the
%two pulses from the input parameters.

%Determine the frequency by looking at the sample rate.
frequency = info.sampleRate;

%Get the parameters.
amplitude1 = params(10);
offset1 = params(11);
sigma1 = params(12);
mu1 = params(13);
amplitude2 = params(14);
offset2 = params(15);
sigma2 = params(16);
mu2 = params(17);

%Check to see that the sum of the amplitude and offset are not greater than
%5 Volts.  First check the first pulse parameters.
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

%Generate a sequence of values to be used as a time.
t = linspace(0, frequency, 2*frequency)';

%Generate the argument to the two exponents.
e1Arg = -0.5*((t - mu1)/sigma1).^2;
e2Arg = -0.5*((t - mu2)/sigma2).^2;

sqrt2pi = sqrt(2.0*pi);

%Generate the functions.
f = offset1 + amplitude1*(1.0/(sigma1 * sqrt2pi))*exp(e1Arg);
g = offset2 + amplitude2*(1.0/(sigma2 * sqrt2pi))*exp(e2Arg);

end