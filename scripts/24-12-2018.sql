SELECT SUBSTR('ABCDEFG',1,4) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',0,4) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',3,4) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',3,5) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',3,15) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',-4,4) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',-1,1) "Substring"  FROM DUAL;

SELECT SUBSTR('ABCDEFG',-LENGTH('ABCDEFG'),1) "Substring"  FROM DUAL; 

SELECT SUBSTR('ABCDEFG',LENGTH('ABCDEFG'),-1) "Substring"  FROM DUAL; 

SELECT * FROM EMP;

SELECT REPLACE('ABCDEFGA', 'AB','Z') FROM DUAL;

SELECT REPLACE('JACK and JUE','J','BL') "Changes"  FROM DUAL;

SELECT REPLACE(JOB, 'MAN', 'DAM') FROM EMP;

SELECT REPLACE(JOB, 'MAN', '') FROM EMP;

SELECT  REGEXP_SUBSTR('500 Oracle Parkway, Redwood Shores, ,CA,', ',[^,]*,') "REGEXPR_SUBSTR" FROM DUAL;

SELECT  REGEXP_REPLACE('080.123.1234', '([[:digit:]]{3})\.([[:digit:]]{3})\.([[:digit:]]{4})',  '(\1) \2-\3') "REGEXP_REPLACE"  FROM DUAL;


SELECT  REGEXP_REPLACE('09876543210', '([[:digit:]]{1})([[:digit:]]{3})([[:digit:]]{3})([[:digit:]]{4})',  '(+91) \2 \3 \4') "REGEXP_REPLACE"  FROM DUAL;

SELECT * FROM EMP;

UPDATE EMP SET ENAME = ' ' || ENAME|| '  ';

SELECT ENAME, LENGTH(ENAME) FROM EMP;

SELECT ENAME, LENGTH(ENAME), LENGTH(TRIM(ENAME)) FROM EMP;

SELECT ENAME, LENGTH(ENAME), LENGTH(TRIM(ENAME)), LENGTH(LTRIM(ENAME)) FROM EMP;

SELECT ENAME, LENGTH(ENAME), LENGTH(TRIM(ENAME)), LENGTH(LTRIM(ENAME)), LENGTH(RTRIM(ENAME)) FROM EMP;

SELECT LTRIM('<=====>BROWNING<=====>', '<>=') "LTRIM Example"  FROM DUAL;

SELECT RTRIM('<=====>BROWNING<=====>', '<>=') "RTRIM Example"  FROM DUAL;

SELECT TRIM('<=====>BROWNING<=====>') "TRIM Example"  FROM DUAL;

SELECT RTRIM(LTRIM('<=====>BROWNING<=====>', '<>='),'=><') "TRIM" FROM DUAL;

SELECT LPAD('Page 1',11,'*') "LPAD example" FROM DUAL;

SELECT LPAD(TRIM(ENAME), 10,'*') FROM EMP;

SELECT RPAD(ENAME, LENGTH(ENAME) + 5,'*') FROM EMP;

SELECT LPAD(RPAD(ENAME, LENGTH(ENAME) + 5,'*'), LENGTH(RPAD(ENAME, LENGTH(ENAME) + 5,'*')) + 5,'*') FROM EMP;

SELECT TRANSLATE('SQL*Plus User''s Guide?asd', ' *?/''', '___') FROM DUAL;

SELECT ename, TREAT(VALUE(e) AS emp).sal sal  FROM EMP e;

SELECT INSTR('CORPORATE FLOOR','OR', 3, 3) "Instring"  FROM DUAL;


CREATE TABLE log_messages
(
message_id NUMBER(10) NOT NULL,
msg_time_as_date DATE,
msg_time_as_timestamp TIMESTAMP,
msg_time_as_timestamp_ms TIMESTAMP(3),
msg_time_as_timstamp_with_tz TIMESTAMP(9) WITH TIME ZONE,
msg_time_as_timstamp_with_ltz TIMESTAMP(2) WITH LOCAL TIME ZONE,
message VARCHAR2(512) NOT NULL
);

DESC LOG_MESSAGES;

SELECT SYSDATE FROM DUAL;
SELECT SYSTIMESTAMP FROM DUAL;

 
SELECT CURRENT_DATE FROM DUAL;

SELECT SESSIONTIMEZONE FROM DUAL;

SELECT DBTIMEZONE FROM DUAL;

SELECT TRUNC(SYSDATE, 'YEAR')   FROM DUAL;

SELECT TRUNC(SYSDATE, 'MONTH')   FROM DUAL;

SELECT TRUNC(SYSDATE, 'WW')   FROM DUAL;

SELECT TRUNC(SYSDATE, 'DAY')   FROM DUAL;

SELECT TRUNC(SYSTIMESTAMP, 'HH')   FROM DUAL;

SELECT ROUND (TO_DATE ('01-JUL-18'),'YEAR')  FROM DUAL;

