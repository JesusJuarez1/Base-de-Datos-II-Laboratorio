SELECT LAST_NAME AS "Employee", SALARY AS "Monthly Salary", COMMISSION_PCT AS "Commission" 
FROM EMPLOYEES WHERE COMMISSION_PCT = ((&COMMISSION_PERCENTAGE)/100);