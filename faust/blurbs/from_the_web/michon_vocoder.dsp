import("music.lib");
import("filter.lib");
import("effect.lib");
import("oscillator.lib");

simpleVocoder(nBands,att,rel,BWRatio,excitation,source) = source <: par(i,nBands,oneVocoderBand(i,nBands,BWRatio,1) : 
amp_follower_ud(att,rel) : _,excitation : oneVocoderBand(i,nBands,BWRatio)) :> _
with{
	oneVocoderBand(band,bandsNumb,bwRatio,bandGain,x) = x : resonbp(bandFreq,bandQ,bandGain)
	with{
		bandFreq = 25*pow(2,(band+1)*(9/bandsNumb));
		BW = (bandFreq - 25*pow(2,band*9/bandsNumb))*bwRatio;
		bandQ = bandFreq/BW;
	};
};

simpleVocoderDemo = hgroup("Simple Vocoder",lf_imptrain(freq)*gain,_ : simpleVocoder(bands,att,rel,BWRatio) <: _,_) 
with{
	bands = 32;
	vocoderGroup(x) = vgroup("[0]Vocoder",x);
	att = vocoderGroup(hslider("[0]Attack [style:knob]",5,0.1,100,0.1)*0.001);
	rel = vocoderGroup(hslider("[1]Release [style:knob]",5,0.1,100,0.1)*0.001);
	BWRatio = vocoderGroup(hslider("[2]BW [style:knob]",0.2,0.1,2,0.001));
	excitGroup(x) = vgroup("[1]Excitation",x);
	freq = excitGroup(hslider("[0]Frequency [style:knob]",140,50,2000,0.1));
	gain = excitGroup(vslider("[1]Gain",0.5,0,1,0.01) : smooth(0.999));
}; 

process = simpleVocoderDemo;