SELECT ROUND (TO_DATE ('16-FEB-18 11:59:59 PM', 'DD-MON-YY HH:MI:SS PM'),'MONTH')  FROM DUAL;

SELECT ROUND (TO_DATE ('20-DEC-18 12:00:59 PM', 'DD-MON-YY HH:MI:SS PM'),'WW')  FROM DUAL;

SELECT ROUND (TO_DATE ('20-DEC-18 11:00:59 AM', 'DD-MON-YY HH:MI:SS AM'),'DD')  FROM DUAL;

SELECT ROUND (SYSDATE,'MONTH')  FROM DUAL;

SELECT EXTRACT(YEAR FROM DATE '1998-03-07') FROM DUAL;

SELECT EXTRACT ( YEAR FROM TRUNC(SYSDATE, 'YEAR') )  FROM DUAL;

SELECT EXTRACT(MONTH FROM TRUNC(SYSDATE, 'MONTH'))   FROM DUAL;

SELECT EXTRACT (DAY FROM TRUNC(SYSDATE, 'DD'))   FROM DUAL;

SELECT TRUNC(SYSDATE, 'DAY')   FROM DUAL;

SELECT TRUNC(SYSTIMESTAMP, 'HH')   FROM DUAL;

SELECT EXTRACT(YEAR FROM ROUND (TO_DATE ('01-JUN-18'),'YEAR'))  FROM DUAL;

SELECT ROUND (TO_DATE ('16-FEB-18 11:59:59 PM', 'DD-MON-YY HH:MI:SS PM'),'MONTH')  FROM DUAL;

SELECT ROUND (TO_DATE ('20-DEC-18 12:00:59 PM', 'DD-MON-YY HH:MI:SS PM'),'WW')  FROM DUAL;

SELECT ROUND (TO_DATE ('20-DEC-18 11:00:59 AM', 'DD-MON-YY HH:MI:SS AM'),'DD')  FROM DUAL;

SELECT ROUND (SYSDATE,'MONTH')  FROM DUAL;



SELECT * FROm EMP;

SELECT EXTRACT (YEAR FROM TRUNC(HIREDATE, 'YEAR')) FROM EMP;

SELECT HIREDATE,TRUNC(HIREDATE, 'YEAR'), EXTRACT (YEAR FROM TRUNC(HIREDATE, 'YEAR')) FROM EMP;

SELECT HIREDATE,TRUNC(HIREDATE, 'MONTH'), EXTRACT (MONTH FROM TRUNC(HIREDATE, 'MONTH')) FROM EMP;

SELECT HIREDATE,ROUND(HIREDATE, 'YEAR'), EXTRACT (YEAR FROM ROUND(HIREDATE, 'YEAR')) FROM EMP;

INSERT INTO log_messages VALUES (1, SYSDATE, SYSDATE, SYSDATE, SYSDATE, SYSDATE, 'some log message');

SELECT * FROM LOG_MESSAGES;


SELECT NEXT_DAY(sysdate, 'FRIDAY') FROM DUAL;

SELECT LAST_DAY('02-06-2018') FROM DUAL;

SELECT ENAME, HIREDATE, LAST_DAY(HIREDATE) as "First sal date" FROM EMP;

SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) as "Exp in months" FROM EMP;

SELECT ENAME, HIREDATE, ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE)) as "Exp in months", FLOOR(ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE))/12) as "Exp in YEars" FROM EMP;

SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'12-01-1990')) as "Age in months", FLOOR(ROUND(MONTHS_BETWEEN(SYSDATE,'01-01-1990'))/12) as "Age in YEars" FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, 100) FROM DUAL;

SELECT NUMTODSINTERVAL (101.5, 'Day') FROM DUAL;

SELECT NUMTODSINTERVAL (100, 'HOUR') FROM DUAL;

SELECT NUMTODSINTERVAL (100, 'MINUTE') FROM DUAL;

SELECT NUMTODSINTERVAL (100, 'SECOND') FROM DUAL;

SELECT NUMTOYMINTERVAL(20, 'MONTH') FROM DUAL;

SELECT NUMTOYMINTERVAL(20.2, 'YEAR') FROM DUAL;

SELECT SYSDATE FROM DUAl;

SELECT TO_CHAR(SYSDATE, 'yyyy-dd') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'mm-dd') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'dd-MON-YYYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'dd-MONTH-YYYY "at" HH:MI:SS AM') FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'dd-Day') FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'dd') FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'Day') FROM DUAL;

SELECT TO_CHAR (SYSDATE, 'd') FROM DUAL;

SELECT TO_CHAR (TO_DATE('21-12-2018', 'dd-mm-yyyy'), 'd') FROM DUAL;

SELECT TO_CHAR (TO_DATE('21-12-2018', 'dd-mm-yyyy'), 'Day') FROM DUAL;
SELECT * FROM EMP;

SELECT TO_DATE('January 15, 1989, 11:00','Month dd, YYYY, HH:MI')FROM DUAL;
