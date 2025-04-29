-- Get project state and type
DO $$
BEGIN
	RAISE NOTICE 'Project state (status) and type';
END$$;
SELECT created_at, updated_at, effective_date, due_date, id, type, state, employer_id, owner_id, wt_owner_id, audited_project_id, automated_creation FROM projects WHERE id = :pid;
