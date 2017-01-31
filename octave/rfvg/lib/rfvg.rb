require "rfvg/version"

module Rfvg
  PATH = File.expand_path(File.join('..', 'rfvg'), __FILE__)
end

%w{
  constants
  filter_cell
  filter_bank
}.each { |f| require File.join(Rfvg::PATH, f) }
