clc 
%Here we go on to implement the second part of the project.

%Part A
[Audio,Fs]= audioread('y.wav');
disp('The sampling frequency is:')
disp(Fs)

%Part B
%First we compute the length of the audio to create the appropriate f.
AudioLen= length(Audio);
f= Fs.*((-AudioLen/2:AudioLen/2-1)/AudioLen);
f1=Fs.*linspace((-AudioLen/2)/AudioLen,(AudioLen/2-1)/AudioLen,AudioLen);
AudioF= fftshift(fft(Audio));
figure()
plot(f1,abs(AudioF),'r');
xlabel('freq');
title('Magnitude of Audio');
figure()
plot(f1,angle(AudioF),'r');
xlabel('freq');
title('Phase of Audio');

%Part C
%Here we compute the autocorrelation of the audio, tau is the variable for
%the given lags,
[R,lags] = xcorr(Audio,'unbiased');
R = R(lags>0);
lags = lags(lags>0);
figure();
plot(lags/Fs,R,'r');
title('Autocorrelation');
xlabel('lags')
ylabel('AutoCorr')
xlim([-0.5 8]);
%Part E
%Here we go on to plot the impulse response, first we create the matrix.
 StepResMat = [1, zeros(1, 5499), 0.3, zeros(1, 3499), 0.2];
 %Now we perform the plotting
 figure()
 stem(StepResMat,'g')
  xlim([-100 9100])
 title('Step response');
%Part F
 Echoremoved = filter(1, StepResMat, Audio);
 sound(Echoremoved,Fs);
 audiowrite('EchoRemoved.wav',Echoremoved,Fs);

%Part H
%Here we see the frequency response of our designed filter.
freqz(FilterWithKaiser);

%Part I
%Now we apply our specially designed filter
 Audiowithreducednoise = filter(FilterWithKaiser,Echoremoved);
 sound(Audiowithreducednoise,Fs)
 audiowrite('Audiowithreducednoise.wav',Audiowithreducednoise,Fs);


%Part J
figure()
plot(Audiowithreducednoise,'m')
xlabel('t')
xlim([0,100000])
title('X(t)');
figure()
plot(Echoremoved,'m')
xlabel('t');
xlim([0,100000])
title('Xp(t)');
%This part is purely for better comprehension
figure()
plot(f, fftshift(abs(fft(Audiowithreducednoise))));
xlabel('Frequency(Hz)')
title('Abs of FT for X')
figure()
plot(f, fftshift(abs(fft(Echoremoved))));
xlabel('Frequency(Hz)')
title('Abs of FT for Xprime')



