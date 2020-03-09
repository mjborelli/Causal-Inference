*****************************************

* Name of file: MBorelli_Rep2.do 

* Description: This is a replication of Angrist and Evan's study, "Children and Their Parent's Labor Supply: Evidence from Exogenous Variation in Family Size", with a focus on Instrumental Variables and Two-Stage Least Squares.

* Author: Matthew Borelli

* Time Last Worked On: 12:24 P.M., 3/9/2020

*****************************************

ssc install estout

clear
cd "D:\Documents\MA_Econ\Spring\Causal-Inference\Replication 2\Do"

use "..\data\pums80.dta"
 
gen more_kids2 = morekids*100
gen workedm_2 = workedm*100

la var more_kids2 "Percent with 2 or more children" 
la var workedm_2 " Percent worked last year"
la var kidcount "Mean children ever born"

mean kidcount more_kids2 workedm_2

esttab using "../Tables/Table_1.rtf", nostar not label title(Table 1 - Fertility and Labor-Supply Measures) obslast mtitles("1980 PUMS")

esttab, nostar not label title(Table 1 - Fertility and Labor-Supply Measures) obslast mtitles(1980 PUMS)

*Generating variables
gen girl1st = 0
gen girl2nd = 0

replace girl1st = 1 if boy1st == 0
replace girl2nd = 1 if boy2nd == 0 & morekids == 1

gen twogirls = 0
gen twoboys = 0

replace twogirls = 1 if girl1st == 1 & girl2nd == 1
replace twoboys = 1 if boy1st == 1 & boy2nd == 1


* Recreating Table 2
* Lables
la var kidcount "Children ever born"
la var morekids "More than 2 children (=1 if mother had more than 2 children, =0 otherwise)"
la var boy1st "Boy 1st(s_1)(=1 if first child was a boy)"
la var boy2nd "Boy 2nd(s_2)(=1 if second child was a boy)"
la var twoboys "Two boys(=1 if first two children were boys)"
la var twogirls "Two girls(=1 if first two children were girls)"
la var samesex "Same sex(=1 if first two children were the same sex)"
la var multi2nd "Twins-2 (=1 if second birth was a twin)"
la var agem1 "Age"
la var agefstm "Age at first birth(parent's age in years when first child was born)"
la var workedm "Worked for pay(=1 if worked for pay in year prior to census"
la var weeksm1 "Weeks worked (weeks worked in year prior to census)"
la var hourswm "Hours/week (average hours worked per week"
la var incomem "Labor income (labor earnings in year prior to census, in 1979 dollars)"


*Creating table
mean kidcount morekids boy1st boy2nd twoboys twogirls samesex multi2nd agem1 agefstm workedm weeksm1 hourswm incomem

esttab using "../Tables/Table_2.rtf", rtf se nostar not label title(Table 2--DESCRIPTIVE STATISTICS, WOMEN AGED 21-35 WITH 2 OR MORE CHILDREN) mtitles("All Women") compress replace

esttab ,se nostar not label title(Table 2--Descriptive Statistics, Women Aged 21-35 with 2 or More Children) mtitles("All Women") width(6)

* Creating Table 3
