function tissueprop = tissueproperty
% Define tissue properties
%
% -----------------------------------------------------------------------------------------
% Realistic 4D abdominal phantom for magnetic resonance imaging
% Wei-Ching Lo
% wxl317@case.edu
% Case Western Reserve University
% April 2018
% -----------------------------------------------------------------------------------------

% T1(ms); T2(ms); ADC(10^-3 mm^2/s); PDFF(%)
tissueprop(1)  = struct('name','bone',        'T1',200, 'T2',49, 'ADC',1300*10^-6,'PDFF',70/100 );
tissueprop(2)  = struct('name','fat',         'T1',250, 'T2',68, 'ADC',20*10^-6,  'PDFF',99/100 );
tissueprop(3)  = struct('name','skin',        'T1',300, 'T2',41, 'ADC',100*10^-6, 'PDFF',80/100 );
tissueprop(4)  = struct('name','colon',       'T1',500, 'T2',100,'ADC',1300*10^-6,'PDFF',1.5/100);
tissueprop(5)  = struct('name','gastro',      'T1',500, 'T2',120,'ADC',1000*10^-6,'PDFF',1.2/100);
tissueprop(6)  = struct('name','pancreas',    'T1',725, 'T2',43, 'ADC',1470*10^-6,'PDFF',2.7/100);
tissueprop(7)  = struct('name','liver',       'T1',810, 'T2',34, 'ADC',1920*10^-6,'PDFF',2.3/100);
tissueprop(8)  = struct('name','muscle',      'T1',898, 'T2',29, 'ADC',1870*10^-6,'PDFF',20/100 );
tissueprop(9)  = struct('name','gallbladder', 'T1',1100,'T2',150,'ADC',1700*10^-6,'PDFF',3/100  );
tissueprop(10) = struct('name','adrenalgland','T1',1100,'T2',130,'ADC',2080*10^-6,'PDFF',0.5/100);
tissueprop(11) = struct('name','vein',        'T1',1120,'T2',200,'ADC',1400*10^-6,'PDFF',0.1/100);
tissueprop(12) = struct('name','kidney',      'T1',1142,'T2',76, 'ADC',1770*10^-6,'PDFF',0.7/100);
tissueprop(13) = struct('name','spleen',      'T1',1328,'T2',61, 'ADC',1400*10^-6,'PDFF',0.9/100);
tissueprop(14) = struct('name','artery',      'T1',1550,'T2',275,'ADC',1280*10^-6,'PDFF',0.1/100);
tissueprop(15) = struct('name','ureter',      'T1',1600,'T2',81, 'ADC',1840*10^-6,'PDFF',0.3/100);
