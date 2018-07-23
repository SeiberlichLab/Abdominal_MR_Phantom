function [seqparam,defseq] = setseqparam(sigtype,matsize,sampmode)
% Define sequence parameters
%   
%   INPUTS:
%       sigtype [string]  -> signal type defined by user
%       matsize  [1 x 3]  -> [np npar nset]
%                            np = # of projections
%                            npar = # of partitions
%                            nset = # of sets
%   OPTIONAL:
%       sampmode [string] -> sampling mode defined by user
%
%   OUTPUT:
%       seqparam [struct] -> sequence parameters
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

np = matsize(1);
npar = matsize(2);
nset = matsize(3);  

defseq = [];
if exist(fullfile('seqparam',sigtype),'file') == 2
    eval(sigtype)
else
    error('Please select defined sequence type or define new sequence parameters in folder "seqparam"');
end
seqparam.samppat = samppattern(defseq.samptype,[np npar nset]);

baseTR = defseq.baseTR; % sec
baseTE = defseq.baseTE; % sec
FA = defseq.FA; % degrees
TRinprep = defseq.TRinprep; % # of TRs in one preparation
TRinex = defseq.TRinex; % # of TRs in one excitation
nprep = defseq.nprep; % # of preparations
phaseang = defseq.phaseang; % degrees
preppausetime = defseq.preppausetime; % sec
dfrange = defseq.dfrange; % off-resonance in Hz
fatsat = defseq.fatsat; % fat saturation
prepind = defseq.prepind; % preparation module

% Prepare preparation matrix
seqparam.prep = padarray(repmat(1*prepind,[1,nprep]),TRinprep/TRinex-1,'post');
if prepind == 1
    ti = padarray(repmat(20.64/1000,[1,nprep]),TRinprep/TRinex-1,'post');
else
    ti = padarray(zeros(1,nprep),TRinprep/TRinex-1,'post');
end
if ~isfield(defseq,'t2prep')
    t2prep = zeros([1,nprep]);
else
    t2prep = defseq.t2prep; % time to preparation
end
if ~isfield(seqparam,'perfT1')
    seqparam.perfT1 = zeros([nprep,4]);
end
t2te = padarray(t2prep,TRinprep/TRinex-1,'post');
patime = padarray(repmat(preppausetime,[1,nprep]),TRinprep/TRinex-1,'post');
Nex = TRinprep/TRinex*nprep;
Necho = TRinex;
seqparam.FAmat = repmat(FA/180*pi,TRinprep/TRinex,nprep);
seqparam.TRmat = baseTR+ti+t2te+patime;
seqparam.TEmat = reshape(repmat(baseTE,TRinprep/TRinex,nprep)+repmat(t2prep,TRinprep,1),[Nex Necho]);
seqparam.phase = mod(phaseang*pi/180*ones(1,TRinprep*nprep)',2*pi);
seqparam.spoiler = ones(TRinprep/TRinex,nprep);
seqparam.dfrange = dfrange;
seqparam.Nex = Nex;
seqparam.Necho = Necho;
seqparam.sigtype = sigtype;
seqparam.ti = ti;
seqparam.fatsat = fatsat;

if strcmp(sampmode,'simple')
    if strcmp(defseq.samptype,'projinpar')
        defseq.demosig = 1:np:TRinprep*nprep;
    elseif strcmp(defseq.samptype,'parinproj')
        defseq.demosig = 1:npar:TRinprep*nprep;
    end
elseif strcmp(sampmode,'eachEcho')
    defseq.demosig = 1:TRinprep*nprep;
end
