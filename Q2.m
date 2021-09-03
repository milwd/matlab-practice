clc;
clear all;
close all;

[y, Fs] = audioread('muz.mp3');

Sn = y(500000: 1000000, 1);
sound(Sn, Fs);

Fs1 = Fs * 2;
%sound(Sn, Fs1);
Fs2 = Fs * 0.5;
%sound(Sn, Fs2);

w0 = 0.05 * pi;
n1 = -20 : 1 : 20;
h1 = (sin(w0 .* n1))./(pi .* n1);
h1 = fillmissing(h1, 'constant', w0);
[H1, wh1] = dtft(h1);
%h2 = 
H3 = exp(-25.*1i.*wh1) .* H1;
[h3, n3] = idtft(H3);
H4 = exp(-25.*1i.*wh1.*wh1) .* H1;
[h4, n4] = idtft(H4);

out1 = conv(h1, Sn);
%sound(abs(out1), Fs);

%out2 = conv(h2, Sn);
%sound(abs(out2), Fs);

out3 = conv(h3, Sn);
%sound(abs(out3), Fs);

out4 = conv(h4, Sn);
%sound(abs(out4), Fs);






