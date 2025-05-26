-- What percentage of policies have Expired or been cancelled, and what was their average premium?
SELECT 
	policy_type, 
	ROUND(100.0 * SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)
	,2) AS Cancelled_policy_rate,
	ROUND(100.0 * SUM(CASE WHEN status = 'Expired' THEN 1 ELSE 0 END) / COUNT(*)
	,2) AS Lapsed_policy_rate,
	ROUND(AVG(premium_amount),2) Average_Premium_amount
FROM policies
GROUP BY policy_type

