declare name "Switch Bank";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import("switch_channel.dsp");

//-------------`switch_bank`-------------
// Implements a 48-channel switch bank
//
// #### Usage
//
// ```faust
// switch_bank(source, fbn) : _ 
// ```
//
// where:
//
// * `source`: signal source
// * `fbn`:    filter bank number
//
// This diagram has 1 input and n_filters (48) outputs
//
// This creates a 48-filter elliptic filter bank which simulates
// the analog elliptic filters which were used at the Freiburg Experimentalstudio

switch_bank(x, fbn) = par(n, n_filters, one_switch_channel(n, _))
  with {
    n = 1;
    n_filters = 48;
    cf(0) = 65.4;
    cf(n) = cf(n-1) * pow(2, 1/6);
    one_switch_channel(n, sig) = switch_channel(sig, mute_button, cf(n))
    with
    {
      f = cf(n);
      i = n >= (n_filters/2);
			j = n + 1; // so that filters are numbered 1-48 and not 0-47
      b = fbn;
      mute_button = checkbox("/h:GUI/v:switch_bank_group_%i/mute %02j (%0f) [osc:/switch_bank/%b/%j 0 10]");
    };
};
