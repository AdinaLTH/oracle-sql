-- Oracle(DBMS) - version(21C) - xe(database명)
-- user(scott) - 테이블.
-- Structured Query Language (SQL)
SELECT STUDNO, NAME-- 컬럼명(전체)
FROM STUDENT; -- 테이블.

-- 1) PROFESSOR 테이블. 전체 컬럼 조회.
SELECT *
FROM PROFESSOR;

-- 2) 학생 -> 학생번호, 이름, 학년
SELECT STUDNO, NAME, GRADE
FROM STUDENT;
