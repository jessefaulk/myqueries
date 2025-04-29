-- Documents given project_id
DO $$
BEGIN
        RAISE NOTICE 'Document(s) in this project';
END$$;
 SELECT documents.created_at, 
	documents.updated_at,
	documents.finalized_at,
	documents.declined_at,
	documents.declined_reason,
	documents.project_id,
	documents.id AS document_id,
	documents.carrier_id,
	carriers.name,
	documents.document_type,
	documents.state 
   FROM documents 
   LEFT JOIN carriers ON documents.carrier_id = carriers.id
  WHERE project_id = :pid
  ORDER BY documents.carrier_id, documents.id
