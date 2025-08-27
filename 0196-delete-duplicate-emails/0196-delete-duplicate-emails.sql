# Write your MySQL query statement below
DELETE
FROM Person 
where id not in (
    select * from (
    select MIN(id)
    from Person
    group by email
    ) sub
) 