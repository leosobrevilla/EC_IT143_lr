-- Q: How to extract the first name from the contact name.

-- A First focus on ContactName column, then extract the first word from the given row. 

-- YouTube search: "How to extract first word SQL"
--https://www.youtube.com/watch?v=KRRSqV-Ya3Y

SELECT T.CustomerID,
	   T.CustomerName,
	   T.ContactName,
	   dbo.udf_parse_first_name(T.ContactName) AS ContactName_first_name,
	   dbo.udf_parse_last_name(T.ContactName) AS ContactName_last_name, -- How to extract last name from Contact Name?
	   T.Address,
	   T.City,
	   T.Country
FROM dbo.t_w3_schools_customers T
ORDER BY 3;
-----------------------------------------------------
