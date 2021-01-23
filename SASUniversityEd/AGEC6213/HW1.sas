/* HOMEWORK */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR; DATA; CLEAR;';
TITLE;
FOOTNOTE;

DATA ONE;
	/* INFILE '\Users\bmishra\Dropbox\OSU\PhD\Semester VI, Spring 2021\AGEC 6213 (Dropped)\Assignments\HW1\Nuclear Cost\nuclear.txt' DELIMITER='09'X; */
	INPUT C D T1 T2 S PR NE CT BW N PT;
	DATALINES;
	1 2 3 4 5 6 7 8 9 
	;
	logc = log(c);
	logn=log(n);
	logs=LOG(S);
	logt1=LOG(T1);
	logt2=LOG(T2);
RUN;

PROC PRINT DATA=ONE;
PROC REG;
	MODEL logc=pt ct logn logs d ne logt1 logt2 pr bw;
	MODEL logc=pt ct logn logs d ne;
	RUN;

PROC IML;
	USE ONE;
	READ ALL VAR {PT CT LOGN LOGS D NE LOGT1 LOGT2 PR BW} INTO EXOG;
	READ ALL VAR {LOGC} INTO Y;
	INTERCEPT=J (NORW(Y), 1, 1);
	X=INTERCEPT || EXOG;
	RNAME={'Constant' 'PT' 'CT' 'LOGN' 'LOGS' 'D' 'NE' 'LOGT1' 'LOGT2' 'PR' 'BW'};

	DO ii=1 TO 2;
		DF=NROW (X) - NCOL(X);
		BHAT=INV (X'* X)* X'*Y;
		E=Y - X*BHAT;
		SIG=E'*E/DF;
		VARCON = SIG * INV (X'* X);
		SE=SQRT(VECDIAG(VARCOV));
		CNAME={'ESTIMATE' 'STD ERROR'};
		OUT=BHAT|SE;
		PRINT OUT [ROWNAME=RNAME COLNAME=CNAME];
		X=X[, 1:7];
	END;
	STOP;
	QUIT;