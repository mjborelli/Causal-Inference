*****************************************

* Name of file: MBorelli_Rep1.do 

* Description: This is a replication of Hansen's study, "Punishment and  Deterrence: Evidence from Drunk Driving", with a focus on regression discontinuity.

* Author: Matthew Borelli

* Time Last Worked On: 12:23 PM, 2/26/20

*****************************************

* Setting my working directory and importing the data
clear
cd "D:\Documents\MA_Econ\Spring\Causal-Inference\Replication 1\Do"

use "..\data\hansen_dwi.dta"

* Install outreg2
ssc install outreg2

* Generate a variable for the first cutoff

gen DUI = (bac1 >= 0.08)

*Create a histogram for bac1

cd "D:\Documents\MA_Econ\Spring\Causal-Inference\Replication 1\Figures"

hist bac1
graph save BAC_Hist

cd "D:\Documents\MA_Econ\Spring\Causal-Inference\Replication 1\Do"

* Check the covariate balance
gen bac1_DUI = bac1*DUI

reg white bac1 DUI bac1_DUI if bac1 > 0.030 & bac1 < 0.130, cluster(bac1)
outreg2 using ../Tables/simple_model.doc, replace ctitle(White) label

reg male bac1 DUI bac1_DUI if bac1 > 0.030 & bac1 < 0.130, cluster(bac1)
outreg2 using ../Tables/simple_model.doc, append ctitle(Male) label

reg age bac1 DUI bac1_DUI if bac1 > 0.030 & bac1 < 0.130, cluster(bac1)
outreg2 using ../Tables/simple_model.doc, append ctitle(Age) label

reg acc bac1 DUI bac1_DUI if bac1 > 0.030 & bac1 < 0.130, cluster(bac1)
outreg2 using ../Tables/simple_model.doc, append ctitle(Accident) label

* Recreate figure 2, panels A-D

ssc install cmogram

*Linear Fits

quietly cmogram acc bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel A. Accident at scene) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/AccLin.gph

quietly cmogram male bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel B. Male) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/MaleLin.gph

quietly cmogram age bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel C. Age) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/AgeLin.gph

quietly cmogram white bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel D. White) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/WhiteLin.gph

*
* Quadratic Fits
*

quietly cmogram white bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel D. White) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/WhiteQuad.gph

quietly cmogram male bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel B. Male) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/MaleQuad.gph

quietly cmogram white bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel C. Age) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/AgeQuad.gph

quietly cmogram white bac1 if bac1 < 0.2, lineat(0.08) cut(0.08) scatter lfitci title(Panel A. Accident at Scene) histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/AccQuad.gph

** Combine the graphs together into a panel

graph combine ../figures/AccLin.gph ../figures/MaleLin.gph ../figures/AgeLin.gph ../figures/WhiteLin.gph, title(Linear Models) saving(../figures/LinModels.gph)

graph combine ../figures/AccQuad.gph ../figures/MaleQuad.gph ../figures/AgeQuad.gph ../figures/WhiteQuad.gph, title(Quadratic Models) saving(../figures/QuadModels.gph)

* generate bac1 squared and interaction
gen bac1sq = bac1^2
gen bac1sq_DUI = bac1sq*DUI

** Run the regressions, Wider Sample of 0.03 < BAC < 0.13  (note the different controls)

regr recid DUI bac1 white male age acc year if bac1 > 0.03 & bac1 < 0.13, robust
outreg2 using ../Tables/P11_WideSample.doc, replace title("Table 3 -- Panel A -- Regression Discontinuity Estimates for the Effect of Exceeding the 0.08 BAC Threshold on Recidivism") ctitle(Model 1) label

regr recid DUI bac1 bac1_DUI white male age acc year  if bac1 > 0.03 & bac1 < 0.13, robust
outreg2 using ../Tables/P11_WideSample.doc, append ctitle(Model 2) label


regr recid DUI bac1 bac1_DUI bac1sq bac1sq_DUI white male age acc year  if bac1 > 0.03 & bac1 < 0.13, robust
outreg2 using ../Tables/P11_WideSample.doc, append ctitle(Model 3) label

**Run regressions with tighter sample of 0.055 < bac1 < 0.105

regr recid DUI bac1 white male age acc year if bac1 > 0.055 & bac1 < 0.105, robust
outreg2 using ../Tables/P11_SkinnySample.doc, replace title("Table 3 -- Panel B -- Regression Discontinuity Estimates for the Effect of Exceeding the 0.08 BAC Threshold on Recidivism") ctitle(Model 1) label

regr recid DUI bac1 bac1_DUI white male age acc year  if bac1 > 0.055 & bac1 < 0.105, robust
outreg2 using ../Tables/P11_SkinnySample.doc, append ctitle(Model 2) label

regr recid DUI bac1 bac1_DUI bac1sq bac1sq_DUI white male age acc year  if bac1 > 0.055 & bac1 < 0.105, robust
outreg2 using ../Tables/P11_SkinnySample.doc, append ctitle(Model 3) label

** cmogram of BAC

quietly cmogram recid bac1 if bac1 < 0.15, lineat(0.08) cut(0.08) scatter lfit title("Panel A. All Offenders w/ Linear Fit") histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/BACRecidLinear.gph

quietly cmogram recid bac1 if bac1 < 0.15, lineat(0.08) cut(0.08) scatter qfit title("Panel A. All Offenders w/ Quadratic Fit") histopts(width(0.002)) graphopts(xtitle("BAC") ytitle(""))
graph save ../figures/BACRecidQuadratic.gph

graph combine ../figures/BACRecidLinear.gph ../figures/BACRecidQuadratic.gph, rows(2) cols(1) saving(../figures/BACRecid.gph)
