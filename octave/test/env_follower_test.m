%
% Env Follower test driver by Tamara Smyth
%
% found at: http://musicweb.ucsd.edu/~trsmyth/code/envfollower.m
%
% heavily modified by Nicola Bernardini
%
sinusoid = 1;

if sinusoid
  fs = 1024;
  sinc = 1/fs;
  nT = [0:sinc:1-sinc]';
  f = 20;
  % phi = pi/5;
  phi = 0;
  % x = cos(2*pi*f*nT+phi) .* hanning(length(nT));
  x = cos(2*pi*f*nT+phi);
else
  [x, fs] = wavread('audio/ergonomics.wav');
end

%
% envelope follower made with a second-order low-pass filter
%
filter_env = filter_envfoll(x);

%
% envelope follower made with an hilbert matrix transform (unfiltered)
%
hilbert_env = hm_envfoll(x);

%
% envelope follower made with a filterd hilbert matrix transform
%
fhilbert_env = fhm_envfoll(x);

%
% envelope follower made with a direct hilbert transform
%
thilbert_env = ht_envfoll(x, f, fs);

N = length(x);
taxis = [0:N-1]/fs;

figure(1);
plot(taxis, x, taxis, filter_env, taxis, hilbert_env, taxis, fhilbert_env, taxis, thilbert_env);
legend('original', 'filter', 'hilbert matrix', 'filtered hilbert matrix', 'hilbert transform', 'location', 'southeast');

figure(2)
subplot(3,2,1)
plot(taxis, x)

subplot(3,2,2)
plot(taxis, filter_env);

subplot(3,2,3)
plot(taxis, hilbert_env);

subplot(3,2,4)
plot(taxis, fhilbert_env);

subplot(3,2,5)
plot(taxis, thilbert_env);
