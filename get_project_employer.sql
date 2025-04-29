-- Get the employer associated with a project given the project_id
DO $$
BEGIN
        RAISE NOTICE 'Employer (Client) on Project';
END$$;
SELECT e.id, e.name, e.status, e.broker_id, b.name, e.created_at, e.updated_at FROM employers e JOIN brokers b ON e.broker_id = b.id WHERE e.id IN (SELECT employer_id FROM projects WHERE id = :pid);
