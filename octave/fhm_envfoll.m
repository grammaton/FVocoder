% -*- texinfo -*-
% @deftypefn {fhm_envfoll.m} {@var{env} =} fhm_envfoll (@var{sig})
% @cindex 1 filtered_hilbert_matrix_envelope_follower
% 
% returns the envelope @var{env} of a real signal, extracted by converting it
% to an analytical signal applying a one-column hilbert matrix of the same length
% and then filtering its modulus with a second-order low-pass filter.
%
% arguments are:
%
% @var{sig}: the actual signal
%
% @var{nu}:  the damping factor of the filter (optional - default: 0.995)
%
% @seealso{one_column_hilb}
% @end deftypefn
%
function env = fhm_envfoll(sig, nu)
  if (nargin < 2)
    nu = 0.995;
  end
  snf = max(abs(sig)); % we'll use this as a global rescaling factor
  env = sig + i*one_column_hilb(sig);
  env = abs(env);
  B = [1-nu];
  A = [1 -nu];
  env = filter(B, A, env);
  env = abs(env);
  env = env/max(env) * snf;
end
