declare name "Switch Channel";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import ("stdfaust.lib");

//-------------`switch_channel`-------------
// Implements a simple switch which may mute a specific signal path.
// This is used in the `switch_bank` set of switches used in the
// Freiburg `filter_bank` and `vocoder`
//
// #### Usage
//
// ```faust
// switch_channel(source, mute_switch) : _ 
// ```
//
// where:
//
// * `source`: signal source
// * `mute_switch`: on/off mute switch
//

switch_channel(source, mute_button) = source <: mute_button * _;
