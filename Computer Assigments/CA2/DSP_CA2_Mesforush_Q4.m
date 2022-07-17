clc
clear all
%Here we shall filter sound with MATLAB tools.
%First we read and listen to the file
[NoisySound,Fs] = audioread('NoisySound.wav');
sound(NoisySound)
%Part A
%Here we obtain and plot the fourier transform in the wanted interval.
fp=linspace(-Fs/2,Fs/2,length(NoisySound));
NoisySoundF=fftshift(fft(NoisySound));
figure()
plot(fp,abs(NoisySoundF),'m')
title('Magnitude of fourier transform of NoisySound')
xlim([0 Fs/2])
xlabel('freq(Hz)')
figure()
semilogy(fp,abs(NoisySoundF),'m')
xlim([0 Fs/2])
xlabel('freq(Hz)')
title('Magnitude of fourier transform of NoisySound(logarithmic scale)')
%Part B & C
%Now we go on to plot the frequency response of our filter
freqz(Q4Bandstop);
%Now we apply this filter
bs_filtered_sound = filter(Q4Bandstop,NoisySound);
sound(bs_filtered_sound,Fs)
audiowrite('bs_filtered_sound.wav',bs_filtered_sound,Fs);

%Part D
%Before filtering sound

sound(bs_filtered_sound,Fs);

%After filtering sound
bsequi_filtered_sound = filter(Equiripple,bs_filtered_sound);
sound(bsequi_filtered_sound,Fs);
audiowrite('bsequi_filtered_sound.wav',bsequi_filtered_sound,Fs);

%Now we plot them in time domain before and after filtering

figure()
plot(bs_filtered_sound)
xlabel('t')
xlim([-10000,length(bs_filtered_sound)])
title('Signal before equiripple filter');
figure()
plot(bsequi_filtered_sound)
xlabel('t');
xlim([-10000,length(bsequi_filtered_sound)])
title('Signal after equiripple filter');
%Now we plot the signals in the frequency domain.
figure()
plot(fp, fftshift(abs(fft(bs_filtered_sound))),'g');
xlabel('Frequency(Hz)')
title('Abs of FT before applying equiripple filter')
figure()
plot(fp, fftshift(abs(fft(bsequi_filtered_sound))),'g');
xlabel('Frequency(Hz)')
title('Abs of FT for after applying equiripple filter')
%Now we go on to plot the frequency response of the equiripple filter
freqz(Equiripple);
%Now we do all we did for another filter.


%Before filtering sound

%sound(bs_filtered_sound,Fs);

%After filtering sound
bsbut_filtered_sound = filter(Butterworth,bs_filtered_sound);
sound(bsbut_filtered_sound,Fs);
audiowrite('bsbut_filtered_sound.wav',bsbut_filtered_sound,Fs);


%Now we plot them in time domain before and after filtering

figure()
plot(bs_filtered_sound)
xlabel('t')
xlim([-10000,length(bs_filtered_sound)])
title('Signal before butterworth filter');
figure()
plot(bsbut_filtered_sound)
xlabel('t');
xlim([-10000,length(bsbut_filtered_sound)])
title('Signal after butterworth filter');

%Now we plot the signals in the frequency domain.
figure()
plot(fp, fftshift(abs(fft(bs_filtered_sound))),'g');
xlabel('Frequency(Hz)')
title('Abs of FT before applying butterworth filter')
figure()
plot(fp, fftshift(abs(fft(bsbut_filtered_sound))),'g');
xlabel('Frequency(Hz)')
title('Abs of FT for after applying butterworth filter')
%Now we go on to plot the frequency response of the equiripple filter
freqz(Butterworth);




























