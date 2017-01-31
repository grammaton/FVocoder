require 'spec_helper'

RSpec.describe 'Rfvg constants' do

  it 'has the number of channels' do
    expect(Rfvg::NUMBER_OF_CHANNELS).not_to be nil
  end

  it 'has a sample rate' do
    expect(Rfvg::SAMPLE_RATE).not_to be nil
  end

  it 'has a normalized sample rate' do
    expect(Rfvg::NORMALIZED_SAMPLE_RATE).not_to be nil
  end

  it 'has a starting frequency' do
    expect(Rfvg::FREQUENCY_START).not_to be nil
  end

  it 'has a calculation interval' do
    expect(Rfvg::INTERVAL).not_to be nil
  end

end
