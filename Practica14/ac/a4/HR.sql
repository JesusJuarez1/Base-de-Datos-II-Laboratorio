--1
Select department_id from Employees where department_id is not null
minus
(Select department_id from Employees where job_id = 'ST_CLERK'
union
Select department_id from Job_History where job_id = 'ST_CLERK');

--2
Select country_id, country_name from Countries
minus
Select country_id, country_name from Countries
join Locations using (country_id) join departments using (location_id);

--3
Select distinct job_id, department_id from Employees where (department_id=10) 
union all
Select distinct job_id, department_id from Employees where (department_id=50)
union all
Select distinct job_id, department_id from Employees where  (department_id=20);

--4
Select employee_id, job_id from Employees
intersect
Select employee_id, job_id from Job_History;

--5
Select last_name,department_id,to_char(null) Department_name from Employees
union
Select to_char(null),department_id,department_name from Departments;

