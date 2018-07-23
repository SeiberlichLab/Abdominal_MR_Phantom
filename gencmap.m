function cmap = gencmap(matsize,nc,origcmap)
% Generate coil maps
%   
%   INPUTS:
%       matsize [any size] -> matrix size defined by user (2D or 3D)
%       nc [1x1] -> # of coils
%
%       Optional arguments:
%       origcmap [any size] -> pre-loaded coil sensitivity map that will be resized to the defined matrix size
%
%   OUTPUT:
%       cmap [any size] -> coil sensitivity maps (2D or 3D)
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% May 2018
% -----------------------------------------------------------------------------------------

if nargin == 2
    % create simulated coil sensitivity maps
    cmap = generateCoilMap(matsize,nc);
elseif nargin == 3
    % resize loaded coil sensitivity maps
    orignc = size(origcmap,3);
    selc = round(linspace(1,orignc,nc));
    cmapc = imresize(origcmap(:,:,selc),[matsize(1) matsize(2)],'nearest');
    cmap = permute(imresize(permute(cmapc,[4 2 1 3]),[matsize(3) matsize(2)],'nearest'),[2 3 4 1]);
end



