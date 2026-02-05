-- 02/04
SELECT
    empno
  , ename
  , sal
  FROM
    emp
 WHERE
    sal BETWEEN 2000 AND 3000;

SELECT
    empno
  , ename
  , sal
  FROM
    emp
 WHERE
        sal >= 2000
       AND sal <= 3000;

SELECT
    deptno
  , AVG(nvl(sal, 0)) AS "avg"
  FROM
    emp
 GROUP BY
    deptno;

SELECT
    SUM(sal)
  FROM
    emp;

DESC emp;

DESC dept;

SELECT
    empno
  , deptno
  FROM
    emp;

SELECT DISTINCT
    deptno
  FROM
    emp;

SELECT DISTINCT
    job
  , deptno
  FROM
    emp;

SELECT ALL
    job
  , deptno
  FROM
    emp;

SELECT
    ename
  , sal
  , sal * 12 + comm
  , comm
  FROM
    emp;

SELECT
    ename
  , sal
  , sal * 12 + comm AS annsal
  , comm
  FROM
    emp;

SELECT
    *
  FROM
    emp
 ORDER BY
    sal;

SELECT
    *
  FROM
    emp
 ORDER BY
    empno;

SELECT
    *
  FROM
    emp
 ORDER BY
    sal DESC;

SELECT
    *
  FROM
    emp
 ORDER BY
    empno DESC;

SELECT
    *
  FROM
    emp
 ORDER BY
    deptno ASC
  , sal DESC;

SELECT DISTINCT
    job
  FROM
    emp;

SELECT
    empno  AS employee_no
  , ename  AS employee_name
  , mgr    AS manager
  , sal    AS salary
  , comm   AS commission
  , deptno AS department_no
  FROM
    emp
 ORDER BY
    deptno DESC
  , ename;

SELECT
    *
  FROM
    emp
 WHERE
    deptno = 30;

SELECT
    *
  FROM
    emp
 WHERE
    empno = 7782;

SELECT
    *
  FROM
    emp
 WHERE
        deptno = 30
       AND job = 'SALESMAN';

SELECT
    *
  FROM
    emp
 WHERE
        empno = 7499
       AND deptno = 30;

SELECT
    *
  FROM
    emp
 WHERE
    deptno = 30
        OR job = 'CLERK';

SELECT
    *
  FROM
    emp
 WHERE
    deptno = 20
        OR job = 'SALESMAN';

SELECT
    *
  FROM
    emp
 WHERE
        sal >= 2500
       AND job = 'ANALYST';

SELECT
    *
  FROM
    emp
 WHERE
    ename >= 'F';

SELECT
    *
  FROM
    emp
 WHERE
    ename <= 'FORZ';

SELECT
    *
  FROM
    emp
 WHERE
    sal != 3000;

SELECT
    *
  FROM
    emp
 WHERE
    sal <> 3000;

SELECT
    *
  FROM
    emp
 WHERE
    sal^= 3000;

SELECT
    *
  FROM
    emp
 WHERE
    NOT sal = 3000;

SELECT
    *
  FROM
    emp
 WHERE
    job = 'MANAGER'
        OR job = 'SALESMAN'
        OR job = 'CLERK';

SELECT
    *
  FROM
    emp
 WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
  FROM
    emp
 WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
  FROM
    emp
 WHERE
    deptno IN ( 10, 20 );

SELECT
    *
  FROM
    emp
 WHERE
    sal BETWEEN 2000 AND 3000;

SELECT
    *
  FROM
    emp
 WHERE
    sal NOT BETWEEN 2000 AND 3000;