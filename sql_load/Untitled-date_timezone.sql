select job_posted_date::Date
from job_postings_fact
limit 10;

select '2023-02-19'::Date,
'123':: INTEGER,
'true'::boolean,
'3.14'::real;

select * from job_postings_fact;

SELECT job_title_short as title,
job_location as location,
job_posted_date::date as date
from job_postings_fact;

select
    job_title_short,
    job_location,
    job_posted_date
from
    job_postings_fact
limit 5;

select
    job_title_short,
    job_location,
    job_posted_date as UTC_time_zone,
    job_posted_date at time zone 'UTC' at time zone 'EST' as EST_time_zone
FROM
    job_postings_fact
limit 5;

select
    job_title_short,
    job_location,
    job_posted_date as original_date,
    EXTRACT(MONTH from job_posted_date) as date_month,
    EXTRACT(YEAR from job_posted_date) as date_year,
    EXTRACT(DAY from job_posted_date) as date_day
from job_postings_fact
limit 10;

select
    count(job_id) as job_posted_count,
    EXTRACT(MONTH from job_posted_date) as month_date
from job_postings_fact
group by month_date
order by job_posted_count desc;

select count(job_id) as count_job_id,
EXTRACT(year from job_posted_date) as year_date
from job_postings_fact
group by year_date
order by count_job_id desc;

select 
count(job_id) as count_job_id,
extract(MONTH from job_posted_date) as month_date,
job_title_short
from job_postings_fact
where job_title_short='Data Analyst'
group by month_date,job_title_short
order by count_job_id desc
limit 10;

select
avg(salary_year_avg) as avg_salary__year,
avg(salary_hour_avg) as avg_salary_hour,
job_schedule_type
from job_postings_fact
where job_posted_date>'2023-06-01'
group by job_schedule_type;

select count(job_id) as count_job_posted,
EXTRACT(MONTH from job_posted_date)
from job_postings_fact
WHERE EXTRACT(year from job_posted_date)=2023
group by EXTRACT(month from job_posted_date)
order by EXTRACT(month from job_posted_date);

select * from job_postings_fact
limit 10;

select
extract(month from job_postings_fact) as month
from job_postings_fact as jan_2023
where month='3' and extract(year from job_posted_date)=2023;

create TABLE jan_jobs as 
    select * 
    from job_postings_fact
    where extract(month from job_posted_date)=1;

create TABLE feb_jobs as 
    select * 
    from job_postings_fact
    where extract(month from job_posted_date)=2;

create TABLE mar_jobs as 
    select * 
    from job_postings_fact
    where extract(month from job_posted_date)=3;

select job_posted_date
from mar_jobs;


create table april_jobs as
select * from job_postings_fact
where extract(month from job_posted_date)=4;

CREATE TABLE may_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 5;

CREATE TABLE june_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 6;

CREATE TABLE july_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 7;

CREATE TABLE august_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 8;

CREATE TABLE september_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 9;

CREATE TABLE october_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 10;

CREATE TABLE november_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 11;

CREATE TABLE december_jobs AS
SELECT * FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 12;


select * from december_jobs;
drop table december_jobs;

select * from november_jobs;

create table december_jobs as
select * from job_postings_fact
where EXTRACT(MONTH from job_posted_date)=12;

select
    job_title_short,
    job_location,
    CASE
        when job_location='Anywhere' then 'Remote'
        when job_location='New York, NY' then 'Local'
        else 'Onsite'
    END as location_category
from job_postings_fact;

select
    COUNT(job_id),
    CASE
        when job_location='Anywhere' then 'Remote'
        when job_location='New York, NY' then 'Local'
        else 'Onsite'
    END as location_category
from job_postings_fact
where job_title_short='Data Analyst'
GROUP BY location_category;

select * from job_postings_fact;
-------------------------------------------------------------
select COUNT(job_id) as Count_of_jobs,
    case
        when salary_year_avg between 1 and 50000 then 'Very Low'
        when salary_year_avg between 50000 and 100000 then 'Low'
        when salary_year_avg between 100000 and 250000 then 'Medium'
        when salary_year_avg between 250000 and 500000 then 'High'
        when salary_year_avg>500000 then 'Premium'
        else 'Free'
    END as PayScale,
    CASE
        when salary_year_avg between 1 and 50000 then '1$-50k$'
        when salary_year_avg between 50000 and 100000 then '50k$ - 100k$'
        when salary_year_avg between 100000 and 250000 then '100k$ - 250k$'
        when salary_year_avg between 250000 and 500000 then '250k$ - 500k$'
        when salary_year_avg>500000 then 'Over 500k$'
        else '0'
    END as Range_Payscale
from job_postings_fact
where job_title_short='Data Analyst'
group by PayScale,Range_Payscale,job_title_short
order by Count_of_jobs desc;

