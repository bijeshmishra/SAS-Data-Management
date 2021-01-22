DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE;
FOOTNOTE;

DATA assign1;
	INPUT Program $ Gender $ Time @@;
	DATALINES;
R M 55.7 B M 64.3
B M 48.9 T F 67.2
T F 65.6 T F 60.5
R M 72.0 R M 52.7
B F 83.5 B F 61.8
B F 66.4 R F 51.2
R F 49.6 T M 78.1
B M 54.2 T F 74.1
T M 71.2 B M 56.9
B F 68.4 R M 50.9
R F 45.7 T M 69.9
B M 77.5 R F 53.4
;

PROC PRINT DATA=assign1;
	TITLE "Assignment 1, Problem 1, Bijesh Mishra";
	TITLE2 "Q: Enter data and create one dataset.";
	FOOTNOTE "STAT 5193: SAS & R";

PROC SORT DATA=assign1;
	BY Gender Program;

PROC PRINT DATA=assign1 NOOBS;
	VAR Gender Program Time;
	TITLE "Assignment 1, Problem 2, Bijesh Mishra";
	TITLE2 "Q: Sort data by gender and then program within gender. Print in order gender, program & time. Supress obs #.";
	FOOTNOTE "STAT 5193: SAS & R";

PROC PRINT DATA=assign1 NOOBS;
	VAR Gender Program Time;
	BY Gender;
	TITLE "Assignment 1, Problem 3, Bijesh Mishra";
	TITLE2 "Q: Print sorted data above by gender. Supress obs #.";
	FOOTNOTE "STAT 5193: SAS & R";

PROC SORT DATA=assign1;
	BY Program DESCENDING Time;

PROC PRINT data=assign1 NOOBS;
	BY PROGRAM;
	VAR Time Gender Program;
	TITLE "Assignment 1, Problem 4, Bijesh Mishra";
	TITLE2 "Q: Sort by program descending time within program. Print by program. print in: order time gender.";
	FOOTNOTE "STAT 5193: SAS & R";
RUN;

QUIT;