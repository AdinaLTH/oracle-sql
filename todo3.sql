SELECT * 
FROM emp
WHERE LENGTH(job) >= 6;

SELECT job, SUBSTR(job, 1, 2), SUBSTR(job, 3, 2), SUBSTR(job, 5)
FROM emp;

SELECT SUBSTR(ename, 3)
FROM emp;

SELECT job,
SUBSTR(job, -LENGTH(job)),
SUBSTR(job, -LENGTH(job), 2),
SUBSTR(job, -3)
FROM emp;

SELECT INSTR('Hello, Oracle!', 'l') AS instr_1,
INSTR('Hello, Oracle!', 'l', 5) AS instr_2,
INSTR('Hello, Oracle!', 'l', 2, 2) AS instr_3
FROM dual;

SELECT * 
FROM emp
WHERE INSTR(ENAME, 'S') > 0;

SELECT * 
FROM emp
WHERE ename LIKE '%S%';

SELECT '010-1234-5678' AS repace_before,
REPLACE('010-1234-5678', '-', ' ') AS replace_1,
REPLACE('010-1234-5678', '-') AS replace_2
FROM dual;

SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS lpad_1,
    RPAD('Oracle', 10, '*') AS rpad_1,
    LPAD('Oracle', 10) AS lpad_2,
    RPAD('Oracle', 10) AS rpad_2
FROM dual;

SELECT 
RPAD('971225-', 14, '*') AS RPAD_JMNO,
RPAD('010-1234-', 13, '*') AS RPAD_PHONE
FROM dual;

SELECT CONCAT(EMPNO, ENAME),
CONCAT(EMPNO, CONCAT(' : ', ename))
FROM emp
WHERE ename = 'SCOTT';

