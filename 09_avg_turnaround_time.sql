-- What is the average turnaround time between policy start date and first claim submission? 
WITH FirstClaimDates AS (
    SELECT 
        policy_id,
        MIN(claim_date) AS first_claim_date
    FROM claims
    GROUP BY policy_id
)
SELECT 
    ROUND(AVG(DATEDIFF(DAY, p.start_date, fc.first_claim_date) * 1.0), 2) AS avg_turnaround_days
FROM policies p
JOIN FirstClaimDates fc ON p.policy_id = fc.policy_id;

