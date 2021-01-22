/* HOMEWORK */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE;
FOOTNOTE;

DATA hw1;
INFILE 'PATH.TXT, DELIMITER = " "'

INPUT var1 var2;
DATALINES;
1 2 3 A
;
logc = log(c);
logn = log(n);

PROC REG;
MODEL logc = pt ct logn logs d ne logt1 logt2 pr bw;
MODEL logc = pt ct logn logs d ne;
RUN;

PROC IML;
USE hw1;
READ ALL VAR()