--1
Select e.last_name, e.hire_date from Employees e join 
(Select employee_id,department_id from Employees where last_name = '&ENTER_NAME') d
on (e.department_id = d.department_id) where e.employee_id != d.employee_id;

--2
Select employee_id, last_name, salary from Employees where salary > 
(Select avg(salary) from Employees) order by salary;

--4
Select last_name, department_id, job_id from Employees where department_id in 
(Select department_id from Departments where location_id = 1700) order by department_id;

--5
Select last_name, salary from Employees where manager_id = 
(Select employee_id from Employees where last_name = 'King' and manager_id is null);

--6
Select department_id, last_name, job_id from Employees where department_id = 
(Select department_id from Departments where department_name = 'Executive');

