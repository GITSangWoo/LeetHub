# Write your MySQL query statement below
select MAX(num) as num
FROM (
SELECT num
FROM MyNumbers
GROUP BY num
Having count(num) = 1
) AS single 

