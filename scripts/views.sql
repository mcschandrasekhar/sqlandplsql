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
VIEWS ON MULTIPLE TABLES
*/