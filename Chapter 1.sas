/* Goad, 2021. SAS programming */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR; OUTPUT; CLEAR;';
TITLE; FOOTNOTE;

DATA one;
INPUT Name $ Fine;
DATALINES;
Lynn 50
Evan 70
Thomas 24
Wesley 44
Marie 30
;
PROC PRINT DATA = one;
TITLE 'Objective 1.1; Outstanding Parking Fines';
PROC MEANS DATA = one;
VAR fine;
RUN;
QUIT;

FILE C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\Chapter1.sas
