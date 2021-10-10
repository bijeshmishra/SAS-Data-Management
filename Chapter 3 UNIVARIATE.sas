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
PROC UNIVARIATE DATA = instruction;
VAR score;
TITLE 'Objective 3.1: Defalut Information';
RUN; QUIT;

PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program; /* Categorical variable and undorted data. */
VAR score;
HISTOGRAM score/NORMAL;
TITLE ' Objective 3.2';
TITLE3 'Using a CLASS statement';
FOOTNOTE ' Objective 3.2 can be achieved by using 
1) NORMAL option on PROC UNIVARIATE only, 
2) NORMAL option in HISTOGRAM only 
3) Include both NORMAL options.';
RUN; QUIT;

/* Recovering Statistics in Data Set */
PROC SORT DATA = instruction;
BY program;
TITLE; TITLE3; FOOTNOTE;
PROC UNIVARIATE DATA = instruction MU0 = 75;
BY program;
VAR score;
HISTOGRAM score/NORMAL (MU = 75);
OUTPUT OUT = three MEAN = mnscore N = nscore 
STDMEAN = semscore NOBS = nobs MIN = min 
RANGE = range VAR = var STD = std CV = cv;
TITLE 'Objective 3.3';
TITLE3 'Using a BY statement';
TITLE; TITLE3; FOOTNOTE;
PROC PRINT DATA = three;
TITLE3 'Output Data Set Identifying Each Program';
RUN; QUIT;

/* Test for Location Syntax Options */
PROC UNIVARIATE DATA = data MU0 = (15 27);
var a b c;
FOOTNOTE 'Ho: MU = 15, 27 and 0 for variables a, b & c respectively'; 

/* The MEANS Procedure */
TITLE; TITLE3; FOOTNOTE;
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
