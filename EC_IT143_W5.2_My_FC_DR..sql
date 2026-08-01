/*****************************************************************************************************************
NAME:    5.2 Final Project: My Communities Analysis—Create Answers
PURPOSE: To provide answers for MyFC questions

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     7/30/2026   DanRod       1. Built this script for EC IT440


RUNTIME: 
2s

 
******************************************************************************************************************/

--Q1 Anthony gyen: Which team has the highest total Month-to-Date salary payout across all its players?
SELECT TOP 1
    TD.t_id,
    TD.t_code,
    SUM(pf.mtd_salary) AS Total_MTD_Salary
FROM tblPlayerFact AS PF
JOIN tblPlayerDim AS PD
    ON PF.pl_id = PD.pl_id
JOIN tblTeamDim AS TD
    ON PD.t_id = TD.t_id
GROUP BY
    TD.t_id,
    TD.t_code
ORDER BY
    Total_MTD_Salary DESC;

--Q2 by Daniel Rodriguez: Which players within each position are the highest paid ones? Is this justified?
SELECT POS.p_name,
       PL.pl_name,
       PF.mtd_salary
FROM tblPlayerDim PL
JOIN tblPositionDim POS
    ON PL.p_id = POS.p_id
JOIN tblPlayerFact PF
    ON PL.pl_id = PF.pl_id
WHERE PF.as_of_date = (
        SELECT MAX(as_of_date) 
        FROM tblPlayerFact)
AND PF.mtd_salary = (
        SELECT MAX(PF2.mtd_salary)
        FROM tblPlayerFact PF2
        JOIN tblPlayerDim PL2
            ON PF2.pl_id = PL2.pl_id
        WHERE PL2.p_id = PL.p_id
          AND PF2.as_of_date = (
                SELECT MAX(as_of_date)
                FROM tblPlayerFact
            )
    )
ORDER BY POS.p_name;

--Q3 by Daniel Rodriguez: What was the total salary we paid per team, in all our categories? The idea is to see wether the professional squad does represent the idea of hierarchy and professional scope of the institution, while still investing on youth talent.
SELECT 
    T.t_code,
    SUM(PF.mtd_salary) AS Total_Team_Salary
FROM tblPlayerFact PF
JOIN tblPlayerDim PL
    ON PF.pl_id = PL.pl_id
JOIN tblTeamDim T
    ON PL.t_id = T.t_id
GROUP BY 
    T.t_code
ORDER BY 
    total_team_salary DESC;


--Q4 by Daniel Rodriguez: Within U18 and U17 squads, which players represent the highest salaries? Who would likely be promoted to first squad?
SELECT 
    T.t_code,
    PL.pl_name,
    PF.mtd_salary
FROM tblPlayerFact PF
JOIN tblPlayerDim PL
    ON PF.pl_id = PL.pl_id
JOIN tblTeamDim T
    ON PL.t_id = T.t_id
WHERE T.t_code IN ('U18', 'U17')
AND PF.as_of_date = (
        SELECT MAX(as_of_date)
        FROM tblPlayerFact
)
ORDER BY 
    T.t_code,
    PF.mtd_salary DESC;