require 'spec_helper'

RSpec.describe Rfvg::FilterCell do

  it 'can be created' do
    expect((fc = Rfvg::FilterCell.new(1, 65.4))).to be_an_instance_of Rfvg::FilterCell
  end

end
