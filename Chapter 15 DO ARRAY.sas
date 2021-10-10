/* Chapter 15 Do loops, ARRAY, RANNOR*/
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
/* Do Loops- DO and END Statements */

TITLE "Objective 15.1 With OUTPUT Statement";
DATA loopex1;
DO Trt = 1 to 6;
DO Rep = 1 to 2;
INPUT y @@;
OUTPUT;
END;
END;
DATALINES;
12 14 18 16 12 11 17 19 20 11 13 15
;
PROC PRINT DATA = loopex1;
RUN; QUIT;

TITLE "Objective 15.2 Without OUTPUT Statement";
TITLE2 "Only last loop output was saved";
DATA loopex1_2;
DO Trt = 1 to 6;
DO Rep = 1 to 2;
INPUT y @@;
END;
END;
DATALINES;
12 14 18 16 12 11 17 19 20 11 13 15
;
PROC PRINT DATA = loopex1_2;
RUN; QUIT;

TITLE "Objective 15.3";
DATA loopex2 loopex3;
DO Trt = 1 to 6;
DO Rep = 1 to 2;
INPUT y @@;
y_log = log(y);
IF Trt <= 3 THEN OUTPUT loopex2;
ELSE OUTPUT loopex3;
END;
END;
DATALINES;
12 14 18 16 12 11 17 19 20 11 13 15
;
PROC PRINT DATA = loopex2;
TITLE "Objective 15.3 Trt 1-3 Data";
PROC PRINT DATA = loopex3;
TITLE "Objective 15.3 Trt 4-6 Data";
RUN; QUIT;

* TITLE "Objective 15.4";
DATA four;
DO p = 0.4, 0.45, 0.5;
DO y = 0 TO 6;
cp = PROBBNML (p, 6, y); *(y <= y);
IF y = 0 THEN prob = cp;
ELSE prob = PROBBNML (p, 6, y) - PROBBNML (p, 6, y-1);
* P (y = y);
OUTPUT;
END; END;
lABEL Y = "Y Success in 6 Trials"
cp = "Cumulative Probability, P(Y <= y)"
prob = " Probability, P(Y = y)";
PROC SORT DATA = four; BY p y;
PROC PRINT DATA = four LABEL NOOBS; BY p;
VAR y prob cp;
TITLE "Objective 15.4";
RUN; QUIT;

* TITLE "Objective 15.4";
DATA a;
r = 16;
DO WHILE (r < 20);
r + 1;
OUTPUT;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

DATA a;
r = 16;
DO WHILE (r < 20);
r + 1;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

DATA a;
r = 16;
DO WHILE (r <= 20);
r + 1;
OUTPUT;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

DATA a;
r = 16;
DO WHILE (r < 20);
r + 1;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

DATA a;
r = 16;
DO WHILE (r >= 20);
r + 1;
OUTPUT;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

DATA a;
r = 16;
DO WHILE (r > 20);
r + 1;
END;
PROC PRINT DATA = a;
TITLE "Objective 15.4";
RUN; QUIT;

/* The ARRAY Statement */
DATA a;
INPUT y x1 x2 x3;
ARRAY v{3} x1 x2 x3;
DATALINES;
;
RUN; QUIT;

