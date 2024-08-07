/*
Questions to Answer

1. what are the top paying jobs for my role?
2. What are the skills required for these top paying roles?
3. What are the most in demand skills for my roles?
4. What are the top skills based on salary for my role?
5. What are the most optimal skills to learn?
    a. optimal: High demand and high paying
*/

select 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
where job_title_short='Data Analyst' AND
job_location='Anywhere'