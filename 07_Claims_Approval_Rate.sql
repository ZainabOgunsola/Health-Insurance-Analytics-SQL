-- What is the claim approval rate (%) per claim type.
SELECT 
	claim_type, 
	ROUND(
	100.0 * SUM(CASE WHEN claim_status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*)
	, 2) AS claims_approval_rate
FROM claims
GROUP BY claim_type
ORDER BY claims_approval_rate DESC