-- Q: How many players play each position?

-- A: Let's ask SQL Server and find out...

--1) Reload data 

TRUNCATE TABLE tblPosition;

INSERT INTO tblPosition
	   SELECT v.p_name,
	   v.p_target 
	   FROM vTeamDim v;

--2) Review results
SELECT t.*
	FROM tblPosition AS t;


	--SELECT * FROM vTeamDim