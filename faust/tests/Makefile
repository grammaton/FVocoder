TOP=..
FILTER_BANK_DIR=$(TOP)/filter_bank
SWITCH_BANK_DIR=$(TOP)/switch
FAUST_IMPORT_DIRS=-I $(FILTER_BANK_DIR) -I $(SWITCH_BANK_DIR)
FAUST_ARCH=
FAUST_AUDIO_ARCH=jack-gtk.cpp
FAUST_OCTAVE_ARCH=octave.cpp

include $(TOP)/Makefile.faust.include

AUDIO_TARGETS=filter_channel_audio_test filter_bank_audio_test switch_channel_audio_test switchable_filter_bank_audio_test
DEPENDS=filter_channel.dsp filter_bank.dsp
VPATH=.:$(FILTER_BANK_DIR):$(SWITCH_BANK_DIR)

all: $(AUDIO_TARGETS)

filter_bank_audio_test filter_bank_octave_test: filter_bank.dsp filter_channel.dsp
switchable_filter_bank_audio_test: filter_bank.dsp filter_channel.dsp switch_channel.dsp
filter_channel_audio_test filter_channel_octave_test: filter_channel.dsp
switch_channel_audio_test: switch_channel.dsp

clean:
	$(RM) $(AUDIO_TARGETS) $(TARGETS:=.cpp) $(TARGETS:=-svg) $(TARGETS:=.xml) $(TARGETS:=-graph.pdf) $(TARGETS:=-mdoc) *tmp*

.PHONY: clean

.SUFFIXES: .cpp .dsp

%_audio_test.cpp: %_audio_test.dsp
	FAUST_ARCH="-a $(FAUST_AUDIO_ARCH)" $(FAUST) -o $@ $<

%_octave_test.cpp: %_octave_test.dsp
	FAUST_ARCH="-a $(FAUST_OCTAVE_ARCH)" $(FAUST) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $*.cpp $(LIBS)
