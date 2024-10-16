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



/* insights based on the top-paying data engineering jobs in 2023:

1. Highest Salary: The top-paying positions for data engineers are offering an impressive average salary of $325,000.
 This salary is consistent across multiple roles at Engtal, indicating a strong demand for skilled data engineers in that company.

2. Key Skills: The most sought-after skills for these high-paying roles include:
- Python: A fundamental programming language for data manipulation and analysis.
- Spark: A powerful tool for big data processing.
- Pandas and Numpy: Essential libraries for data analysis in Python.
- Hadoop and Kafka: Important for handling large datasets and real-time data streaming.
- Kubernetes: Increasingly important for managing containerized applications.

3. Emerging Companies: Companies like AI Startups and Movable Ink are also offering attractive salaries,
 indicating that the tech industry is expanding and valuing data engineering expertise.

Overall, the data engineering field is thriving,
 with high salaries reflecting the critical role these professionals play in managing and analyzing data.
  If you're considering a career in this area, focusing on the mentioned skills could be very beneficial!
  */