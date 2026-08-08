-- Q1: How to keep track of when a record was last modified?
-- A1: This works for the initial INSERT...

ALTER TABLE dbo.t_hello_world
ADD last_modified_date DATETIME DEFAULT GETDATE();

-- Q2: How to keep track of who last modified a record


CREATE TABLE dbo.t_hello_world (
 my_message VARCHAR (25) PRIMARY KEY NOT NULL,
 current_date_time DATETIME NOT NULL DEFAULT GETDATE(),
)

DROP TABLE IF EXISTS dbo.t_hello_world