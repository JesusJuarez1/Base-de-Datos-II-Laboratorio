--1
Select sysdate as "Date" from Dual;
--5.1
Select initcap(last_name) "Last Name", length(last_name) "Length" from Employees 
where last_name like 'J%' or last_name like 'A%' or last_name like 'M%';
--5.2
Select initcap(last_name) "Last Name", length(last_name) "Length" from Employees 
where last_name like '&Start_Letter%';
--5.3
Select initcap(last_name) "Last Name", length(last_name) "Length" from Employees 
where last_name like upper('&Start_Letter%');
--6
Select last_name, round(months_between(sysdate,hire_date)) MONTHS_WORKED from Employees order by months_between(sysdate,hire_date);
--7
Select last_name, lpad(salary,15,'$') salary from Employees;
--8
Select (rpad(last_name,8,' ') )||(rpad(' ',round(salary/1000),'*')) as EMPLOYEES_AND_THEIR_SALARIES from Employees order by salary desc;
--9
Select last_name, trunc((sysdate-hire_date)/7,0) tenencia from Employees where department_id = 80 order by (sysdate-hire_date)/7 desc;



