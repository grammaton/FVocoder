% -*- texinfo -*-
% @deftypefn {hm_envfoll.m} {@var{env} =} hm_envfoll (@var{sig})
% @cindex 1 hilbert_matrix_envelope_follower
% 
% returns the envelope @var{env} of a real signal, extracted by converting it
% to an analytical signal applying a one-column hilbert matrix of the same length
% and then returning its modulus.
%
% arguments are:
%
% @var{sig}: the actual signal
%
% @seealso{one_column_hilb}
% @end deftypefn
%
function env = hm_envfoll(sig)
  snf = max(abs(sig)); % we'll use this as a global rescaling factor
  env = sig + i*one_column_hilb(sig);
  env = abs(env);
  env = env/max(env) * snf;
end
