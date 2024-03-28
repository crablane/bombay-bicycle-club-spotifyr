/*	
--------------------------------------------------------------------------------
			
Title:			Creating Scatterplots for tracks' valence and energy
Author:			Carlotta Brüning
Last updated:	28.03.2024

--------------------------------------------------------------------------------	
			
							Introduction

In this do-file I create the scatterplots for all tracks' energy and 
valence-measures, using the dataset generated in the prior step. I create 
a separate graph for all six albums and the tracks in the others-category.
	
After creating the graph you might find that some of the labels overlap, 
if two songs are very similar. In these cases I excluded one of them in 
the original scatterplot and added a second scatterplot as an overlay, 
that shows only the left-out track with a changed label-position. 
Examples for this can be seen in the Code for "Flaws", "Everythings Else 
Has Gone Wrong" and the "Others"-category.
	
For better visibility, no marker labels are shown in the graph that 
shows all tracks, but I increased the marker size from very small to 
small. Here I use the colorvar() option to set the color scheme.
	
--------------------------------------------------------------------------------	

				I Had the Blues But I Shook Them Loose

--------------------------------------------------------------------------------
*/

scatter energy valence if id==1 ///
	, mlabpos(3) msize(small) mcolor(black) mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) /// 
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) yline(0.5, lcolor(gray%30)) /// 
		ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", nogrid labsize(vsmall)) /// 
		ytitle("Energy", size(small)) ///
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: I Had The Blues But I Shook Them Loose - 2009}"',size(small) /// 
	margin(b=5))
	
graph export $graph/scatter-IHTBBISTL.png, replace

*-------------------------------------------------------------------------------

*								Flaws

*-------------------------------------------------------------------------------
scatter energy valence if id==2 & name != "Leaving Blues" & name != "Rinse Me Down" ///
	, mlabpos(3) msize(small) mcolor("189 152 143") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: Flaws - 2010}"',size(small) /// 
	margin(b=5)) ///
|| scatter energy valence if id==2 & name == "Leaving Blues" ///
	, mlabpos(2) msize(small) mcolor("189 152 143") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
|| scatter energy valence if id==2 & name == "Rinse Me Down" ///
	, mlabpos(12) msize(small) mcolor("189 152 143") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black)
	
graph export $graph/scatter-Flaws.png, replace

*-------------------------------------------------------------------------------

*						A Different Kind Of Fix

*-------------------------------------------------------------------------------

scatter energy valence if id==3 /// 
	, mlabpos(3) msize(small) mcolor("127 107 160") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: A Different Kind Of Fix - 2011}"',size(small) /// 
	margin(b=5))
	
graph export $graph/scatter-Fix.png, replace

*-------------------------------------------------------------------------------
	
*						So Long, See You Tomorrow

*-------------------------------------------------------------------------------
	
scatter energy valence if id==4 /// 
	, mlabpos(3) msize(small) mcolor("6 118 119") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: So Long, See You Tomorrow - 2014}"',size(small) /// 
	margin(b=5))
	
graph export $graph/scatter-SLSYT.png, replace 

*-------------------------------------------------------------------------------
	
*					Everything Else Has Gone Wrong

*-------------------------------------------------------------------------------

scatter energy valence if id==5 & name != "Eat, Sleep, Wake (Nothing But You)" /// 
	, mlabpos(3) msize(small) mcolor("249 235 146") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 		
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: Everything Else Has Gone Wrong - 2020}"',size(small) /// 
	margin(b=5)) ///	
|| scatter energy valence if id==5 & name == "Eat, Sleep, Wake (Nothing But You)" /// 
	, mlabpos(12) msize(small) mcolor("249 235 146") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) 
	
graph export $graph/scatter-EEHGW.png, replace 	

*-------------------------------------------------------------------------------

* 									My Big Day

*-------------------------------------------------------------------------------

scatter energy valence if id==6 /// 
	, mlabpos(3) msize(small) mcolor("237 190 72") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: My Big Day - 2023}"',size(small) /// 
	margin(b=5)) 
	
graph export $graph/scatter-MBD.png, replace 		

*-------------------------------------------------------------------------------

*							 Others

*-------------------------------------------------------------------------------

