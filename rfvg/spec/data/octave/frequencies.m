n_filters = 48;
exponents = [0:n_filters-1];
start_freq = 65.4;
frequencies = start_freq * 2.**(exponents/6.0);
sample_rate = 48000.0;
normalized_frequencies = frequencies*(1.0/sample_rate);

fh = fopen("../frequencies_calculated_by_octave.yml", "w");
fprintf(fh, "frequencies:\n");
for n=1:size(frequencies, 2)
  fprintf(fh, "  - [%016.10f, %13.10f]\n", frequencies(n), normalized_frequencies(n));
end
fclose(fh)
