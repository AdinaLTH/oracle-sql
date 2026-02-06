-- 1번
SELECT
    employee_id
  , last_name
  , salary
  , department_id
  FROM
    employees
 WHERE
    salary BETWEEN 7000 AND 12000
       AND last_name LIKE 'H%';

-- 2번
SELECT
    employee_id
  , first_name
  , job_id
  , salary
  , department_id
  FROM
    employees
 WHERE
    department_id BETWEEN 50 AND 60
       AND salary > 5000;

-- 3번
SELECT
    first_name
  , salary
  , CASE
        WHEN salary <= 5000  THEN
            salary * 1.2
        WHEN salary <= 10000 THEN
            salary * 1.15
        WHEN salary <= 15000 THEN
            salary * 1.1
        ELSE
            salary
      END AS upsal
  FROM
    employees
 WHERE
    employee_id = &employee_id;

-- 4번
SELECT
    d.department_id
  , d.department_name
  , l.city
  FROM
    departments d
  , locations   l
 WHERE
    d.location_id = l.location_id;

-- 5번
SELECT
    employee_id
  , last_name
  , job_id
  FROM
    employees
 WHERE
    department_id = (
        SELECT
            department_id
          FROM
            departments
         WHERE
            department_name = 'IT'
    );

-- 6번
SELECT
    employee_id
  , first_name
  , last_name
  , email
  , phone_number
  , hire_date
  , job_id
  FROM
    employees
 WHERE
        hire_date < '2014-01-01'
       AND job_id = 'ST_CLERK';

-- 7번 substr(tel, 1, instr(tel, ')', 1) - 1)
SELECT
    last_name
  , job_id
  , salary
  , substr(commission_pct, 1)
  FROM
    employees
 WHERE
    commission_pct IS NOT NULL
 ORDER BY
    salary DESC;

-- 8번
CREATE TABLE prof (
    profno   NUMBER(4)
    , name     VARCHAR2(15) NOT NULL
    , id       VARCHAR2(15) NOT NULL
    , hiredate DATE
    , pay      NUMBER(4)
);

-- 9번
-- 1)
INSERT INTO prof (
    profno
    , name
    , id
    , hiredate
    , pay
) VALUES (
    1001
  , 'Mark'
  , 'm1001'
  , '07/03/01'
  , 800
);

INSERT INTO prof (
    profno
    , name
    , id
    , hiredate
) VALUES (
    1003
  , 'Adam'
  , 'a1003'
  , '11/03/02'
);

COMMIT;

-- 2)
UPDATE prof
   SET
    pay = 1200
 WHERE
    profno = 1001;

--3)
DELETE FROM prof
 WHERE
    profno = 1003;

-- 10번

-- 1)
ALTER TABLE prof ADD CONSTRAINT prof_profno_pk PRIMARY KEY ( profno );

-- 2)
ALTER TABLE prof ADD gender CHAR(3);

-- 3)
ALTER TABLE prof MODIFY
    name VARCHAR2(20);