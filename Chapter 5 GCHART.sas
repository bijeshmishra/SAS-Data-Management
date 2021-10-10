/* Chapter 5 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE; TITLE3; FOOTNOTE;
DATA instruction;
INPUT program $ score @@;
DATALINES;
A 71 A 82 A 88 A 64 A 59 A 78 A 72
A 81 A 83 A 66 A 83 A 91 A 79 A 70
B 65 B 88 B 92 B 76 B 87 B 89 B 85
B 90 B 81 B 91 B 78 B 81 B 86 B 82
B 73 B 79
;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
VBAR program ; /* /MIDPOINTS = 1 2*/
TITLE 'Objective 5.1';
TITLE3 'Vertical Bar Chart for Program';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC SORT DATA = instruction; BY program;
PROC GCHART DATA = instruction; BY program;
VBAR score / SPACE = 0;
TITLE 'Objective 5.2';
TITLE3 'Histogram of the Scores for Each Program' ;
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction; 
BY program;
VBAR score / SPACE = 0 AXIS = 1 TO 6 MIDPOINTS = 60 65 70 75 80 85 90;
TITLE 'Objective 5.3';
TITLE2 'Histogram for the Scores for Each Program';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
VBAR score / SPACE = 0 GROUP = program AXIS = 1 TO 6 
			 MIDPOINTS = 60 65 70 75 80 85 90;
TITLE 'Objective 5.4';
TITLE2 'Histogram for the Scores for Each Program';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
HBAR score;
TITLE 'Objective 5.5: Default Horizantal Bar Chart for Score';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
HBAR score / SPACE = 0 LEVELS = 4 NOSTATS AUTOREF CLIPREF;
TITLE 'Objective 5.6: Histogram';
TITLE3 ' Number of Levels Specified - All Frequency Information is supressed';
TITLE4 'Reference lines are included in the background.';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
HBAR program; / TYPE = MEAN SUMVAR = score MEAN;
TITLE 'Objective 5.7';
TITLE3 ' The mean of each program';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
VBAR3D program / TYPE = MEAN SUMVAR = score MEAN;
TITLE 'Objective 5.8: Mean of each program in a 3-D horizantal bar chart';
* FOOTNOTE ' SUMVAR and TYPE tell us which variable and statistics to use 
as reference variable in the chart. See practice 4, Q1(c)';
HBAR3D program / TYPE = MEAN SUMVAR = score MEAN;
TITLE 'Objective 5.8: Mean of each program in a 3-D vertical bar chart';
BLOCK program / TYPE = MEAN SUMVAR = score NOHEADING;
TITLE 'Objective 5.8: Mean of each program in a block chart';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC GCHART DATA = instruction;
PIE program / TYPE = PERCENT ;
TITLE 'Objective 5.9: Pie Chart';
TITLE2 'for the percent of subjects in each of the programs.';
RUN; QUIT;
