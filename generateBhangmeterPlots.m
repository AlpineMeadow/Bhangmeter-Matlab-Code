function generateBhangmeterPlots(fig1, time, outputData, amplitude, ...
    frequency, offset)

%Generate a plot of the output voltage as a function of time.

amplitudeStr = ['Amplitude : ', num2str(amplitude), ' Volts'];
frequencyStr = ['Frequency : ', num2str(frequency), ' Hz'];
offsetStr = ['Offset : ', num2str(offset), ' Volts'];

timeStartIndex = 1000;
timeEndIndex = 1500;
t = time(timeStartIndex : timeEndIndex);
voltage = outputData(timeStartIndex : timeEndIndex);

plot(t, voltage, 'r') 
title('Plot of Voltage Sent to Bhangmeter Versus Time')
xlim([t(1) t(end)])
xlabel('Time (ms)')
ylabel('Bhangmeter Signal (V)')
ylim([-1.2*amplitude + offset 1.2*amplitude + offset])
text('Units', 'Normalized', 'Position', [0.6, 0.95], 'string', ...
    amplitudeStr, 'FontSize', 11)
text('Units', 'Normalized', 'Position', [0.6, 0.85], 'string', ...
    frequencyStr, 'FontSize', 11)
text('Units', 'Normalized', 'Position', [0.6, 0.75], 'string', ...
    offsetStr, 'FontSize', 11)

end  %End of the function generateBhangmeterPlots.m
