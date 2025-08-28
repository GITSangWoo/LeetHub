# Write your MySQL query statement below

-- SELECT distinct
--     (
--         SELECT  salary 
--         FROM (
--             SELECT 
--                 salary,
--                 dense_rank() OVER (ORDER BY salary DESC) AS `rank`
--             FROM Employee
--         ) AS sub
--         WHERE `rank` = 2
--     ) AS SecondHighestSalary;

SELECT
  (
    SELECT salary
    FROM (
      SELECT DISTINCT salary
      FROM Employee
      ORDER BY salary DESC
    ) AS distinct_salaries
    LIMIT 1 OFFSET 1  -- 두 번째로 큰 값
  ) AS SecondHighestSalary;

