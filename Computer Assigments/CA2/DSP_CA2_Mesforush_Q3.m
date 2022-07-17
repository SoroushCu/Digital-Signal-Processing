%In this part we attempt to censor the word "California"
clc
clear all
%Part A & B
%Here we read the voices and listen to them.
[Arnold, FsArn]=audioread('Arnold.wav');
sound(Arnold,FsArn)
[California, FsCal]=audioread('California.wav');
sound(California,FsCal);
[CrossCorr ,lags] = xcorr(Arnold,California);
CrossCorrNorm=normalize(CrossCorr(lags>0),'range',[-1 1]);
plot(lags(lags>0)/FsArn,CrossCorrNorm,'r')
title('The cross correlation of California and Arnold')
[PeakVal ,Peak_Indice]=max(CrossCorrNorm);
%Now we go on to define the bleep sound.
fsin=1000;%Hz
t=1/FsArn*(0:length(California)-1);
bleep_sound=sin(2*pi*fsin*t);
Arnold(Peak_Indice:Peak_Indice+length(California)-1)=bleep_sound;
audiowrite('Censored.wav',Arnold,FsArn)