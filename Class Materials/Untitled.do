set more off
cd d:\Documents\MA_Econ\Spring\Causal_Inference\data
clear
quietly infix                     ///
  long    year             1-5    ///
  double  caseid           6-19   ///
  byte    statefip         20-21  ///
  long    county           22-26  ///
  byte    pernum           27-28  ///
  int     lineno           29-31  ///
  double  wt06             32-48  ///
  byte    sex              49-50  ///
  int     race             51-54  ///
  int     educ             55-57  ///
  byte    empstat_cps8     58-59  ///
  int     job_search       60-63  ///
  int     waiting_example  64-67  ///
  using `"atus_00001.dat"'


format caseid          %14.0g
format wt06            %17.0g

label var year            `"Survey year"'
label var caseid          `"ATUS Case ID"'
label var statefip        `"FIPS State Code"'
label var county          `"FIPS County code"'
label var pernum          `"Person number (general)"'
label var lineno          `"Person line number"'
label var wt06            `"Person weight, 2006 methodology"'
label var sex             `"Sex"'
label var race            `"Race"'
label var educ            `"Highest level of school completed"'
label var empstat_cps8    `"Labor force status (CPS)"'
label var job_search      `"BLS: Working and work-related activities: Job search and interviewing"'
label var waiting_example `"WaitE"'

label define statefip_lbl 01 `"Alabama"'
label define statefip_lbl 02 `"Alaska"', add
label define statefip_lbl 04 `"Arizona"', add
label define statefip_lbl 05 `"Arkansas"', add
label define statefip_lbl 06 `"California"', add
label define statefip_lbl 08 `"Colorado"', add
label define statefip_lbl 09 `"Connecticut"', add
label define statefip_lbl 10 `"Delaware"', add
label define statefip_lbl 11 `"District of Columbia"', add
label define statefip_lbl 12 `"Florida"', add
label define statefip_lbl 13 `"Georgia"', add
label define statefip_lbl 15 `"Hawaii"', add
label define statefip_lbl 16 `"Idaho"', add
label define statefip_lbl 17 `"Illinois"', add
label define statefip_lbl 18 `"Indiana"', add
label define statefip_lbl 19 `"Iowa"', add
label define statefip_lbl 20 `"Kansas"', add
label define statefip_lbl 21 `"Kentucky"', add
label define statefip_lbl 22 `"Louisiana"', add
label define statefip_lbl 23 `"Maine"', add
label define statefip_lbl 24 `"Maryland"', add
label define statefip_lbl 25 `"Massachusetts"', add
label define statefip_lbl 26 `"Michigan"', add
label define statefip_lbl 27 `"Minnesota"', add
label define statefip_lbl 28 `"Mississippi"', add
label define statefip_lbl 29 `"Missouri"', add
label define statefip_lbl 30 `"Montana"', add
label define statefip_lbl 31 `"Nebraska"', add
label define statefip_lbl 32 `"Nevada"', add
label define statefip_lbl 33 `"New Hampshire"', add
label define statefip_lbl 34 `"New Jersey"', add
label define statefip_lbl 35 `"New Mexico"', add
label define statefip_lbl 36 `"New York"', add
label define statefip_lbl 37 `"North Carolina"', add
label define statefip_lbl 38 `"North Dakota"', add
label define statefip_lbl 39 `"Ohio"', add
label define statefip_lbl 40 `"Oklahoma"', add
label define statefip_lbl 41 `"Oregon"', add
label define statefip_lbl 42 `"Pennsylvania"', add
label define statefip_lbl 44 `"Rhode Island"', add
label define statefip_lbl 45 `"South Carolina"', add
label define statefip_lbl 46 `"South Dakota"', add
label define statefip_lbl 47 `"Tennessee"', add
label define statefip_lbl 48 `"Texas"', add
label define statefip_lbl 49 `"Utah"', add
label define statefip_lbl 50 `"Vermont"', add
label define statefip_lbl 51 `"Virginia"', add
label define statefip_lbl 53 `"Washington"', add
label define statefip_lbl 54 `"West Virginia"', add
label define statefip_lbl 55 `"Wisconsin"', add
label define statefip_lbl 56 `"Wyoming"', add
label values statefip statefip_lbl

label define pernum_lbl 01 `"1"'
label define pernum_lbl 02 `"2"', add
label define pernum_lbl 03 `"3"', add
label define pernum_lbl 04 `"4"', add
label define pernum_lbl 05 `"5"', add
label define pernum_lbl 06 `"6"', add
label define pernum_lbl 07 `"7"', add
label define pernum_lbl 08 `"8"', add
label define pernum_lbl 09 `"9"', add
label define pernum_lbl 10 `"10"', add
label define pernum_lbl 11 `"11"', add
label define pernum_lbl 12 `"12"', add
label define pernum_lbl 13 `"13"', add
label define pernum_lbl 14 `"14"', add
label define pernum_lbl 15 `"15"', add
label define pernum_lbl 16 `"16"', add
label values pernum pernum_lbl

label define lineno_lbl 001 `"1"'
label define lineno_lbl 002 `"2"', add
label define lineno_lbl 003 `"3"', add
label define lineno_lbl 004 `"4"', add
label define lineno_lbl 005 `"5"', add
label define lineno_lbl 006 `"6"', add
label define lineno_lbl 007 `"7"', add
label define lineno_lbl 008 `"8"', add
label define lineno_lbl 009 `"9"', add
label define lineno_lbl 010 `"10"', add
label define lineno_lbl 011 `"11"', add
label define lineno_lbl 012 `"12"', add
label define lineno_lbl 013 `"13"', add
label define lineno_lbl 014 `"14"', add
label define lineno_lbl 015 `"15"', add
label define lineno_lbl 016 `"16"', add
label define lineno_lbl 017 `"17"', add
label define lineno_lbl 018 `"18"', add
label define lineno_lbl 019 `"19"', add
label define lineno_lbl 999 `"NIU (Not in universe)"', add
label values lineno lineno_lbl

label define sex_lbl 01 `"Male"'
label define sex_lbl 02 `"Female"', add
label define sex_lbl 99 `"NIU (Not in universe)"', add
label values sex sex_lbl

