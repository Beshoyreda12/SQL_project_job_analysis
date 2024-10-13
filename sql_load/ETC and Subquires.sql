with remote_jobs AS 
    (
        select 
            job_id
            
        FROM
            job_postings_fact
        where 
            job_work_from_home = true and job_title_short = 'Data Analyst'
        GROUp by
            job_id
    )

select
     count(skill_per_job.job_id) as number_of_jobs,
     skills_dim.skills
from (
        select 
            remote_jobs.job_id,
            skills_job_dim.skill_id
        from 
            remote_jobs
        INNER JOIN
            skills_job_dim on remote_jobs.job_id = skills_job_dim.job_id
) as skill_per_job
INNER JOIN
skills_dim on skill_per_job.skill_id = skills_dim.skill_id
GROUP BY skills_dim.skills
ORDER BY number_of_jobs DESC
