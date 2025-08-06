# Write your MySQL query statement below
select 
    case 
        when s1.id%2 = 1 and s2.id IS NOT NULL then s1.id+1 
        when s1.id % 2 = 0 then s1.id - 1
        else s1.id  
    END AS id , s1.student
FROM Seat s1  LEFT JOIN Seat s2 on s1.id + 1 = s2.id 
ORDER BY id 