/* Question: what are the top-paying data engineerinng jobs?
- identify the top 10 highest-paying data engineers roles that are available remotly.
- focuses on job postings with specified salaries (remove nulls).
-why?
        highlight the top-paying oppertunities for data engineers
        offering insights into employment oppertunities
*/


select job_title_short,
job_title,
salary_year_avg,
company_dim.name,
job_location,
job_schedule_type,
job_id
from job_postings_fact

LEFT JOIN company_dim on job_postings_fact.company_id=company_dim.company_id

where job_title_short='Data Engineer' and
job_work_from_home = TRUE and 
salary_year_avg IS NOT NULL

ORDER BY salary_year_avg DESC
limit 10
