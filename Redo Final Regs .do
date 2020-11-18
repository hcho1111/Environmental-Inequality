*Graphs For 25 Miles 
import delimited "/Users/Cho/Desktop/UPDATED REGRESSION/regression radii/25Miles.csv", clear 

*set 
xtset plant yr

*log_pollution 

gen log_so2 = log(so2_lbs_md)
gen log_nox = log(nox_lbs_md)
gen log_pm25 = log(pm25_lbs_md)

*create differences in pollution 

gen dif_log_so2 = d.log_so2
gen dif_log_nox = d.log_nox
gen dif_log_pm25 = d.log_pm25

*create first difference lag pollution 

gen first_lag_diff_log_so2 = l.dif_log_so2
gen first_lag_diff_log_nox = l.dif_log_nox
gen first_lag_diff_log_pm25 = l.dif_log_pm25

*Second Lag of Pollution 
gen L2_so2 = l2.log_so2
gen L2_nox = l2.log_nox
gen L2_pm25 = l2.log_pm25


*ivregress 2sls delta p (lag_dif_pollution variables = lag_2_pollution spatial_instruments l2_instruments)


rename americanindianandalaskanativealo amindian
rename nativehawaiianandotherpacificisl PI 
rename iv1blackorafricanamericanalone iv1black
rename iv1americanindianandalaskanative iv1amindian
rename iv1nativehawaiianandotherpacific iv1PI

rename iv2blackorafricanamericanalone iv2black
rename iv2americanindianandalaskanative iv2amindian
rename iv2nativehawaiianandotherpacific iv2PI

gen other = amindian + PI + someotherracealone + twoormoreraces
gen iv1other = iv1amindian + iv1PI  +  iv1someotherracealone + iv1twoormoreraces
gen iv2other = iv2amindian + iv2PI + iv2someotherracealone+  iv2twoormoreraces

*occupations


gen white_collar = managementbusinessandfinancialop + professionalandrelatedoccupation 
gen pink_collar = officeandadministrativesupportoc +personalcareandserviceoccupation   +  healthcaresupportoccupations  + salesandrelatedoccupations + foodpreparationandservingrelated
gen blue_collar = buildingandgroundscleaningandmai  + transportationandmaterialmovingo + constructionextractionandmainten + farmingfishingandforestryoccupat + productionoccupations + protectiveserviceoccupations



gen iv1white_collar = iv1managementbusinessandfinancia + iv1professionalandrelatedoccupat  
gen iv1pink_collar = iv1officeandadministrativesuppor   + iv1personalcareandserviceoccupat  + iv1salesandrelatedoccupations  + iv1healthcaresupportoccupations
gen iv1blue_collar =   iv1farmingfishingandforestryoccu  + iv1constructionextractionandmain + iv1productionoccupations + iv1transportationandmaterialmovi +iv1protectiveserviceoccupations + iv1buildingandgroundscleaningand

gen iv2white_collar = iv2managementbusinessandfinancia + iv2professionalandrelatedoccupat 
gen iv2pink_collar = iv2officeandadministrativesuppor   + iv2personalcareandserviceoccupat  + iv2salesandrelatedoccupations  + iv2healthcaresupportoccupations
gen iv2blue_collar =   iv2farmingfishingandforestryoccu  + iv2constructionextractionandmain + iv2productionoccupations + iv2transportationandmaterialmovi +iv2protectiveserviceoccupations + iv2buildingandgroundscleaningand

*pov ratio
gen pov_ratio_under_one = under05 + x05074 + x075099
gen pov_ratio_over_one = x100149 + x15199 + x200 

gen iv1pov_ratio_under_one = iv1under05 + iv1x05074 + iv1x075099
gen iv1pov_ratio_over_one = iv1x100149 + iv1x15199 + iv1x200 

gen iv2pov_ratio_under_one = iv2under05 + iv2x05074 + iv2x075099
gen iv2pov_ratio_over_one = iv2x100149 + iv2x15199 + iv2x200 

gen less_than_50k = up_to_34999 + x3500050000
gen iv1less_than_50k = iv1up_to_34999 + iv1x3500050000
gen iv2less_than_50k = iv2up_to_34999 + iv2x3500050000


*transportation 
gen driving = drovealone + carpooled + motorcycle 

