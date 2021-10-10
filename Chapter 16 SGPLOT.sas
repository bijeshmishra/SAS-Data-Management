/* Chapter 16 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
/* SGPLOT procedure */
PROC SGPLOT DATA = beef3;
HBAR sex;
TITLE 'Objective 16.1 - Default Horizontal Bar Chart';
RUN;

PROC SORT DATA = beef3; BY Producer;
PROC SGPLOT DATA = beef3; BY Producer;
HBAR sex;
TITLE 'Objective 16.2 - BY Producer';
RUN;

PROC SGPLOT DATA = beef3;
WHERE Producer = 3;
HBAR sex / RESPONSE = adg STAT = MEAN ALPHA = 0.10 LIMITS = BOTH ;
TITLE 'Object-ive 16.3 - Bar Length is ADG mean' ;
TITLE2 '90% CI for ADG Mean - Producer 3';
RUN;

PROC SGPLOT DATA = beef ;
WHERE Producer = 3;
HBAR sex / RESPONSE = adg STAT = MEAN FILLATTRS = (COLOR = BLACK) ;
HbAR sex / RESPONSE = dmi STAT = MEAN BARWIDTH = 0.70 TRANSPARENCY = 0.50
FILLATTRS =(COLOR = BLACK);
TITLE 'Objective 16.4 - Overlaying Bar Charts - Producer 3';
RUN;

PROC SGPLOT DATA = beef3;
HISTOGRAM cwt ;
TITLE 'Objective 16.5 - Default Histogram';
RUN;

PROC SGPLOT DATA = beef3;
HISTOGRAM cwt;
DENSITY cwt / TYPE = N0RMAL;
TITLE 'Objective 16.6';
RUN;

PROC SGPLOT DATA = beef3;
VBOX backfat/CATEGORY = producer CONNECT = MEAN;
TITLE 'Objective 16.7';
RUN;

PROC SGPLOT DATA = beef3;
WHERE producer = 3 ;
SCATTER Y = cwt X = dmi / MARKERATTRS =(COLOR = BLACK SYMBOL = CIRCLEFILLED) ;
TITLE 'Objective 16.8 - Option 1';
RUN;
PROC SGPLOT DATA = beef3;
WHERE producer = 3 ;
SCATTER Y = CWt X = dmi / DATALABEL = sex;
TITLE 'Objective 16.8 - Option 2';
RUN;
PROC SGPLOT DATA = beef3;
WHERE producer = 3;
SCATTER Y = cwt X = dmi / MARKERCHAR = sex;
TITLE 'Objective 16.8 - Option 3';
RUN;

PROC SGPLOT DATA = beef3means;
WHERE _STAT_ = "MEAN";
SERIES Y = cwt X = producer / GROUP = sex LINEATTRS = {COLOR = BLACK PATTERN = 3);
SCATTER Y = cwt X = producer / MARKERCHAR = sex;
TITLE 'Objective 16.9';
RUN;

/* SGSCATTER procedure */
PROC SGSCATTER DATA = beef3;
COMPARE Y = (cwt rea backfat) X = (dmi adg) / GRID
MARKERATTRS = (SYMBOL = CIRCLE COLOR = BLACK) ;
TITLE 'Objective 16.10';
RUN;

PROC SGSCATTER DATA = beef3;
MATRIX cwt rea backfat dmi adg /MARKERATTRS = (SYMBOL = CIRCLE COLOR = BLACK) ;
TITLE 'Objective 16.11';
RUN;

/* SGPANEL procedure */
PROC SGPANEL DATA = beef3;
PANELBY producer;
VBAR sex / FILLATTRS = (COLOR = WHITE);
TITLE 'Objective 16.12';
RUN;

PROC SGPANEL DATA = beef3;
PANELBY producer / LAYOUT = COLUMNLATTICE ;
VBAR Sex / RESPONSE adq STAT = MEAN FILLATTRS = (COLOR = LIGHTGRAY) ;
TITLE 'Objective 16.13' ;
RUN;

PROC SGPANEL DATA = beef3;
PANELBY producer sex / LAYOUT = LATTICE;
HISTOGRAM cwt;
DENSITY cwt / TYPE = NORMAL;
TITLE 'Objective 16.14';
RUN;

PROC SGPANEL DATA = beef3;
PANELBY producer sex / LAYOUT = LATTICE ROWHEADPOS = BOTH;
VBOX backfat / CATAGORY = producer CONNECT = MEAN;
TITLE 'Objective 16.l5',-
RUN;
