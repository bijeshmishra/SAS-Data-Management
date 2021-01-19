DM 'LOG; CLEAR; ODSRESULTS; CLEAR; OUTPUT CLEAR; PGM; CLEAR;";
TITLE; FOOTNOTE;

/*Data Management */
/*Enter Data */
DATA prac1;
	/* Name of Dataset */
	INPUT group color $ time @@;

	/* Variables, $ = Character, @@ = Value Reoccuring */
	DATALINES;
1 Red 115.3 2 Green 93.4 3 Blue 67.8 3 Yellow 87.2
4 Green 78.0 1 Blue 92.4 2 Blue 88.1 4 Red 97.3
3 Red 108.2 1 Green 113.5 1 Yellow 99.2 2 Red 104.5
2 Yellow 89.3 4 Yellow 75.4 4 Blue 83.9 3 Green 94.6
;

PROC PRINT DATA=prac1;
	/* Print Data */
	TITLE " Practice 1, Problem 1, Bijesh Mishra";

	/*Upto TITLE9 */
	TITLE2 " Using the SAS DATA Step, enter data with three variables ";
	FOOTNOTE "STAT 5193: SAS & R";

	/* Sort Data, Aescending group, descending time */
PROC SORT DATA=prac1;
	BY DESCENDING time;
	BY group;
