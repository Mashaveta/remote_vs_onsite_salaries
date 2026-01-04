# Remote vs On-site Salaries (2023)

## Overview
This project analyzes whether remote roles are paid less than on-site roles within the same job title using 2023 salary data.

## Tools Used
- SQL (PostgreSQL)
- Tableau Public
- GitHub

## Key Findings
- For most job titles, on-site roles earn slightly more than remote roles.
- Salary differences are generally small.
- Some job titles only appear as on-site or remote due to data availability.

## Visualization
![Dashboard](dashboard 1.png)

## Tableau Public Link
https://public.tableau.com/app/profile/eliza.wanye/vizzes

## SQL Query
```sql
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

