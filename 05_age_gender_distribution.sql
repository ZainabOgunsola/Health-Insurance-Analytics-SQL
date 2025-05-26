-- What is the distribution of policyholders by age group and gender?
SELECT 
    CASE 
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 46 AND 60 THEN '46-60'
		ELSE '60+'
END AS Age_group,
	gender,
	COUNT(*) AS num_policyholders
FROM policyholders
GROUP BY 
	CASE 
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
		WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 46 AND 60 THEN '46-60'
		ELSE '60+'
	END,
	gender
ORDER BY Age_group,gender 