scatter energy valence if id==7 /// 
		& name != "Cancel On Me" /// 
		& name != "Fantasneeze (feat. Matilda Mann)" ///
		& name != "Dust on the Ground (Demo)" /// 
		& name != "Open House" ///
	, mlabpos(3) msize(small) mcolor("69 158 217") mlabel(name) /// 
		mlabsize(tiny) mlabcolor(black) /// 
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 	
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: Others}"',size(small) /// 
	margin(b=5)) ///
|| scatter energy valence if id==7 & name == "Cancel On Me" /// 
	| name == "Fantasneeze (feat. Matilda Mann)" ///
	| name == "Dust on the Ground (Demo)" ///
	, mlabpos(12) msize(small) mcolor("69 158 217") mlabel(name) /// 
	mlabsize(tiny) mlabcolor(black) ///
|| scatter energy valence if id==7 & name == "Open House" /// 
	, mlabpos(6) msize(small) mcolor("69 158 217") mlabel(name) /// 
	mlabsize(tiny) mlabcolor(black) 
	
graph export $graph/scatter-Others.png, replace 	
	
	
*-------------------------------------------------------------------------------

*					All tracks in one graph 

*-------------------------------------------------------------------------------

scatter energy valence, colorvar(id) colordiscrete coloruseplegend /// 
		colorlist("0 0 0" "189 152 143" "127 107 160" "6 118 119" /// 
		"249 235 146" "237 190 72" "69 158 217") ///
		plegend(order(7 "IHTBBISTL" 6 "Flaws" 5 "ADKOF" 4 "SLSYT" /// 
			3 "EEHGW" 2 "My Big Day" 1 "Others") size(tiny)) ///
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		labsize(vsmall) nogrid) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		labsize(vsmall) nogrid) ytitle("Energy", size(small)) ///	 
		yline(0.5, lcolor(gray%30)) /// 	
	legend(off) msize(small) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(0.05 0.1 `"{it: sad, depressed, bored}"', size(vsmall)) ///
	text(1 0.1 `"{it: distressed, angry, tense}"', size(vsmall)) /// 
	text(0.05 0.9 `"{it: calm, relaxed, content}"', size(vsmall)) /// 
	text(1 0.9 `"{it: alert, excited, happy}"', size(vsmall)) ///
	title(`"{bf: Bombay Bicycle Club - All tracks}"',size(small) /// 
	margin(b=5)) 
	
graph export $graph/scatter-Alltracks.png, replace 
	
	
*-------------------------------------------------------------------------------

*				Empty graph with only the emotions

*-------------------------------------------------------------------------------
scatter energy valence if id==6 /// 
	, mlabpos(3) msize(small) mcolor(white) ///
	xsc(range(0(.1)1)) xlab(0 "Negative" 0.2 0.4 0.6 0.8 1 "Positive", /// 
		nogrid labsize(vsmall)) xtitle("Valence", size(small)) ///
		xline(0.5, lcolor(gray%30)) /// 
	ysc(range(0(.1)1)) ylab(0 "Low" 0.2 0.4 0.6 0.8 1 "High", /// 
		nogrid labsize(vsmall)) ytitle("Energy", size(small)) ///
		yline(0.5, lcolor(gray%30)) /// 
	legend(off) ///
	plotregion(fcolor(white)) graphregion(fcolor(white)) /// 
	text(1 0.4 `"{it: tense}"', size(vsmall)) /// 
	text(0.9 0.14 `"{it: angry}"', size(vsmall)) /// 
	text(0.55 0.1 `"{it: distressed}"', size(vsmall)) /// 
	text(0.45 0.1 `"{it: sad}"', size(vsmall)) /// 
	text(0.1 0.14 `"{it: depressed}"', size(vsmall)) /// 
	text(0 0.4 `"{it: bored}"', size(vsmall)) ///  
	text(0 0.6 `"{it: calm}"', size(vsmall)) /// 
	text(0.1 0.86 `"{it: relaxed}"', size(vsmall)) ///
	text(0.45 0.90 `"{it: content}"', size(vsmall)) ///
	text(0.55 0.90 `"{it: happy}"', size(vsmall)) ///
	text(0.9 0.86 `"{it: excited}"', size(vsmall)) ///
	text(1 0.6 `"{it: alert}"', size(vsmall)) 
	
graph export $graph/wheel.png, replace 	
	
	
	
	
	
	