TOP=..
OCTAVEDIR=$(TOP)/octave
TESTDIR=$(OCTAVEDIR)/test
TARGETS=$(OCTAVEDIR)/filter_bank.m $(TESTDIR)/filter_bank_analyser_test.m $(OCTAVEDIR)/envelope_follower_bank.m
RAKE=rake
RFVGDIR=$(TOP)/rfvg

all: $(TARGETS)

clean:
	$(RM) $(TARGETS)

.PHONY: $(TARGETS) clean

$(OCTAVEDIR)/filter_bank.m:
	cd $(RFVGDIR); $(RAKE) rfvg:filterbank:octave:function > $@

$(TESTDIR)/filter_bank_analyser_test.m:
	cd $(RFVGDIR); $(RAKE) rfvg:filterbank:octave:test > $@

$(OCTAVEDIR)/envelope_follower_bank.m:
	cd $(RFVGDIR); $(RAKE) rfvg:envfoll:octave:function > $@
