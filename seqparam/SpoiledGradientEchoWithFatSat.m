
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

% Sequence Parameters: 'SpoiledGradientEchoWithFatSat' => Perfusion-weighted image

defseq.baseTR = 5.12/1000; % sec
defseq.baseTE = 0.76/1000; % sec
defseq.FA = 15; % degrees
defseq.TRinprep = 480; % # of TRs in one preparation
defseq.TRinex = 1; % # of TRs in one excitation
defseq.nprep = 100; % # of preparations
defseq.phaseang = 117; % degrees
defseq.preppausetime = 0; % sec
defseq.dfrange = 0; % off-resonance in Hz
defseq.fatsat = 1; % fat saturation
seqparam = load('perfT1_release'); % Load T1 matrix for perfusion

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
defseq.demosig = round(linspace(101,defseq.TRinprep*defseq.nprep,6)); % selected contrast for phantom image
