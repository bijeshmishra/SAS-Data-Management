DM 'LOG; CLEAR; ODSRESULTS; CLEAR; OUTPUT; CLEAR; PGM; CLEAR; ';
TITLE; FOOTNOTE;

/* Data Management: Enter Data */
DATA prac1; /* Name of Dataset */
	INPUT group color $ time @@; /* Variables, $ = Character, @@ = Value Reoccuring */
	DATALINES;
1 Red 115.3 2 Green 93.4 3 Blue 67.8 3 Yellow 87.2
;

PROC PRINT DATA=prac1;
	/* Print Data */
	TITLE " Practice 1, Problem 1, Bijesh Mishra";

	/*Upto TITLE9 */
	TITLE2 " Using the SAS DATA Step, enter data with three variables ";
	FOOTNOTE "STAT 5193: SAS & R";
