/*
Question: What are the top skills based on salary?
-- Look at the average salary associated with each skill for Data Analyst positions
-- Focuses on roles with specified salaries, regardless of location
-- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/


select 
    skills,
    round(avg(salary_year_avg),2) as avg_salary
    from job_postings_fact
inner join skills_job_dim on skills_job_dim.job_id=job_postings_fact.job_id
inner join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
    where job_title_short='Data Analyst'
    and salary_year_avg IS NOT NULL
    and job_location='Anywhere'
group by skills
order by avg_salary DESC
LIMIT 10;


/*
Trends and Observations
Focus on Big Data and AI:

High salaries for skills like PySpark and Watson reflect the ongoing trend towards 
big data analytics and artificial intelligence.
Importance of Automation and Version Control:

Tools like Bitbucket and GitLab are highly valued, demonstrating the need for 
efficient version control and automation in development workflows.
Demand for Specialized Data Tools:

Skills in tools like DataRobot and Jupyter are well-compensated,
indicating a trend towards specialization in data science tools and platforms.
Diversification in Programming Languages:

Swift's presence among high-paying skills shows that data roles are
expanding to include a variety of programming languages,
not just those traditionally associated with data analysis.
Emphasis on Data Storage and Retrieval:

Technologies like Couchbase and Elasticsearch receiving high pay 
emphasize the importance of advanced data storage and retrieval mechanisms.
*/