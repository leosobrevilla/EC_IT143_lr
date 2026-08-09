SELECT pa.*
FROM Person.Address AS pa
WHERE pa.city='Bothell';

CREATE NONCLUSTERED INDEX IX_my_index
ON [Person].[Address] ([City]) 

