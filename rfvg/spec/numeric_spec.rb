require 'spec_helper'

RSpec.describe 'Numeric extension' do

  it 'can be created as float and has the extension' do
    expect(f = 2323.2).to be_an_instance_of Float
    expect(f.respond_to?(:to_n)).to be true
  end

  it 'can be created as integer and has the extension' do
    expect(n = 2323).to be_an_instance_of Fixnum
    expect(n.respond_to?(:to_n)).to be true
  end

  it 'actually does what is expected' do
    tests = [
      { :arg => Rfvg::SAMPLE_RATE / 2.0, :result => 0.5 },
      { :arg => Rfvg::SAMPLE_RATE / 3.0, :result => 0.333333 },
      { :arg => Rfvg::SAMPLE_RATE / 4.0, :result => 0.25 },
      { :arg => Rfvg::SAMPLE_RATE / 10.0, :result => 0.1 },
      { :arg => Rfvg::SAMPLE_RATE / 100.0, :result => 0.01 },
      { :arg => Rfvg::SAMPLE_RATE / 1000.0, :result => 0.001 },
      { :arg => Rfvg::SAMPLE_RATE / 10000.0, :result => 0.0001 },
    ]
    tests.each { |t| expect(t[:arg].to_n).to be_within(RSPEC_FLOAT_EPS).of t[:result] }
  end

end
