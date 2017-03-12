include ../../Makefile.faust.include

TARGETS=michon_vocoder

all: $(TARGETS)

clean:
	$(RM) $(TARGETS) $(TARGETS:=.cpp) $(TARGETS:=-svg) $(TARGETS:=.xml) $(TARGETS:=-graph.pdf) *tmp*

.PHONY: clean

.SUFFIXES: .dsp

%.cpp: %.dsp
	$(FAUST) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $*.cpp $(LIBS)
