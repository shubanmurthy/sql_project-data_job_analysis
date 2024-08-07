/*
Question: What are the skills required for these top paying roles?
--  use the top 10 highest paying data analyst jobs from first query
-- add the specific skills required for these roles
-- Why?: It provides a detailed look at which high-pyaing jobs demand certain skills,
    helping job seekres understand which skills to develop that align with top salaries
*/


with top_paying_jobs AS
(select 
    job_id,
    job_title,
    cd.name as company_name,
    job_schedule_type,
    salary_year_avg
FROM
    job_postings_fact as jpf
left join company_dim cd on cd.company_id=jpf.company_id
where job_title_short='Data Analyst' AND
job_location='Anywhere' AND
salary_year_avg IS NOT NULL
order by salary_year_avg DESC
limit 10)


select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
inner join skills_job_dim on skills_job_dim.job_id=top_paying_jobs.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
order by salary_year_avg DESC;