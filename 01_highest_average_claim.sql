-- Which policy type has the highest average claim amount?
SELECT 
	policy_type, 
	ROUND(AVG(claim_amount), 2) AS Average_claim_amount
FROM policies p
JOIN claims c
ON p.policy_id = c.policy_id
Group BY policy_type
ORDER BY Average_claim_amount DESC
