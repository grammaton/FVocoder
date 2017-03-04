module Rfvg
  NUMBER_OF_CHANNELS = 48
  SAMPLE_RATE = 48000
  NORMALIZED_SAMPLE_RATE = 1.0     # `octave`/`matlab` filter algorithms use a normalized sample rate
  FREQUENCY_START = 65.4           # Hertz
  INTERVAL = 1.0/6.0               # Filter frequencies are calculated as $$F_n = F_{n-1} 2^{Rfvg::INTERVAL}$$
  MAX_PASSBAND_RIPPLE =  0.1       # dB
  STOPBAND_ATTENUATION = 100.0     # dB
end
