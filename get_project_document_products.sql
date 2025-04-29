-- Products per document for each carrier invited given the project_id
DO $$
BEGIN
        RAISE NOTICE 'Products per document for each carrier invited on the project';
END$$;

SELECT  products.created_at,
        products.updated_at,
	products.declined_at,
	products.project_product_id,
	project_products.label,
	products.document_id,
	products.document_type,
	products.carrier_id,
	products.id AS product_id,
	products.state,
	products.submitting_user_id,
	products.is_current_coverage,
	products.skip_threeflow_review
   FROM products 
   JOIN project_products ON products.project_product_id = project_products.id 
  WHERE document_id 
     IN (SELECT id 
	      FROM documents 
	     WHERE project_id = :pid) 
  ORDER BY products.document_type,
	   products.carrier_id,
	   project_products.label;
