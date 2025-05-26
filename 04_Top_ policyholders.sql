--  Who are the top 10 policyholders with the highest total approved claims?
SELECT TOP(10) full_name, 
	ROUND(SUM(claim_amount),2) total_approved_claims
FROM policyholders ph
JOIN policies p
ON ph.policyholder_id = p.policyholder_id
JOIN claims c
ON p.policy_id = c.policy_id
WHERE claim_status = 'Approved'
GROUP BY full_name
ORDER BY total_approved_claims DESC