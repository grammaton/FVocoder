declare name "Filter Channel";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

ba = library ("basics.lib");
fi = library ("filter.lib");

//-------------`filter_channel`-------------
// Implements a 12-th order elliptical filter along with a mute  switch,
// similar to what the Freiburg filter banks should have looked like.
//
// #### Usage
//
// ```faust
// filter_channel(source, mute_switch, cf) : _ 
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

filter_channel(source, mute_button, center_freq) = source : fi.bandpass6e(le, he) <: mute_button,* : ba.toggle * _
with {
  // three quarter tones = 3/24 = 1/8 
  le = center_freq * pow(2, -1/8);
	he = center_freq * pow(2, 1/8);
};
