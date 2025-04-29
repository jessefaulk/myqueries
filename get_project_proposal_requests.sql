-- Proposal Requests per Product Type given the project_id

DO $$
BEGIN
        RAISE NOTICE 'Proposal Requests per Product Type given the project';
END$$;

SELECT pr.id,
       pr.project_id,
       pr.carrier_id,
       pr.created_at,
       ipt.product_type_id,
       ipt.processed,
       ipt.updated_at
FROM proposal_requests AS pr
JOIN invited_product_types AS ipt ON pr.id = ipt.proposal_request_id
WHERE pr.project_id = :pid
ORDER BY pr.carrier_id, ipt.product_type_id;
