/* Write your PL/SQL query statement below */
Select customer_id, count(*) as count_no_trans
    from Visits A LEFT OUTER JOIN Transactions B 
        on A.visit_id = B.visit_id
    where transaction_id IS NULL
    group by customer_id
    