-- SELECT category,
--        COUNT(a.account_id) AS accounts_count
-- FROM (
--     SELECT 'Low Salary' AS category
--     UNION ALL
--     SELECT 'Average Salary'
--     UNION ALL
--     SELECT 'High Salary'
-- ) AS cats
-- LEFT JOIN Accounts a
--   ON (cats.category = 'Low Salary' AND a.income < 20000)
--   OR (cats.category = 'Average Salary' AND a.income BETWEEN 20000 AND 50000)
--   OR (cats.category = 'High Salary' AND a.income > 50000)
-- GROUP BY category;


SELECT 'Low Salary' AS category, COUNT(*) AS accounts_count
FROM Accounts
WHERE income < 20000

UNION ALL

SELECT 'Average Salary', COUNT(*)
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL

SELECT 'High Salary', COUNT(*)
FROM Accounts
WHERE income > 50000;
