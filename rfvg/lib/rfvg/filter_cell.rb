module Rfvg

  class FilterCell

    attr_reader :index, :center_frequency

    def initialize(idx, cf)
      @index = idx
      @center_frequency = cf
    end

    include View::Octave::FilterCell

  private

    def passband_frequencies
      lo = self.center_frequency * (2.0**(-1.0/12.0)) # Hz
      hi = self.center_frequency * (2.0**(+1.0/12.0)) # Hz
      [lo, hi]
    end

    #
    # +stopband_frequencies+: as per +ellip+ documentation, if the stopband
    # frequencies surround the passband ones this behaves like a passband
    # filter (which is what we actually want in this case)
    #
    def stopband_frequencies
      lo = 0.1 # Hz
      hi = Rfvg::SAMPLE_RATE.to_f / 2.0 - 1.0
      [lo, hi]
    end

  end

end
