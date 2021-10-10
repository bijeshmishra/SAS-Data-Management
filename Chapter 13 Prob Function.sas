/* Chapter 13 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
/* 13.1: Discrete Probability Distribution */
/* 13.1.1: Binomial Distribution */
* PROBBNML (p, n, m);
* p = Probability of Success;
* n = # of Independent Trials, n > 0.
* m = # of Success in Trials 0 <= m <= n;
DATA one;
a = PROBBNML (0.3, 8, 5);  						               * P(Y <= 5);
b = PROBBNML (0.3, 8, 5) - PROBBNML (0.3, 8, 4);  	            * P(Y = 5);
c = PROBBNML (0.3, 8, 6) - PROBBNML (0.3, 8, 3);  	  	   * P(4 <= Y = 6);
d = 1 - PROBBNML (0.3, 8, 3);  		* P(Y > 3) = P(Y >= 4) = 1 - P(Y <= 3);
PROC PRINT DATA = one;
TITLE "Objective 13.1: Binomial Probability Distribution";
RUN; QUIT;

/* 13.1.2: Poisson Distribution */
* POISSON (m, n);
* m = Mean, m > 0;
* n = Value of random variable Y, n = 0 ... INF;
DATA two;
a = POISSON(5.2, 7);					* P(Y <= 7);
b = POISSON(5.2, 7) - POISSON(5.2, 6);	 * P(Y = 7);
c = 1 - POISSON(5.2, 0);				 * P(Y = 0);
PROC PRINT DATA = two;
TITLE " Objective 13.2: Poisson Probability Distribution";
RUN; QUIT;

/* 13.2: Continuous Probability Distribution */
/* 13.2.1: The Normal Distribution */
* PROBNORM(x);
* x = Numeric value of standard normal random variable.
* PROBIT(p);
* p = Numeric Probability, 0 < p < 1;

DATA three;
a = PROBNORM(-1) - PROBNORM(-2); 	* p(Z < -1) - p(Z < -2);
b = 1 - PROBNORM(2);			 	* p(Z > 2) = 1 = p(z < 2);
c = PROBIT (0.90);					* 0.90 = p( Z < c);
d = PROBNORM(1.645);				* p(Z < 1.645);
;
PROC PRINT DATA = three;
TITLE " Objective 13.3";
RUN; QUIT;

/* 13.2.2: The t Distribution */
* PROBT (x, df, <, nc>);
* x = numeric random variable.
* df = degree of freedom;
* nc = non-centrality parameter, nc >= 0;

/* Inverse of T-Distribution */
* TINV (p , df, <,nc>);
* p = numeric probability, 0 < p < 1;
* df = degree of freedom , df > 0;
* nc = Non-centrality parameter, nc >= 0;

/* 13.2.3: Chi Squared Distribution */
* PROBCHI (x, df, <,nc>);
* x = numeric random variable.
* df = degree of freedom;
* nc = non-centrality parameter, nc >= 0;

/* Inverse of Chi Squared Distribution */
* CINV (p , df, <,nc>);
* p = numeric probability, 0 < p < 1;
* df = degree of freedom , df > 0;
* nc = Non-centrality parameter, nc >= 0;

/* 13.2.2: The F Distribution */
* PROBF (x, ndf, ddf, <, nc>);
* x = numeric random variable.
* ndf = Numerator degree of freedom;
* ddf = Denominator degree of freedom;
* nc = non-centrality parameter, nc >= 0;

/* Inverse of F Distribution */
* FINV (p, ndf, ddf, <,nc>);
* p = numeric probability, 0 < p < 1;
* ndf = Numerator degree of freedom;
* ddf = Denominator degree of freedom;
* nc = Non-centrality parameter, nc >= 0;

DATA four;
a = TINV (0.88, 14);			* p(t > a) = 0.12 or 0.88 = p(t < a), df = 14;
b = 1 - PROBT (2.104, 20);		* p( t > 2.104, df = 20) = b;
c = CINV (0.96, 14);			* p(x2 > c) = 0.04 or p(x2 < c) = 0.96;
d = 2 *(1- PROBCHI(17.04, 6));  * 2p(x2 > 17.04) = d,  df = 6;
e = 1 - PROBF (7.83, 4, 16);	* 1 - p (F > 7.78) = e, ndf = 4, ddf = 16;
f = FINV(0.97, 4, 16);			* 0.03 = P(F > f), ndf = 4, ddf = 16 ;
PROC PRINT DATA = four;
TITLE " Objective 13.4";
RUN; QUIT;

