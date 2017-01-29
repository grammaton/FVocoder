require 'spec_helper'

RSpec.describe 'Rfvg::FilterBank' do

  it 'can be created' do
    expect((fb = Rfvg::FilterBank.new).class).to eq Rfvg::FilterBank
  end

end
