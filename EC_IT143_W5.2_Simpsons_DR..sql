/*****************************************************************************************************************
NAME:    5.2 Final Project: My Communities Analysis—Create Answers
PURPOSE: To provide answers for Simpsons database questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     7/30/2026   DanRod       1. Built this script for EC IT440


RUNTIME: 
2s

 
******************************************************************************************************************/

--Q1 by Daniel Rodriguez: What's the day Marge has had the most purchases and what was the total amount paid in that day?
SELECT TOP 1
    Member_Name,
    Date,
    COUNT(*) AS total_purchases,
    SUM(Debit) AS total_spent
FROM FBS_Viza_Costmo
WHERE Member_Name = 'Marge Simpson'
AND Debit IS NOT NULL
GROUP BY 
    Member_Name,
    Date
ORDER BY total_purchases DESC;

--Q2 by Anthony Agyen:What is the total amount spent by each card member across different spending categories in the Planet Express table?
SELECT Card_Member,
       Category,
       SUM(Amount) AS Total_Spent
FROM Planet_Express
GROUP BY
       Card_Member,
       Category
ORDER BY
    Card_Member,
    Category;

--Q3 by Daniel Rodriguez:How much did Homer Simpson spend over the course of 1989-1992? The ideas is to forecast expenditures for the upcoming 5 and make adjustments.
SELECT 
    Member_Name,
    SUM(Debit) AS total_spent_1989_1992
FROM FBS_Viza_Costmo
WHERE Member_Name = 'Homer Simpson'
AND Debit IS NOT NULL
AND Date BETWEEN '1989-01-01' AND '1992-12-31'
GROUP BY Member_Name;


--Q4 by Daniel Rodriguez:Back in 1990 Homer seemed pretty pressed due to ongoing debts. Which month were they the most financially unstable? Understood as the month that there were the msot charges but the least payments.
SELECT TOP 1
    YEAR(Date) AS year,
    MONTH(Date) AS month,
    SUM(Debit) AS total_charges,
    SUM(Credit) AS total_payments,
    SUM(Debit) - SUM(Credit) AS net_deficit
FROM FBS_Viza_Costmo
WHERE Member_Name = 'Homer Simpson'
AND Date BETWEEN '1990-01-01' AND '1990-12-31'
GROUP BY 
    YEAR(Date),
    MONTH(Date)
ORDER BY 
    net_deficit DESC;