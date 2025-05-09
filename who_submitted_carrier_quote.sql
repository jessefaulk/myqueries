SELECT
  projects.id AS project_id,
  documents.id AS document_id,
  employers.name AS employer_name,
  employers.status AS employer_status,
  brokers.id AS broker_id,
  brokers.name AS broker_name,
  users.carrier_id AS carrier_id,
  users.email AS user_email,
  audit.event,
  audit.changeset
FROM _documents_audit AS audit
JOIN users ON users.id = audit.user_id
JOIN documents ON documents.id = audit.reference_id
JOIN projects ON projects.id = documents.project_id
JOIN employers ON employers.id = projects.employer_id
JOIN brokers ON brokers.id = employers.broker_id
WHERE audit.event = 'update'
AND audit.changeset::jsonb ? 'finalized_at'
AND audit.reference_id IN (
            SELECT documents.id
            FROM documents
            JOIN projects
            ON documents.project_id = projects.id
            WHERE projects.id = :id
            --WHERE projects.id IN (:ids))
            --AND documents.carrier_id = :cid
)
