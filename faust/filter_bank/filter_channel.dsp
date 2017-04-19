declare name "Filter Channel";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon, Yann Orlarey, Stéphane Letz";
declare version "0.0";
declare license "GNU GPL";

import ("stdfaust.lib");

//-------------`filter_channel`-------------
// Implements a 12-th order elliptical filter along with a mute  switch,
// similar to what the Freiburg filter banks should have looked like.
//
// #### Usage
//
// ```faust
// filter_channel(source, cf) : _ 
// ```
//
// where:
//
// * `source`: signal source
// * `mute_switch`: on/off mute switch
// * `cf`: center frequency
//
// We suppose that the filters of the Freiburg Vocoder are 12-th
// order elliptical filters whose bandpass width is three quarter-tones
// (a semitone plus a quarter-tone, that is 3/24 or 1/8)
// around the center frequency

filter_channel(source, center_freq) = source : fi.bandpass6e(le, he)
with {
  // three quarter tones = 3/24 = 1/8 
  le = center_freq * pow(2, -1/8);
	he = center_freq * pow(2, 1/8);
};