select COUNT(job_id) as Count_of_jobs,
job_title_short,
-- salary_year_avg,
    case
        when salary_year_avg<50000 then 'Very Low'
        when salary_year_avg>=50000 and salary_year_avg<100000 then 'Low'
        when salary_year_avg>=100000 and salary_year_avg<250000 then 'Medium'
        when salary_year_avg>=250000 and salary_year_avg<500000 then 'High'
        when salary_year_avg>=500000 then 'Premium'
        else 'Free'
        END as PayScale
from job_postings_fact
where job_title_short='Data Analyst'
group by job_title_short,PayScale,job_title_short,salary_year_avg
order by salary_year_avg desc;

select *
from (
    select *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date)=1
    ) AS january_jobs;

    select * 
    from (
        SELECT * from job_postings_fact
        where extract(MONTH from job_posted_date)=2
    ) as february_jobs;

WITH march01_jobs as (
    select * from job_postings_fact where EXTRACT(MONTH from job_posted_date)=3
)
select * from march01_jobs;

-- create table jan_test_jobs AS
-- (select * from job_postings_fact
-- where extract(MONTH from job_posted_date)=1);

drop table jan_test_jobs;

select *
from (
    select * from job_postings_fact
    where EXTRACT(month from job_posted_date)=1
    ) as jan_test_jobs;

select * 
    from (
        select * from job_postings_fact
        where extract(month from job_posted_date)=2
        order by job_posted_date
    ) as feb_test_jobs;


-- CTE'S 

with mar_test_jobs as
( 
    select *
    from job_postings_fact
    where extract(month from job_posted_date)=3
    order by job_posted_date
)
select * from mar_test_jobs;

with no_degree_req AS
(
    select company_id,name
    from company_dim
    where company_id=(select company_id from job_postings_fact where job_no_degree_mention='TRUE')
)
SELECT * FROM no_degree_req;

select * from company_dim;
select * from job_postings_fact;

select name
from company_dim
where company_id in (
    select company_id
    from job_postings_fact
    where job_no_degree_mention='TRUE'
    );


select company_id,NAME as company_name
from company_dim
where company_id in (
    select company_id
    from job_postings_fact
    where extract(month from job_posted_date)=2)
order by company_id;

-- select company_id,name as company_name
-- from job_postings_fact
-- where 

with company_job_count as (
select company_id,count(*) as total_jobs
from job_postings_fact
group by company_id
)

select 
    cd.name as company_name,
    cj.total_jobs
from company_dim as cd
left join company_job_count as cj on cj.company_id=cd.company_id;

with company_job_count as (
    select company_id,
    count(*) as total_jobs
    from job_postings_fact
    group by company_id
)

SELECT 
cd.name as company_name,
cj.total_jobs
from company_job_count as cj
left join company_dim as cd on cd.company_id=cj.company_id
order by cj.total_jobs desc;

-- select count(*) as max_skill,sd.skills
-- from skills_job_dim as sjd
-- left join skills_dim as sd on sd.skill_id=sjd.skill_id
-- group by sd.skills
-- order by max_skill desc
-- limit 5;

select * from job_postings_fact;
select * from skills_dim;
select * from skills_job_dim;

with table_skill as (
    select count(job_id) as most_skill, skill_id
    from skills_job_dim
    group by skill_id
    order by most_skill desc
)

select sd.skill_id,sd.skills,ts.most_skill
from skills_dim as sd 
left join table_skill as ts on ts.skill_id=sd.skill_id
order by most_skill desc
limit 5;

-- find the count of the number of remote job postings per skill
-- display the top 5 skills by their demand in remote jobs
-- include skill id, name,& count of postings requiring the skills

select * from job_postings_fact
where job_work_from_home='TRUE'
LIMIT 10;

with table_skill as (
    select count(job_id) as most_skill, skill_id
    from skills_job_dim
    group by skill_id
    order by most_skill desc
)

select sd.skill_id,sd.skills,ts.most_skill
from skills_dim as sd 
left join table_skill as ts on ts.skill_id=sd.skill_id
order by most_skill desc
limit 5;


with table_most_skill as (
    select sd.skill_id,sd.skills,count(*) as max_skill
    from skills_job_dim as sjd
    left join skills_dim as sd on sd.skill_id=sjd.skill_id
    group by sd.skill_id,sd.skills
    order by max_skill desc
    limit 5
);

-- select 
-- from job_postings_fact as jp
-- left join skill_job_dim as sj on sj.job_id=jp.job_id
-- left join table_most_skill

-- select skill_id,
-- count(*) as skill_count
-- from skills_job_dim as skills_to_job
-- inner join job_postings_fact as job_postings on job_postings.job_id=skills_to_job.job_id
-- where job_postings.job_work_from_home='TRUE'
-- group by 

select current_time();


