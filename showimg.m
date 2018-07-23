function showimg(temp,climit,cmap)
% Show 3D images
%   
%   INPUTS:
%       temp   [nx, ny, nz] -> phantom images
%       climit [1 x 2]      -> colormap limit
%       cmap   [n x 3]      -> colormap
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

if ~(exist('cmap','var'))
    cmap = [];
end

temp = abs(squeeze(temp));
nrow = ceil(sqrt(size(temp,3)));
ncol = nrow;
imdisp = zeros(size(temp,1)*nrow,size(temp,2)*ncol);
zz = 0;
for rr = 1:nrow
    for cc = 1:ncol
        zz = zz+1; if zz > size(temp,3), continue; end
        imdisp((rr-1)*size(temp,1)+1:rr*size(temp,1),(cc-1)*size(temp,2)+1:cc*size(temp,2)) = temp(:,:,zz);
    end
end
if ~(exist('climit','var'))
    figure;imagesc(imdisp); axis square off; drawnow;
else
    figure;imagesc(imdisp,climit); axis square off; drawnow;
end

if strcmp(cmap,'grayjet')
    colormap(jet(256).*gray(256));
elseif strcmp(cmap,'gray')
    colormap(gray(256));
elseif ~isempty(cmap)
    colormap(cmap);
end