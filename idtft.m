function [x, ni]=idtft(X)
    L = length(X);
    ni = 0 : L-1;
    x = (ifft(X));
end
    
    
    