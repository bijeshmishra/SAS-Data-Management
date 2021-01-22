DM 'LOG; CLEAR; ODSRESULTS; CLEAR; OUTPUT; CLEAR; PGM; CLEAR; ';
TITLE; FOOTNOTE;

DATA prac1;
	INPUT group color $ time @@;

	DATALINES;
1 Red 115.3 2 Green 93.4 3 Blue 67.8 3 Yellow 87.2
4 Green 78.0 1 Blue 92.4 2 Blue 88.1 4 Red 97.3
3 Red 108.2 1 Green 113.5 1 Yellow 99.2 2 Red 104.5
2 Yellow 89.3 4 Yellow 75.4 4 Blue 83.9 3 Green 94.6
;

PROC PRINT DATA=prac1;
	TITLE " Practice 1, Problem 1, Bijesh Mishra";
	TITLE2 " Using the SAS DATA Step, enter data with three variables ";
	FOOTNOTE "STAT 5193: SAS & R";

/* Sort Data, Aescending group, descending time */
PROC SORT DATA=prac1;
	BY DESCENDING time;
	BY group;
PROC PRINT DATA=prac1;
	TITLE " Practice 1, Problem 2, Bijesh Mishra";
	TITLE2 
" Sort data by descending time within ascending group and print sorted data.";
	FOOTNOTE "STAT 5193: SAS & R";

/* Print data by Group */
PROC SORT DATA=prac1;
	BY group;
PROC PRINT DATA=prac1 NOOBS;
	VAR group time;
	BY GROUP;
	TITLE " Practice 1, Problem 3, Bijesh Mishra";
	TITLE2 " Print sorted data from problem 2 by group. Supress color variable and observation numbers.";
	FOOTNOTE "STAT 5193: SAS & R";

/*Sort data by color and group and print */
PROC SORT DATA=prac1;
	BY color group;

PROC PRINT DATA=prac1;
	TITLE " Practice 1, Problem 4, Bijesh Mishra";
	TITLE2 " Sort the data by color and the group within color. Print data.";
	FOOTNOTE "STAT 5193: SAS & R";
RUN;

QUIT;