-- Q: How many players play each position?
-- A: Let's ask SQL Server and find out...




SELECT v.p_name,
       v.p_target
	INTO tblPosition
FROM vTeamDim v