/* 
Question: what are the most in-demand skills for data engineers?
- join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for a data engineer.
*/


select
count(job_postings_fact.job_id) as number_of_jobs,
skills_dim.skills
FROM
job_postings_fact
INNER JOIN
skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where job_title_short='Data Engineer' and

job_schedule_type= 'Full-time'and 
salary_year_avg IS NOT NULL
GROUP BY skills_dim.skills
ORDER BY number_of_jobs DESC
limit 5