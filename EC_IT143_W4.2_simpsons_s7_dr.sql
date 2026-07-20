CREATE PROCEDURE dbo.usp_Simpsons_Born
AS


/*****************************************************************************************************************
NAME:    dbo.usp_Simpsons_Born
PURPOSE: Simpsons DB - Load user stored procedure

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/20/2026   DROD       1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
 
******************************************************************************************************************/


 BEGIN
	--1) Reload data 

      TRUNCATE TABLE tSimpsons_Born;

      INSERT INTO tSimpsons_Born
		           	SELECT v.Name,
			               v.Birth_Date
	                FROM vSimpsons_Born v;

    --2) Review results
       SELECT t.*
	   FROM tSimpsons_Born AS t;


 END;
GO

