require 'spec_helper'

RSpec.describe 'Rfvg::FilterBank' do

  it 'can be created' do
    expect((fb = Rfvg::FilterBank.new).class).to eq Rfvg::FilterBank
  end

  it 'has 48 filters' do
    expect((fb = Rfvg::FilterBank.new).class).to eq Rfvg::FilterBank
    expect(fb.cells.size).to eq 48
  end

end
