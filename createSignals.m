 %% Create Signals for GVS and Sham
 function [signalGVS] = createSignals()
 % GVS SIMULUS
 AmplitudeGVS = 1;
 SampleRate = 20000;
 timeGVS = [0:1/SampleRate:20];
 frequencyGVS = 1;
 signalGVS = AmplitudeGVS*sin(2*pi*frequencyGVS*timeGVS);
 plot(timeGVS,signalGVS);
 
%  % SHAM STIMULUS
%  timeGVSSham = [0:1/SampleRate:2];
%  signalSham = AmplitudeGVS*sin(2*pi*frequencyGVS*timeGVSSham);
%  plot(timeGVSSham,signalSham);
%  timeSham = [2:1/SampleRate:20];
%  noGVS = zeros(length(timeSham),1)';
%  signalSham = [signalSham noGVS];
%  plot([timeGVSSham timeSham],signalSham);
 end
 