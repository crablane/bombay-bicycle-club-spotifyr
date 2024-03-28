/*------------------------------------------------------------------------------
			
Title:			Cleaning and Preparing the dataset
Author:			Carlotta Brüning
Last updated:	28.03.2024

--------------------------------------------------------------------------------	
			
							Introduction

In this do-file I prepare the data downloaded from Spotify for analysis. Most 
importantly, I search for duplicates and drop songs that I dont want to use 
in the analysis, such as live-versions or Remixes by other artists.

Finally I generate an album-identifier that can be used when making graphs in 
the next step. 

------------------------------------------------------------------------------*/

* Importing the dataset from Excel
import excel $data/bbc_alltracks.xlsx, sheet("Sheet1") firstrow
			 
* Encoding the album names
encode album, gen(album_id) label(album_lbl)

*displaying numeric labels
numlabel _all, add

* Inspecting the new variable
tab album_id

*Dropping unneccesary variables 
drop danceability loudness acousticness ids id duration_ms

*-------------------------------------------------------------------------------

*				Cleaning the data: Identifying Duplicates 

*-------------------------------------------------------------------------------	
		
* Sorting the dataset by track name
sort name

*Generating a variables that counts the occurance of each a track in the dataset
bysort name: gen n = _n

* Save the maximum number of occurance for each track
bysort name: egen count = max(n)

* Listing all duplicate tracks and the album they are on
list name album_id if count >1

/*-------------------------------------------------------------------------------

				Cleaning the data: Dropping and keeping Duplicates  

-------------------------------------------------------------------------------

Now that we know which songs are duplicates we have to make a decision for 
each case whether they really are duplicates or not and which tracks we 
want to keep.
*/

/* 						Always Like This

Always Like This is 3 times in the dataset:
	- Album version
	- 2x Single releases or others
 
 All three versions are the same song, therefore I only want to keep one of 
 them, the one that is on "I Had the Blues But I Shook Them Loose".
*/

drop if name == "Always Like This" & album_id != 5


/* 						Cancel On Me 

Cancel On Me is twice in the dataset:
	- EP-version  
	- IHTBBISTL-version. 
I want to keep both, since they are distinct in the way they sound. 
*/

/* 				Dust On The Ground

Dust On The Ground is three times in the set
   - IHTBBISTL-version
   - Flaws-version
   - Single release
   I only want to keep the IHTBBISTL-version and the Flaws-version
*/
drop if name == "Dust On The Ground" & album_id==7


/*					Ghost

Ghost is two times in the set
	- How We Are EP 
	- IHTBBISTL-version
	I want to keep both.
*/

/*					How Can You Swallow So Much Sleep

HCYSSMS is two times in the set
	- Single release
	- album-version
	I want to keep only the album version
*/
drop if name == "How Can You Swallow So Much Sleep" & album_id==7

/* 					I Can Hardly Speak

I Can Hardly Speak is twice in the dataset:
	- EEHGW-version
	- Spotify Singles version 
	They are different versions, thus I keep both.
*/

/* 				My Big Day

My Big Day is 2 times in the dataset:
	- single version
	- album version
	
I want to keep the album version only
*/

drop if name == "My Big Day" & album_id ==7

/* 						The Hill

The Hill is two times in the dataset:
	-The Boy I Used To Be-version
	-IHTBBISTL-version 
	
I want to keep both 
*/

*-------------------------------------------------------------------------------

*				Cleaning the data: Manually checking the tracklist 

*-------------------------------------------------------------------------------	

/*	Even though there should be no more duplicates, there might still be 
	tracks in the dataset that I don't want to keep, such as Remixes or 
	Live-Versions of songs. Therefore I manually inspect the dataset.

*/
* Sorting the dataset by name
sort name 
order name album_id

* Opening the dataviewer 
browse

*	There are still more versions of Always Like This that I don't want to keep.
drop if name =="Always Like This - Bombay Bicycle Club vs. London School Of Samba"

* Drop all tracks that have the word "Remix" or "Mix" in their title. 
list name if strpos(name, "Remix")>0
drop if strpos(name,"Remix")>0 // 7 tracks deleted

list name if strpos(name, "remix")>0
drop if strpos(name,"remix")>0 // 3 tracks deleted

list name if strpos(name, "Mix")>0
drop if strpos(name,"Mix")>0 // 1 track deleted

/* 						Diving

Diving is 4 times in the dataset:
   - Single Version
   - Acoustic
   - Slowed Down
   - Album vesion 

I only want to keep the album-version, acoustic version and slowed down
*/
drop if name== "Diving (feat. Holly Humberstone)" & album_id==7

/*					Evening / Morning 
There is a duplicate of Evening/Morning but with a space between the 
parenthesis, so it doesn't come up as a duplicate
*/ 
drop if name =="Evening/Morning"

/* 					Feel

There is the UNKLE-Reconstruction of Feel that I don't want to keep as it is 
a Remix 
*/ 
drop if name =="Feel - UNKLE Reconstruction"

/* 					Lights Out, Words Gone

There is a Live-Version of LOWG that I dont want to keep
*/ 
drop if name =="Lights Out, Words Gone - BBC Live Version - Zane Lowe Session"

*-------------------------------------------------------------------------------

*				Data Preparation: Generating an album identifier

*-------------------------------------------------------------------------------	

/* Generating a new album identifier that groups all non-album releases into an 
   "other" category.
*/

tab album_id

recode album_id (5 = 1 "I Had The Blues But I Shook Them Loose") ///
				(3 = 2 "Flaws") ///
				(1 = 3 "A Different Kind Of Fix") ///
				(8 = 4 "So Long, See You Tomorrow") ///
				(2 = 5 "Everything Else Has Gone Wrong") ///
				(6 = 6 "My Big Day") ///
				(else = 7 "Others") ///
				, gen(id)
label variable id "Album Identifier" 

numlabel _all, add

*Reordering the dataset and sorting it by id and track_number 
order name id release energy valence
drop album_id album n count
sort id track_number 

* Saving the dataset 
save $data/fullset, replace









