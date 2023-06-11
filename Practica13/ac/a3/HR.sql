--a
Select sysdate Today, (Select count(*) from Departments) Dept_Count, (Select count(*) from Employees) Emp_Count from dual;

--b
Select last_name from Employees where employee_id in (Select manager_id from Employees);

--c
Select * from (Select max(salary),country_id from Employees natural join Departments natural join Locations
where department_id is not null group by country_id);
--Select max(e.salary),country_id from Employees e, (Select department_id,country_id from Departments natural join Locations) l 
--where e.department_id is not null and e.department_id = l.department_id group by country_id;

--d
Select last_name from Employees where department_id in (Select department_id from Departments 
where location_id in (Select location_id from Locations where country_id = 
(Select country_id from Countries where country_name = 'United Kingdom')));

--e
Select last_name from Employees where salary > (Select avg(salary) from Employees) and department_id in 
(Select department_id from Departments where department_name like 'IT%');

--f
Select last_name from Employees where salary > all (Select salary from Employees where last_name = 'Tobias');
Select last_name from Employees where salary > (Select max(salary) from Employees where last_name = 'Taylor');

--g
Select last_name from Employees where salary > any (Select salary from Employees where last_name = 'Tobias');
Select last_name from Employees where salary > (Select min(salary) from Employees where last_name = 'Taylor');

--h
Select e.last_name, d.department_name from Employees e,departments d where (e.department_id = d.department_id) 
and e.department_id in (Select department_id from Departments where department_name like '%&Department_name%');



