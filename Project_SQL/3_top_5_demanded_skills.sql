/* Question: What are the most in-demand skills for data analysts?
-- Join job postings to inner join table similar to query 
-- Identify the top 5 in-demand skills for a data analyst. 
-- Focus on all job postings.
-- Why? Retrieves the top skills with the highest demand in the job market,
        providing insights into the most valuable skills for job seekers.
*/

-- Top 5 in-demand skills for a data analyst 

select 
    skills,
    count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
where job_title_short='Data Analyst'
group by skills
order by  count(skills_job_dim.job_id) DESC
LIMIT 5;

-- Top 5 in-demand skills for a data analyst, Location : Anywhere (Remote)

select 
    skills,
    count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
where job_title_short='Data Analyst' AND job_location='Anywhere'
group by skills
order by  count(skills_job_dim.job_id) DESC
LIMIT 5;

-- Top 5 in-demand skills for a data analyst, Location : India

select 
    skills,
    count(skills_job_dim.job_id) as demand_count
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
where job_title_short='Data Analyst' AND job_location='India'
group by skills
order by  count(skills_job_dim.job_id) DESC
LIMIT 5;
