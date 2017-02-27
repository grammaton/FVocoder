% -*- texinfo -*-
% @deftypefn {ht_envfoll.m} {@var{env} =} ht_envfoll (@var{sig}, @var{freq}, @var{sf})
% @cindex 1 hilbert_transform_envelope_follower
% 
% returns the envelope @var{env} of a real signal, extracted by converting it
% to an analytical signal applying a hilbert transform with an imaginary
% sinewave of the same length at frequency @var{freq} and returning its modulus.
%
% arguments are:
%
% @var{sig}: the actual signal
%
% @var{freq}: the reference frequency of the complex sinewave
%
% @var{sf}: the sampling frequency of the system
%
% @end deftypefn
%
function env = ht_envfoll(sig, freq, sf)
  sinc = 1/sf;
  l = length(sig);
  dur = l/sf;
  t = [0:sinc:dur-sinc];
  ansig = sin(2*pi*freq*t)';
  env = sig .+ i*ansig;
  snf = max(abs(sig)); % we'll use this as a global rescaling factor
  env = abs(env)/2;    % we need to correct for the Euler doubling 
  env = env/max(env) * snf;
end
