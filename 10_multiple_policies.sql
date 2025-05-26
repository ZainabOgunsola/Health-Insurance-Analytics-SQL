 -- Which policyholders have multiple policies and what’s their total premium and claim amount?
 SELECT 
    ph.full_name,
    COUNT(DISTINCT p.policy_id) AS num_policies,
    ROUND(SUM(p.premium_amount), 2) AS total_premium, 
    ROUND(SUM(c.claim_amount), 2) AS total_claim_amount
FROM policyholders ph
JOIN policies p ON ph.policyholder_id = p.policyholder_id
LEFT JOIN claims c ON p.policy_id = c.policy_id
GROUP BY ph.full_name
HAVING COUNT(DISTINCT p.policy_id) > 1
