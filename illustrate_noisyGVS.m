clear all

%Create the noise with an intensity of 500
optimalNoise = createNoise(20.5,20000,500,0,30, 'off');

%Create the noise with an intensity of 100
lowNoise = createNoise(20.5,20000,100,0,30, 'off');

%Create the noise with an intensity of 3000
highNoise = createNoise(20.5,20000,3000,0,30, 'off');

%Create the Sinus Signal 
sinusSignal = sin(0.0001 *(1:length(optimalNoise)))' * 500;

%Set fictional threshold to 600
threshold = 600;

%Combination of low noise and signal

lowNoiseSinusSignal = lowNoise + sinusSignal;

%Combination of optimal noise and signal

optimalNoiseSinusSignal = optimalNoise + sinusSignal;

%Combination of high noise and signal

highNoiseSinusSignal = highNoise + sinusSignal;

%Plot optimal Noise

 h = figure;
    subplot(3,1,1);
    line([0,length(optimalNoise)],[threshold,threshold], 'LineWidth', 2)
    hold on
    line([0,length(optimalNoise)],[-threshold,-threshold], 'LineWidth', 2)
    plot(sinusSignal, 'LineWidth', 2)
    plot(optimalNoiseSinusSignal)
    xlabel('Signal');
    title('Optimal Noise');
    
    subplot(3,1,2);
    line([0,length(lowNoise)],[threshold,threshold], 'LineWidth', 2)
    hold on
    line([0,length(lowNoise)],[-threshold,-threshold], 'LineWidth', 2)
    plot(sinusSignal, 'LineWidth', 2)
    plot(lowNoiseSinusSignal)
    xlabel('Signal');
    title('Low Noise');
    
    subplot(3,1,3);
    line([0,length(highNoise)],[threshold,threshold], 'LineWidth', 2)
    hold on
    line([0,length(highNoise)],[-threshold,-threshold], 'LineWidth', 2)
    plot(sinusSignal, 'LineWidth', 2)
    plot(highNoiseSinusSignal)
    xlabel('Signal');
    title('High Noise');

