# Write your MySQL query statement below
select sub.name 
from(
    Select e.name, count(m.managerId) as cntdir
    from Employee e join Employee m
    on e.id=m.managerId
    group by m.managerId
)as sub
where sub.cntdir>=5

