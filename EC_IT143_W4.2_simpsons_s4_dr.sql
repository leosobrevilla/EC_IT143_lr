DROP VIEW IF EXISTS vSimpsons_Born;
GO

CREATE VIEW vSimpsons_Born
AS
/*****************************************************************************************************************
NAME:    vSimpsons_Born
PURPOSE: Create the vSimpsons_Born - Load View

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/20/2026   DROD       1. Built this script for EC IT440


RUNTIME: 
1s

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer focused Approach for T-SQL Data Manipulation 
******************************************************************************************************************/

-- Q: How many players play each position?

-- A: Let's ask SQL Server and find out...


SELECT * FROM Family_Data