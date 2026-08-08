CREATE FUNCTION [dbo].[udf_parse_first_name]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR (100)

/*****************************************************************************************************************
NAME:    dbo.udf_parse_first_name
PURPOSE: Parse first name from combined one

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/07/2026   LDROD       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
Adapted from te following:
https://www.youtube.com/watch?v=KRRSqV-Ya3Y
 
******************************************************************************************************************/
BEGIN
	DECLARE @v_first_name AS VARCHAR(100);
	SET @v_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + ' ') -1);
	RETURN @v_first_name;
END;
GO