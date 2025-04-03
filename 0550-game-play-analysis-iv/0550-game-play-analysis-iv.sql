SELECT ROUND(
    COUNT(CASE WHEN DATEDIFF(sub.second_played_date, sub.first_logged_date) = 1 THEN 1 END) /
    COUNT(DISTINCT sub.player_id), 
    2
) AS fraction
FROM (
    SELECT *, 
           FIRST_VALUE(event_date) OVER (PARTITION BY player_id ORDER BY event_date) AS first_logged_date,
           LEAD(event_date, 1) OVER (PARTITION BY player_id ORDER BY event_date) AS second_played_date
    FROM Activity
) AS sub;

