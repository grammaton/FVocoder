module Rfvg
  module View
    module Faust
      PATH = File.expand_path(File.join('..', 'faust'), __FILE__)
    end
  end
end

%w{
}.each { |f| require File.join(Rfvg::View::Faust::PATH, f) }
