%
% Env Follower test driver by Tamara Smyth
%
% found at: http://musicweb.ucsd.edu/~trsmyth/code/envfollower.m
%
% heavily modified by Nicola Bernardini
%
sinusoid = 0;

if sinusoid
  fs = 1024;
  sinc = 1/fs;
  nT = [0:sinc:1-sinc]';
  f = 20;
  phi = pi/5;
  x = cos(2*pi*f*nT+phi) .* hanning(length(nT));
else
  [x, fs] = wavread('audio/ergonomics.wav');
end

sig_norm_factor = max(abs(x)); % we'll use this as a global rescaling factor

%
% envelope follower made with a second order filter
%
nu0 = .995;

B0 = [1-nu0];
A0 = [1 -nu0];

filter_ef = filter(B0, A0, abs(x));
filter_ef_mag = abs(filter_ef);
filter_ef_mag = filter_ef_mag/max(filter_ef_mag) * sig_norm_factor;

%
% envelope follower made with an hilbert transform
%
hilbert_ef = x + i*one_column_hilb(x);
hilbert_ef_mag = abs(hilbert_ef);
hilbert_ef_mag = hilbert_ef_mag/max(hilbert_ef_mag) * sig_norm_factor;

nu1 = 0.995;
B1 = [1-nu1];
A1 = [1 -nu1];
filter_hilbert_ef = filter(B1, A1, abs(hilbert_ef));
filter_hilbert_ef_mag = abs(filter_hilbert_ef);
filter_hilbert_ef_mag = filter_hilbert_ef_mag/max(filter_hilbert_ef_mag) * sig_norm_factor;

N = length(x);
taxis = [0:N-1]/fs;

figure(1);
plot(taxis, x, taxis, filter_ef_mag, taxis, hilbert_ef_mag, taxis, filter_hilbert_ef_mag);
legend('original', 'env follower', 'analytic/hilbert', 'filtered analytic/hilbert', 'location', 'southeast');

figure(2)
subplot(4,1,1)
plot(taxis, x)

subplot(4,1,2)
plot(taxis, filter_ef_mag);

subplot(4,1,3)
plot(taxis, hilbert_ef_mag);

subplot(4,1,4)
plot(taxis, filter_hilbert_ef_mag);
