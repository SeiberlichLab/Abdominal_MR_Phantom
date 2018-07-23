function Y = fft1n(y,dim)
% FFT1N Normalized Fast Fourier Transform along one dimension
% 
% y   [any size] the signal or image
% dim [1x1]      the dimension along which to FFT
% 
% Y:  [any size] result after the FFT
% 
% Jesse Hamilton
% MIMOSA 
% Dec 2013
fctr = sqrt(size(y,dim));
Y = fftshift(fft(ifftshift(y,dim),[],dim),dim) / fctr;