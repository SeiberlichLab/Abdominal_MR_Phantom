function y = ifft2n(Y,dim1,dim2)
% IFFT2N Normalized 2D inverse fast fourier transform
% 
% Y [any size]  the signal or image
% dim [1x2]     dimensions along which to take inverse FFT
% 
% y [any size]  result after inverse FFT
% 
% Jesse Hamilton
% Dec 2013
% MIMOSA
y = ifft1n(ifft1n(Y,dim2),dim1);