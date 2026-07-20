CREATE PROCEDURE dbo.usp_Position
AS


/*****************************************************************************************************************
NAME:    dbo.usp_Position
PURPOSE: MyFC - Load user stored procedure

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
	--1) Reload Data
		TRUNCATE TABLE tblPosition;

		INSERT INTO tblPosition
			SELECT v.p_name,
			       v.p_target
			FROM vTeamDim AS v;

	--2) Review results 
		SELECT t.*
		FROM tblPosition AS t;
 END;
GO

--SELECT * FROM vTeamDim