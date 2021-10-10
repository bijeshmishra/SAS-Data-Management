/* Chapter 12 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE "Objective 12.1";
DATA one;
INPUT X Y Z;
DATALINES;
25 27 34
28 31 29
41 58 29
37 28 83
;
RUN; QUIT;

LIBNAME SasLib "C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book";
DATA SasLib.one;
INPUT X Y Z;
DATALINES;
25 27 34
28 31 29
41 58 29
37 28 83
;
PROC PRINT DATA = SasLib.one;
TITLE "Objective 12.2";
RUN; QUIT;

/* Using Permanent SAS Library */
LIBNAME SasLib "C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book";
/* Run the Procedure After this line */
PROC MEANS DATA = SasLib.one;
RUN; QUIT;
