create sequence test_seq;

DESC test_seq;

SELECT * FROM test_seq;



SELECT test_seq.CURRVAL FROM DUAL;

SELECT test_seq.NEXTVAL FROM DUAL;

CREATE TABLE EX_TEST_SEQ (
    id NUMBER(2) PRIMARY KEY,
    name VARCHAR2(10)
    );
    
DESC EX_TEST_SEQ;

INSERT INTO EX_TEST_SEQ VALUES(test_seq.NEXTVAL, CONCAT('test',test_seq.CURRVAL));

SELECT * FROM EX_TEST_SEQ;

DROP SEquence test_seq;

create sequence test_seq
    START WITH 100;

SELECT test_seq.CURRVAL FROM DUAL;

SELECT test_seq.NEXTVAL FROM DUAL;

DROP SEQUENCE test_seq;
/*
    INCREAMENT By 10
    =====================
*/

create sequence test_seq
    START WITH 100
    INCREMENT BY 10;
    
SELECT test_seq.NEXTVAL FROM DUAL;
DROP SEQUENCE test_seq;

/*
MAX BOUND
=============
*/
create sequence test_seq
    START WITH 100
    INCREMENT BY 10
    MAXVALUE 200;
    
SELECT test_seq.NEXTVAL FROM DUAL;
DROP SEQUENCE test_seq;

/*
REPEAT USING CYCLE
==================
*/

create sequence test_seq
    START WITH 100
    INCREMENT BY 10
    MAXVALUE 200
    CYCLE;
    
SELECT test_seq.NEXTVAL FROM DUAL;
DROP SEQUENCE test_seq;

/*
MIN VALUE & NOCACHE
=====================
*/

create sequence test_seq
    START WITH 100
    INCREMENT BY 10
    MAXVALUE 200
    MINVALUE 100
    CYCLE
    NOCACHE;
    
SELECT test_seq.NEXTVAL FROM DUAL;
DROP SEQUENCE test_seq;


/*
    Decrement sequence
*/

CREATE SEQUENCE test_rev_seq
    START WITH -1
    INCREMENT BY -10;
    
    SELECT test_rev_seq.NEXTVAL FROM DUAL;