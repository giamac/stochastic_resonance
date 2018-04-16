function checkSignal(signal)

%Take fourier transform
fftSignal = fft(signal);
%apply fftshift to put it in the form we are used to (see documentation)
fftSignal = fftshift(fftSignal);

f = 1:length(signal);


%Since the signal is complex, we need to plot the magnitude to get it to
%look right, so we use abs (absolute value)
figure;
plot(f, abs(fftSignal));
title('magnitude FFT of sine');
xlabel('Frequency (Hz)');
ylabel('magnitude');

end
