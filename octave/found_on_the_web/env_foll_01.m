%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all hidden

% 1.- Evironment Variables
%--------------------------
fs = 40e3;
N = 2^14;
t = 0:1/fs: (N-1)/fs;
phaseAdjust= 1.3;

% 2.- Buildig AM signal
%-----------------------
f = [100 5e3];
m = 1; % Modulation deep (100%)
xm = cos(2*pi*f(1)*t); % Message
xc = sin(2*pi*f(2)*t); % Carrier
xam = (1+m*xm).*xc;

% 3.- Designing the filters
%---------------------------
% 3.1.- Hilbert Filter
orden = 61;
f = 0.1:0.001:0.901; % Frecuencias donde la fase es lineal
a = ones(length(f)); % Amplitud constante en toda la banda
Hil = remez(orden, f, a, 'hilbert');

% 3.2.- Low Pass filter
orden = 100;
fcut = 150;
h = fir1(orden, 2*fcut/fs);
tau = round(phaseAdjust*max(grpdelay(h)));

% 4.- Detecting the envelope
%---------------------------
% 4.1.- Hilbert Signal
xam2 = filter(Hil,1,xam);

% 4.2.- Mix signal
xmix = (xam-xam2).*(xam-xam2);

% 4.3.- Envelope
envelope = 6.7.*filter(h,1,xmix);

% 4.4.- Not considering group delay
envelope = envelope(tau+1:length(envelope));
envelope(1:40) = zeros(1,1:10);
xam = xam(1:length(envelope));
t = t(tau+1:length(t));

% 5.- Watching the results
%-------------------------
figure(1)
freqz(Hil,1,N,fs);
title('Respuesta en frecuencia del filtro de Hilbert');

figure(2)
subplot(2,1,1)
plot(t,xam);
hold on;
plot(t,envelope,'r');
ylabel('Amplitud');
ylabel('Time (sg)');
title('AM and his envelope');

subplot(2,1,2)
f = (-fs/2:fs/(length(envelope)-1):fs/2)/1000;
XAM = 10*log10(abs(fftshift(fft(xam))));
ENVELOPE = 10*log10(abs(fftshift(fft(envelope))));
plot(f,XAM);
hold on;
plot(f,ENVELOPE,'r');
ylabel('Amplitud');
ylabel('f (kHz)');
zoom on
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
