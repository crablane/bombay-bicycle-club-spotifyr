/*	
--------------------------------------------------------------------------------
			
Title:			Master Do-File
Author:			Carlotta Brüning
Last updated:	28.03.2024

------------------------------------------------------------------------------*/

/* This Do-File executes the Do-Files for data-preparation, generates the 
   graphs and stores them in the designated folder. The following folder 
   structure should be prepared:
  
   - graph // Folder for graphs
   - code // Folder for alle code 
   - data // Folder for the data, the excel-sheet with the data must be saved here
   
*/

* Generating globals 
global graph = "PUT YOUR DIRECTORY HERE\graphs"
global code = "PUT YOUR DIRECTORY HERE\code"
global data = "PUT YOUR DIRECTORY HERE\data"

* Executing the do-files for data-preparation and graphs 
do $code/data-prep.do
do $code/graphs.do
