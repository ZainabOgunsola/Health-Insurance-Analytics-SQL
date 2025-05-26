--  How many claims were rejected in the last 12 months, and what are the common types?
SELECT 
	claim_type,
	COUNT(*) AS rejected_claims
FROM claims
WHERE 
	claim_status = 'Rejected' 
	AND claim_date >= DATEADD(YEAR, -1,GETDATE())
GROUP BY claim_type
ORDER BY rejected_claims DESC
