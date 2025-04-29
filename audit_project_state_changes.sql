-- Query the given project number for any state changes.
DO $$
BEGIN
        RAISE NOTICE 'Audit of project state and type changes in descending order';
END$$;
SELECT pa.created_at AS timestamp, pa.reference_id AS project_id, pa.user_id, users.email, pa.changeset->'state' AS state ,pa.changeset->'type' AS type FROM _projects_audit AS pa JOIN users ON users.id = pa.user_id WHERE pa.reference_id IN (:pid) AND pa.changeset->'state' IS NOT null OR pa.reference_id IN (:pid) AND pa.changeset->'type' IS NOT null ORDER BY pa.created_at DESC
