/* Chapter 8 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
/* Objective 8.1 */
FILENAME t1 'C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\tornado1.dat';
FILENAME t2 'C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\tornado2.dat';
FILENAME t3 'C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\tornado3.dat';
DATA one;
INFILE t1;
INPUT Year Number Damage;
PROC PRINT DATA = one;
TITLE 'Objective 8.1';

DATA two;
INFILE t2 FIRSTOBS = 2;
INPUT Year Number Damage;
PROC PRINT DATA = two;
TITLE 'Objective 8.1';

DATA three;
INFILE t3;
INPUT Year 1-4 Number 5-6 Damage 7-9;
PROC PRINT DATA = three;
TITLE 'Objective 8.1';
RUN; QUIT;

/* Objective 8.2 */
DATA four;
INFILE 'C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\tornado4.dat' DLM = '09'X DSD;
INPUT Year Number Damage;
PROC PRINT DATA = four;
TITLE 'Objective 8.2';
RUN; QUIT;

/* Objective 8.3 */
DATA four;
INFILE 'C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\Course Book\tornado4.dat' DLM = '09'X DSD;
INPUT Year Number Damage;
LABEL Number = "Number of Tornadoes"
	  Damage = "Damage Assessment, X$10,0000";
PROC PRINT DATA = four;
TITLE 'Objective 8.2';
TITLE2 'Print with no LABEL options';
PROC MEANS DATA = four;
VAR number damage;
TITLE2;
RUN; QUIT;

DATA five;
SET four;
RENAME Year = Year1 Number = Number1 Damage = Damage1;
KEEP Year1 Number1;
PROC PRINT DATA = five;
TITLE 'RENAME & KEEP Demonstration';
RUN; QUIT;

DATA six;
SET four;
DROP Year;
PROC PRINT DATA = four;
TITLE 'Drop Demonstration';
RUN; QUIT;
