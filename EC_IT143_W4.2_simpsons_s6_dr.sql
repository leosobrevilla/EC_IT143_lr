-- Q: When were Homer and Marge born?

-- A: Let's ask SQL Server and find out...

--1) Reload data 

TRUNCATE TABLE tSimpsons_Born;

INSERT INTO tSimpsons_Born
			SELECT v.Name,
			       v.Birth_Date
	        FROM vSimpsons_Born v;

--2) Review results
SELECT t.*
	FROM tSimpsons_Born AS t;

