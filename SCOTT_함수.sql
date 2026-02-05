-- 함수.
SELECT
    profno
  , name
  , pay
  , bonus
  , pay * 12 + nvl(bonus, 0) * 3 AS "연봉"
  , nvl(bonus, 0)                bonus -- 특정 열의 null값을 입력값으로 변환
  FROM
    professor;
    
-- initcap('문자열'/ 컬럼)
SELECT
    initcap('hello')
  FROM
    dual;

SELECT
    profno
  , initcap(name)
  , lower(name)
  FROM
    professor;

SELECT
    ename
  , length(ename)  "LENGTH"
  , lengthb(ename) "LENGTHB"
  FROM
    emp
 WHERE
    deptno = 20;

SELECT
    '서진수'          "NAME"
  , length('서진수')  "LENGTH"
  , lengthb('서진수') "LENGTHB"
  FROM
    dual;

SELECT
    name
  FROM
    professor;
-- 예1) 교수테이블의 이름에 'st'가 포함된 교수의 교수번호, 이름, 입사일 출력.
SELECT
    profno
  , name
  , hiredate
  FROM
    professor
 WHERE
    lower(name) LIKE ( '%st%' );
-- 예2) 교수테이블의 교수이름이 10글자가 안되는 교수의 번호 이름, 아이디 출력.
SELECT
    profno
  , name
  , id
  , concat(profno, name)
  FROM
    professor
 WHERE
    length(name) < 10;
    
-- SUBSTR
SELECT
    'hello, world'                                             AS hello
  , substr('hello, world', 1, 5)                               substr1
  , -- +값이면 왼쪽부터 순번
   substr('hello, world', - 5, 5)                             substr2
  , -- -값이면 오른쪽부터 순번
   substr('0' || 5, - 2, 2)                                   mm
  , substr('02)3456-2345', 1, instr('02)3456-2345', ')', 1))   instr1
  , substr('031)2345-2312', 1, instr('031)2345-2312', ')', 1)) instr2
  , instr('031)2345-2312', ')', 1)                             instr2 -- 문자열에서 찾을 문자열의 위치 반환.
  FROM
    dual;
    
-- 주전공(201) 전화번호, 지역번호 구분
SELECT
    name
  , deptno1
  , tel
  , substr(tel, 1, instr(tel, ')', 1) - 1)                                           "AREA CODE"
  , substr(tel,                     -- 문자열.
   instr(tel, ')', 1) + 1,   -- 시작위치.
   instr(tel, '-', 1) - instr(tel, ')', 1) - 1) "MAIN TEL"   -- 크기.
--    INSTR(tel, ')', 1), -- ')' 위치값
--    INSTR(tel, '-', 1)  -- '-' 위치값
  FROM
    student
 WHERE
    deptno1 = 201;

SELECT
    *
  FROM
    student;
    
-- lpad/ rpad
SELECT
    lpad('hello', 5, '*')
  , rpad('hello', 10, '*')
  FROM
    dual;
    
-- LPAD 퀴즈.
SELECT
    lpad(ename, 9, '1234567')
  , rpad(ename, 10, '-')
  FROM
    emp
 WHERE
    deptno = 10;
-- RPAD 퀴즈.
SELECT
    rpad(ename, 9, substr('123456789', length(ename) + 1, lengthb(ename) + 1))
  FROM
    emp
 WHERE
    deptno = 10;
    
-- LTRIM/RTRIM('값', '찾을문자열')
SELECT
    ltrim('Hello', 'H')
  , rtrim('Hello', 'o')
  FROM
    dual;
    
-- REPLACE('값', '찾을문자열', '대체문자열')
SELECT
    replace('Hello', 'o', 'o, World')
  FROM
    dual;

SELECT
    ename
  , replace(ename, substr(ename, 1, 2), '**') AS replace
  , substr(ename, 1, 2)                       AS destination
  FROM
    emp
 WHERE
    deptno = 10;

SELECT
    ename
  , replace(ename, substr(ename, 2, 2), '--') AS replace
  FROM
    emp
 WHERE
    deptno = 20;

SELECT
    name
  , jumin
  , replace(jumin, substr(jumin, 7, 7), '-/-/-/-') AS replace
  FROM
    student
 WHERE
    deptno1 = 101;

SELECT
    name
  , tel
  , replace(tel, substr(tel, instr(tel, ')', 1) + 1, instr(tel, '-', 1) - instr(tel, ')', 1) - 1), '***')
  FROM
    student
 WHERE
    deptno1 = 102;

