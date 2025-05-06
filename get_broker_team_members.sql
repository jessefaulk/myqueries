-- Get all team members for employers under a specific broker
-- Input: :bid (broker_id)

SELECT
  e.id AS employer_id,
  e.name AS employer_name,
  u.id AS user_id,
  u.first_name,
  u.last_name,
  u.email,
  e.broker_id
FROM
  employers e
JOIN broker_team_members btm ON e.id = btm.employer_id
JOIN users u ON btm.user_id = u.id
WHERE
  e.broker_id = :bid
ORDER BY
  e.name;