/* Use of ARRAY */
DATA beef; 
Input DMI ADG CWT BackFat REA @@; 
DATALINES; 
17.0090 3.05 819.000 0.54571 13.3821  17.0183 2.87 857.000 0.53974 13.7779  
17.4826 3.12 826.000 0.46000 13.5262  18.0043 2.73 831.256 . .  16.2731 2.83 799.000 0.54622 12.8589 
17.5451 2.98 850.000 0.50550 13.8188 16.6000 2.78 790.000 0.50280 13.4800 
17.1309 2.80 805.000 0.51200 12.6460  17.8689 2.85 814.000 0.49434 13.4662 
17.8994 3.03 838.000 0.53535 13.2404  18.4669 3.04 806.563 . . 16.7834 2.86 835.000 0.50667 13.8126 
17.7115 2.94 844.000 0.45829 13.6686 16.5675 2.94 810.000 0.57653 12.6427 
17.2382 2.90 822.000 0.54649 12.9730 18.9442 3.12 826.000 0.53853 13.4189 
17.6088 2.96 850.000 0.53351 13.0730 19.3759 3.19 842.000 0.46176 13.8103 
16.5377 2.82 829.000 0.54061 13.6045 17.6711 2.98 807.000 0.48278 12.9250 
18.5135 3.09 824.000 0.50319 13.1232 16.3334 2.86 823.000 0.50861 13.7305 
16.9373 2.91 818.000 0.52319 13.1000 17.5444 2.91 816.000 0.45947 13.4447 
18.2698 2.98 831.172 0.51020 13.2291 18.6745 3.16 844.000 0.45442 14.3259 
17.7172 3.01 848.000 0.54147 13.7000 19.8536 3.21 820.397 0.46944 13.9285 
21.1642 3.59 836.000 0.51452 14.7292 21.2228 3.49 866.878 0.52544 14.8798 
22.2457 3.61 888.000 0.54220 14.6725 23.3023 3.56 892.000 0.48324 13.6784 
24.5569 3.68 885.000 0.47611 13.5639 19.7097 3.47 854.000 0.58245 13.9235 
20.1899 3.37 842.000 0.58304 13.1376 17.9807 2.92 798.000 0.47350 13.4375 
17.8008 2.84 817.000 0.52578 12.8422 17.3405 2.88 817.000 0.48162 13.6371 
18.2908 2.76 796.000 0.47315 13.4815 18.7467 2.88 842.000 0.50133 14.5440 
19.0026 3.84 939.000 0.58390 14.4117 18.4399 2.80 831.000 0.46667 14.1912 
17.0606 1.53 701.000 0.39456 12.3437 18.2209 2.98 848.000 0.52294 14.4610 
16.5719 2.92 807.000 0.49563 14.1172 17.8575 2.80 792.000 0.46196 13.6490 
18.2689 3.10 847.000 0.49333 14.8190 18.8171 3.04 846.000 0.46959 13.4986 
19.8960 2.90 800.000 0.49308 13.7439 20.8472 3.36 858.000 0.51261 14.2328 
22.6299 3.38 896.000 0.53629 14.6718 21.9390 3.44 876.000 0.51627 14.1254 
23.7774 3.62 922.000 0.53076 15.4403 23.6753 3.77 965.000 0.56481 15.9731 
21.0995 3.25 848.000 0.50533 13.4050 21.4372 3.25 859.000 0.52818 13.9649 
;
DATA beef2;
SET beef;
Adg_kg = adg/2.2046;
Dmi_kg = dmi/2.2046;
Cwt_kg = cwt/2.2046;
RUN; QUIT;
/* Equivalently */
DATA beef3;
SET beef;
ARRAY b{3} dmi adg cwt;
ARRAY c{3} Dmi_kg Adg_kg Cwt_kg;
Do i = 1 TO 3;
c{i} = b {i} / 2.2046;
END; RUN; QUIT;

* Notes: 
Double dashes (--) between variables be used to denote old variables.
Double dashes (--) between variables cannot be used to define new variables.
Generate: number of new variables = number of old variabels.;

/* Random Number Generator */
TITLE "Objective 15.7";
DATA seven;
seed1 = 2120;
seed2 = 2120;
seed3 = 2120;
DO i = 1 to 10;
CALL RANNOR (seed1, x1);
CALL RANNOR (seed2, x2);
y1 = RANNOR (seed3);
y2 = RANNOR (2120);
IF i = 6 THEN DO;
seed2 = 17;
seed3 = 17;
END; OUTPUT; END;
PROC PRINT DATA =seven;
TITLE "objective 15.7";
RUN; QUIT;

/* Continuous Distributions */
DATA dist;
SEED = 1235;
/* Normal Distribution */
x = RANNOR(seed);
CALL RANNOR (seed, x);
/* Uniform Distribution */
x = RANNOR(seed);
CALL RANUNI(seed, x);
/* Cauchy Distribution */
x = RANNOR(seed);
CALL RANCAU(seed, x);
/* Exponential Distribution */
x = RANEXP(seed);
CALL RANUNI(seed, x);
/* Gamma Distribution */
x = RANGAM(seed);
CALL RANUNI(seed, x);

DATA eight;
DO i = 1 to 10;
X = RANNOR(28374); * X ~ N(0, 1);
Y = 5 + RANNOR(39587209); * Y ~ N(5, 1);
W = SQRT(6) * RANNOR(659363); * W ~ N(0, 6);
U = 8 + SQRT(10) * RANNOR(494703); * U ~ N(8, 10);
OUTPUT;
END;
RUN;
PROC PRINT DATA = eight NOOBS N;
TITLE "Objective 15.8";
RUN; QUIT;

DATA eight;
SEED = 6474983
DO i = 1 to 10;
CALL RANNOR (seed, x); * X ~ N(0, 1);
X = 5 + x ; * Y ~ N(5, 1);
W = SQRT(6) * X; * W ~ N(0, 6);
U = 8 + SQRT(10); * U ~ N(8, 10);
OUTPUT;
END;
TITLE "Objective 15.8";
RUN; QUIT;

/* Discrete Distributions */
/* Binomial Distribution */
x = RANBIN (seed, n, p);
CALL RANBIN (seed, n, p, x);
/* Poisson Distribution */
x = RANPOI (seed, m);
CALL RANPOI (seed, m, x);
/* Tabled Probability Distribution */
x = RANTBL (seed, p1, p2, ..., pn);
CALL RANTBL (seed, p1, p2, ..., pn, x);

DATA nine;
DO Sample = 1 TO 2;
DO Day = 1 to 5;
C = RANPOI(739284, 14); * RANPOI(seed, mean);
OUTPUT;
END; END;
PROC MEANS DATA = nine;
CLASS sample;
VAR c;
TITLE 'Objective 15.9 - Option 1';
RUN; QUIT;

PROC MEANS DATA = nine;
BY sample;
VAR c;
TITLE 'Objective 15.9 - Option 2';
RUN;
