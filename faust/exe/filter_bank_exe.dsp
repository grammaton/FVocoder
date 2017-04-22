declare name "Filter Bank Executable";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import ("filter_bank.dsp");

GUI(x) = hgroup("GUI",
             vgroup("filter_bank_group_0", x),
             vgroup("filter_bank_group_1", x),
             vgroup("gain", x),
             vgroup("output VU", x));

process = GUI(switchable_filter_bank(_,1,48) :> (vslider("/h:GUI/v:gain/gain", 0, -96, +36, 0.1) : ba.db2linear : si.smoo) * _);
