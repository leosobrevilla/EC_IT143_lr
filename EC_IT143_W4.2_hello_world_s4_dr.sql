

DROP VIEW IF EXISTS dbo.v_hello_world_load;
GO

CREATE VIEW dbo.v_hello_world_load
AS
/*****************************************************************************************************************
NAME:    EC_IT143_W4.2_hello_world_s4_dr.sql
PURPOSE: Create the Hellow World - Load View

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     07/20/2026   DROD       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
This script exists to help me learn step of 8 in the Answer focused Approach for T-SQL Data Manipulation 
******************************************************************************************************************/

-- Q: What is the current date and time?

-- A: Let's ask SQL Server and find out...

SELECT 'Hello World' AS my_message,
GETDATE () AS current_date_time;




