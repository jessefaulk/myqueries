\echo 'Running query for Employer ID: ' :eid

-- List-Style Output
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
    'employer_id = ' || emp_id 
FROM 
    employer_info
UNION ALL
SELECT 
    'Broker Name = ' || broker_name 
FROM 
    employer_info
UNION ALL
SELECT 
    'Broker ID = ' || broker_id 
FROM 
    employer_info
UNION ALL
SELECT 
    'Project ID = ' || proj_id 
FROM 
    project_info;

\echo ''
\echo 'Table View of Employer and Projects'

-- Table-Style Output
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
)
SELECT 
    'Employer Info' AS section, 
    emp_id, 
    employer_name, 
    broker_id, 
    broker_name, 
    NULL AS proj_id, 
    NULL AS state, 
    NULL AS merged_into 
FROM 
    employer_info
UNION ALL
SELECT 
    'Project Info' AS section, 
    NULL AS emp_id, 
    NULL AS employer_name, 
    NULL AS broker_id, 
    NULL AS broker_name, 
    proj_id, 
    state, 
    merged_into 
FROM 
    project_info;
