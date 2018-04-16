clear all
N = 1000;
signal = randn(N, 1);

N_clear = 490;

% Remove the calls to fftshift, if you want to delete the lower frequency components
S = fftshift(fft(signal));   
S_cleared = S;
S_cleared(1:N_clear) = 0;
S_cleared(end-N_clear+2:end) = 0;
S_cleared = fftshift(S_cleared);

signal_cleared = ifft(S_cleared);

subplot(2,2,1);
plot(signal);
title('input signal');

subplot(2,2,2);
plot(abs(S));
title('input spectrum');

subplot(2,2,3);
plot(abs(S_cleared));
title('output spectrum');

subplot(2,2,4);
plot(signal_cleared);
title('output signal');