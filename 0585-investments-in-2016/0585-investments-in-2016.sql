# Write your MySQL query statement below

-- select *
-- from Insurance 
-- group by lat,lon
-- Having count(*) < 2
-- | pid | tiv_2015 | tiv_2016 | lat | lon |
-- | --- | -------- | -------- | --- | --- |
-- | 1   | 10       | 5        | 10  | 10  |
-- | 4   | 10       | 40       | 40  | 40  |


-- select tiv_2015
-- from Insurance 
-- group by tiv_2015
-- Having count(*)> 1

-- | tiv_2015 |
-- | -------- |
-- | 10       |


select ROUND(sum(tiv_2016),2) as tiv_2016
FROM  (
    select *
    from Insurance 
    group by lat,lon
    Having count(*) < 2
) as sub
WHERE tiv_2015 in (select tiv_2015
from Insurance 
group by tiv_2015
Having count(*)> 1)
