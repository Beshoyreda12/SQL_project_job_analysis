/* Question: what are the top skills based on salary?
- look at the average salary associated with each skill for data engineering positions.
- focuses on roles with specified salaries, regardless of location.
- why? it reveals how different skills impact salary levels for data engineer and helps identify 
the most financially rewarding skills to acquire or improve.
*/



SELECT
    
    skills_dim.skills,
    round(avg(job_postings_fact.salary_year_avg), 0) as salary,
    count(job_postings_fact.job_id) as number_of_jobs
FROM
    job_postings_fact
INNER JOIN
    skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner JOIN
   skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short='Data Engineer' and
    job_work_from_home = TRUE and 
    salary_year_avg IS NOT NULL
group by 
    skills_dim.skill_id
Having
    count(skills_job_dim.job_id)>10
order BY 
    salary desc,
    number_of_jobs desc
limit 25;


/*1. **High Demand for Cloud and Containerization Skills**: 
Skills such as Kubernetes ($158,190) and Terraform ($146,057) are among the highest-paying,
indicating a strong demand for expertise in cloud infrastructure and container orchestration.
This trend reflects the industry's shift towards cloud-native architectures.

2. **Data Processing and Analysis Tools**:
Tools like Spark ($139,838), PySpark ($139,428), and Pandas ($144,656) are also highly valued.
This suggests that proficiency in data processing frameworks and libraries is crucial for data engineers,
as organizations increasingly rely on big data analytics.

3. **Emerging Technologies**: 
Skills related to streaming data and real-time processing, such as Kafka ($150,549) and Airflow ($138,518), are prominent.
This highlights the growing importance of real-time data processing in modern data engineering roles.

4. **Diverse Database Technologies**: 
The presence of various database technologies, including NoSQL (e.g., MongoDB at $138,569 and Cassandra at $151,282),
indicates a trend towards flexibility in data storage solutions. 
Companies are looking for engineers who can work with both traditional and non-traditional databases.

5. **Programming Languages**: 
Languages like Java ($138,087) and Go ($147,818) are also in demand, 
suggesting that strong programming skills remain essential for data engineering roles.

6. **Machine Learning and AI Integration**: 
Skills related to machine learning frameworks, such as PyTorch ($142,254), are emerging as valuable,
reflecting the integration of AI and machine learning into data engineering tasks.

Overall, the data indicates that data engineering roles are evolving, with a strong emphasis on cloud technologies,
real-time data processing, and a diverse set of programming and database skills. 
This trend suggests that professionals in this field should focus on continuous learning and adaptation to stay competitive.*/