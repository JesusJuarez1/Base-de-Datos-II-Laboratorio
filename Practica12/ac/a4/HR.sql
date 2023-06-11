--a
Select employee_id, job_id, department_id, emp.last_name, emp.hire_date, jh.end_date from Employees emp natural join Job_History jh;

--b
Select e.first_name||' '||e.last_name||' is manager of the '||d.department_name||'department.' "Managers" from Employees e 
join Departments d on (e.employee_id = d.manager_id);

--c
Select e.last_name employee, e.employee_id,e.manager_id, m.last_name as "MANAGER", e.department_id from Employees e 
join Employees m on (e.manager_id = m.employee_id)
where e.department_id in (10,20,30) order by department_id;

--d
Select l.location_id, l.street_address, l.city, l.state_province, c.country_name from Locations l natural join Countries c;

--e
Select e.last_name, e.department_id, d.department_name from Employees e left outer join Departments d on (e.department_id = d.department_id);

--f
Select e.last_name, e.job_id, e.department_id, d.department_name from Employees e join Departments d on (e.department_id=d.department_id) join 
Locations l on (d.location_id=l.location_id and l.city='&CITY');

--g
Select e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", m.employee_id "MGR#" from Employees e 
join Employees m on (e.manager_id=m.employee_id);

--h
Select e.last_name "Employee", e.employee_id "Emp#", m.last_name "Manager", m.employee_id "MGR#" from Employees e 
left outer join Employees m on (e.manager_id=m.employee_id) order by e.employee_id;

--i
Select e.department_id, e.last_name employee, m.last_name colleague from Employees e join 
Employees m on (e.department_id=m.department_id and e.employee_id!=m.employee_id) order by e.department_id,e.last_name;

--j
Select e.first_name, e.job_id, d.department_name, e.salary, g.grade from Employees e join Departments d on (e.department_id=d.department_id) 
join Job_Grades g on (e.salary >= g.lowest_sal and e.salary <= g.highest_sal) order by e.employee_id;

--k
Select last_name, hire_date from Employees where hire_date > (Select hire_date from Employees where last_name = '&NAME') order by last_name;

--l
Select e.last_name, e.hire_date, m.last_name, m.hire_date from Employees e join 
Employees m on (e.manager_id=m.employee_id and e.hire_date < m.hire_date);

--m
Select d.department_name, d.department_id from Departments d left outer join Employees e on (d.department_id=e.department_id) where e.department_id is null;

--n
Select count(*) from Employees;
Select count(*) from Departments;
Select count(*) from Employees cross join Departments; 


