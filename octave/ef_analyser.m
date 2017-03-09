% -*- texinfo -*-
% @deftypefn {ef_analyser.m} {[ @var{h}, @var{w}, @var{b}, @var{a} ] =} ef_analyser (@var{pbf}, @var{sbf}, @var{sba}, @var{pr} [, @var{wsize} ])
% @cindex 1 elliptic_filter_analyser
% 
% returns the complex transfer function of the filter along the frequency axis
% (@var{h}) and the array of frequencies (@var{w})
% and the two vectors of filter coefficients @var{b} (numerator) and @var{a} (denominator)
% (practically, a wrapper around the `ellip` and `ellipord` functions)
%
% arguments are:
%
% @var{pbf}: array of passband frequencies (two values: high, low) with normalized sampling frequency (1.0)
%
% @var{sbf}: array of stopband frequencies (two values: high, low); if the stopband frequencies surround the passband ones then the filter is a passband
%
% @var{sba}: stopband attenuation (scalar value in dB)
%
% @var{pr}:  passband ripple tolerance (scalar value in dB)
%
% @var{wsize}: analysis window size (optional, default: 512)
%
% @seealso{ellip, ellipord, freqz}
% @end deftypefn
%
function [h, w, b, a] = ef_analyser(pbf, sbf, sba, pr, wsize)
  if(nargin < 5)
    wsize = 512;
  end
  [filter_order, Ws] = ellipord (pbf, sbf, pr, sba); % we want to read the coefficients
  [b, a] = ellip (filter_order, pr, sba, pbf);
  [h, w] = freqz (b, a, wsize);
end
