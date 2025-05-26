--Which policyholders have active policies but have not filed any claims in the past year?

SELECT
	ph.policyholder_id,
	ph.full_name,
	p.policy_id,
	p.status
FROM policyholders ph
JOIN policies p
ON ph.policyholder_id = p.policyholder_id
LEFT JOIN claims c ON p.policy_id = c.policy_id AND claim_date >= DATEADD(YEAR, -1, GETDATE())
WHERE 
	p.status = 'Active' 
	AND c.claim_id IS NULL
