--Are remote jobs paid less than on-site jobs within the same job title in 2023?
SELECT job_title, ROUND(AVG(salary_in_usd)) AS avg_salary, COUNT(*) AS number_of_jobs,
CASE
	WHEN remote_ratio = 0 THEN 'On-site'
	WHEN remote_ratio = 100 THEN 'Remote'
END AS work_type
FROM ds_salaries 
WHERE salary_in_usd IS NOT NULL AND remote_ratio IN(0,100)
GROUP BY job_title, remote_ratio
HAVING COUNT(*)>10
ORDER BY job_title, remote_ratio;

