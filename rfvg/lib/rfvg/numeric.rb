class Numeric

  #
  # +to_n+: normalize frequency value to normalized sampling rate
  # casting to a float if necessary
  #
  def to_n
    self.to_f / Rfvg::SAMPLE_RATE
  end

end
