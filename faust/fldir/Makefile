TOP=..
DIRS=$(TOP)/filter_bank $(TOP)/exe
LN=ln -f
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
