require 'spec_helper'

RSpec.describe 'Rfvg constants' do

  it "has the number of channels (#{Rfvg::NUMBER_OF_CHANNELS})" do
    expect(Rfvg::NUMBER_OF_CHANNELS).not_to be nil
  end

  it "has a sample rate (#{Rfvg::SAMPLE_RATE} Hz)" do
    expect(Rfvg::SAMPLE_RATE).not_to be nil
  end

  it "has a normalized sample rate (#{Rfvg::NORMALIZED_SAMPLE_RATE})" do
    expect(Rfvg::NORMALIZED_SAMPLE_RATE).not_to be nil
  end

  it "has a starting frequency (#{Rfvg::FREQUENCY_START} Hz)" do
    expect(Rfvg::FREQUENCY_START).not_to be nil
  end

  it "has a calculation interval (#{Rfvg::INTERVAL})" do
    expect(Rfvg::INTERVAL).not_to be nil
  end

  it "has a maximum passband ripple (#{Rfvg::MAX_PASSBAND_RIPPLE} dB)" do
    expect(Rfvg::MAX_PASSBAND_RIPPLE).not_to be nil
  end

  it "has a stopband attenuation value (#{Rfvg::STOPBAND_ATTENUATION} dB)" do
    expect(Rfvg::STOPBAND_ATTENUATION).not_to be nil
  end

end
