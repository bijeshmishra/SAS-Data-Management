/* Chapter 14 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
/* The IMPORT Procedure */
FILENAME fileref “path\to\file\file.xlsx”;
PROC IMPORT OUT = WORK.DEMO
DATAFILE = “path\tofile\file.xlsx” (or fileref)
DBMS = EXCEL REPLACE;
SHEET = “Sheet1$”;
GETNAMES = YES;
MIXED = NO;
SCANTEXT = YES;
USEDATA = YES;
SCANTIME = YES;
STARTROW = 10; /* In older version of excel */
LABEL X = “ Label for variable x”
      y = “ Label for variable y”;
RUN; QUIT;

/* The EXPORT Procedure */
FILENAME fileref “path\to\file\file.xlsx”;
PROC EXPORT OUT = WORK.DEMO
DATAFILE = “path\tofile\file.xlsx” (or fileref)
DBMS = EXCEL REPLACE;
SHEET = “Sheet Name”;
RUN;  QUIT;
