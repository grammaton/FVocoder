module Rfvg

  class FilterCell

    attr_reader :index, :center_frequency

    def initialize(idx, cf)
      @index = idx
      @center_frequency = cf
    end

    include View::Octave::FilterCell

  end

end
