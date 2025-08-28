# Write your MySQL query statement below

SELECT 
    (
        SELECT salary
        FROM (
            SELECT 
                distinct salary,
                DENSE_RANK() OVER (ORDER BY salary DESC) AS `rank`
            FROM Employee
        ) AS sub
        WHERE `rank` = 2
    ) AS SecondHighestSalary;

