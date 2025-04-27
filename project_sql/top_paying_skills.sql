/* This query will show the top skills based on salary by looking at the avergae salary associated with each skill for data analyst jobs and 
focus on roles with specified salaries. 
*/

SELECT 
    skills,
   ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
    Big Data, Cloud, and Machine Learning Skills Pay the Most:

Tools like PySpark, Databricks, GCP, and DataRobot show that companies pay top dollar for analysts who can handle large-scale data and build predictive models.

 Programming and Engineering Skills are In Demand:

Knowledge of languages like Golang, Scala, and platforms like Kubernetes, GitLab, and Bitbucket boost salaries — analysts who can build and deploy data solutions are highly valued.

Advanced Data Tools and Libraries Still Matter:

Mastering Pandas, NumPy, PostgreSQL, and Jupyter remains essential — core technical skills are a must alongside newer tech.
*/