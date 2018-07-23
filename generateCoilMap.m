function cmap = generateCoilMap(imsize,nc,sigma,ang)
% GENERATECOILMAP Creates a coil map with 2D Gaussian sensitivity profiles arranged in a circle. Coil map may be 2D or 3D.
% Coil map is assumed to be time-invariant.
%
% INPUTS
% imsize 	[1xn], vector that specifies image size
% nc        [1x1], number of coils
% optional arguments
	% sigma [1x1]   use a larger value to make the coil profiles more narrow (3.4 is a good start)
	% ang 	[1xn]   vector of angles; controls how the coils are spaced around the circle
%
% OUTPUTS
% cmap      [ny,nx,nc] or [ny,nx,nc,nz]  2D or 3D coil map
% 
% 2D EXAMPLE: cmap = generateCoilMap([128 128],18); % 128x128 image, 18 channels
% 3D EXAMPLE: cmap = generateCoilMap([128 128 16],18); % 18 channels, 16 partitions
%
% Jesse Hamilton
% Dec 2013
% MIMOSA Code Repository

    function cmap = coilmap_2D(imsize,nc,sigma,ang)
        [X,Y] = meshgrid(1:imsize(1),1:imsize(2));
        initPoint = [0;imsize(1)/4;1];
        
        cmap = zeros([imsize nc],'single');
        for i=1:nc
            q = round(rotatePoint(initPoint,ang(i)));
            xcen = imsize(2)/2 + q(1); % correct x-offset
            ycen = imsize(1)/2 + q(2); % correct y-offset
            cmap(:,:,i) = exp(-((X-xcen).^2+(Y-ycen).^2)./(2*sigma^2));
        end
    end
    % END coilmap_2D()
    
    function coilmap_3D()
        Z = 1:imsize(3);
        alpha = 10;%3.4; % larger value --> coil sensitivities vary less across partitions
        y = zeros(nc,imsize(3));
        zi = linspace(1,imsize(3),nc);
        for i=1:nc
            y(i,:) = exp(-(Z-zi(i)).^2 / (2*alpha^2) );
        end
        
        deg = [];
        numAng = 4;
        numSets = ceil(nc/numAng);
        for i = 1:numSets
            deg((i-1)*numAng+1:i*numAng) = mod((0:360/numAng:360-360/numAng) + 180/numSets*(i-1),360);
        end
        
        cmap = zeros([imsize(1:2) nc imsize(3)],'single');
        cmap2D = coilmap_2D(imsize(1:2),nc,sigma,deg);
        for i = 1:nc % loop over coils
            for j = 1:imsize(3) % loop over partitions
                cmap(:,:,i,j) = y(i,j)*cmap2D(:,:,i);
            end
        end
    end
    % END coilmap_3D()

cmap = [];

if ~(exist('sigma','var'))
    sigma = max(imsize)/2;
end
if ~(exist('ang','var'))
    ang = 0:360/nc:360-360/nc;
end

if numel(imsize)==2
    cmap = coilmap_2D(imsize,nc,sigma,ang);
elseif numel(imsize)==3
    coilmap_3D();
else
    error('Variable ''imsize'' has wrong number of dimensions')
end

end
% END generateCoilMap()