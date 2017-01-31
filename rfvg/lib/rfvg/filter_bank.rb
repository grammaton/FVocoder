module Rfvg

  class FilterBank

    attr_reader :cells

    def initialize
      create_bank
    end

  private

    def create_bank
      cur_f = Rfvg::FREQUENCY_START
      @cells = []
      1.upto(Rfvg::NUMBER_OF_CHANNELS) do
        |n|
        @cells << Rfvg::FilterCell.new(n, cur_f)
        cur_f = next_frequency(cur_f)
      end
    end

    def next_frequency(prev)
      prev*(2.0**(Rfvg::INTERVAL))
    end

  end

end

