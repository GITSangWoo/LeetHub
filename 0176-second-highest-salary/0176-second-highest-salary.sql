# Write your MySQL query statement below

SELECT 
    (
        SELECT  distinct salary 
        FROM (
            SELECT 
                salary,
                dense_rank() OVER (ORDER BY salary DESC) AS `rank`
            FROM Employee
        ) AS sub
        WHERE `rank` = 2
    ) AS SecondHighestSalary;

-- WITH RankedSalaries AS (
--   SELECT 
--     salary,
--     ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
--   FROM (
--     SELECT DISTINCT salary FROM Employee
--   ) AS distinct_salaries
-- )
-- SELECT
--   rs.salary AS SecondHighestSalary
-- FROM 
--   RankedSalaries rs
-- WHERE
--   rs.rn = 2;
