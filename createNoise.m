function [noiseFinal] = createNoise(duration,samplingRate, amplitude,  lf, hf)
    
    npoints   = duration * samplingRate;
    noise     = (amplitude/3)* randn( 1, npoints ); 
    % Gaus distributed white noise; mean = ~0; 99.7% of amplitudes between ± 2.
    time      = (0:npoints-1) / samplingRate;

    % In frequency domain, white noise has constant amplitude but uniformly
    % distributed random phase. We generate this here. Only half of the
    % samples are generated here, the rest are computed later using the complex
    % conjugate symmetry property of the FFT (of real signals).
    X = [1; exp(i*2*pi*rand(npoints/2-1,1)); 1]; % X(1) and X(NFFT/2) must be real 

    % Identify the locations of frequency bins. These will be used to zero out
    % the elements of X that are not in the desired band
    freqbins  = (0:npoints/2)'/npoints*samplingRate;

    % Zero out the frequency components outside the desired band 
    X(find((freqbins < lf) | (freqbins > hf))) = 0;

    % Use the complex conjugate symmetry property of the FFT (for real signals) to
    % generate the other half of the frequency-domain signal
    X         = [X; conj(flipud(X(2:end-1)))];

    % IFFT to convert to time-domain
    noise     = real(ifft(X));

    % Normalize such that 99.999% of the times signal lies between ± amplitude
    noiseFinal = amplitude*noise/prctile(noise, 99.999);

    %Plot the signal
    
    timePlot = 1/samplingRate:1/samplingRate:duration;

    binwidth = 1/2*std(noiseFinal);
    numbins = round(range(noiseFinal)/binwidth);
    
    
    h = figure;
    subplot(1,2,1);
    plot(timePlot,noiseFinal);
    xlabel('Duration in sec');
    ylabel('Amplitude in mA');
    title(['Noise for Frequencies between ' num2str(lf) 'Hz to ' num2str(hf) 'Hz (Sampling Rate: ' num2str(samplingRate) 'Hz)'])

    subplot(1,2,2); 
    histfit(noiseFinal,100)
    xlabel('Amplitudes in mA');
    ylabel('Frequency of Amplitudes');
    title(['Distribution of Amplitudes over whole signal'])
    
    if ~exist('signals','dir')
        mkdir('signals')
    end
    
    set(h,'PaperPositionMode','auto');         

    set(h,'PaperOrientation','landscape');

    set(h,'Position',[50 50 1200 800]);

    
    print(h,['signals/noise_' num2str(lf) '_' num2str(hf) '_' num2str(samplingRate) '_' num2str(amplitude) '_' num2str(duration) '.pdf'],'-dpdf','-r0')

    
    % Save Signals as audio file
    
    
    
    audiowrite(['signals/noise_' num2str(lf) '_' num2str(hf) '_' num2str(samplingRate) '_' num2str(amplitude) '_' num2str(duration) '.wav'], noiseFinal, samplingRate)

    

end

