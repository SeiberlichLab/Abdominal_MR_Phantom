function Y = fft2n(Y,dim1,dim2)
% FFT2N Normalized 2D fast fourier transform
% 
% Y [any size]  the signal or image
% dims [1x2]     dimensions along which to take FFT
% 
% y [any size]  result after FFT
% 
% Jesse Hamilton
% Dec 2013
% MIMOSA
Y = fft1n(fft1n(Y,dim1),dim2);