Select employee_id, last_name from Employees where salary > (Select avg(salary) from Employees) 
and department_id in (Select department_id from Employees where last_name like '%u%');