SELECT
    name
  , tel
  , replace(tel, substr(tel, instr(tel, '-', 1) + 1), '****')
  FROM
    student
 WHERE
    deptno1 = 101;
    
-- ROUND(123.4) 반올림
SELECT
    round(123.456, - 2)                                    round
  , trunc(123.4567, - 1)                                   trunc
  , mod(12, 5)                                             mod
  , ceil(12.3)                                             ceil
  , floor(12.3)                                            floor
  , to_char(trunc(sysdate, 'hh'), 'rrrr/mm/dd hh24:mi:ss') truc2 -- 년/월/일/ 시/분/초
  FROM
    dual;
    
-- 날짜관련함수.
SELECT
    add_months(sysdate, 1)
  , -- next_month
   add_months(sysdate, - 1)
  , -- before_month
   months_between(sysdate + 28, sysdate) months
  FROM
    dual;
    
-- 사원번호, 이름, 근속년수 (23년 7개월)    
SELECT
    empno
  , ename
  , hiredate
  , trunc(months_between(sysdate, hiredate) / 12)
      || '년 '
      || mod(trunc(months_between(sysdate, hiredate)), 12)
      || '개월' AS 근속년수
  FROM
    emp
 ORDER BY
    empno;
    
-- 30년 이상 근무 교수번호, 이름, 입사일자, 급여
SELECT
    profno
  , name
  , hiredate
  , pay
    -- p.* 모든 컬럼 출력 professor가 길어 별칭 p를 사용
  FROM
    professor p
 WHERE
    trunc(months_between(sysdate, hiredate) / 12) >= 30;
    
-- 학과
SELECT
    *
  FROM
    professor;

SELECT
    profno
  , name
  , p.deptno
  , d.deptno
  , dname
  FROM
    professor  p
  , department d -- 16 * 12 = 192
 WHERE
        p.deptno = d.deptno
       AND d.dname = 'Computer Engineering';
    
-- 교수번호, 이름, 입사일자, 급여 (20년 이상, Software Engineering)

SELECT
    profno
  , name
  , hiredate
  , pay
  , p.deptno
  , d.dname
  FROM
    professor  p
  , department d
 WHERE
        p.deptno = d.deptno
       AND trunc(months_between(sysdate, p.hiredate) / 12) >= 20
       AND d.dname = 'Software Engineering';

SELECT
    *
  FROM
    emp
  , dept
 WHERE
    emp.deptno = dept.deptno
 ORDER BY
    emp.empno;
    
-- SALES 부서에서 근속년 40년 이상,
-- 사번, 이름, 급여, 부서명
SELECT
    e.empno
  , e.ename
  , e.sal
  , d.dname
  FROM
    emp  e
  , dept d
 WHERE
        e.deptno = d.deptno
       AND trunc(months_between(sysdate, e.hiredate)) > 40
       AND d.dname = 'SALES';
    
-- 2 + '2'
SELECT
    2 + '2'
  , concat(2, '2')
  , sysdate
  FROM
    dual
 WHERE
    sysdate > '2026/02/03';
    
-- to_char(날짜, '포맷문자')
SELECT
    sysdate
  , to_char(sysdate, 'RRRR-MONTH-DD HH24:MI:SS') to_char
  , TO_DATE('05/2024/03', 'MM/RRRR/DD')          to_date
  FROM
    dual;
    
-- to_char
SELECT
    to_char(12345.6789, '099,999.99') -- 반올림 한 연산결과를 문자출력.
  FROM
    dual;

SELECT
    studno
  , name
  , to_char(birthday, 'RR/MM/DD')
  FROM
    student
 WHERE
    to_char(birthday, 'MM') = '01';
    
-- NVL()
SELECT
    nvl(10, 0) -- null ? 0 : 10
  FROM
    dual;

SELECT
    pay + nvl(bonus, 0) 월급
  FROM
    professor;
    
-- student(profno) -> 9999(없으면) / 담당교수번호
--                     담당교수없음 / 담당교수번호
SELECT
    name
  , nvl(profno, 9999)
  , nvl(to_char(profno), '담당교수없음')
  FROM
    student;

SELECT
    name
  , birthday
  , to_char(birthday, 'Q')
      || '/4분기' AS 분기
  FROM
    student;

SELECT
    name
  , birthday
  , ceil(to_char(birthday, 'MM') / 3)
      || '/4분기' AS 분기 -- CEIL은 가장 가까운 큰 정수
  FROM
    student;