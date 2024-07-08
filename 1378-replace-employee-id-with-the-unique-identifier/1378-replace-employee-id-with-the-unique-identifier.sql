/* Write your PL/SQL query statement below */
select B.unique_id , A.name 
    from Employees A LEFT OUTER JOIN EmployeeUNI B
        on A.id = B.id
