declare name "Filter Bank Executable";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

ma = library ("math.lib");
import ("filter_bank.dsp");

GUI(x) = hgroup("GUI",
						 vgroup("filter_bank_group_0", x),
             vgroup("filter_bank_group_1", x),
						 vgroup("gain", x),
						 vgroup("output VU", x));

process = GUI(filter_bank(_,1) : vslider("/h:GUI/v:gain/gain", 1, 0, 10, 1) * _)
          // REMOVE ME: trying to be less sluggish
	        with {
						BS = 262144;
	        };
