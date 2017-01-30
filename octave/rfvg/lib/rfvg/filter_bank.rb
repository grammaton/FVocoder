module Rfvg

  class FilterBank

    attr_reader :cells

    def initialize
      create_bank
    end

  private

    FREQUENCY_START = 65.4
    INTERVAL = 1.0/6.0
    NUM_FILTERS = 48

    def create_bank
      cur_f = FREQUENCY_START
      @cells = []
      1.upto(NUM_FILTERS) do
        |n|
        @cells << Rfvg::FilterCell.new(n, cur_f)
        cur_f = next_frequency(cur_f)
      end
    end

    def next_frequency(prev)
      prev*(2.0**(INTERVAL))
    end

  end

end

