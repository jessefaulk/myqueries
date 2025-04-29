-- get_brokers_users.sql

-- Usage: psql service=prod-ro -f get_brokers_users.sql -v bid=

\echo 'Running query to retrieve users for broker_id: :bid'

    SELECT 
	users.broker_id, 
	brokers.name AS broker_name, 
	users.id AS user_id, 
	users.first_name, 
        users.last_name, 
        users.email 
    FROM 
	users 
    JOIN
	brokers ON users.broker_id = brokers.id
    WHERE 
	users.broker_id = :bid 
    ORDER BY first_name

