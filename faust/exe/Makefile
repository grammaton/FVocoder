TOP=..
FILTER_BANK_DIR=$(TOP)/filter_bank
FAUST_IMPORT_DIRS=-I $(FILTER_BANK_DIR)

include $(TOP)/Makefile.faust.include

TARGETS=filter_bank_exe
DEPENDS=filter_channel.dsp filter_bank.dsp
VPATH=.:$(FILTER_BANK_DIR)

all: $(TARGETS)

$(TARGETS): $(DEPENDS)

clean:
	$(RM) $(TARGETS) $(TARGETS:=.cpp) $(TARGETS:=-svg) $(TARGETS:=.xml) $(TARGETS:=-graph.pdf) $(TARGETS:=-mdoc) *tmp*

.PHONY: clean

.SUFFIXES: .dsp

%.cpp: %.dsp
	$(FAUST) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $*.cpp $(LIBS)
