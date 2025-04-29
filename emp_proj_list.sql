\echo 'Running query for Employer ID: ' :eid

WITH employer_info AS (
    SELECT 
        employers.id AS emp_id, 
        employers.name AS employer_name, 
        employers.broker_id, 
        brokers.name AS broker_name 
    FROM 
        employers 
    JOIN 
        brokers ON employers.broker_id = brokers.id 
    WHERE 
        employers.id = :eid
),
project_info AS (
    SELECT 
        id AS proj_id, 
        employer_id, 
        state, 
        merged_into 
    FROM 
        projects 
    WHERE 
        employer_id = :eid 
        AND state = 'rfp_sent_to_market'
)
SELECT 
    'employer_name = ' || employer_name AS result
FROM 
    employer_info
UNION ALL
SELECT 
    'emp_id = ' || emp_id 
FROM 
    employer_info
UNION ALL
SELECT 
    'broker_name = ' || broker_name 
FROM 
    employer_info
UNION ALL
SELECT 
    'broker_id = ' || broker_id 
FROM 
    employer_info
UNION ALL
SELECT 
    'proj_id = ' || proj_id 
FROM 
    project_info;
