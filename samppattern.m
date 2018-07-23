function samppat = samppattern(samptype,matsize,usersamp)
% Define sampling pattern
%   
%   INPUTS:
%       samptype [string] -> signal type defined by user
%                            'projinpar':  projection in partition
%                            'parinproj':  partition in projection
%                            'userdefined': user defined sampling pattern
%       matsize  [1 x 3]  -> [np npar nset]
%                            np = # of projections
%                            npar = # of partitions
%                            nset = # of sets
%       usersamp [n x 2]  -> user defined sampling pattern 
%                            n = # of samples 
%                            projection(1) and partition(2) samppling pattern
%
%   OUTPUT:
%       samppat [n x 2]   -> sampling pattern
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

if strcmp(samptype,'projinpar')
    np = matsize(1);
    npar = matsize(2);
    nset = matsize(3);
    selproj = col(repmat((1:np)',[npar nset]));
    selpar = col(repmat(1:npar,[np nset]));
    samppat = [selproj selpar];
elseif strcmp(samptype,'parinproj')
    np = matsize(1);
    npar = matsize(2);
    nset = matsize(3);
    selproj = col(repmat(1:np,[npar nset]));
    selpar = col(repmat((1:npar)',[np nset]));
    samppat = [selproj selpar];
elseif strcmp(samptype,'userdefined')
    if exist('usersamp','var')
        samppat = usersamp;
    else
        error('Please define sampling pattern');
    end
else
    error('Please select defined sampling type or define new sampling pattern by using "userdefined" option');
end
