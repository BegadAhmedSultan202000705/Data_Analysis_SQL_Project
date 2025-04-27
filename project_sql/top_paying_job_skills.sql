/* Next, the second query will represent the skills required for the top-paying data analyst jobs. 
    The first query which presented the top 10 highest-paying data analyst jobs will be used. 
    - This query will add the specific skills required for these roles to provide a detailed information at which high-paying jobs demand certain skills,
        helping job seekers understand which skills to develop that align with top salaries. 
*/  

WITH top_paying_jobs AS(

    SELECT
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/* Here's a quick analysis:

SQL is the most required skill, appearing 8 times.

Python follows closely, appearing 7 times.

Tableau is next, mentioned 6 times.

*/