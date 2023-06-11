--1
select distinct department_id from Employees;

--2
Select * from Regions where region_name = 'Europe';
Select * from Countries where region_id = 1;

--3
DESCRIBE JOBS;
DESCRIBE JOB_HISTORY;
DESCRIBE LOCATIONS;
DESCRIBE COUNTRIES;
DESCRIBE REGIONS;

--4
SELECT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE, 
	TO_CHAR((1+(END_DATE-START_DATE))/365.25,'99999.99') AS "Years Employed" FROM JOB_HISTORY;

--5
SELECT 'The Job Id for the '||JOB_TITLE||'''s job is: '||JOB_ID AS "Job Description" FROM JOBS WHERE JOB_ID = 'AD_PRES';

--6
SELECT TO_CHAR((22/7)*6000*6000,999999999.99)||' square units' AS "Area" FROM DUAL;