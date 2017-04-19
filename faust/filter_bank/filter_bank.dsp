declare name "Filter Bank";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import("filter_channel.dsp");
import("switch_channel.dsp");

//-------------`filter_bank`-------------
// Implements a n_filters-12-th order elliptical filter bank
//
// #### Usage
//
// ```faust
// filter_bank(source, fbn, n_filters) :> _; 
// ```
//
// where:
//
// * `source`: signal source
// * `fbn`:    filter bank number
// * `n_filters`: number of filters
//
// This creates a 48-filter elliptic filter bank which simulates
// the analog elliptic filters which were used at the Freiburg Experimentalstudio
// (should use 48 filters to simulate it completely

filter_bank(x, fbn, n_filters) = x <: par(n, n_filters, one_filter_channel(n, _))
  with {
    n = 0;
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
		one_filter_channel(n, x) = filter_channel(x, cf(n));
};

//-------------`switchable_filter_bank`-------------
// Implements a 48-12-th order elliptical filter bank which allows
// individual filters to be switched on and off
//
// #### Usage
//
// ```faust
// switchable_filter_bank(source, fbn) : _ 
// ```
//
// where:
//
// * `source`: signal source
// * `fbn`:    filter bank number
// * `n_filters`: number of filters
//
// This creates a 48-filter elliptic filter bank which simulates
// the analog elliptic filters which were used at the Freiburg Experimentalstudio

switchable_filter_bank(x, fbn, n_filters) = x <: par(n, n_filters, one_filter_channel(n, _))
  with {
    n = 0;
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
		one_filter_channel(n, sig) = filter_channel(sig, cf(n)) : switch_channel(_, mute_button) 
    with
    {
      f = cf(n);
      i = n >= (n_filters/2);
			j = n + 1; // so that filters are numbered 1-48 and not 0-47
      b = fbn;
      mute_button = checkbox("/h:GUI/v:filter_bank_group_%i/mute %02j (%0f) [osc:/filter_bank/%b/%j 0 1]");
    };
};
