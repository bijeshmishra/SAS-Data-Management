/* The MEANS Procedure */
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
PROC MEANS DATA = instruction MIN MAX MEAN STD N CV;
CLASS program;
VAR score;
TITLE ' Objective 3.4, 3.5 & 3.6';
OUTPUT OUT = six MIN = score_min 
MAX = score_max RANGE = score_range;
TITLE; TITLE3; FOOTNOTE;
PROC PRINT DATA = six;
RUN; QUIT;

PROC SORT DATA = instruction;
BY program;
TITLE; TITLE3; FOOTNOTE;
PROC MEANS DATA = instruction 
MIN MAX MEAN STD N CV STDERR T PRT CLM ALPHA = 0.01;
BY program;
VAR score;
TITLE ' Objective 3.7';
OUTPUT OUT = seven MIN = score_min MAX = score_max RANGE = score_range;
PROC PRINT DATA = seven;
RUN; QUIT;

TITLE; TITLE3; FOOTNOTE;
PROC MEANS DATA = instruction MEAN STDERR T PRT CLM ALPHA = 0.01;
CLASS program;
VAR score;
TITLE ' Objective 3.8';
RUN; QUIT;
