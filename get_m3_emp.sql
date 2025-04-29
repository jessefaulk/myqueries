-- SQL Script: get_m3_emp.sql
-- Description: This script retrieves employer details where the employer's name matches the provided input and the broker_id is 41.

-- Usage:
-- psql service=prod-ro -f get_m3_emp.sql -v ename='value'

SELECT 
    employers.id, 
    employers.name, 
    employers.status, 
    employers.broker_id, 
    brokers.name 
FROM 
    employers 
JOIN 
    brokers 
    ON employers.broker_id = brokers.id 
WHERE 
    LOWER(employers.name) LIKE '%' || LOWER(:'ename') || '%' 
    AND broker_id = 41;
