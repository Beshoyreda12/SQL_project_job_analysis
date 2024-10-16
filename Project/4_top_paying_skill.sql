/* Question: what are the top skills based on salary?
- look at the average salary associated with each skill for data engineering positions.
- focuses on roles with specified salaries, regardless of location.
- why? it reveals how different skills impact salary levels for data engineers and helps
identify the most financially rewarding skills to acquire or improve.
*/


select
skills_dim.skills,
round(avg(salary_year_avg), 0) as average_skill_salry

FROM
job_postings_fact
INNER JOIN
skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where salary_year_avg IS NOT NULL
and job_title_short = 'Data Engineer'
GROUP BY skills_dim.skills
ORDER BY average_skill_salry DESC
limit 25