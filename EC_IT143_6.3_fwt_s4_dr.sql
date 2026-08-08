CREATE TRIGGER trg_hello_world_last_mod ON dbo.t_hello_world
AFTER UPDATE
AS
/*****************************************************************************************************************
NAME:    dbo.trg_hello_world_last_mod
PURPOSE: Hello World - Last Modified By Trigger

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     08/07/2026   LDROD       1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
Keep track of the last modified date for each row in the table
******************************************************************************************************************/

UPDATE dbo.t_hello_world
	SET
		last_modified_date = GETDATE()
 WHERE my_message IN
 (
	SELECT DISTINCT 
			my_message
		FROM Inserted
);
