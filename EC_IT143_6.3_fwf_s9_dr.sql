ALTER  FUNCTION [dbo].[udf_parse_last_name]
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
     IF CHARINDEX(' ', @v_combined_name) = 0
    RETURN NULL;
	DECLARE @v_last_name AS VARCHAR(100);
	SET @v_last_name = RIGHT(@v_combined_name, (LEN(@v_combined_name)-CHARINDEX(' ', @v_combined_name + ' ')))
	RETURN @v_last_name;
END;
GO