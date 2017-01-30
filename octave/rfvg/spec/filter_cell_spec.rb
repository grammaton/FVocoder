require 'spec_helper'

RSpec.describe Rfvg::FilterCell do

  it 'can be created' do
    expect((fc = Rfvg::FilterCell.new(1, 65.4)).class).to eq Rfvg::FilterCell
  end

end
