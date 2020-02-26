*****************************************

* Name of file: MBorelli_Rep1.do 

* Description: This is a replication of Hansen's study, "Punishment and  Deterrence: Evidence from Drunk Driving", with a focus on regression discontinuity.

* Author: Matthew Borelli

* Time Last Worked On: 1:38 AM, 2/26/20

*****************************************

* Setting my working directory and importing the data
clear
cd "D:\Documents\MA_Econ\Spring\Causal-Inference\Replication 1\Do"

use "..\data\hansen_dwi.dta"

* Generate a variable for the first cutoff

gen DUI = (bac1 >= 0.08)

*Create a histogram for bac1

hist bac1