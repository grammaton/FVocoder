require 'spec_helper'

RSpec.describe Rfvg::FilterCell do

  it 'can be created' do
    expect((fc = Rfvg::FilterCell.new(1, 65.4))).to be_an_instance_of Rfvg::FilterCell
  end

  it 'can spit out some correct octave code' do
    the_correct_result = "%\n%\tfilter n.23: (left: 528.7584 center: 560.2000 right: 593.5112)\n%\n[h(:,23), w23, b23, a23] = ef_analyser([0.0110157998, 0.0123648172], [0.0000020833, 0.4999791667], +100.0, 0.10000000, 16381);\n%\n"
    expect((fc = Rfvg::FilterCell.new(23, 560.2))).to be_an_instance_of Rfvg::FilterCell
    expect(fc.to_octave { |f| f.analysis(f) }).to eq the_correct_result
  end

end
