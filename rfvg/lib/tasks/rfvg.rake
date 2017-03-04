require File.expand_path(File.join(['..']*2, 'rfvg'), __FILE__)
#
# rfvg-specific tasks
#
namespace :rfvg do

  namespace :filterbank do

    desc 'generates the octave code for the 48-filter bank'
    task :octave do
      puts Rfvg::FilterBank.new.to_octave
    end

  end

end
