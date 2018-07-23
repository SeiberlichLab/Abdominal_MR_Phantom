### Abdominal_MR_Phantom
Realistic 4D abdominal phantom for magnetic resonance imaging.

In the spirit of reproducible research, our 4D abdominal MR phantom is made available online to the community. The source codes are available as a MATLAB package and can be found at https://github.com/SeiberlichLab/Abdominal_MR_Phantom.

![Optional Text](../master/phantom_demo_image.png)

### Citing
If you have used Abdominal_MR_Phantom in a scientific publication, we would appreciate citations to the following paper:
- Lo W-C, Chen Y, Jiang Y, Gulani V, Seiberlich N. Realistic 4D abdominal phantom for magnetic resonance imaging. Proc Intl Soc Mag Reson Med, Honolulu, 2017, #1231.

If you have used the Fessler Toolbox, please also cite the following paper:
- Fessler JA. On NUFFT-based gridding for non-Cartesian MRI. J. Magn. Reson. 2007;188:191–195.

### Downloading
Please download and install the Fessler Toolbox for non-Cartesian NUFFT-based gridding.
Fessler Toolbox: http://web.eecs.umich.edu/~fessler/irt/fessler.tgz

### Notes
The Abdominal_MR_Phantom source code includes phantom generation, data acquisition, and reconstruction.
Please start with the main script "main_phantom_generation.m".

- Part1: Phantom generation<br />
(1)	Define tissue properties and respiratory motion.<br />
(2)	Generate voxelized volumetric masks with indexes.<br />
- Part2: Data acquisition<br />
(1)	Define sequence parameters.<br />
(2)	Generate signal evolution using Bloch simulation.<br />
(3)	Generate k-space data for each time frame.<br />
- Part3: Data reconstruction and gridding

### Acknowledgement
The research project is supported by Siemens Healthineers, R01DK098503, R01HL094557, 1C06RR12463-01.

### External links
- CT Abdomen mesh models: http://hdl.handle.net/1926/546 License granted by Julien Jomier (jomier@unc.edu) on 2007.
- Mesh voxelisation: https://www.mathworks.com/matlabcentral/fileexchange/27390-mesh-voxelisation Copyright (c) 2013, Adam H. Aitkenhead. All rights reserved.

### Bugs and Questions
Please contact Tina (Wei-Ching) Lo at wxl317@case.edu and Nicole Seiberlich at nes30@case.edu.
