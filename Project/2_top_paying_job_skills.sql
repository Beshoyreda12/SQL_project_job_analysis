/* Question: what skills are required for the top-paying data engineering jobs?
 _ Use the top 10 highest-paying data engineering jobs from first query
 _ Add the specific skills required for these roles
 _ Why?
    it provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
    */

with job_information AS (
select 
job_title_short,
job_title,
salary_year_avg,
company_dim.name,
job_id

from job_postings_fact

LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id

where job_title_short='Data Engineer' and
job_work_from_home = TRUE and 
job_schedule_type= 'Full-time'and 
salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC
limit 10
)


select job_information.*,
skills_dim.skills
from 
job_information

inner JOIN skills_job_dim on job_information.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id