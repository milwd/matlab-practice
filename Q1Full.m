clc;
clear all;
close all;

n0 = 0 : 1 :  400;
%wmax = 0.07 * pi;
%wmin = 0.02 * pi;
%w0 = (wmax - wmin).*rand(1, 1) + wmin;
w0 = 0.05 * pi;
x = cos(w0.*n0) - (1/3).*(cos(3.*w0.*n0)) - (1/5).*(cos(5.*w0.*n0));

%--1--
stem(n0, x);

%--2--
[X, w] = dtft(x);
subplot(2,1,2);
stem(n0, x);
subplot(2,1,1);
plot(w,abs(X));

%--3--
n1 = -20 : 1 : 20;
h1 = sin(w0.*n1) ./ (pi.*n1);
h1 = fillmissing(h1, 'constant', w0/pi);
y1 = conv(x, h1);
[Y1, w] = dtft(y1);
subplot(2, 1, 2);
nOut = 0 : 1 : length(y1)-1;
stem(nOut, y1);
subplot(2, 1, 1);
plot(w, abs(Y1));

%--4--
n1 = -20 : 1 : 20;
h1 = sin(w0.*n1) ./ (pi.*n1);
h1 = fillmissing(h1, 'constant', w0/pi);
[H1, w] = dtft(h1);
subplot(1, 1, 1);
plot(w, abs(H1));

%--5--
n1 = -20 : 1 : 20;
h1 = sin(w0.*n1) ./ (pi.*n1);
h1 = fillmissing(h1, 'constant', w0/pi);
[H1, w] = dtft(h1);
n1_10 = n1 * 10;
h1_10 = sin(w0.*n1_10) ./ (pi.*n1_10);
h1_10 = fillmissing(h1_10, 'constant', w0/pi);
subplot(3, 1, 1);
plot(n1_10, h1_10);
subplot(3, 1, 2);
stem(n1_10, h1_10);
subplot(3, 1, 3);
plot(w, abs(H1));

%--6--


%--7--
n1 = -20 : 1 : 20;
h1 = sin(w0.*n1) ./ (pi.*n1);
h1 = fillmissing(h1, 'constant', w0/pi);
[H1, wh1] = dtft(h1);
[X3, wx3] = dtft(x);
H3 = exp(-25.*1i.*wh1) .* H1;
Y3 = X3 .* H3;
[y3, ni] = idtft(Y3);
subplot(2, 1, 2);
plot(ni, real(y3));
subplot(2, 1, 1);
plot(wx3, abs(Y3));

%--8--
n1 = -20 : 1 : 20;
h1 = sin(w0.*n1) ./ (pi.*n1);
h1 = fillmissing(h1, 'constant', w0/pi);
[H1, wh1] = dtft(h1);
[X4, wx4] = dtft(x);
H4 = exp(-25.*1i.*wh1.*wh1) .* H1;
Y4 = X4 .* H4;
[y4, ni] = idtft(Y4);
subplot(2, 1, 2);
plot(ni, real(y4));
subplot(2, 1, 1);
plot(wx4, abs(Y4));


