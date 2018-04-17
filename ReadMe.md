Script to create noisy signal for GVS

Use: 

signal = createNoise(duration in sec,samplingRate,Intensity,minFrequence,maxFrequence);

Example: 

signal = createNoise(20.5,20000,500,0,30);

The function also creates a .wav file and a PDF of the signal in the directory 'signals'