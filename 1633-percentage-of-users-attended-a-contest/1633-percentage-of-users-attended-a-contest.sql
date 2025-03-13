# Write your MySQL query statement below
SELECT
contest_id, ROUND(COUNT(u.user_id)/(SELECT COUNT(user_id) FROM Users)*100,2 ) as percentage
FROM 
Register r LEFT JOIN Users u
on r.user_id = u.user_id 
Group by 
contest_id
Order by 
percentage DESC, contest_id ASC