*walked 
gen other_beside = othermeans + workedathome + bicycle + publictransportationincludestaxi
gen iv2other_beside = iv2othermeans + iv2workedathome + iv2bicycle + iv2publictransportationincludest
gen ldif_other_beside = ld.other_beside

gen iv1driving = iv1drovealone + iv1carpooled + iv1motorcycle 
gen iv1pub_transit = iv1bicycle + iv1publictransportationincludest
*walked 
gen iv1other_transit = iv1othermeans + iv1workedathome

gen iv2driving = iv2drovealone + iv2carpooled + iv2motorcycle 

*walked 
gen iv2other_transit = iv2othermeans + iv2workedathome


*differenced and lagged vars 


gen ldif_less_than_50K = ld.less_than_50k
gen ldif_black = ld.blackorafricanamericanalone
gen ldif_asian = ld.asianalone
gen ldif_other = ld.other
gen ldif_vacant = ld.vacant
gen ldif_blue_collar = ld.blue_collar
gen ldif_pink_collar = ld.pink_collar
gen ldif_high_school = ld.high_school 
gen ldif_college = ld.college 
gen ldif_unemployed = ld.unemployed1
gen ldif_pov_ratio_under_one = ld.pov_ratio_under_one
gen ldif_pubassist = ld.withpublicassistanceincome
gen ldif_up_to34999 = ld.up_to_34999
gen ldif_x3500050000  = ld.x3500050000
gen ldif_x5000075000 = ld.x5000075000
gen ldif_x75000125000 = ld.x7500012500


gen ldif_walked = ld.walked
gen ldif_giniindex = ld.giniindex
gen ldif_hsdropout  = ld.nothighschoolgraduatenotenrolled
gen ldif_medianhouseholdincome = ld.medianhouseholdincome
gen ldif_driving = ld.driving
gen ldif_white_collar = ld.white_collar
gen ldif_child = ld.child 
gen ldif_young_adult = ld.young_adult 
gen ldif_elderly = ld.elderly 


gen lag2_black = l2.blackorafricanamericanalone
gen lag2_asian = l2.asianalone
gen lag2_other = l2.other
gen lag2_vacant = l2.vacant
gen lag2_blue_collar = l2.blue_collar
gen lag2_high_school = l2.high_school 
gen lag2_college = l2.college 
gen lag2_unemployed = l2.unemployed1
gen lag2_pov_ratio_under_one = l2.pov_ratio_under_one
gen lag2_pubassist = l2.withpublicassistanceincome
gen lag2_up_to34999 = l2.up_to_34999
gen lag2_x3500050000  = l2.x3500050000
gen lag2_x5000075000 = l2.x5000075000
gen lag2_x75000125000 = l2.x75000125000



gen lag2_mixed = l2.twoormoreraces
gen lag2_child = l2.child 
gen lag2_young_adult = l2.young_adult 
gen lag2_elderly = l2.elderly 


gen lag2_giniindex = l2.giniindex
gen lag2_hsdropout  = l2.nothighschoolgraduatenotenrolled
gen lag2_percapitaincome  = l2.percapitaincome
gen lag2_medianhouseholdincome = l2.medianhouseholdincome



gen lag2_white_collar = l2.white_collar

gen lag2_driving = l2.driving


gen at_most_hs = lessthanhighschool + highschoolgraduateincludesequiva

gen ldif_at_most_hs = ld.at_most_hs
gen iv1at_most_hs = iv1lessthanhighschool + iv1highschoolgraduateincludesequ
gen iv2at_most_hs = iv2lessthanhighschool + iv2highschoolgraduateincludesequ

 gen less_than_75K = up_to_34999 + x3500050000 + x5000075000
 gen iv2less_than_75K = iv2up_to_34999 + iv2x3500050000 + iv2x5000075000

gen ldif_35K = ld.up_to_34999
gen pov_ratio_under_075 = under05 + x05074
gen ldif_pov_ratio_under_075 = ld.pov_ratio_under_075

gen log_occupied = log(occupied) 
gen ldif_occupied = ld.log_occupied

gen iv2pov_ratio_under_075 = iv2under05 + iv2x05074
gen iv2log_occupied = log(iv2occupied)


*OLS
regress dif_log_so2 blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly eststo
eststo
regress dif_log_nox blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly eststo
eststo
regress dif_log_pm25 blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly eststo
eststo


