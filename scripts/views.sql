SELECT * FROM EMP;

CREATE VIEW emp_view
    AS 
    SELECT * FROM EMP;
    
    
DESC emp_view;


CREATE VIEW emp_view_name_no
    AS 
    SELECT empno,ename FROM EMP;
    
DESC emp_view_name_no;

SELECT * FROM emp_view_name_no;

CREATE VIEW emp_view_name_id (
        id ,name
    )
    AS 
    SELECT empno,ename FROM EMP;
    
SELECT * FROM emp_view_name_id;

/*
TABLE for view
*/

CREATE TABLE V_TABLE (
    id NUMBER,
    name VARCHAR2(20),
    email VARCHAR2(30)
);
/*
VIEW for V_TABLE
*/

CREATE VIEW v_table_view(v_id, v_name,v_email)
        AS SELECT id,name,email FROM V_TABLE;
        
SELECT * FROM v_table_view;

INSERT INTO v_table_view VALUES (1,'test', 'test@test.com');

SELECT * FROM V_TABLE;

CREATE VIEW v_table_view_email(v_id, v_email)
        AS SELECT id,email FROM V_TABLE;

DESC v_table_view_email;

SELECT * FROM v_table_view_email;

SELECT v_id,v_email FROM v_table_view_email;

SELECT * FROM V_TABLE;

INSERT INTO v_table_view_email VALUES (2,'test2@test.com');

INSERT INTO v_table_view_email(v_id,v_email) VALUES (3,'test3@test.com');

UPDATE v_table_view_email set v_email ='test@test.com' WHERE v_id=2;

UPDATE v_table_view_email set name ='test2' WHERE v_id=2;

DELETE FROM v_table_view_email WHERE v_id=2;

/*
CREATING view without table
*/

CREATE FORCE VIEW  view_no_name 
    AS
    SELECT * FROM N0_TABLE;
    
DESC view_no_name;

CREATE TABLE N0_TABLE (
    id NUMBER,
    description VARCHAR2(20),
    dob DATE
);

INSERT INTO N0_TABLE VALUES (1, 'testing', TO_DATE('01-12-1990', 'dd-mm-yyyy'));
COMMIT;

SELECT * FROM N0_TABLE;

SELECT * FROM view_no_name;

ALTER VIEW view_no_name COMPILE;

DROP VIEW view_no_name;

CREATE FORCE VIEW  view_no_name 
    AS
    SELECT id,dob FROM N0_TABLE;
    
/*
CREATE OR REPLACE
*/

SELECT * FROM EMP;

CREATE OR REPLACE FORCE VIEW emp_view_one
    (emp_id, emp_name,sal)
    AS
    SELECT EMPNO,ENAME,SAL FROM EMP;
    
SELECT * FROM emp_view_one;

DESC emp_view_one;

CREATE OR REPLACE FORCE VIEW emp_view_one
    (emp_id, emp_name,sal,mgr_id)
    AS
    SELECT EMPNO,ENAME,SAL,MGR FROM EMP;
    
SELECT * FROM EMP;

SELECT * FROM EMP WHERE DEPTNO = 10;

CREATE OR REPLACE FORCE VIEW emp_10_records
    AS
    SELECT * FROM EMP WHERE DEPTNO=10;
    
SELECT * FROM EMP_10_RECORDS;

/*
READ ONLY VIEWS
*/

SELECT * FROM EMP;

CREATE OR REPLACE FORCE VIEW emp_read_only
    AS
    SELECT * FROM EMP;
    
SELECT * FROM EMP_READ_ONLY;

INSERT INTO EMP_READ_ONLY VALUES (1234,'TEST','TEST',null,SYSDATE, 1000, null, null);

UPDATE EMP_READ_ONLY SET MGR=7934 WHERE EMPNO=1234;

DELETE FROM EMP WHERE EMPNO = 1234;
/*
    READ ONLY VIEW UPDATE
    ===============
*/
CREATE OR REPLACE FORCE VIEW emp_read_only
    AS
    SELECT * FROM EMP
    WITH READ ONLY;
    
SELECT * FROM EMP_READ_ONLY;

INSERT INTO EMP_READ_ONLY VALUES (1234,'TEST','TEST',null,SYSDATE, 1000, null, null);
/*
Result
SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
*/

UPDATE EMP_READ_ONLY SET COMM=100 WHERE EMPNO=7369;
/*
Result
SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
*/

DELETE FROM EMP_READ_ONLY WHERE EMPNO = 7369;
/*
Result
SQL Error: ORA-42399: cannot perform a DML operation on a read-only view
*/

/*
===============================================================================

*/

CREATE OR REPLACE VIEW emp_10_departments
    AS
    SELECT * FROM EMP WHERE DEPTNO = 10;
    
SELECT * FROM emp_10_departments;

INSERT INTO emp_10_departments VALUES (1234,'TEST','TEST',null,SYSDATE, 1000, null, 10);

INSERT INTO emp_10_departments VALUES (1235,'TEST1','TEST1',null,SYSDATE, 1000, null, 20);

SELECT * FROM EMP;

CREATE OR REPLACE VIEW emp_10_departments
    AS
    SELECT * FROM EMP WHERE DEPTNO = 10
    WITH CHECK OPTION;
    
SELECT * FROM emp_10_departments;

INSERT INTO emp_10_departments VALUES (1236,'TEST','TEST',null,SYSDATE, 1000, null, 10);

INSERT INTO emp_10_departments VALUES (1237,'TEST','TEST',null,SYSDATE, 1000, null, 20);
/*
ORA-01402: view WITH CHECK OPTION where-clause violation
*/

UPDATE emp_10_departments SET MGR=1234 WHERE DEPTNO = 20;

UPDATE emp_10_departments SET MGR=1234 WHERE EMPNO = 1235;

UPDATE emp_10_departments SET MGR=1234 WHERE EMPNO = 1236;

DELETE FROM emp_10_departments WHERE EMPNO = 1236;

DELETE FROM emp_10_departments WHERE EMPNO = 1235;

ROLLBACK;

DELETE FROM EMP WHERE EMPNO IN (1234,1235);

COMMIT;
/*
VIEWS ON MULTIPLE TABLES
*/

SELECT * FROM EMP;

SELECT * FROM DEPT;

SELECT e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno, d.dname,d.loc 
      FROM EMP e, DEPT d WHERE e.deptno = d.deptno;
      
CREATE OR REPLACE FORCE VIEW emp_dept
    AS
    SELECT e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno, d.dname,d.loc 
      FROM EMP e, DEPT d WHERE e.deptno = d.deptno;

SELECT * FROM emp_dept;

INSERT INTO emp_dept VALUES (1237,'TEST','TEST',null,SYSDATE, 1000, null, 20,'accounting','new york');
/*
SQL Error: ORA-01776: cannot modify more than one base table through a join view

*/

INSERT INTO emp_dept VALUES (1237,'TEST','TEST',null,SYSDATE, 1000, null, 20);
/*
SQL Error: ORA-00947: not enough values

*/

INSERT INTO emp_dept(empno,ename,job,mgr,hiredate,sal,comm,deptno) VALUES (1237,'TEST','TEST',null,SYSDATE, 1000, null, 20);

INSERT INTO emp_dept(deptno,dname,loc) VALUES (50,'test','test');

SELECT * FROM USER_UPDATABLE_COLUMNS WHERE TABLE_NAME='EMP_DEPT';

