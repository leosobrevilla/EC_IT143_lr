-- Q: How to extract the first name from the contact name.

-- A First focus on ContactName column, then extract the first word from the given row. 

-- YouTube search: "How to extract first word SQL"
--https://www.youtube.com/watch?v=KRRSqV-Ya3Y

SELECT T.ContactName ,
	   LEFT (t.ContactName, CHARINDEX(' ', T.ContactName + ' ') - 1) AS first_name,
	   dbo.udf_parse_first_name(T.ContactName) AS first_name2
FROM dbo.t_w3_schools_customers T
ORDER BY 1;