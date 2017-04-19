declare name "Filter Bank Executable";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

//
// This is only a test executable to see if the switch bank does it job.
// It should not be used in normal conditions.
//

import ("switch_channel.dsp");

GUI(x) = hgroup("GUI",
             vgroup("filter_bank_group_0", x),
             vgroup("filter_bank_group_1", x),
             vgroup("gain", x),
             vgroup("output VU", x));

process = GUI(_ <: par(n, n_channels, one_switch_channel(n, _) :> (vslider("/h:GUI/v:gain/gain", 0, -96, +36, 0.1) : ba.db2linear : si.smoo) * _))
	with
	{
	  n = 1;
	  n_channels = 2;
		one_switch_channel(n, sig) = switch_channel(sig, mb)
		with
		{
      i = n >= (n_channels/2);
			j = n + 1; // so that filters are numbered 1-48 and not 0-47
      mb = checkbox("/h:GUI/v:filter_bank_group_%i/mute %02j [osc:/filter_bank/%j 0 10]");
	  };
	};
