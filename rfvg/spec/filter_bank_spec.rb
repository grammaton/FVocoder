require 'spec_helper'
require 'yaml'

RSpec.describe 'Rfvg::FilterBank' do

  before 'test' do
    @frequencies = load_frequencies
  end

  it 'can be created' do
    expect((fb = Rfvg::FilterBank.new)).to be_an_instance_of Rfvg::FilterBank
  end

  it 'has 48 filters' do
    expect((fb = Rfvg::FilterBank.new)).to be_an_instance_of Rfvg::FilterBank
    expect(fb.filters.size).to eq 48
  end

  it 'matches its final frequency (including the normalized one)' do
    expect((fb = Rfvg::FilterBank.new)).to be_an_instance_of Rfvg::FilterBank
    expect(fb.filters[-1].center_frequency).to be_within(RSPEC_FLOAT_EPS).of @frequencies[-1][0]
    expect(fb.filters[-1].center_frequency.to_n).to be_within(RSPEC_FLOAT_EPS).of @frequencies[-1][1]
  end

  it 'matches all frequencies (including normalized ones)' do
    expect((fb = Rfvg::FilterBank.new)).to be_an_instance_of Rfvg::FilterBank
    0.upto(fb.filters.size-1) do
      |n|
      expect(fb.filters[n].center_frequency).to be_within(RSPEC_FLOAT_EPS).of @frequencies[n][0]
      expect(fb.filters[n].center_frequency.to_n).to be_within(RSPEC_FLOAT_EPS).of @frequencies[n][1]
    end
  end

end

FREQUENCY_FILENAME = File.expand_path(File.join('..', 'data', 'frequencies_calculated_by_octave.yml'), __FILE__)

def load_frequencies
  f = YAML.load(File.open(FREQUENCY_FILENAME, 'r'))
  f['frequencies']
end
