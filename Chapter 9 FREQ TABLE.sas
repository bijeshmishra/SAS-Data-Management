/* Chapter 9 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
DATA rtw;
INPUT EmpClass $ Opinion $ Y @@;
LABEL EmpClass = "Employment Classification"
	  Opinion = "Opinion on Right to Work"
	  Y = "Observed Frequency";
DATALINES;
I F 20 I DNF 24 I U 16
B F 40 B DNF 51 B U 9
U F 20 U DNF 15 U U 7
;
* The following FREQ procedure will count the number of occurrences;
* of the levels of the variables CLASS and OPINION *;
PROC FREQ DATA = rtw;
TABLES Opinion;
TITLE "Objective 9.1 - No WEIGHT Statement";
* The WEIGHT statement is necessary in order to get correct frequencies;
* when the counts for each level of a variable are included in the data;
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
TABLES Opinion / CHISQ;
WEIGHT Y;
TITLE "Objective 9.1 - with a WEIGHT Statement";
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
TABLES EmpClass / TESTP = (45 50 5);
WEIGHT y;
TITLE 'Objective 9.2 - Goodness of Fit Test for Employee Classification';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw;
TABLES EmpClass * Opinion / LIST;
WEIGHT y;
TITLE 'Objective 9.3 - LIST Option';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
TABLES EmpClass*Opinion / CHISQ;
WEIGHT y;
TITLE 'Objective 9.3 - Ordered Data in a Two-way Table';
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
tables EmpClass*Opinion/ CHISQ PLOTS = FREQPLOT;
WEIGHT Y;
TITLE "Objective 9.4" ;
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA; 
TABLES EmpClass*Opinion/ CHISQ PLOTS = FREQPLOT (TYPE = DOTPLOT);
WEIGHT Y;
TITLE "Objective 9.5";
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
TABLES EmpClass*Opinion/ CHISQ NOROW NOCOL NOPERCENT EXPECTED;
*The options on the TABLES statement can be in any order;
WEIGHT y;
TITLE "Objective 9.6";
RUN; QUIT;

DM 'LOG; CLEAR; ODSRESULTS; CLEAR; ';
PROC FREQ DATA = rtw ORDER = DATA;
TABLES Opinion / CHISQ; *Objective 9.1;
TABLES EmpClass / TESTP = (45 50 5); *Objective 9.2;
tables EmpClass * Opinion / LIST PLOTS = NONE; *Objective 9.6;
WEIGHT y;
TITLE "Multiple Tables";
RUN; QUIT;