esttab using "reg7.rtf", replace /// 
	b(%8.2f) se(%8.2f) stats(N r2, fmt(0 2) labels ("Observations" "R Squared")) label star(* 0.10 ** 0.05 *** 0.01) ///
	nogap nonum dep /// 
	nonotes addnotes("Notes:" "i) Weighted regressions, standard errors clustered at Plant level" "ii) * p$<$0.10, ** p$<$0.05, *** p$<$0.01")	
eststo clear

*FE
xtivreg2 dif_log_so2 ( blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly =   ld.iv2blue_collar ld.iv2pink_collar ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly), fe i(plant) cluster(plant) robust
eststo
xtivreg2 dif_log_nox ( blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly =   ld.iv2blue_collar ld.iv2pink_collar ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly), fe i(plant) cluster(plant) robust
eststo
xtivreg2 dif_log_pm25 ( blue_collar pink_collar blackorafricanamericanalone asianalone other up_to_34999  medianhouseholdincome at_most_hs  pov_ratio_under_one child elderly =   ld.iv2blue_collar ld.iv2pink_collar ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly), fe i(plant) cluster(plant) robust
eststo

esttab using "reg8.rtf", replace /// 
	b(%8.2f) se(%8.2f) stats(N r2, fmt(0 2) labels ("Observations" "R Squared")) label star(* 0.10 ** 0.05 *** 0.01) ///
	nogap nonum dep /// 
	nonotes addnotes("Notes:" "i) Weighted regressions, standard errors clustered at Plant level" "ii) * p$<$0.10, ** p$<$0.05, *** p$<$0.01")	
eststo clear

***Experiment

ivreg2 dif_log_so2 (first_lag_diff_log_so2 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K ldif_unemployed ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_075 ldif_occupied ldif_driving ldif_walked =  L2_so2  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone  ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999 ld.iv2unemployed1 ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_075 ld.iv2log_occupied ld.iv2driving ld.iv2walked lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999  lag2_unemployed lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_075 l2.log_occupied lag2_driving l2.walked), gmm2s cluster(plant) robust 
ivreg2 dif_log_so2 (first_lag_diff_log_so2 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_075 ldif_vacant ldif_driving =  L2_so2  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_075 ld.iv2vacant ld.iv2driving  lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_075 l2.vacant lag2_driving ), gmm2s cluster(plant) robust 
ivreg2 dif_log_so2 (first_lag_diff_log_so2 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_so2  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 
ivreg2 dif_log_nox (first_lag_diff_log_nox ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_nox  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 
ivreg2 dif_log_pm25 (first_lag_diff_log_pm25 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_pm25  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 


**GMM2s

ivreg2 dif_log_so2 (first_lag_diff_log_so2 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_so2  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 
ivreg2 dif_log_nox (first_lag_diff_log_nox ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_nox  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 
ivreg2 dif_log_pm25 (first_lag_diff_log_pm25 ldif_blue_collar ldif_pink_collar ldif_black-ldif_other ldif_35K  ldif_medianhouseholdincome ldif_at_most_hs  ldif_pov_ratio_under_one ldif_child ldif_elderly =  L2_pm25  ld.iv2blue_collar  ld.iv2other  ld.iv2asianalone ld.iv2black  ld.iv2pink_collar  ld.iv2up_to_34999  ld.iv2medianhouseholdincome ld.iv2at_most_hs  ld.iv2pov_ratio_under_one  ld.iv2child ld.iv2elderly lag2_blue_collar  lag2_black-lag2_other  l2.pink_collar lag2_up_to34999   lag2_medianhouseholdincome l2.at_most_hs  l2.pov_ratio_under_one  lag2_child lag2_elderly), gmm2s cluster(plant) robust 


esttab using "reg6.rtf", replace /// 
	b(%8.2f) se(%8.2f) stats(N r2, fmt(0 2) labels ("Observations" "R Squared")) label star(* 0.10 ** 0.05 *** 0.01) ///
	nogap nonum dep /// 
	nonotes addnotes("Notes:" "i) Weighted regressions, standard errors clustered at Plant level" "ii) * p$<$0.10, ** p$<$0.05, *** p$<$0.01")	
eststo clear
 
