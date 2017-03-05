module Rfvg
  module View
    PATH = File.expand_path(File.join('..', 'view'), __FILE__)
  end
end

%w{
  octave
  faust
}.each { |f| require File.join(Rfvg::View::PATH, f) }

