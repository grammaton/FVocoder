declare name "Filter Channel Tester";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

import ("filter_channel.dsp");
f(0) = vslider("freq",1000,65.4,1400,1);
f(n) = f(n-1) * 1.05;
process(x) = x <: par(n,1,filter_channel(_, f(n))) :> _;
