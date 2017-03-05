module Rfvg
  module View
    module Octave
      module FilterCell

        def to_octave
          idx = self.index
          res = header
          res += "[h%02d, w%02d, b%02d, a%02d] = ef_analyser([%-.10f, %-.10f], [%-.10f, %-.10f], %-+.1f, %-.8f);\n" % [idx, idx, idx, idx,
                                                                                                      passband_frequencies[0].to_n, passband_frequencies[1].to_n,
                                                                                                      stopband_frequencies[0].to_n, stopband_frequencies[1].to_n,
                                                                                                      Rfvg::STOPBAND_ATTENUATION, Rfvg::MAX_PASSBAND_RIPPLE]
          res += trailer
          res
        end
    
      private
    
        def header
          "%%\n%%\tfilter n.%02d: (left: %8.4f center: %8.4f right: %8.4f)\n%%\n" % [self.index,
                                                                                     passband_frequencies[0], self.center_frequency, passband_frequencies[1]]
        end
    
        def trailer(fh = STDOUT)
          "%\n"
        end
    
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
  end
end
