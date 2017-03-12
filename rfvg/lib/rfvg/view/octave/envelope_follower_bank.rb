module Rfvg
  module View
    module Octave
      module EnvelopeFollowerBank

        def to_function
          self.to_octave
        end

        def to_octave(header = :function_header, trailer = :function_trailer)
          res = send(header)
          1.upto(Rfvg::NUMBER_OF_CHANNELS).each { |n| res += envelope_cell(n) }
          res += send(trailer)
          res
        end

        def no_header
          ''
        end

        def function_header
          res = <<-EOfh.gsub(/^\s+/, '')
            % -*- texinfo -*-
            % @deftypefn {envelope_follower_bank.m} { @var{efs} =} envelope_follower_bank (@var{sigs})
            % @cindex 1 envelope_follower_bank
            %
            % returns the envelope of each signal in the signal vector @var{sigs}.
            %
            % arguments are:
            %
            % @var{sigs}: a vector of signals (rows: time domain, columns: the actual signal channels)
            %
            % @seealso{filter_bank}
            % @end deftypefn
            % 
            function efs = envelope_follower_bank(sigs)
              efs = zeros(size(sigs));
          EOfh
          res
        end

        def function_trailer
          'end'
        end
    
        def test_trailer
          res = common_trailer + 'semilogx('
          self.filters.each { |f| res += ("w(2:size(w))./pi*%d, 20*log10(abs(h(:,%d)(2:size(h(:,%d),1)))), \";;\"," % [Rfvg::SAMPLE_RATE, f.index, f.index]) }
          res.sub!(/,$/,'')
          res += ");\n"
          res += ("axis([5 %d -110 3]);" % [Rfvg::SAMPLE_RATE/2.0])
          res += "xlabel(\"Frequency\");\n"
          res += "ylabel(\"abs(H[w])[dB]\");\n"
          res
        end

      private

        def envelope_cell(n)
          "%%\nefs(:, %d) = filter_envfoll(sigs(:, %d));\n%%\n" % [ n, n ]
        end

      end
    end
  end
end
