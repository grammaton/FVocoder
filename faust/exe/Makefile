TOP=..
FILTER_BANK_DIR=$(TOP)/filter_bank
SWITCH_BANK_DIR=$(TOP)/switch
FAUST_IMPORT_DIRS=-I $(FILTER_BANK_DIR) -I $(SWITCH_BANK_DIR)

include $(TOP)/Makefile.faust.include

TARGETS=filter_bank_exe switch_bank_exe
DEPENDS=filter_channel.dsp filter_bank.dsp switch_channel.dsp switch_bank.dsp
VPATH=.:$(FILTER_BANK_DIR):$(SWITCH_BANK_DIR)

all: $(TARGETS)

$(TARGETS): $(DEPENDS)

clean:
	$(RM) $(TARGETS) $(TARGETS:=-svg) $(TARGETS:=.xml) $(TARGETS:=-graph.pdf) $(TARGETS:=-mdoc) *tmp* *.cpp

.PHONY: clean

.SUFFIXES: .dsp

%.cpp: %.dsp
	$(FAUST) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $*.cpp $(LIBS)
