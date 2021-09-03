function [X,w]=dtft(x)
    % Computes Discrete-time Fourier Transform of x(n) as X(e^(jw));
    % X=Fourier Transform values of x(n)
    % x= input signal in size(1,n)
    % w=frequency location vector
    n=length(x);
    if n<512; w=0:2*pi/512:2*pi-2*pi/512;
    else; w=0:2*pi/(n-1):2*pi;
    end
    X=fft(x,length(w));
    X=X/max(abs(X));
end