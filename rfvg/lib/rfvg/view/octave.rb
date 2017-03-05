module Rfvg
  module View
    module Octave
      PATH = File.expand_path(File.join('..', 'octave'), __FILE__)
    end
  end
end

%w{
  filter_cell
}.each { |f| require File.join(Rfvg::View::Octave::PATH, f) }
