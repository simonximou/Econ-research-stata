reg acresburn wildfires gdp rain firedep spending temp humidity lakes pop house college, robust
describe
codebook
histogram acresburn
summarize acresburn
corr acresburn wildfires gdp rain firedep spending temp humidity lakes pop house college
gen lngdp=ln(gdp)
gen spending2=(spending)^2
gen lnfiredep=ln(firedep)
gen lnacresburn=ln(acresburn)
gen rain2=(rain)^2
vif
reg acresburn wildfires rain firedep spending temp humidity lakes pop house college, robust
reg acresburn wildfires gdp rain firedep spending temp humidity lakes house college, robust
reg acresburn wildfires gdp rain firedep spending temp humidity lakes pop college, robust
reg lnacresburn wildfires rain firedep lnspending temp humidity lakes college, robust
vif 
xi: reg lnacresburn i.State i.Year gdp wildfires rain firedep lnspending temp humidity lakes lncollege, robust
display e(r2_a)
ssc install estout, replace
eststo eq1: xi: reg lnacresburn i.State i.Year wildfires, robust
eststo eq2: xi: reg lnacresburn i.State i.Year wildfires rain, robust
eststo eq3: xi: reg lnacresburn i.State i.Year wildfires rain firedep, robust
eststo eq4: xi: reg lnacresburn i.State i.Year wildfires rain firedep lnspending, robust
eststo eq5: xi: reg lnacresburn i.State i.Year wildfires rain firedep lnspending temp, robust
eststo eq6: xi: reg lnacresburn i.State i.Year wildfires rain firedep lnspending temp humidity, robust
eststo eq7: xi: reg lnacresburn i.State i.Year wildfires rain firedep lnspending temp humidity lakes, robust
eststo eq8:  xi: reg lnacresburn i.State i.Year wildfires rain firedep lnspending temp humidity lakes lncollege, robust
 esttab, p star(** 0.05 *** 0.01) ar2 scalar(rss) mtitles drop(_I*)
esttab using "C:\Users\zx616\Desktop\out.rtf", p star(** 0.05 *** 0.01) ar2 scalar(rss) mtitles drop(_I*)
