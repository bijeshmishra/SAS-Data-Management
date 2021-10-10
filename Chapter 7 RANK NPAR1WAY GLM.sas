/* Chapter 7 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE; TITLE3; FOOTNOTE;

DATA meat;
INPUT Group $ pH CookYield;
DATALINES;
C 6.14 20.9
C 5.98 22.1
C 6.30 21.8 
C 6.25 20.3
C 6.07 21.2
T1 5.98 22.4 
T1 6.32 23.8
T1 5.89 23.0
T1 6.08 24. 5
T1 6.11 22.8 
T2 6.18 23.4 
T2 6.22 20.8 
T2 6.03 22.6 
T2 5.97 24.8 
T2 5.93 25.1
;
PROC PRINT DATA = meat; RUN; QUIT;
DM 'ODSRESULTS; CLEAR;'; TITLE; TITLE3; FOOTNOTE;

/* PROC GLM for ANOVA */
PROC GLM DATA = meat PLOTS = NONE; /* PLOTS (ONLY) = (RESIDUALS DIAGNOSTICS); */
CLASS group;
MODEL ph cookyield = group; * Two dependent variables;
MEANS group;
TITLE 'Objective 7.1 and 7.2 ANOVA';
RUN; QUIT;

PROC GLM DATA = meat  PLOTS (ONLY) = (RESIDUALS DIAGNOSTICS);
CLASS group;
MODEL cookyield = group;
MEANS group / CLM LSD; * Confidence Limit and Least Significant Difference; 
TITLE "Objective 7.3 ANOVA, CI's and Residuals";
RUN; QUIT;

/* Non Parametric Test: NPAR1WAY */
PROC NPAR1WAY DATA = meat WILCOXON;
WHERE group NE "T2"; * T2 group excluded;
CLASS group;
VAR ph;
TITLE "Objective 74. Wilcoxon Score";
RUN; QUIT;

PROC NPAR1WAY DATA = meat WILCOXON ANOVA PLOTS = NONE;
CLASS Group;
VAR CookYield;
TITLE 'Objective 7.5';
RUN; QUIT;

/* Non Parametric Test: RANK */
DATA six;
INPUT X Y Z;
DATALINES;
89 25 41 
47 33 37
73 27 37
66 25 29
50 42 37
;
PROC PRINT DATA = six; 
TITLE "Data Six";
RUN; QUIT;
PROC RANK DATA = six OUT = new6;
VAR x y z;
RANKS RX RY RZ; * Order matters, Must be VAR = RANKS; 
PROC PRINT DATA = new6;
VAR rx x ry y rz z; * Reorder variables to print ;
TITLE 'Objective 7.6';
RUN; QUIT;

TITLE 'Objective 7.7';
PROC RANK DATA = six OUT = high TIES = HIGH;
VAR x y z;
RANKS rx ry rz; * Order matters, Must be VAR = RANKS; 
PROC PRINT DATA = high ;
VAR rx x ry y rz z; * Reorder variables to print ;
TITLE 'Objective 7.7 (TIES = HIGH)';
RUN; QUIT;

PROC RANK DATA = six OUT = highdes TIES = HIGH;
VAR x y z;
RANKS rx ry rz; * Order matters, Must be VAR = RANKS; 
PROC PRINT DATA = highdes ;
VAR rx x ry y rz z; * Reorder variables to print ;
TITLE 'Objective 7.7 (TIES = HIGH DESCENDING)';
RUN; QUIT;

PROC RANK DATA = six OUT = low TIES = HIGH;
VAR x y z;
RANKS rx ry rz; * Order matters, Must be VAR = RANKS; 
PROC PRINT DATA = low ;
VAR rx x ry y rz z; * Reorder variables to print ;
TITLE 'Objective 7.7 (TIES = LOW)';
RUN; QUIT;

PROC RANK DATA = six OUT = lowdes TIES = HIGH;
VAR x y z;
RANKS rx ry rz; * Order matters, Must be VAR = RANKS; 
PROC PRINT DATA = lowdes;
VAR rx x ry y rz z; * Reorder variables to print ;
TITLE 'Objective 7.7 (TIES = LOW DESCENDING)';
RUN; QUIT;

PROC RANK DATA = six OUT = SixA;
VAR x;
RANKS rx;
TITLE 'Objective 7.8, Option 1';
RUN; QUIT;

PROC RANK DATA = six OUT = SixB;
VAR y;
RANKS ry;
PROC SORT DATA = SixA; BY x y;
PROC SORT DATA = SixB; BY x y;
TITLE 'Objective 7.8, Option 1';
RUN; QUIT;
/* Sorting the data sets by X (or RX) before merging is all that is
necessary since X has all unique values. If there were duplicate values
for X one would want to include more than one variable in the BY
statements of the SORT procedures. See Section 20.2 for information
on annotating programs with block, comments such as this. */
DATA eight;
MERGE SixA sixB; BY x y;
PROC PRINT DATA = eight;
TITLE "Objective 7.8 - Option 1";
RUN; QUIT;

PROC RANK DATA = SIX OUT = new6;
VAR x;
VAR rx;
PROC RANK DATA = new6 OUT = eight DESCENDING;
VAR y;
RANKS ry;

PROC SORT DATA = eight; BY x; * or SORT BY rx;
PROC PRINT DATA = eight; 
VAR X rx y ry z; * Optional Statement to order variables;
TITLE "Objective 7.8 - Option 2.";
RUN; QUIT;
