SELECT 
  employers.id, 
  employers.name, 
  employers.broker_id, 
  brokers.name 
FROM employers
JOIN brokers
  ON employers.broker_id = brokers.id 
WHERE employers.id = :id
