-- Oracle(DBMS) - version(21C) - xe(database명)
-- user(scott) - 테이블.
-- Structured Query Language (SQL)
SELECT
    studno
  , name-- 컬럼명(전체)
  FROM
    student; -- 테이블.

-- 1) PROFESSOR 테이블. 전체 컬럼 조회.
SELECT
    *
  FROM
    professor;

-- 2) 학생 -> 학생번호, 이름, 학년
SELECT
    studno
  , name
  , grade
  FROM
    student;

-- 숙제완료함.
SELECT
    name
    || '의 아이디는 '
    || id AS "전체설명" -- 별칭(alias)
  , grade "학년"
  FROM
    student;
-- James Seo의 아이디는 75true 이고 4학년입니다. => (학년설명)
SELECT
    name
    || '의 아이디는 '
    || id
    || ' 이고 '
    || grade
    || '학년입니다.' AS "학년설명"
  FROM
    student;
-- James Seo의 '아이디'는 75true 이고 4학년입니다. => (학년설명)
SELECT
    name
    || '의 ''아이디''는 '
    || id
    || ' 이고 '
    || grade
    || '학년입니다.' AS "학년설명"
  FROM
    student;

SELECT DISTINCT
    name
  , grade -- 중복된 값 제거.
  FROM
    student;

SELECT
    *
  FROM
    emp;

-- 연습1)
SELECT
    name
    || '''S ID: '
    || id
    || ' , WEIGHT is '
    || weight
    || 'kg' AS "ID AND WEIGHT"
  FROM
    student;

-- 연습2)
SELECT
    ename
    || '('
    || job
    || '), '
    || ename
    || ''''
    || job
    || '''' AS "NAME AND JOB"
  FROM
    emp;

-- WHERE
SELECT
    *
  FROM
    student
 WHERE
    weight BETWEEN 60 AND 70
       AND deptno1 IN ( 101, 201 );

SELECT
    *
  FROM
    student
 WHERE
    deptno2 IS NOT NULL;

SELECT
    *
  FROM
    emp;
-- 비교연산자 연습1) EMP 테이블 급여 3000보다 큰 직원
SELECT
    *
  FROM
    emp
 WHERE
    sal > 3000;

-- 비교연산자 연습2) EMP 테이블 보너스 있는 직원.
SELECT
    *
  FROM
    emp
 WHERE
    comm IS NOT NULL;

-- 비교연산자 연습3) STUDENT테이블 추천 주전공학과: 101, 102, 103인 학생
SELECT
    *
  FROM
    student
 WHERE
    deptno1 IN ( 101, 102, 103 );

-- AND / OR
-- IF (sal > 100 && height > 170)
-- IF (sal > 100 || height > 170)
SELECT
    studno
  , name
  , grade
  , height
  , weight
  FROM
    student
 WHERE
    ( height > 170
        OR weight > 60 )
       AND ( grade = 4
        OR height > 150 );

-- 급여가 2000 이상인 직원. 커미션(급여 + 커미션)
SELECT
    ename
  , sal
  , comm
  FROM
    emp
 WHERE
    sal >= 2000
        OR ( comm IS NOT NULL
       AND sal + comm >= 2000 );

SELECT
    *
  FROM
    professor;
-- 교수 => 연봉이 4000 이상인. 보너스 3번
SELECT
    profno
  , name
  , pay
  , bonus
  , pay * 12             AS total_1
  , pay * 12 + bonus * 3 AS total_2
  FROM
    professor
 WHERE
    ( pay * 12 >= 3000
       AND bonus IS NULL )
        OR ( pay * 12 + bonus * 3 >= 3000
       AND bonus IS NOT NULL )
 ORDER BY
    5-- 정렬기준.
    ;

-- 문자열 like 연산자
SELECT
    *
  FROM
    student
 WHERE
    name LIKE '%on____%';

--
SELECT
    profno
  , name
  , pay
  , bonus
  , hiredate
  FROM
    professor
 WHERE
    hiredate > TO_DATE('99/01/01', 'rr/mm/dd')
 ORDER BY
    hiredate; -- 1970.01.01

SELECT
    *
  FROM
    student;
-- 학생테이블, 전화번호(02, 031, 051, 052, 053..)
-- 부산 거주(051)
SELECT
    studno
  , name
  , tel
  FROM
    student
 WHERE
    tel LIKE '051%';
-- 이름 M으로 시작 8개 이상만 조회
SELECT
    studno
  , name
  , tel
  FROM
    student
 WHERE
    name LIKE 'M________%';
-- 주민번호 10월달에 태어난 사람조회
SELECT
    studno
  , name
  , tel
  , jumin
  FROM
    student
 WHERE
    jumin LIKE '__10%';

-- 생년월일 10월생
SELECT
    studno
  , name
  , tel
  , birthday
  FROM
    student
 WHERE
    birthday LIKE '_____10%';