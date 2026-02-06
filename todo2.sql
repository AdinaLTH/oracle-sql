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
    *
  FROM
    emp
 WHERE
    ename LIKE 'S%';

SELECT
    *
  FROM
    emp
 WHERE
    ename LIKE '_L%';

SELECT
    *
  FROM
    emp
 WHERE
    ename LIKE '%AM%';

SELECT
    *
  FROM
    emp
 WHERE
    ename NOT LIKE '%AM%';

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
 WHERE
    comm IS NULL;
    
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

SELECT *
FROM emp
WHERE UPPER(ename) = UPPER('scott');

SELECT *
FROM emp
WHERE UPPER(ename) LIKE UPPER('%scott%');

SELECT UPPER(ename)
FROM emp;

SELECT ename, LENGTH(ename)
FROM emp;

SELECT ename, LENGTH(ename)
FROM emp
WHERE LENGTH(ename) >= 5;

SELECT LENGTH('한글'), LENGTHB('한글')
FROM dual;

