function y = ifft1n(Y,dim)
% IFFT1N Normalized inverse fast fourier transform along 1 dimension
% 
% Y [any size]  the signal or image
% dim [1x1]     dimension along which to take inverse FFT
% 
% y [any size]  result after inverse FFT
% 
% Jesse Hamilton
% Dec 2013
% MIMOSA
fctr = sqrt(size(Y,dim));
y = fftshift(ifft(ifftshift(Y,dim),[],dim),dim)*fctr;