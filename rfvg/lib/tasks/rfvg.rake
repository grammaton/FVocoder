require File.expand_path(File.join(['..']*2, 'rfvg'), __FILE__)
#
# rfvg-specific tasks
#
namespace :rfvg do

  namespace :filterbank do

    namespace :octave do

      desc 'generates the test code for the 48-filter bank (octave)'
      task :test do
        puts Rfvg::FilterBank.new.to_octave(:no_header, :test_trailer) { |f| f.analysis(f) }
      end

      desc 'generates the function code with the 48-filter bank (octave)'
      task :function do
        puts Rfvg::FilterBank.new.to_octave { |f| f.filtering(f) }
      end

    end

  end

  namespace :envfoll do

    namespace :octave do

      desc 'generates the function code for the 48-channel envelope follower (octave)'
      task :function do
        puts Rfvg::EnvelopeFollowerBank.new.to_function
      end

    end

  end

end
