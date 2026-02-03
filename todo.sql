SELECT ename || '''s sal is $' || sal
    AS "Name And Sal"
FROM emp;

-- 2/3

SELECT
    *
FROM
    emp;
    
DESC dept;

SELECT
    *
FROM
    tab;
    
SELECT
    empno,
    ename
FROM
    emp;
    
SET PAGESIZE 15;
SET LINESIZE 200;
SELECT
    empno,
    ename
FROM
    emp;
    
SELECT
    DISTINCT deptno
FROM
    emp;
    
SELECT
    ename||'-'||job
FROM
    emp;
    
SELECT
    ename||' ''s job is '||job AS "NAME AND JOB"
FROM
    emp;
    
SELECT
    name||'''s ID: '||id||' , WEIGHT is '||weight||'kg' AS "ID AND WEIGTH"
FROM
    student;
    
SELECT
    ename || '(' || job || '), ' || ename || '''' || job || '''' AS "NAME AND JOB"
FROM
    emp;
    
-- DECODE(A, B, '같은조건', '다른조건')
SELECT
    DECODE(10, 20, '같다', '다르다') -- 10 == 20 ? '같다' : '다르다'
FROM
    dual;
    
SELECT
    studno,
    profno,
    DECODE(profno, null, 9999, profno)
FROM
    student
ORDER BY
    profno DESC;
    
SELECT
    DECODE('S', 'A', '현재A', 'B', '현재B', '기타')
FROM 
    dual;
    
SELECT
    deptno,
    name,
    DECODE(deptno, 101, 'Computer Engineering', ' ') AS dname
FROM
    professor;
    
SELECT
    deptno,
    name,
    DECODE(deptno, 101, 'Computer Engineering', 'ETC') AS dname
FROM
    professor;
    
SELECT
    deptno,
    name,
    DECODE(deptno, 101, 'Computer Engineering', 
                    102, 'Multimedia Engineering', 
                    103, 'Software Engineering', 
                        'ETC') AS dname
FROM
    professor;
    
SELECT
    empno,
    ename
FROM
    emp
WHERE
    empno = 7900;
    
SELECT
    ename,
    sal
FROM
    emp
WHERE
    sal < 900;

SELECT
    empno,
    ename,
    sal
FROM
    emp
WHERE
    ename = 'SMITH';
    
-- 2026.02.03(화) TODO.

-- 107p, 108p, 113p(nvl2).
SELECT
    empno,
    ename,
    sal,
    comm,
    TO_CHAR((sal*12)+comm, '99,999') AS 연봉
FROM
    emp
WHERE
    ename = 'ALLEN';
    
SELECT
    name,
    pay,
    NVL(bonus, 0) AS bonus,
    NVL(TO_CHAR((pay*12)+bonus, '99,999'), ' ') AS 연봉
FROM
    professor
WHERE
    deptno = 201;
    
SELECT
    empno,
    ename,
    hiredate,
    TO_CHAR((sal*12)+comm, '$99,999') AS "총 연봉",
    TO_CHAR(((sal*12)+comm)*1.15, '$99,999') AS "15% UP"
FROM
    emp
WHERE
    comm IS NOT NULL;
-- 학생테이블의 생년월일을 기준으로 1~3 => 1/4분기.
--                             4~6 => 2/4분기.
--                             7~9 => 3/4분기.
--                             10~12 => 4/4분기.
SELECT
    studno,
    name,
    birthday,
    TO_CHAR(birthday, 'MM') AS m
FROM
    student;
SELECT
    studno,
    name,
    birthday,
    DECODE(TO_CHAR(birthday, 'MM'), 
                              '01', '1/4분기',
                              '02', '1/4분기',
                              '03', '1/4분기',
                              '04', '2/4분기',
                              '05', '2/4분기',
                              '06', '2/4분기',
                              '07', '3/4분기',
                              '08', '3/4분기',
                              '09', '3/4분기',
                              '10', '4/4분기',
                              '11', '4/4분기',
                              '12', '4/4분기') AS 분기
FROM
    student;
    
SELECT
    studno,
    name,
    birthday,
    TO_CHAR(birthday, 'Q') || '/4분기' AS 분기
FROM
    student;
    
SELECT
    studno,
    name,
    birthday,
    DECODE(TO_CHAR(birthday, 'Q'),
            '1', '1/4분기',
            '2', '2/4분기',
            '3', '3/4분기',
            '4', '4/4분기') AS 분기
FROM
    student;
    
SELECT
    studno,
    name,
    birthday,
    CEIL(TO_CHAR(birthday, 'MM')/3) || '/4분기' AS 분기
FROM
    student;