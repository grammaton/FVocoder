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

filter_bank(fbn, n_filters) = par(n, n_filters, filter_channel(_, cf(n)))
  with {
    n = 0;
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
		// one_filter_channel(x, n) = filter_channel(x, cf(n));
};
