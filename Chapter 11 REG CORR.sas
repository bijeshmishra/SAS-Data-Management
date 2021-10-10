/* Chapter 11 */
/* The REG Procedure */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
DATA beef;
INFILE "C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Data\BookData\beef data set Table 11_2.sas";
INPUT DMI ADG CWT BackFat REA @@;
PROC REG DATA = beef;
MODEL cwt = dmi;
TITLE "Objective 11.1";
RUN; QUIT;

PROC REG DATA = beef PLOTS = NONE;
MODEL cwt = dmi/ CLB ALPHA = 0.01;
slope9_2: TEST dmi = 9.2;
Intercept500: TEST INTERCEPT = 500;
TITLE "Objective 11.2";
RUN; QUIT;

DATA Obj11_3;
INPUT DMI @@;
DATALINES;
18 20 22
;
DATA beef2;
SET Obj11_3 beef;
RUN; QUIT;
PROC REG DATA = beef2 PLOTS (ONLY) = FIT;
MODEL cwt = dmi / P CLI CLM ALPHA = 0.01;
ID dmi;
TITLE "Objective 11.3";
RUN; QUIT;

/* The CORR Procedure */
PROC CORR DATA = beef;
VAR dmi adg cwt backfat rea;
TITLE "Objective 11.4";
RUN; QUIT;

PROC CORR DATA = beef;
VAR cwt;
WITH backfat rea;
TITLE "Objective 11.5 (Option 1)";
RUN; QUIT;

PROC CORR DATA = beef;
VAR backfat rea;
WITH cwt;
TITLE "Objective 11.5 (Option 2)";
RUN; QUIT;

PROC CORR DATA = beef SPEARMAN PLOTS = MATRIX(HISTOGRAM);
VAR dmi adg cwt;
TITLE "Objective 11.6";
RUN; QUIT;
