/*
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest paying data analyst roles that are available remotely.
- Focuses on job postings with specified salaries (not null)
- Why? highlight the top pyaing opportunities for data analysts,
    offering insghts into employment
*/

select 
    job_id,
    job_title,
    cd.name as company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact as jpf
left join company_dim cd on cd.company_id=jpf.company_id
where job_title_short='Data Analyst' AND
job_location='Anywhere' AND
salary_year_avg IS NOT NULL
order by salary_year_avg DESC
limit 10