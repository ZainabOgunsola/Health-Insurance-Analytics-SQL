--What is the average premium collected and claim payout ratio per policy type
SELECT 
	policy_type, 
	ROUND(AVG(premium_amount),2) AS "Average Premium Amount", 
	ROUND(AVG(claim_amount),2) AS "Average Claim Amount", 
	ROUND(AVG(claim_amount) / AVG(premium_amount), 2) AS "Claim Payout Ratio"
FROM policies p
JOIN claims c
ON p.policy_id = c.policy_id
GROUP BY policy_type

