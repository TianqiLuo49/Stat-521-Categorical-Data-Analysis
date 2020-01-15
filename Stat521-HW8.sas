/* Stat 521 HW8 */

/* 1 */
title "1";
data table;
    input gender $ party $ count @@;

datalines;
female dem 762 female indep 327 female repub 468
male dem 484 male indep 239 male repub 477
;
proc freq order = data; weight count;
  tables gender*party / chisq expected;
run;


/* 2 */
title "2";
data fisher;
input poured guess count @@;
datalines;
1 1 3   1 2 1   2 1 1   2 2 3
;
proc freq; weight count;
tables poured*guess / riskdiff;
exact fisher or / alpha = 0.05;
run;


/* 3 */
title "3";
data table1;
input income $ happiness $ count @@;
datalines;
aboveaverage nottoohappy 21   aboveaverage prettyhappy 159 aboveaverage veryhappy 110
average nottoohappy 53       average prettyhappy 372     average veryhappy 221
belowaverage nottoohappy 94   belowaverage prettyhappy 249 belowaverage veryhappy 83
;
proc freq order = data; weight count;
tables income*happiness / chisq expected crosslist(stdres) nopercent norow nocol;
run;

/* Assign values to the table */
data table1;
input income happiness count @@;
datalines;
3 1 21   3 2 159  3 3 110
2 1 53   2 2 372  2 3 221
1 1 94   1 2 249  1 3 83
;

proc freq order = data; weight count;
tables income * happiness / measures;
run;
