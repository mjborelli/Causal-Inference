//1//

gen morekidsp =morekids*100
gen workedmp = workedm*100

mean kidcount morekidsp workedmp if agem>21 & agem<35
mean kidcount morekidsp workedmp if agem>21 & agem<35 & kidcount>1

outreg2 using table1_rep2.xls
//sends the regression output to a .xls file named "table1_rep2"

//2//

gen girl1st= 0
gen girl2nd= 0

replace girl1 =1  if boy1st == 0
replace girl2 =1 if boy2nd == 0

gen bothgirls = 0
gen bothboys = 0

replace bothgirls = 1 if girl1st==1 & girl2nd==2
replace bothboys = 1 if boy1st == 1 & boy2nd == 2
gen samesex if bothboys==1 | bothgirls == 1


gen boy1stp = boy1st*100
gen boy2ndp = boy2nd*100
gen girl1stp = girl1st*100
gen girl2ndp = girl2nd*100
gen bothgirlsp = bothgirls*100
gen bothboysp = bothboys*100
gen samesexp = samesex*100

mean boy1stp boy2ndp bothboysp bothgirlsp samesexp agem agef workedmp weeksm1 hourswm incomem
outreg2 using table2_rep2.xls

//3//
//1st stage regression//

reg morekids samesex, robust
predict morekidshat, xb

//generating table 3 from Cunningham&Findlay//

reg workedm morekids, robust
outreg2 using 2sls1.xls, ctitle("workedm OLS") replace
reg workedm morekidshat, robust
outreg2 using 2sls1.xls, ctitle("worked 2SLS (manual)") append
ivregress 2sls workedm (morekids = samesex), robust
outreg2 using 2sls1.xls, ctitle("worked 2SLS") append

reg weeksm morekids, robust
outreg2 using 2sls1.xls, ctitle("weeksm OLS ") append
reg weeksm morekidshat, robust
outreg2 using 2sls1.xls, ctitle("weeksm 2SLS (manual)") append
ivregress 2sls weeksm (morekids = samesex), robust
outreg2 using 2sls1.xls, ctitle("weeksm 2SLS") append

reg hourswm morekids, robust
outreg2 using 2sls1.xls, ctitle("hoursm OLS") append
reg hourswm morekidshat, robust
outreg2 using 2sls1.xls, ctitle("hoursm 2SLS (manual)") append
ivregress 2sls hourswm (morekids = samesex), robust
outreg2 using 2sls1.xls, ctitle("hoursm 2sls") append

reg incomem morekids, robust
outreg2 using 2sls1.xls, ctitle("incomem OLS") append
reg incomem morekidshat, robust
outreg2 using 2sls1.xls, ctitle("incomem 2SLS (manual)") append
ivregress 2sls incomem (morekids = samesex), robust
outreg2 using 2sls1.xls, ctitle("incomem 2SLS") append




//I'm not sure which covariates to include for these, so I left them out for the time being//
//also, I'm still not sure how to do the 'covariate adjusted' stuff so this has been left out




