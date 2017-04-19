TOP=..
DIRS=$(TOP)/filter_bank $(TOP)/exe $(TOP)/switch $(TOP)/tests
LN=ln -sf
TOUCH=touch
TSTAMP=.link-done

all: $(TSTAMP)

$(TSTAMP):
	for d in $(DIRS);\
	do\
		$(LN) $$d/*.dsp .;\
	done
	$(TOUCH) $@

clean:
	$(RM) *.dsp $(TSTAMP)

.PHONY: $(TSTAMP) clean
