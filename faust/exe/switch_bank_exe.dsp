declare name "Filter Bank Executable";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

//
// This is only a test executable to see if the switch bank does it job.
// It should not be used in normal conditions.
//

import ("switch_bank.dsp");

GUI(x) = hgroup("GUI", vgroup("switch_bank_group", x));

process = GUI(switch_bank(_, 1, 8));
