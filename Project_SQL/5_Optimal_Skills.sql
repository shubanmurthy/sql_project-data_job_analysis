/*
Question: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
--Identify skills in high demand and associated with high average salaries for Data Analyst roles
--Concentrates on remote positions with specified salaries
--Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
        offering strategic insights for career development in data analysis 6 7 I 
*/

with demanded_skills AS (
select 
    skills_job_dim.skill_id,
    skills,
    count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
    where job_title_short='Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location='Anywhere'
group by skills_job_dim.skill_id,skills),

average_salary AS (
select 
    skills_job_dim.skill_id,
    skills,
    round(avg(salary_year_avg),2) as avg_salary
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
    where job_title_short='Data Analyst'
    and salary_year_avg IS NOT NULL
    and job_location='Anywhere'
group by skills_job_dim.skill_id,skills)

SELECT 
    demanded_skills.skill_id,
    demanded_skills.skills,
    demanded_skills.demand_count,
    average_salary.avg_salary
from demanded_skills
INNER JOIN average_salary 
    on average_salary.skill_id=demanded_skills.skill_id