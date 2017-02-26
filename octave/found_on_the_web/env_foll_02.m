%
% Env Follower di Tamara Smyth
%
% found at: http://musicweb.ucsd.edu/~trsmyth/code/envfollower.m
%
% heavily modified by Nicola Bernardini
%
sinusoid = 1;

if sinusoid
% fs = 1024;
  fs = 256;
  sinc = 1/fs;
  nT = [0:sinc:1-sinc]';
  f = 60;
  phi = pi/5;
  x = cos(2*pi*f*nT+phi) .* hanning(length(nT));
else
  [x, fs] = wavread('Trumpet_novib_ff_C4.wav');
end

nu = .66;

B = [1-nu];
A = [1 -nu];

y = filter(B, A, abs(x));

z = x + i*myhilb(size(x,1), 1);

N = length(x);
taxis = [0:N-1]/fs;
figure(1);
plot(taxis, x/max(abs(x)), taxis, y/max(y), taxis, abs(z));
legend('original', 'env follower', 'analytic/hilbert', 'location', 'southeast');
