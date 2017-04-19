declare name "Filter Bank Tester";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import ("switch_channel.dsp");

process(x) = switch_channel(x, checkbox("mute"));

