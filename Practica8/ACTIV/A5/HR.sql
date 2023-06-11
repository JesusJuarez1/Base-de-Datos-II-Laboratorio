--1 ARCHIVO lab_08_01.sql
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >= &SALARY;
--2
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE EMPLOYEE_ID = &EMPLOYEE_ID;
--3 ARCHIVO lab_08_03.sql
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY NOT BETWEEN &MIN_SALARY AND &MAX_SALARY;
--4
SELECT LAST_NAME, JOB_ID, HIRE_DATE FROM EMPLOYEES WHERE LAST_NAME LIKE 'Matos' OR LAST_NAME LIKE 'Taylor' ORDER BY HIRE_DATE ASC;
--5
SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID IN (&DEPARTMENT_ID_1,&DEPARTMENT_ID_2) ORDER BY FIRST_NAME ASC;
--6 ARCHIVO lab_08_06.sql
SELECT LAST_NAME AS "Employee", SALARY AS "Monthly Salary" FROM EMPLOYEES WHERE 
(SALARY BETWEEN &MIN_SALARY AND &MAX_SALARY) AND DEPARTMENT_ID IN (&DEPARTMENT_ID_1,&DEPARTMENT_ID_2);
--7 SE CAMBIO EL A�O PORQUE NO HABIA NINGUN REGISTRO CON EL A�O DE CONTRATACION 1994
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE EXTRACT(YEAR FROM HIRE_DATE) = &YEAR;
--8
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
--9
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL ORDER BY SALARY DESC, COMMISSION_PCT DESC;
--10 ARCHIVO lab_08_10.sql
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY > &MIN_SALARY;
--11
SELECT EMPLOYEE_ID, LAST_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES WHERE MANAGER_ID = &MANAGER_ID ORDER BY &COLUMN_NAME_TO_ORDER;
--12 
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '__a%';
--13
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%';
--14
SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_ID FROM JOBS WHERE JOB_TITLE 
IN ('Sales Representative','Stock Clerk')) AND SALARY NOT IN (2500,3500,7000);
--15 ARCHIVO lab_08_15.sql
SELECT LAST_NAME AS "Employee", SALARY AS "Monthly Salary", COMMISSION_PCT AS "Commission" FROM EMPLOYEES WHERE COMMISSION_PCT = ((&COMMISSION_PERCENTAGE)/100);
