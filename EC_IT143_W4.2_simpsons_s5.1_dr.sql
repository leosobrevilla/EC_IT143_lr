-- Q: When were Homer and Marge born?
-- A: Let's ask SQL Server and find out...




SELECT v.Name,
       v.Birth_Date
	INTO tSimpsons_Born
FROM vSimpsons_Born v