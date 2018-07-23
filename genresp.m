function linv = genresp(respmov,tframe,respamp)
% Generate respratory curves
%   
%   INPUTS:
%       respmov [n x 3] -> respiratory motion curve
%       tframe  [1 x 1] -> # of time frames
%       respamp [1 x 3] -> [SImov APmov LRmov]
%                          SImov = largest superior-inferior (SI) excursion (mm)
%                          APmov = largest anterior-posterior (AP) excursion (mm)
%                          LRmov = largest left-right (LR) excursion (mm)
%
%   OUTPUT:
%       linv [tframe x 3] -> scaled respiratory time curves in the SI, AP, and LR directions
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% May 2018
% -----------------------------------------------------------------------------------------

linSI = interp1(1:size(respmov,1),respmov(:,1)*(respamp(1)/97.0637)+1,linspace(1,size(respmov,1),tframe))';
linAP = interp1(1:size(respmov,1),respmov(:,2)*(respamp(2)/97.0637)+1,linspace(1,size(respmov,1),tframe))';
linLR = interp1(1:size(respmov,1),respmov(:,3)*(respamp(3)/97.0637)+1,linspace(1,size(respmov,1),tframe))';

linv = [linSI linAP linLR];