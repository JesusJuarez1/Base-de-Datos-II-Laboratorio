--a 2
Select region_name from Regions;
    --a 3
    Select region_name from Regions union Select region_name from Regions;
    --a 4
    Select region_name from Regions union all Select region_name from Regions;
    --a 5
    Select region_name from Regions intersect Select region_name from Regions;
    --a 6
    Select region_name from Regions minus Select region_name from Regions;

--b 2
Select department_id, count(employee_id) count_emp from Employees where department_id in (20,30,40) group by department_id;
    --b 3
    Select department_id, count(employee_id)count_emp from Employees group by department_id
    intersect
    Select department_id, count(*) from Employees where department_id in (20,30,40) group by department_id;
    --b 4
    Select manager_id from Employees 
    intersect
    Select manager_id from Employees where department_id = 20
    intersect
    Select manager_id from Employees where department_id = 30
    intersect
    Select employee_id from Employees where department_id != 40;
    --b 5
    Select department_id,null manager_id,sum(salary) from Employees group by department_id
    union
    Select null,manager_id,sum(salary) from Employees group by manager_id
    union all
    Select null,null,sum(salary) from Employees;
    
--c
    --c 1
    Select employee_id, last_name from Employees where employee_id in 
        (Select employee_id from Employees
        minus
        Select employee_id from Job_History) order by employee_id;
        
    --c 2
    Select last_name, job_title from Employees natural join Jobs natural join 
    (Select employee_id,job_id from Job_History
    intersect
    Select employee_id,job_id from Employees);
    
    --c 3
    Select job_title from Jobs natural join 
    (Select job_id from Employees where employee_id = &&employee_id 
    union 
    Select job_id from Job_History where employee_id = &employee_id)
    