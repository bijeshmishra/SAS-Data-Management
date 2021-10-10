/* Chapter 10 */
DM ' LOG; CLEAR; ODSRESULTS; CLEAR;';
DATA gradebook;
INPUT Student $ 9. ID Group Hw1 Hw2 Ex1 Hw3 Hw4 Ex2;
HwTotal = SUM (HW1, HW2, HW3, HW4);
ExTotal = SUM (Ex1, Ex2);
CourseTL = SUM (HwTotal, ExTotal);
LABEL HwTotal = "Homework Points Total"
      ExTotal = "Exam Score Total"
	  Course TL = " Point Total for the Course";
DATALINES;
Total     . . 75 110 100 50 25 100
Dave      101 1 71 88 93 46 23 88
Lynn      381 2 64 96 95 48 25 .
Michael   987 2 68 75 97 35 12 60
Leslie    579 3 55 75 81 . 17 82
Andrew    239 1 70 79 77 38 23 77
Elizabeth 128 3 67 103 94 42 20 92
;
PROC PRINT DATA = gradebook LABEL;
TITLE "Objective 10.1";
RUN; QUIT;

DATA gradebook;
SET gradebook;                         * max points = 460;
IF CourseTL GE 414 THEN Grade = "A";   * 460*0.90 = 414 Lowest A;
ELSE IF 368 LE CourseTL LE 413 THEN Grade = "B";   * 460*0.80 = 368 Lowest B;
ELSE IF 322 LE CourseTL LE 367 THEN Grade = "B";   * 460*0.70 = 322 Lowest C;
ELSE IF 276 LE CourseTL LE 321 THEN Grade = "D";   * 460*0.60 = 276 Lowest D;
ELSE Grade = "F";
IF Student = "Total" THEN Grade = " ";

DM 'ODSRESULTS; CLEAR;';
PROC PRINT DATA = gradebook LABEL NOOBS;
TITLE "Objective 10.1";
TITLE2 ' PRINT Procedure with LABEL Options';
TITLE3 "Including new Variabels";
RUN; QUIT;

DM 'ODSRESULTS; CLEAR;';
PROC FREQ DATA = gradebook NLEVELS;
WHERE Student NE "Total";
TABLES Grade;
TITLE "Objective 10.2";
TITLE2 "FREQ Procedure with NLEVELS Options";
TITLE3 "One-way Table";
RUN; QUIT;

DM 'ODSRESULTS; CLEAR;';
PROC FREQ DATA = gradebook NLEVELS;
WHERE Student NE "Total";
TABLES Group*Grade/ NOPERCENT NOROW NOCOL;
TITLE "Objective 10.3";
TITLE2 "Two-way Table with NLEVELS Option";
RUN; QUIT;

DM ' ODSRESULTS; CLEAR;';
PROC FREQ DATA = gradebook;
WHERE Student NE "Total";
TABLES Group*Grade/ CROSSLIST;
TITLE "Objective 10.4";
TITLE2 "FREQ Procedure: Two-way Table with CROSSLIST Option";
RUN; QUIT;

PROC FREQ DATA = gradebook;
WHERE Student NE "Total";
TABLES Group*Grade/ LIST;
TITLE "Objective 10.4";
TITLE2 "FREQ Procedure: Two-way Table with LIST Option";
RUN; QUIT;

DM ' ODSRESULTS; CLEAR;';
PROC MEANS DATA = gradebook MEAN MIN MAX N;
WHERE Student NE "Total";
VAR HwTotal ExTotal CourseTL;
TITLE "Objective 10.5";
TITLE2 "MEANS Procedure with no CLASS Statement ";
RUN; QUIT;

PROC MEANS DATA = gradebook MEAN MIN MAX N;
WHERE Student NE "Total";
CLASS group;
VAR HwTotal ExTotal CourseTL;
TITLE "Objective 10.6";
TITLE2 "Group is identified as CLASS Variable";
RUN; QUIT;

/* The REPORT Procedure */
DM ' ODSRESULTS; CLEAR;';
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Student HWTotal ExTotal CourseTL Grade;
RBREAK AFTER / SUMMARIZE; * summarize at the end;
TITLE " Objective 10.7";
TITLE2 " REPORT Procedure with a RBREAK Statement";
RUN; QUIT;

* Does same thing as above;
PROC PRINT DATA = gradebook NOOBS LABEL;
WHERE Student NE "Total";
VAR Student HWTotal ExTotal CourseTL Grade;
SUM HWTotal ExTotal CourseTL;
TITLE " Objective 10.7";
TITLE2 " PRINT Procedure with a SUM Statement";
RUN; QUIT;

DM ' ODSRESULTS; CLEAR;';
PROC SORT DATA  = gradebook; BY Grade DESCENDING CourseTL;
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
BY Grade;
COLUMN Student hwtotal extotal CourseTL grade;
RBREAK AFTER / SUMMARIZE;
TITLE " Objective 10.8";
TITLE2 "REPORT Procedure: Ordered Grade List";
RUN; QUIT;

* Does same thing as above;
PROC PRINT DATA = gradebook NOOBS LABEL;
WHERE Student NE "Total";
BY Grade;
VAR Student hwtotal extotal CourseTL grade;
SUM hwtotal extotal CourseTL;
TITLE " Objective 10.8";
TITLE2 "PRINT Procedure: Ordered Grade Lists";
RUN; QUIT;

DM ' ODSRESULTS; CLEAR;';
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Student hwtotal extotal CourseTL grade;
DEFINE Grade / GROUP;
DEFINE CourseTL / ORDER DESCENDING;
TITLE " Objective 10.9";
TITLE2 "REPORT Procedure: One Ordered Grade List";
TITLE3 " Option 1";
RUN; QUIT;

* Different arrangement of variabels;
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Student Grade hwtotal extotal CourseTL;
DEFINE Grade / GROUP;
DEFINE CourseTL / ORDER DESCENDING;
TITLE " Objective 10.9";
TITLE2 "REPORT Procedure: One Ordered Grade List";
TITLE3 " Option 2";
RUN; QUIT;

DM 'ODSRESULTS; CLEAR;';
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Student hw1 hw2 hwtotal;
DEFINE hw1 / 'Homework 1';
DEFINE hw2 / 'Homework 2';
TITLE " Objective 10.10";
TITLE2 "Report of Homework Scores";
RUN; QUIT;

* Ordered hwtotal in above code;
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Student hw1 hw2 hwtotal;
DEFINE hw1 / 'Homework 1';
DEFINE hw2 / 'Homework 2';
DEFINE hwtotal / 'Ordered Homework Total' ORDER;
TITLE " Objective 10.11";
TITLE2 "Report of Homework Scores";
RUN; QUIT;

DM 'ODSRESULTS; CLEAR;';
PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Group Student id CourseTL grade;
DEFINE group / GROUP 'Project Group';
DEFINE id / ID 'ID #';
DEFINE hwtotal / 'Ordered Homework Total' ORDER;
TITLE " Objective 10.12";
RUN; QUIT;

PROC REPORT DATA = gradebook;
WHERE Student NE "Total";
COLUMN Group CourseTL;
DEFINE group / GROUP 'Project Group';
DEFINE CourseTL / 'Project group course average' MEAN ;
TITLE " Objective 10.13";
RUN; QUIT;
