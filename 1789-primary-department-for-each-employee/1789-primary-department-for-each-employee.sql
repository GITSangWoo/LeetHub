# Write your MySQL query statement below
SELECT employee_id,department_id 
FROM (SELECT *,ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY primary_flag ASC)as rn 
FROM Employee)as sub 
WHERE sub.rn = 1