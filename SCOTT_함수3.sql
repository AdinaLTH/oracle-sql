-- Users 테이블
-- 회원아이디(user_id), 비밀번호(password), 회원이름(user_name), 생성일자(created_at)
-- varchar2(30), varchar2(100), varchar2(50), date

-- board(writer)는 users테이블의 회원아이디에 참조

CREATE TABLE users (
    user_id    VARCHAR2(30)
        CONSTRAINT users_user_id_pk PRIMARY KEY
    , password   VARCHAR2(100)
        CONSTRAINT users_password_nn NOT NULL
    , user_name  VARCHAR2(50)
        CONSTRAINT users_user_name_nn NOT NULL
    , created_at DATE DEFAULT sysdate
);

-- responsibility 컬럼 add
ALTER TABLE users ADD responsibility VARCHAR2(5); -- Admin, User
ALTER TABLE users
    ADD CONSTRAINT users_resp_ck CHECK ( responsibility IN ( 'User', 'Admin' ) );

UPDATE users
   SET
    responsibility = 'Admin'
 WHERE
    1 = 1;

COMMIT;

DROP TABLE users;

INSERT INTO users VALUES (
    'user01'
  , '1234'
  , '아디나'
  , sysdate
);

INSERT INTO users VALUES (
    'user02'
  , '2222'
  , '이바'
  , sysdate
);

INSERT INTO users VALUES (
    'user02'
  , '0202'
  , '유저02'
  , sysdate
);

SELECT
    *
  FROM
    users;

SELECT
    *
  FROM
    board;

-- board(writer) 외래키 FOREIGN KEY
-- users(user_id) -> reference key
ALTER TABLE board
    ADD CONSTRAINT board_users_id_fk FOREIGN KEY ( writer )
        REFERENCES users ( user_id );

SELECT
    *
  FROM
    dept2;

SELECT
    name
  FROM
    emp2;

CREATE TABLE tcons (
    no     NUMBER(5)
        CONSTRAINT tcons_no_pk PRIMARY KEY
    , name   VARCHAR2(20)
        CONSTRAINT tcons_name_nn NOT NULL
    , jumin  VARCHAR2(13)
        CONSTRAINT tcons_jumin_nn NOT NULL
        CONSTRAINT tcons_jumin_uk UNIQUE
    , area   NUMBER(1)
        CONSTRAINT tcons_area_ck CHECK ( area >= 1
           AND area <= 4 )
    , deptno VARCHAR2(16)
        CONSTRAINT tcons_deptno_fk
            REFERENCES dept2 ( dcode )
);

DROP TABLE tcons;

COMMIT;

SELECT *
FROM board;

-- 시퀀스
CREATE SEQUENCE board_seq; -- 1 ~~ 789
SELECT BOARD_SEQ.nextval
FROM dual;

DELETE FROM board;

INSERT INTO board (board_no, title, content, writer)
VALUES (BOARD_SEQ.nextval, '오라클 인덱스', '데이터생성시 생성', 'user01');
INSERT INTO board (board_no, title, content, writer)
VALUES (BOARD_SEQ.nextval, 'HTML,CSS,JS', '웹프로그램 작성', 'user02');
INSERT INTO board (board_no, title, content, writer)
VALUES (BOARD_SEQ.nextval, 'Node.js', 'JS활용한 서버프로그램', 'user99');

INSERT INTO board (board_no, title, content, writer)
SELECT BOARD_SEQ.nextval, title, content, writer
FROM board;

-- primary key (unique index)

-- paging 기능
-- 1페이지에 10건씩 페이지
-- 1page: 1 ~ 10 / 2page: 11~20 / 3page: 21~30 ...

SELECT b.*
FROM (SELECT rownum rn, a.*
      FROM (SELECT *
            FROM board
            ORDER BY board_no) a) b
WHERE b.rn > (:page - 1)  * 10
AND b.rn <= :page * 10;

SELECT a.*
FROM (SELECT /*+ INDEX_DESC(b SYS_C008402) */ rownum rn, b.*
      FROM board b) a
WHERE a.rn > (:page - 1)  * 10
AND a.rn <= :page * 10; -- 11g 예전방식

SELECT *
FROM board
ORDER BY board_no
OFFSET (:page - 1)*10 rows FETCH NEXT 10 ROWS ONLY;