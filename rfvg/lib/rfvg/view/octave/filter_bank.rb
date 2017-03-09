module Rfvg
  module View
    module Octave
      module FilterBank

        def to_function
          self.to_octave
        end

        def to_octave(header = :function_header, trailer = :function_trailer)
          res = send(header)
          self.filters.each { |f| res += f.to_octave { |f| yield(f) } }
          res += send(trailer)
          res
        end

        def no_header
          ''
        end

        def function_header
          res = <<-EOfh.gsub(/^\s+/, '')
            % -*- texinfo -*-
            % @deftypefn {filter_bank.m} {[ @var{sigs},  @var{h}, @var{w} ] =} filter_bank (@var{input_sig})
            % @cindex 1 filter_bank
            %
            % returns the @var{input_sig} signal passed through the 48-band filter bank constructed around
            % the ef_analyser function. It also returns the vector of 48 frequency responses @var{h}
            % and the appropriate @var{w} radiant frequency axis vector for testing purposes
            %
            % arguments are:
            %
            % @var{input_sig}: the input signal (in column/row order)
            %
            % @seealso{ef_analyser, ellipord, ellip}
            % @end deftypefn
            % 
            function [sigs, h, w] = filter_bank(input_sig)
              sigs = zeros(size(input_sig, 1), 48);
              h = zeros(#{Rfvg::ANALYSIS_WINDOW_SIZE}, 48);
          EOfh
          res
        end

        def function_trailer
          "w = w01; % one or another is the same\nend"
        end
    
        def test_trailer
          res = 'semilogx('
          self.filters.each { |f| res += ("w%02d(2:size(w%02d,1))./pi*%d, 20*log10(abs(h(%02d)(2:size(h(%02d),1)))), \";;\"," % [f.index, f.index, Rfvg::SAMPLE_RATE, f.index, f.index]) }
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
