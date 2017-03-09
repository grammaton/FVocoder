require File.expand_path(File.join(['..']*2, 'rfvg'), __FILE__)
#
# rfvg-specific tasks
#
namespace :rfvg do

  namespace :filterbank do

    namespace :octave do

      desc 'generates the analysis code for the 48-filter bank (octave)'
      task :analysis do
        puts Rfvg::FilterBank.new.to_octave(:no_header, :test_trailer) { |f| f.analysis(f) }
      end

      desc 'generates the filtering code with the 48-filter bank (octave)'
      task :filtering do
        puts Rfvg::FilterBank.new.to_octave { |f| f.filtering(f) }
      end

    end

  end

end
