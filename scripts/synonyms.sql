SELECT * FROM TAB;

CREATE OR REPLACE SYNONYM emp_syn FOR EMP;

SELECT * FROM emp_syn;

SELECT * FROM TAB;

SELECT * FROM scott.emp_syn;

SELECT * FROM scott.EMP;

SELECT * FROM  hr.EMPLOYEES;

CREATE OR REPLACE PUBLIC SYNONYM hr_emp FOR hr.EMPLOYEES;

CREATE OR REPLACE PUBLIC SYNONYM hr_employees FOR EMPLOYEES;

select * from hr.hr_employees;

SELECT * FROM hr_emp;

SELECT * FROM hr.EMPLOYEES;

GRANT SELECT on hr.EMPLOYEES to C##hibernate;
GRANT SELECT on hr.hr_emp to C##hibernate;

SELECT * FROM HR.EMPLOYEES@localhost/orclpdb;

CREATE SYNONYM hr_emp FOR HR.EMPLOYEES@//localhost:1521/orclpdb;




