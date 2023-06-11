--1
Select round(avg(length(country_name))) average_country_name_length from Countries;

--2
Select to_char(end_date,'yyyy') "Quitting Year", job_id, count(*) "Number of Employees" from Job_History
group by to_char(end_date,'yyyy'),job_id order by count(*) desc;

--3
Select to_char(hire_date,'day'), count(*) from Employees group by to_char(hire_date,'day') having count(*) >= 15;