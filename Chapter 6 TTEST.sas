/* Chapter 6 */
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

PROC PRINT DATA = instruction;
RUN;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = instruction H0 = 75;
VAR score;
TITLE 'Objective 6.1';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = instruction H0 = 75 ALPHA = 0.02 PLOTS = NONE;
VAR score;
TITLE 'Objective 6.2';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC SORT DATA = instruction; BY program;
PROC TTEST DATA = instruction PLOTS = NONE H0 = 75 ALPHA = 0.02 CIBASIC SIDES = U;
BY program;
VAR score;
TITLE 'Objective 6.3';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = instruction SIDES = 2 ALPHA = 0.05 H0 = 75;
VAR score;
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC UNIVARIATE DATA = instruction ALPHA = 0.05 CIBASIC MU0 = 75;
VAR score;
RUN; QUIT;

data improvement;
input subject before after ;
DATALINES;
1 138 324
2 284 520
3 234 318
4 132 220
5 183 232
;
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = improvement SIDES = L CI = NONE ALPHA = 0.01;
PAIRED before*after;
TITLE 'Objective 6.4';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = improvement ALPH = 0.01
		   PLOTS (ONLY) = (HISTOGRAM BOXPLOT);
PAIRED before*after;
TITLE 'Objective 6.5 (1)';
RUN; QUIT;

PROC TTEST DATA = improvement ALPH = 0.01
		   PLOTS (ONLY) = (BOXPLOT INTERVAL) SIDED = L;
PAIRED before*after;
TITLE 'Objective 6.5 (2)';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = instruction;
CLASS program;
VAR score;
TITLE 'Objective 6.6';
TITLE3 't-test for the Difference Between Two Independent Means';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
PROC TTEST DATA = instruction SIDED = L;
CLASS program;
VAR score;
TITLE 'Objective 6.7 (1)';
TITLE3 't-test (Lower Sided) for the Difference Between Two Independent Means';
RUN; QUIT;

PROC TTEST DATA = instruction SIDED = U;
CLASS program;
VAR score;
TITLE 'Objective 6.7 (2)';
TITLE3 't-test (Upper Sided) for the Difference Between Two Independent Means';
RUN; QUIT;
