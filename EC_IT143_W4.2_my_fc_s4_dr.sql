DROP VIEW IF EXISTS dbo.vTeamDim;
GO

CREATE VIEW dbo.vTeamDim
AS
/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_my_fc_s4_dr.sql
PURPOSE: Create the vTeamDim - Load View

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


SELECT * FROM tblPositionDim