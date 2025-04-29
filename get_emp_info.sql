\echo 'Running query for Employer ID: ' :eid

-- List-Style Output

WITH employer_info AS (
    SELECT
        employers.id AS emp_id,
        employers.name AS employer_name,
        employers.broker_id,
        brokers.name AS broker_name,
        employers.status AS employer_status
    FROM
        employers
    JOIN
        brokers ON employers.broker_id = brokers.id
    WHERE
        employers.id = :eid
)
SELECT 'employer_name = ' || employer_name AS result FROM employer_info
UNION ALL
SELECT 'employer_id = ' || emp_id FROM employer_info
UNION ALL
SELECT 'broker_name = ' || broker_name FROM employer_info
UNION ALL
SELECT 'broker_id = ' || broker_id FROM employer_info
UNION ALL
SELECT 'employer_status = ' || employer_status FROM employer_info;

\echo ''
