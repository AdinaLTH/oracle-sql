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
    board;