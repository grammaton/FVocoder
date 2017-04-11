declare name "Filter Bank";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import("filter_channel.dsp");

//-------------`filter_bank`-------------
// Implements a 48-12-th order elliptical filter bank which allows
// individual filters to be switched on and off
//
// #### Usage
//
// ```faust
// filter_bank(source, fbn) : _ 
// ```
//
// where:
//
// * `source`: signal source
// * `fbn`:    filter bank number
//
// This creates a 48-filter elliptic filter bank which simulates
// the analog elliptic filters which were used at the Freiburg Experimentalstudio

filter_bank(x, fbn) = x <: par(n, n_filters, one_filter_channel(n, _)) :> _
  with {
    n = 1;
    n_filters = 48;
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
    one_filter_channel(n, sig) = filter_channel(sig, mute_button, cf(n))
    with
    {
      f = cf(n);
      i = n >= (n_filters/2);
      b = fbn;
      mute_button = checkbox("/h:GUI/v:filter_bank_group_%i/mute %02n (%0f) [osc:/filter_bank/%b/%n 0 10]");
    };
};
