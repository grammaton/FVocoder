declare name "Filter Bank Executable";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import ("filter_bank.dsp");
import ("switch_bank.dsp");

GUI = hgroup("filter bank", vgroup("[1]", _) : vgroup("[2]", _) : vgroup("[3]", _) : vgroup("[4]", _));

n_ch = 48;
process(x) = x <: GUI(filter_bank(1,n_ch) : switch_bank(_,1,n_ch) :> (vslider("/h:filter_bank/v:[3]/ [osc:/fb/1/gain -96 +36]", 0, -96, +36, 0.1) : ba.db2linear : si.smoo) * _);
