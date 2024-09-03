# Write your MySQL query statement below
Select name,bonus 
From Employee e left join Bonus b
on e.empId = b.empId
where bonus < 1000 or bonus is null