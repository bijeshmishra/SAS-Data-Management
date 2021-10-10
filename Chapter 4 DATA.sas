DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE; FOOTNOTE;
DATA fish;
INPUT ID Location $ Length Weight Age Gender $;
Length_in = Length/25.4;
Gender2 = LOWCASE(Gender); * Lower Case: Obj. 4.4;
Gender3 = UPCASE(Gender); * Upper Case;
Location = PROPCASE(Location); * Proper Case: Obj. 4.5;
State = "OK";

IF length < 60 THEN Size = 'Small';
ELSE size = 'Large';
IF age LE 2.0 THEN Group = 1;
IF 2.0 < age < 3.0 THEN Group = 2;
IF age GE 3.0 THEN Group = 3;
IF location = "payne" THEN Lake = 'CB';

DATALINES;
23 payne 75 24 2.5 f
41 payne 68 16 2 m
17 payne 57 12 1.5 F
33 payne 45 14 0.5 m
18 payne 71 20 3 F
77 payne 60 19 2.5 f
;
PROC PRINT	DATA = fish;
TITLE 'Objective 4.1';
RUN; QUIT;

PROC SORT DATA = fish; BY gender;
PROC PRINT DATA = fish; BY gender;
TITLE 'Objective 4.3 & 4.4';
RUN; QUIT;

PROC PRINT	DATA = fish;
WHERE weight LE 15;
TITLE 'Objective 4.6';
TITLE2 ' Observations with Weight <= 15';
RUN; QUIT;

PROC PRINT	DATA = fish;
WHERE gender = 'm';
VAR length length_in weight;
TITLE 'Objective 4.6';
TITLE2 ' Summary Statistics for Males';
RUN; QUIT;

PROC PRINT DATA = fish NOOBS;
VAR location state length_in weight gender;
TITLE 'Objective 4.5';
RUN; QUIT;

DATA Grades;
INPUT Name $ ID Exam1 Exam2 Exam3 Q1 Q2 Q3 Q4 Q5;
ExamTotal1 = SUM(exam1, exam2, exam3);
ExamTotal2 = exam1 + exam2 + exam3;
ExamsN = N(exam1, exam2, exam3); * Number of exams completed;
ExamAvg1 = MEAN(exam1, exam2, exam3);
ExamAvg2 = (exam1 + exam2 + exam3)/ExamsN;
MinQuiz = MIN(q1, q2, q3, q4, q5);
Best4QuizTotal = SUM (q1, q2, q3, q4, q5) - MIN(q1, q2, q3, q4, q5);
Best4QuizTotal1 = SUM (q1, q2, q3, q4, q5) - MinQuiz;
DATALINES;
Bill 123000000 85 88 84 20 22 16 . 21
Helen 234000000 96 90 89 16 25 20 18 22
Steven 345000000 80 92 82 19 24 19 20 21
Caria 456000000 65 78 74 18 20 23 20 24
Dana 567000000 97 94 . 22 17 24 18 20
Lisa 789000000 81 88 92 15 20 22 18 19
;
PROC PRINT DATA = Grades NOOBS;
VAR name exam1 exam2 exam3 examtotal1 examtotal2 examsn examavg1 examavg2;
TITLE 'Objective 4.2';
TITLE3 'Exam Info Only';
RUN; QUIT;

PROC PRINT DATA = Grades NOOBS;
VAR name q1 q2 q3 q4 q5 best4quiztotal;
TITLE 'Objective 4.2';
TITLE3 'Quiz Info Only';
RUN; QUIT;

DATA males_fish; * Creates New Dataset males_fish; 
SET fish; 
IF gender = 'f' THEN DELETE;
TITLE 'Objective 4.7';
PROC PRINT DATA = males_fish;
RUN; QUIT;

DATA  fish; * Update Old Dataset; 
SET fish; 
Species = "darter";
TITLE 'Objective 4.8';
PROC PRINT DATA = FISH;
RUN; QUIT;

/* Combine/Merge Two Datasets */
DATA fish_noble;
INPUT ID Lake $ Gender $ Weight Length Age;
Length_in = length/25.4;
Location = "Noble";
State = "OK";
DATALINES;
83 PRY f 20 61 2
72 MCM m 24 80 3
30 MCM m 19 69 1.5
46 pry f 18 50 2.5
78 MCM f 19 54 2
;
PROC PRINT DATA = fish_noble; 
TITLE 'Objective 4.9';
RUN; QUIT;
DATA combine;
SET fish fish_noble;
PROC PRINT DATA = combine;
TITLE 'Objective 4.9';
PROC MEANS DATA = combine;
CLASS location;
RUN; QUIT;
