# Write your MySQL query statement below
select person_name
from (
select *, SUM(weight) OVER (ORDER BY turn) as Total_Weight
from Queue
order by turn
) sub 
where sub.Total_Weight <= 1000 
ORDER BY turn DESC
LIMIT 1;