function generatePulsePairPlot(fig1, time, outputData, params)
%This function will plot the pulse pairs.  It is called by
%generatePulsePairs.

%Get the parameters.
amplitude1 = params(10);
offset1 = params(11);
sigma1 = params(12);
mu1 = params(13);
amplitude2 = params(14);
offset2 = params(15);
sigma2 = params(16);
mu2 = params(17);

%Now plot the data.
plot(time, outputData, 'green')
xlim([time(1) time(end)])
title('Voltage versus time')
xlabel('Time (s)')
ylabel('Amplitude (V)')
text(0.75, 3.50, ['A_{1}', ' = ', num2str(amplitude1)])
text(0.75, 3.25, ['\sigma_{1}', ' = ', num2str(sigma1)])
text(0.75, 3.00, ['\mu_{1}', ' = ', num2str(mu1)])
text(0.75, 2.75, ['Y Offset', ' = ', num2str(offset1)])
text(0.75, 2.50, ['A_{2}', ' = ', num2str(amplitude2)])
text(0.75, 2.25, ['\sigma_{2}', ' = ', num2str(sigma2)])
text(0.75, 2.00, ['\mu_{2}', ' = ', num2str(mu2)])
text(0.75, 1.75, ['Y Offset', ' = ', num2str(offset2)])

end  %End of the function generatePulsePairPlot.m