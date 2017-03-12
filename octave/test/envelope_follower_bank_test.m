%
% this tests the envelope follower bank implementation
%
clf;
graphics_toolkit("fltk");

[sig sr nbits] = wavread("ergonomics.wav");

[sigs hs ws] = filter_bank(sig);

efs = envelope_follower_bank(sigs);

sinc = 1/sr;
dur = length(sig)/sr;
t = [0:sinc:dur-sinc]';
nfilt = [1:48];

efsdB = 20*log10(efs);

figure(1, "visible", "off");
colormap("jet");
caxis([-70 -20]);
mesh(nfilt, t, efsdB);
axis([nfilt(1) nfilt(end) t(1) t(end) -70 0.5]);

print("envelope_follower_bank_mesh.png", "-dpng");
