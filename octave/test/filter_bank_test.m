%
% this tests the actual filter bank implementation
%
% graphics_toolkit("fltk");

[sig sr nbits] = wavread("ergonomics.wav");

[sigs hs ws] = filter_bank(sig);

sinc = 1/sr;
dur = length(sig)/sr;
t = [0:sinc:dur-sinc];
nfilt = [1:48];

figure(1, "visible", "off");
mesh(nfilt, t, sigs);
print("filter_bank_mesh.png", "-dpng");

figure(2, "visible", "off");
surfl(nfilt, t, sigs);
print("filter_bank_surfl.png", "-dpng");
