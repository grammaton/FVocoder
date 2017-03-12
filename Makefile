OCTAVEDIR=./octave
TARGETS=octave
RAKE=rake
RFVGDIR=./rfvg

all: $(TARGETS)

octave:
	$(MAKE) -C $(OCTAVEDIR) -$(MAKEFLAGS)

clean:
	$(MAKE) -C $(OCTAVEDIR) -$(MAKEFLAGS) $@

.PHONY: octave clean
