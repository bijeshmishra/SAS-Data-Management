DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';

DATA prac2;
	INPUT program $ gender $ time @@;

	/* Variables, $ = Character, @@ = Value Reoccuring */
	DATALINES;
R M 55.7 B M 64.3 B M 48.9 T F 67.2
T F 65.6 T F 60.5 R M 72.0 R M 52.7
B F 83.5 B F 61.8 B F 66.4 R F 51.2
R F 49.6 T M 78.1 B M 54.2 T F 74.1
T M 71.2 B M 56.9 B F 68.4 R M 50.9
R F 45.7 T M 69.9 B M 77.5 R F 53.4
;

PROC PRINT DATA=prac2;
	TITLE " Practice 2, Data, Bijesh Mishra";
	FOOTNOTE "STAT 5193: SAS & R";

PROC UNIVARIATE DATA=prac2;
	VAR time;
	TITLE " Practice 2, Problem 1, Bijesh Mishra";
	TITLE2 " Default summary statistics for entire data.";
	FOOTNOTE "STAT 5193: SAS & R";
	OUTPUT OUT=checkA MEAN=timeMean MEDIAN=TimeMedian VAR=TimeVariance STD=TimeSTD 
		MAX=TimeMax MIN=TimeMin;

PROC PRINT DATA=checkA;
	TITLE "Practice 2, Problem 4i (Ext. 1), Bijesh Mishra";
	TITLE2 "Print mean, median and variance for time modifing 1.";
	FOOTNOTE "STAT 5193: SAS & R";

PROC SORT DATA=prac2;
	BY gender;
	* ODS SELECT BASICINTERVALS;

	/* Generates basic interval table only. */
PROC UNIVARIATE DATA=prac2 CIBASIC (ALPHA=0.02);
	CLASS gender;
	VAR time;
	TITLE " Practice 2, Problem 2, Bijesh Mishra";
	TITLE2 " Include 98% CI for mean for each gender class using CLASS statement. Is sorting necessary?";
	TITLE3 " Note: Sort before calculating CI.";
	FOOTNOTE "STAT 5193: SAS & R";
	OUTPUT OUT=checkB MEAN=timeMean MEDIAN=TimeMedian VAR=TimeVariance STD=TimeSTD 
		MAX=TimeMax MIN=TimeMin;

PROC PRINT DATA=checkB;
	TITLE "Practice 2, Problem 4ii (Ext. 2), Bijesh Mishra";
	TITLE2 "Print mean, median and variance for time modifing 2.";
	FOOTNOTE "STAT 5193: SAS & R";

PROC SORT DATA=prac2;
	BY gender;
	ODS SELECT HISTOGRAM;

	/* Generates histograms only */
PROC UNIVARIATE DATA=prac2;
	HISTOGRAM Time / NORMAL(PERCENTS=20 40 60 80 MIDPERCENTS) ODSTITLE=TITLE;
	VAR time;
	BY gender;
	INSET N NORMAL (KSDPVAL) / POS=NE FORMAT=6.3;
	TITLE " Practice 2, Problem 3, Bijesh Mishra";
	TITLE2 " For each gender, include histogram for the time variable, overlay normal curve.";
	TITLE3 "Note: Sorting might be necessary if sorting is not done previously.";
	FOOTNOTE "STAT 5193: SAS & R";
	OUTPUT OUT=checkC MEAN=timeMean MEDIAN=TimeMedian VAR=TimeVariance STD=TimeSTD 
		MAX=TimeMax MIN=TimeMin;

PROC PRINT DATA=checkB;
	TITLE "Practice 2, Problem 4iii (Ext. 3), Bijesh Mishra";
	TITLE2 "Print mean, median and variance for time modifing 3.";
	FOOTNOTE "STAT 5193: SAS & R";
RUN;
DM 'SAVE '
DM 'LOG; CLEAR;'
QUIT;