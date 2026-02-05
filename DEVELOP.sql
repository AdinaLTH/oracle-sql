SELECT
    *
  FROM
    emp;

-- DML (insert, update, delete, merge)
-- 1) insert into table명 (컬럼1, 컬럼2,...) values(값1, 값2,...);
SELECT
    *
  FROM
    board;

UPDATE board
   SET
    click_count = click_count + 1
, title = :title
, content = :content
 WHERE
    board_no = :bno;

DELETE FROM board
 WHERE
    content LIKE '%바인드%';

ROLLBACK;

UPDATE board
   SET
    title = '글등록연습'
, writer = 'user01'
, content = 'sql연습중'
 WHERE
    board_no = 4;

SELECT
    *
  FROM
    emp;

INSERT INTO board (
    board_no
    , title
    , content
    , writer
) VALUES (
    (
        SELECT
            MAX(board_no) + 1
          FROM
            board
    )
  , :title
  , :content
  , :writer
);
        
-- max_1, 이름, job=SALESMAN, , sysdate-3, 3000, 10, 30
INSERT INTO emp (
    empno
    , ename
    , job
    , hiredate
    , sal
    , comm
    , deptno
) VALUES (
    (
        SELECT
            MAX(empno) + 1
          FROM
            emp
    )
  , '아디나'
  , 'SALESMAN'
  , TO_DATE('2026-02-01', 'rrrr-mm-dd')
  , 3000
  , 10
  , 30
);
     
-- 매니저 7698


UPDATE emp
   SET
    mgr = (
        SELECT
            empno
          FROM
            emp
         WHERE
                deptno = 30
               AND job = 'MANAGER'
    )
 WHERE
    empno = 7935;

CREATE TABLE board (
    board_no  NUMBER(10) PRIMARY KEY
    , -- 글번호(키역할  )
     title     VARCHAR2(300) NOT NULL
    , -- 제목
     writer    VARCHAR2(50) NOT NULL
    , -- 작성자 
     content   VARCHAR2(1000) NOT NULL
    , -- 글내용 
     create_at DATE DEFAULT sysdate -- 작성시간
);
-- 상품테이블(product_tb1)
-- 상품코드, 상품명, 가격, 상품설명, 평점(5,4,3,2,1), 제조사, 등록일자
-- key,     nn      nn  nn      default 3               sysdate
CREATE TABLE product_tb1 (
    pcode NUMBER(10) PRIMARY KEY
    , pname VARCHAR2(50) NOT NULL
    , price NUMBER(20) NOT NULL
    , pdscb VARCHAR2(1000) NOT NULL
    , rate  NUMBER(1) DEFAULT 3
    , pcomp VARCHAR(50)
    , rg_at DATE DEFAULT sysdate
);

DROP TABLE product_tb1;

COMMIT;

INSERT INTO product_tb1 (
    pcode
    , pname
    , price
    , pdscb
    , rate
    , pcomp
) VALUES (
    (
        SELECT
            nvl(MAX(pcode), 0) + 1
          FROM
            product_tb1
    )
  , '애플펜슬PRO'
  , 200000
  , '전작보다 향상된 필기감'
  , 5
  , 'APPLE'
);

INSERT INTO product_tb1 (
    pcode
    , pname
    , price
    , pdscb
    , rate
    , pcomp
) VALUES (
    (
        SELECT
            nvl(MAX(pcode), 0) + 1
          FROM
            product_tb1
    )
  , :pname
  , :price
  , :pdscb
  , :rate
  , :pcomp
);

SELECT
    'S'
    || (
        SELECT
            lpad(MAX(substr(pcode, 1, 1)), 3, '0')
          FROM
            product_tb1
    )
  FROM
    dual;

SELECT
    *
  FROM
    product_tb1;

-- merge into table1
-- using table2
-- on 병합조건
-- when matched then
-- update ...
-- when not matched then
-- insert ...   
MERGE INTO product_tb1 tbl1
USING (
          SELECT
              1                   pcode
            , '애플펜슬PRO'           pname
            , 198000              price
            , '전작보다 향상된 부드러운 필기감' pdscb
            FROM
              dual
      )
tbl2 ON ( tbl1.pcode = tbl2.pcode )
WHEN MATCHED THEN UPDATE
SET tbl1.pname = tbl2.pname
  , tbl1.price = tbl2.price
  , tbl1.pdscb = tbl2.pdscb
WHEN NOT MATCHED THEN
INSERT (
    pcode
    , pname
    , price
    , pdscb )
VALUES
    ( tbl2.pcode
      , tbl2.pname
      , tbl2.price
      , tbl2.pdscb );