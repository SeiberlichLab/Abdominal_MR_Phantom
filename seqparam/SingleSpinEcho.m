
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

% Sequence Parameters: 'SingleSpinEcho' => T2 mapping

defseq.baseTR = 10000/1000; % sec
defseq.baseTE = 0.4/1000; % sec
defseq.FA = 180; % degrees
defseq.TRinprep = 1; % # of TRs in one preparation
defseq.TRinex = 1; % # of TRs in one excitation
defseq.phaseang = 0; % degrees
defseq.preppausetime = 0; % sec
defseq.dfrange = 0; % off-resonance in Hz
defseq.fatsat = 0; % fat saturation

t2prep = [25 40 60 80 100 120]/1000; % time to preparation
defseq.nprep = size(t2prep,2)*np*npar*nset; % # of preparations
defseq.t2prep = repmat(t2prep,[1 defseq.nprep/length(t2prep)]);

% Preparation:
% 0: No prepatation
% 1: Inversion recovery
% 2: Spin echo
defseq.prepind = 2; % spin echo

% Define sampling pattern
% 'projinpar': projection in partition
% 'parinproj': partition in projection
% 'userdefined': user defined sampling pattern
defseq.samptype = 'projinpar';
defseq.demosig = 1:6; % selected contrast for phantom image