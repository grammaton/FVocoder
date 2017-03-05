module Rfvg
  module View
    module Octave
      module FilterBank

        def to_octave(header = nil, trailer = :freqz_plot)
          res = header ? header : ""
          self.filters.each { |f| res += f.to_octave { |f| yield(f) } }
          res += send(trailer) if trailer
          res
        end
    
      private
    
        def freqz_plot
          res = 'semilogx('
          self.filters.each { |f| res += ("w%02d(2:size(w%02d,1))./pi*%d, 20*log10(abs(h%02d(2:size(h%02d,1)))), \";;\"," % [f.index, f.index, Rfvg::SAMPLE_RATE, f.index, f.index]) }
          res.sub!(/,$/,'')
          res += ");\n"
          res += ("axis([5 %d -110 3]);" % [Rfvg::SAMPLE_RATE/2.0])
          res += "xlabel(\"Frequency\");\n"
          res += "ylabel(\"abs(H[w])[dB]\");\n"
          res
        end

      end
    end
  end
end
