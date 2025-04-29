-- Project_products given the project_id
DO $$
BEGIN
        RAISE NOTICE 'Project Products or Lines of Coverage on given project';
END$$;
SELECT created_at, updated_at, id, product_type_id, label, inforce_carrier_id, prior_coverage, alternative AS alt, sold_status, sold_carrier_id FROM project_products WHERE project_id = :pid ORDER BY product_type_id;
