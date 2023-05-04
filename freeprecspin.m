function Mout = freeprecspin(M,relaxTime,T1,T2,df,Nspins)

    on = ones(1, Nspins); % Vector to ensure size of matrices in further calculations
    [Atr,Btr] = freeprecess(relaxTime,T1,T2,df);
    Mout = Atr*M+Btr*on;
end

function [Atr,Btr]=freeprecess(T,T1,T2,df)
%
%	Function simulates free precession and decay
%	over a time interval T, given relaxation times T1 and T2
%	and off-resonance df.  Times in ms, off-resonance in Hz.

phi = 2*pi*df*T;	% Resonant precession, radians.
E1 = exp(-T/T1);
E2 = exp(-T/T2);

Atr = [E2 0 0;0 E2 0;0 0 E1]*zrot(phi);
Btr = [0 0 1-E1]';
end

function [M] = zrot(phi)

c = cos(phi);
s = sin(phi);

M = [c -s 0; s c 0; 0 0 1];
end