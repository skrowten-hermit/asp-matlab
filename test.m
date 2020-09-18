source = '/home/sreekanth/Programs/asp-matlab/male_8k.wav'
%recorded = '/home/sreekanth/Programs/asp-matlab/male_8k_silence.wav'
recorded = '/home/sreekanth/Programs/asp-matlab/male_8k_half.wav'
[y1, fs1] = audioread(source)
[y2, fs2] = audioread(recorded)
%plot(y1)
%plot(y2)

[Rx, lags] = xcorr(y1)
tau = lags/fs

% plot the signal autocorrelation function
figure(6)
plot(tau, Rx, 'r')