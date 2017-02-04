module Rfvg

  class FilterCell

    attr_reader :index, :center_frequency

    def initialize(idx, cf)
      @index = idx
      @center_frequency = cf
    end

    def normalized_center_frequency
      self.center_frequency * norm
    end

    def to_octave
    end

  private

    def passband_frequency_array
      lo = self.center_frequency * (2.0**(-1.0/12.0))
      hi = self.center_frequency * (2.0**(+1.0/12.0))
      [lo, hi]
    end

    def norm
      Rfvg::NORMALIZED_SAMPLE_RATE / Rfvg::SAMPLE_RATE
    end

  end

end