label define race_lbl 0100 `"White only"'
label define race_lbl 0110 `"Black only"', add
label define race_lbl 0120 `"American Indian, Alaskan Native"', add
label define race_lbl 0130 `"Asian or Pacific Islander"', add
label define race_lbl 0131 `"Asian only"', add
label define race_lbl 0132 `"Hawaiian Pacific Islander only"', add
label define race_lbl 0200 `"White-Black"', add
label define race_lbl 0201 `"White-American Indian"', add
label define race_lbl 0202 `"White-Asian"', add
label define race_lbl 0203 `"White-Hawaiian"', add
label define race_lbl 0210 `"Black-American Indian"', add
label define race_lbl 0211 `"Black-Asian"', add
label define race_lbl 0212 `"Black-Hawaiian"', add
label define race_lbl 0220 `"American Indian-Asian"', add
label define race_lbl 0221 `"American Indian-Hawaiian"', add
label define race_lbl 0230 `"Asian-Hawaiian"', add
label define race_lbl 0300 `"White-Black-American Indian"', add
label define race_lbl 0301 `"White-Black-Asian"', add
label define race_lbl 0302 `"White-Black-Hawaiian"', add
label define race_lbl 0310 `"White-American Indian-Asian"', add
label define race_lbl 0311 `"White-American Indian-Hawaiian"', add
label define race_lbl 0320 `"White-Asian-Hawaiian"', add
label define race_lbl 0330 `"Black-American Indian-Asian"', add
label define race_lbl 0331 `"Black-American Indian-Hawaiian"', add
label define race_lbl 0340 `"Black-Asian-Hawaiian"', add
label define race_lbl 0350 `"American Indian-Asian-Hawaiian"', add
label define race_lbl 0398 `"Other 3 race combinations"', add
label define race_lbl 0399 `"2 or 3 races, unspecified"', add
label define race_lbl 0400 `"White-Black-American Indian-Asian"', add
label define race_lbl 0401 `"White-Black-American Indian-Hawaiian"', add
label define race_lbl 0402 `"White-Black-Asian-Hawaiian"', add
label define race_lbl 0403 `"Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0404 `"White-American Indian-Asian-Hawaiian"', add
label define race_lbl 0500 `"White-Black-American Indian-Asian-Hawaiian"', add
label define race_lbl 0599 `"4 or 5 races, unspecified"', add
label define race_lbl 9999 `"NIU (Not in universe)"', add
label values race race_lbl

label define educ_lbl 010 `"Less than 1st grade"'
label define educ_lbl 011 `"1st, 2nd, 3rd, or 4th grade"', add
label define educ_lbl 012 `"5th or 6th grade"', add
label define educ_lbl 013 `"7th or 8th grade"', add
label define educ_lbl 014 `"9th grade"', add
label define educ_lbl 015 `"10th grade"', add
label define educ_lbl 016 `"11th grade"', add
label define educ_lbl 017 `"12th grade - no diploma"', add
label define educ_lbl 020 `"High school graduate - GED"', add
label define educ_lbl 021 `"High school graduate - diploma"', add
label define educ_lbl 030 `"Some college but no degree"', add
label define educ_lbl 031 `"Associate degree - occupational vocational"', add
label define educ_lbl 032 `"Associate degree - academic program"', add
label define educ_lbl 040 `"Bachelor's degree (BA, AB, BS, etc.)"', add
label define educ_lbl 041 `"Master's degree (MA, MS, MEng, MEd, MSW, etc.)"', add
label define educ_lbl 042 `"Professional school degree (MD, DDS, DVM, etc.)"', add
label define educ_lbl 043 `"Doctoral degree (PhD, EdD, etc.)"', add
label define educ_lbl 999 `"NIU (Not in universe)"', add
label values educ educ_lbl

label define empstat_cps8_lbl 01 `"Employed - at work"'
label define empstat_cps8_lbl 02 `"Employed - absent"', add
label define empstat_cps8_lbl 03 `"Unemployed - on layoff"', add
label define empstat_cps8_lbl 04 `"Unemployed - looking"', add
label define empstat_cps8_lbl 05 `"Not in labor force - retired"', add
label define empstat_cps8_lbl 06 `"Not in labor force - disabled"', add
label define empstat_cps8_lbl 07 `"Not in labor force - other"', add
label define empstat_cps8_lbl 99 `"NIU (Not in universe)"', add
label values empstat_cps8 empstat_cps8_lbl
