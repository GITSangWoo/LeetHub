# Write your MySQL query statement below
select x, y,z , 
    case 
        when ABS(x + y) > ABS(z) AND ABS(x + z) > ABS(y) AND ABS(y + z) > ABS(x) then "Yes"
        ELSE "No"
    END AS triangle
FROM Triangle 