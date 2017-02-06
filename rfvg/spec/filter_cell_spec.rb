require 'spec_helper'

RSpec.describe Rfvg::FilterCell do

  it 'can be created' do
    expect((fc = Rfvg::FilterCell.new(1, 65.4))).to be_an_instance_of Rfvg::FilterCell
  end

  it 'can spit out some correct octave code' do
    the_correct_result = "%\n%\tfilter n.23: (left: 528.7584 center: 560.2000 right: 593.5112)\n%\n[h23, w23] = ef_analyser([0.0110, 0.0124], [0.0000, 0.5000], -100.0000, 0.1000]);\n%\n"
    expect((fc = Rfvg::FilterCell.new(23, 560.2))).to be_an_instance_of Rfvg::FilterCell
    expect(fc.to_octave).to eq the_correct_result
  end

end
