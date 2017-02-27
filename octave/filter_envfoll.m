% -*- texinfo -*-
% @deftypefn {filter_envfoll.m} {@var{env} =} filter_envfoll (@var{sig}, @var{nu})
% @cindex 1 filter_envelope_follower
% 
% returns the envelope @var{env} of a signal, extracted by applying a second-order
% low-pass filter.
%
% arguments are:
%
% @var{sig}: the actual signal (mandatory)
%
% @var{nu}:  the damping factor of the filter (optional - default: 0.995)
%
% @seealso{filter}
% @end deftypefn
%
function env = filter_envfoll(sig, nu)
  if (nargin < 2)
    nu = 0.995;
  end
  snf = max(abs(sig)); % we'll use this as a global rescaling factor
  B = [1-nu];
  A = [1 -nu];
  env = filter(B, A, abs(sig));
  env = abs(env);
  env = env/max(env) * snf;
end
