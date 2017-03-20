declare name "Filter Channel Tester";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import ("filter_channel.dsp");

process = filter_channel(_, button("mute"), 1000) : _;
