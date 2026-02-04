SELECT
    *
FROM
    emp;
    
SELECT
    * 
FROM
    dept;
    
SELECT
    e.*,
    dname,
    loc
FROM
    emp e, 
    dept d
WHERE
    e.deptno = d.deptno;
    
-- ANSI VS ORACLE
SELECT
    * 
FROM
    emp e
JOIN
    dept d
ON
    e.deptno = d.deptno
WHERE
    job = 'SALESMAN';
    
-- student(profno), professor(profno)
SELECT
    studno,
    s.name,
    s.profno,
    p.name
FROM
    student s
FULL OUTER JOIN
    professor p
ON
    s.profno = p.profno;
    
SELECT
    * 
FROM
    professor;
    
-- 학생번호, 학생이름, 담당교수이름 / 담당교수없음
-- 9615, Daniel Day-Lewis, 4007, Jodie Foster
-- 9711, Danny Devito, 담당교수없음

SELECT
    studno,
    s.name,
    DECODE(s.profno, NULL, '담당교수없음') AS 담당교수이름,
    p.name AS 교수이름
FROM
    student s
LEFT OUTER JOIN
    professor p
ON
    s.profno = p.profno;

-- NVL(), DECODE(), CASE WHEN END
-- STUDENT 지역번호 구분 02(서울), 031(경기도), 부산(051) 그외 기타
SELECT
    name,
    tel,
    SUBSTR(tel, 1, INSTR(tel, ')', 1) - 1) AS 지역번호,
    CASE SUBSTR(tel, 1, INSTR(tel, ')', 1) - 1)
        WHEN '02' THEN '서울'
        WHEN '031' THEN '경기도'
        WHEN '051' THEN '부산'
        ELSE '기타'
        END AS 거주지
FROM
    student;
    
SELECT
    name,
    jumin,
    SUBSTR(jumin, 3, 2) AS 월정보,
    CASE 
        WHEN SUBSTR(jumin, 3, 2) BETWEEN '01' AND '03' THEN '1/4분기'
        WHEN SUBSTR(jumin, 3, 2) BETWEEN '04' AND '06' THEN '2/4분기'
        WHEN SUBSTR(jumin, 3, 2) BETWEEN '07' AND '09' THEN '3/4분기'
        WHEN SUBSTR(jumin, 3, 2) BETWEEN '10' AND '12' THEN '4/4분기'
        END AS 분기
FROM
    student;
    
SELECT
    empno
    ,ename
    ,sal
    ,CASE
        WHEN sal BETWEEN 1 AND 1000 THEN 'Level 1'
        WHEN sal BETWEEN 1001 AND 2000 THEN 'Level 2'
        WHEN sal BETWEEN 2001 AND 3000 THEN 'Level 3'
        WHEN sal BETWEEN 3001 AND 4000 THEN 'Level 4'
        ELSE 'Level 5'
        END AS "LEVEL"
FROM
    emp;
    
SELECT
    job
    , COUNT(*)
    , SUM(sal)
    , ROUND(AVG(sal),1 ) AS avg
    , MAX(hiredate)
    , MIN(hiredate)
FROM
    emp
GROUP BY
    job;
    
-- 부서별 부서명, 급여합계, 평균급여, 인원
SELECT
    d.dname, e.*
FROM (SELECT deptno
           , SUM(sal) AS 급여합계
           , ROUND(AVG(SAL)) AS 평균급여
           , COUNT(*) AS 인원
      FROM emp
      GROUP BY deptno) e
JOIN dept d ON e.deptno = d.deptno;

-- emp dept 조인.
SELECT d.dname
      ,SUM(e.sal) AS 급여합계
      ,ROUND(AVG(e.sal + NVL(comm, 0)), 1) AS 평균급여
      ,COUNT(*) 인원
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;

-- rollup()
-- 1)부서별 직무별 평균급여, 사원수.
SELECT deptno
      ,job
      ,AVG(sal)
      ,COUNT(*)
FROM emp
GROUP BY deptno
        ,job
UNION
-- 2)부서별 평균급여, 사원수.
SELECT deptno
      ,'소계'
      ,ROUND(AVG(sal), 1)
      ,COUNT(*)
FROM emp
GROUP BY deptno
UNION
-- 3)전체 평균급여, 사원수.
SELECT 99
      ,'전체집계'
      ,ROUND(AVG(sal), 1)
      ,COUNT(*)
FROM emp
ORDER BY 1;

-- rollup
SELECT deptno
      ,job
      ,ROUND(AVG(sal), 1)
      ,COUNT(*)
FROM emp
GROUP BY ROLLUP(deptno, job)
ORDER BY 1;

-- 게시판(board)
-- 글번호, 제목, 작성자, 글내용, 작성시간 --, 조회수, 수정시간, 수정자
DROP TABLE board;
CREATE TABLE board (
  board_no  NUMBER(10)     PRIMARY KEY, -- 글번호(키역할  )
  title     VARCHAR2(300)  NOT NULL, -- 제목
  writer    VARCHAR2(50)   NOT NULL, -- 작성자 
  content   VARCHAR2(1000) NOT NULL, -- 글내용 
  create_at DATE DEFAULT sysdate -- 작성시간
);

-- 컬럼추가
ALTER TABLE board ADD (click_count number);
ALTER TABLE board MODIFY content VARCHAR2(2000);
ALTER TABLE board MODIFY click_count NUMBER DEFAULT 0;

DESC board;

INSERT INTO board (board_no, title, writer, content) 
VALUES (1, 'test', 'user01', '연습글입니다');

INSERT INTO board (board_no, title, writer, content) 
VALUES (2, 'test2', 'user02', '연습글입니다2');

INSERT INTO board (board_no, title, writer, content) 
VALUES (3, 'test', 'user01', '연습글입니다');

INSERT INTO board (board_no, title, writer, content) 
VALUES (4, 'test', 'user01', '연습글입니다');

INSERT INTO board (board_no, title, content, writer) 
VALUES ((SELECT MAX(board_no)+1 FROM board)
        ,:title
        ,:content
        ,:writer
        );
        
INSERT INTO board
VALUES(9, 'title', 'user02', 'content', sysdate, 0);

SELECT MAX(board_no)+1 FROM board;

SELECT
    * 
FROM
    board;
    
COMMIT;

UPDATE board
SET title = 'test3',
    writer = 'user03',
    content = '연습글입니다3'
WHERE board_no = 3;