/* Chapter 18 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE "Chapter 18, Bijesh Mishra";
DATA one;
INPUT ID exp Salary Region Gender BS MS PhD Group $;
salary2 = salary*1000; *convert salary in Sthousands to dollars;
LABEL exp = "Work Experience" salary = "Salary ($thousands) "
region = "Region of US";
DATALINES;
000171831 8.5 41.5 1 1 1 1 2 E
077889999 10 53.4 3 2 1 1 1 E
111223333 13 65.0 4 . 1 1 2 B
222334444 20 75.0 2 3 2 1 1 S
/
RUN;
PROC FORMAT;
*** templates for the ID and Salary variables ***;
PICTURE a OTHER = '000-00-0000' (FILL = "0");
PICTURE b OTHER = '000.00';
PICTURE c OTHER = '000000' (PREFIX = '$');

*** create salary intervals for original salary variable ***;
VALUE salfmt low - 49.9 = 'Below 50,000'
			 50.0 - 59.9 = '50,000 - 60,000'
			 60 - high = '60,000 and over';

			 *** Identify numerical regions to parts of the US ***;
VALUE regfmt 1 = 'Northwest'
			 2 = 'Central'
			 3-4 = 'Southern';

*** Note that a format can assist with missing or miscoded values***;
VALUE gen 1 = 'Male'
		  2 = 'Female'
		  . = 'Missing value'
          OTHER = 'Miscoded';

*** Format can translate numerica values into antoher language if needed ***;
VALUE degree 1 = "yes" 2 = "No";
VALUE degree 1 = "Da" 2 = "Nyet"; * Yes/No Russian;
VALUE degree 1 = "Si" 2 = "No"; * Yes/No Spanish;

*** $ is needed to create a format when the responeses are character strings ***;
VALUE $grp "E" =  "Engineering"
		   "B" =  "Business"
		   "S" =  "Science";

PROC PRINT DATA:= one ;
FORMAT id a. salary b.;
TITLE 'Objective 18.1' ;
RUN;

PROC PRINT DATA=one LABEL;
VAR id exp salary salary2 region gender bs ms phd group;
format id SSN. salary salfmt. salary2 c. region regfmt. gender gen.
bs ms phd degree, group $grp.;
TITLE 'Objective 18.2' ;
RUN;

PROC FORMAT;
VALUE likert 1 = "Strongly Disagree"
			 2 = "Disagree"
			 3 = "Neutral"
			 4 = "Agree"
			 5 = "Strongly Agree";
PROC PRINT DATA = one;
VAR id salary2 salary;
FORMAT is SSN.salary2 DOLLAR9.2 salary 7.3;
TITLE 'Objective 18.3';
RUN;

LIBNAME demo ' G:\CLGoad\' ;
PROC FORMAT;
VALUE $sexfmt "H" = "Heifers" "S" = "Steers";
VALUE pfmt 1= "Rocking K Ranch" 2="Superior Beef Co." 3 = "Royal Beef
Producers";
GOPTION RESET = ALL; * restore the default graph settings;

PROC GCHART DATA = demo.beef 3;
VBAR sex / GROUP = producer ;
TITLE 'Objective 18.4' ;
PATTERN1 VALUE = SOLlD COLOR = GRAY;
FORMAT sex $sexfmt. producer pfmt. ;
RUN;

PROC MEANS DATA=demo.beef3 MEAN RANGE;
CLASS sex producer;
VAR dmi rea;
TITLE 'Object:ive 18.5';
FORMAT sex $sexfnit. producer pfmt. ;
*CLASS producer sex; * Change class to see difference;
RUN;

