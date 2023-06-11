Select employee_id, last_name, salary, to_char(salary +((salary/100)*15.5),'999,999,999') as "New Salary",
(salary+((salary/100)*15.5))-salary as "Increase" from Employees;