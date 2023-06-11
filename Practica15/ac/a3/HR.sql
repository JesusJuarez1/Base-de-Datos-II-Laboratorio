--A
--1
Create view Employees_Vu as
Select employee_id, last_name employee, department_id from Employees;
--2
Select * from Employees_Vu;
--3
Select employee,department_id from Employees_Vu;
--4
Create view DEPT50 as
Select employee_id empno, last_name employee, department_id deptno from Employees where department_id = 50 with check option;
--5
Describe Dept50;
Select * from Dept50;
--6
Update Dept50 set deptno=80 where employee='Matos';


--B
--1
Create view emp_anon_v as
Select hire_date, job_id, salary,commission_pct, department_id from Employees ; 
Create view dept_anon_v as 
Select department_id, department_name, location_id from Departments;
--2
Create view dep_sum_v as
Select department_id,department_name, sum(salary) salaries,count(*) staff from Emp_anon_v join Dept_anon_v using (department_id)
group by department_id,department_name;
--3
Select * from Dep_sum_v;

--C
--1
insert into DEPT_ANON_V values(99,'Temp Dept',1800);
insert into EMP_ANON_V values(sysdate,'AC_MGR',10000,0,99);
--La primera insercion si la hace, la segunda no, porque la vista no incluye todas las columnas NOT NULL de la tabla Employees.
update emp_anon_v set salary=salary*1.1;
--Si actualiza los salarios debido a que la vista no incluye la opcion WITH CHECK OPTION.
rollback;
--2
Select max(avgsal) from (Select avg(salary)avgsal from Employees group by department_id);
Select max(salaries/staff) from DEP_SUM_V;


CREATE TABLE departments1 (
name CHAR(20) PRIMARY KEY,
office CHAR(50));
CREATE TABLE employees1 (
id SMALLINT PRIMARY KEY,
surname CHAR(40),
name CHAR(20),
salary INTEGER,
dep CHAR(20) REFERENCES departments1);
Select * from Departments;
--1
insert into departments1 values('Sales','Office_1');
insert into departments1 values('IT','Office_2');

insert into employees1 values(1,'Perez','Juan',1234,'Sales');
insert into employees1 values(2,'Felix','Maria',5678,'IT');
insert into employees1 values(3,'Hernandez','Pedro',9101,'Sales');

--2
create view EmpDepSales
(last_name,first_name) as
Select surname,name from Employees1 where dep='Sales';
Select * from EmpDepSales;
--3
Select last_name,first_name from EmpDepSales order by last_name,first_name;
--4
create or replace view EmpDepSales
(last_name,first_name,salary) as
Select surname,name,salary from Employees1 where dep='Sales';
Select * from EmpDepSales;
--5
create view EmpSalary 
(maxsal,minsal,avgsal)as
Select max(salary),min(salary),avg(salary) from Employees1 group by dep;
Select * from EmpSalary;
--6
Describe EmpDepSales;
Describe EmpSalary;
--7
Drop view EmpDepSales;
Drop view EmpSalary;

--E
--2
Create synonym emp for emp_anon_v;
Create synonym dept for dept_anon_v;
Create synonym dep_sum for dep_sum_v;
--3
Select * from emp;
Select * from dept;
Select * from dep_sum;
--4
insert into dept values(99,'Temp Dept',1800);
insert into emp values(sysdate,'AC_MGR',10000,0,99);
update emp set salary=salary*1.1;
rollback;
--5
Drop view emp_anon_v;
Drop view dept_anon_v;
--6
Select * from dep_sum;
--8
Drop view dep_sum_v;
--9
Select * from dep_sum;
--11
Drop synonym emp;
Drop synonym dept;
Drop synonym dep_sum;