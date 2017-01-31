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

  private

    def norm
      Rfvg::NORMALIZED_SAMPLE_RATE / Rfvg::SAMPLE_RATE
    end

  end

end
