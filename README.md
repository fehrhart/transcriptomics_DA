# transcriptomics_DA
Transcriptomics data analysis

Arrayanalysis.org derived R packages for affymetrix micro arrays

How to use:
Open affyAnalysisQC.R - these are the settings - what plots are required, plotted, customisable, copy together with the data
Adapt:
DATA.DIR - directory where the CEL files can be found
SCRIPT.DIR - where the scripts (run, functions, affy are)
WORK.DIR - where to put the output

prefOligo - prefer oligo over affy (standard, no need to change)
arrayGroup = add link to description file - no symbols or numbers for group name start, make sure to add .txt or .CEL to the filenames
Example
CEL file name	sample name	group 
Bla.CEL	1	group1
BLa1.CEL	2	group2

save

run the affyAnalysisQC.R
