declare name "Filter Bank Tester";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import ("filter_bank.dsp");
import ("switch_channel.dsp");

process(x) = ((vslider("gain", -96, -96, +12, 0.1) : ba.db2linear : si.smoo) * x) : switchable_filter_bank(_, 1, 12) :> _;
