declare name "Switch Bank";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import("switch_channel.dsp");

//-------------`switch_bank`-------------
// Implements a n-channel switch bank
//
// #### Usage
//
// ```faust
// switch_bank(source, fbn, n_channels)
// ```
//
// where:
//
// * `source`: signal source
// * `fbn`:    switch bank number
// * `n_chnannels`: number of channels
//
// This diagram has n_channel inputs and n_channel outputs
//
// This creates an n_chnannels switch bank

switch_bank(x, fbn, n_channels) = par(n, n_channels, one_switch_channel(_, n))
  with {
    one_switch_channel(sig, n) = switch_channel(sig, mute_button)
    with
    {
      i = n >= (n_channels/2);
			j = n + 1; // so that switches are numbered from 0
      b = fbn;
      mute_button = checkbox("/h:filter_bank/v:[%i]/mute %02j [osc:/switch_bank/%b/%j 0 10]");
    };
};
