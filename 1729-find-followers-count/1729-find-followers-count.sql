# Write your MySQL query statement below
SELECT user_id,count(follower_id)as followers_count
FROM Followers
Group BY user_id