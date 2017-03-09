module Rfvg
  module View
    module Octave
      module FilterCell

        def to_octave
          res = header
          res += yield(self)
          res += trailer
          res
        end

        def analysis(f)
          n = f.index
          "[h(:,%d), w%02d, b%02d, a%02d] = ef_analyser([%-.10f, %-.10f], [%-.10f, %-.10f], %-+.1f, %-.8f, %d);\n" % [n, n, n, n,
                                                                                                      passband_frequencies[0].to_n, passband_frequencies[1].to_n,
                                                                                                      stopband_frequencies[0].to_n, stopband_frequencies[1].to_n,
                                                                                                      Rfvg::STOPBAND_ATTENUATION, Rfvg::MAX_PASSBAND_RIPPLE,
                                                                                                      Rfvg::ANALYSIS_WINDOW_SIZE]
        end

        def filtering(f)
          n = f.index
          res = analysis(f)
          res += ("sigs(:,%d) = filter(b%02d, a%02d, input_sig);\n" % [n, n, n])
          res
        end
    
      private
    
        def header
          "%%\n%%\tfilter n.%02d: (left: %8.4f center: %8.4f right: %8.4f)\n%%\n" % [self.index,
                                                                                     passband_frequencies[0], self.center_frequency, passband_frequencies[1]]
        end
    
        def trailer
          "%\n"
        end

      end
    end
  end
end
