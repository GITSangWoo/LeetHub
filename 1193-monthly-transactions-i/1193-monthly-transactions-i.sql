-- # Write your MySQL query statement below
-- SELECT DATE_FORMAT(trans_date,'%Y-%m') as month, country,COUNT(DATE_FORMAT(trans_date,'%Y-%m')) as trans_count, COUNT(CASE WHEN state = "approved" THEN 1 END) as approved_count, SUM(amount) as  trans_total_amount, SUM(CASE WHEN state ="approved" THEN amount ELSE 0 END) as approved_total_amount
-- FROM Transactions
-- GROUP BY DATE_FORMAT(trans_date,'%Y-%m'),country
-- Order BY DATE_FORMAT(trans_date,'%Y-%m')

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country
ORDER BY month;

