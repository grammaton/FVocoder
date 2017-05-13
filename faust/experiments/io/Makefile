TOP=../..
include $(TOP)/Makefile.faust.include

TARGET=io

all: $(TARGET)

plot: clean
	$(MAKE) -$(MAKEFLAGS) "FAUST_ARCH=-a plot.cpp"

octave: clean
	$(MAKE) -$(MAKEFLAGS) "FAUST_ARCH=-a matlabplot.cpp"
	./$(TARGET) > $(TARGET)plot.m

clean:
	$(RM) $(TARGET) $(TARGET:=.cpp) $(TARGET:=-svg) $(TARGET:=.xml) $(TARGET:=-graph.pdf) $(TARGET:=-mdoc) $(TARGET:=plot.m) *tmp*

.PHONY: clean

.SUFFIXES: .dsp

%.cpp: %.dsp
	$(FAUST) $(FAUST_FLAGS) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $*.cpp $(LIBS)
