module Rfvg

  class FilterBank

    attr_reader :filters

    def initialize
      create_bank
    end

    def to_octave
      res = ""
      self.filters.each { |f| res += f.to_octave }
      res += octave_tail
      res
    end

  private

    def octave_tail
      res = 'semilogx('
      self.filters.each { |f| res += ("w%02d(2:size(w%02d,1))./pi*%d, 20*log10(abs(h%02d(2:size(h%02d,1)))), \";;\"," % [f.index, f.index, Rfvg::SAMPLE_RATE, f.index, f.index]) }
      res.sub!(/,$/,'')
      res += ");\n"
      res += ("axis([5 %d -110 3]);" % [Rfvg::SAMPLE_RATE/2.0])
      res += "xlabel(\"Frequency\");\n"
      res += "ylabel(\"abs(H[w])[dB]\");\n"
      res
    end

    def create_bank
      cur_f = Rfvg::FREQUENCY_START
      @filters = []
      1.upto(Rfvg::NUMBER_OF_CHANNELS) do
        |n|
        @filters << Rfvg::FilterCell.new(n, cur_f)
        cur_f = next_frequency(cur_f)
      end
    end

    def next_frequency(prev)
      prev*(2.0**(Rfvg::INTERVAL))
    end

  end

end

