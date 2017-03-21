declare name "Filter Channel";
declare author "Nicola Bernardini";
declare copyright "Nicola Bernardini";
declare acknowledgements "Julius Smith, Romain Michon";
declare version "0.0";
declare license "GNU GPL";

ba = library ("basics.lib");
import("filter.lib");

// We suppose that the filters of the Freiburg Vocoder are 12-th
// order elliptical filters whose bandpass width is a whole-tone
// around the center frequency

filter_channel(source, mute_button, center_freq) = source : bandpass6e(le, he) <: mute_button,* : ba.toggle * _
with {
  le = center_freq * pow(2, -1/12);
	he = center_freq * pow(2, 1/12);
};
