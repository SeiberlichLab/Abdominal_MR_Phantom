
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

% Sequence Parameters: 'MultiEchoSpoiledGradientEcho' => Proton density fat fraction

defseq.baseTR = 120/1000; % sec
defseq.baseTE = [1.15 2.3 3.45 4.6 5.75 6.9]'/1000; % sec
defseq.FA = 10; % degrees
defseq.TRinprep = size(defseq.baseTE,1); % # of TRs in one preparation
defseq.TRinex = size(defseq.baseTE,1); % # of TRs in one excitation
defseq.nprep = np*npar*nset; % # of preparations
defseq.phaseang = 117; % degrees
defseq.preppausetime = 0; % sec
defseq.dfrange = 0; % off-resonance in Hz
defseq.fatsat = 0; % fat saturation

% Preparation:
% 0: No prepatation
% 1: Inversion recovery
% 2: Spin echo
defseq.prepind = 0; % spoiled gradient echo

% Define sampling pattern
% 'projinpar': projection in partition
% 'parinproj': partition in projection
% 'userdefined': user defined sampling pattern
defseq.samptype = 'projinpar';
defseq.demosig = 1:6; % selected contrast for phantom image