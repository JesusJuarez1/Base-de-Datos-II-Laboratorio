--4
describe Departments;
select * from Departments;

--5
describe Employees;

--7
Select distinct job_id from Employees;

--8
Select employee_id as "Emp #",last_name as "Employee",job_id as "Job",hire_date as "Hire Date" from Employees;
Emp #, Employee, Job

--9
Select last_name||', '||job_id as "Employee and Title" from Employees;

--10
Select employee_id||', '||first_name||', '||last_name||', '||email||', '||phone_number||', '||hire_date||', '
    ||job_id||', '||salary||', '||commission_pct||', '||manager_id||', '||department_id as "THE_OUTPUT" from Employees;
    
    
    
    
    
    
SELECT TO_CHAR((22/7)*6000*6000,999999999.99)||' square units' AS "Area" FROM DUAL;

Select * from sys.tables;
SELECT * FROM all_objects;
