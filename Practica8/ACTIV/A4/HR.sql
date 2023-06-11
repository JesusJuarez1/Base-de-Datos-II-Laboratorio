--1
SELECT DEPARTMENT_NAME FROM DEPARTMENTS WHERE DEPARTMENT_NAME LIKE '%ing';

--2
SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, (MAX_SALARY-MIN_SALARY) VARIANCE FROM JOBS
WHERE JOB_TITLE LIKE '%President%' OR JOB_TITLE LIKE '%Manager%' ORDER BY VARIANCE DESC, JOB_TITLE DESC;

--3
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, (SALARY*12) ANNUAL_SALARY, &&TAX_RATE AS TAX_RATE, (&TAX_RATE * (SALARY*12)) TAX 
FROM EMPLOYEES WHERE EMPLOYEE_ID = &EMPLOYEE_ID;