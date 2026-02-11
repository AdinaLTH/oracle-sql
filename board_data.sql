SELECT *
FROM categories;
--INSERT INTO categories (name, display_order)
--VALUES ('잡담', 0);
--INSERT INTO categories (name, display_order)
--VALUES ('질문', 1);
--INSERT INTO categories (name, display_order)
--VALUES ('정보', 2);
--INSERT INTO categories (name, display_order)
--VALUES ('창작', 3);

--BEGIN
--    -- 1. 페이징 테스트용 일반 게시글 25개 자동 생성 (반복문)
--    FOR i IN 1..25 LOOP
--        INSERT INTO POSTS (
--            CATEGORY_ID, 
--            TITLE, 
--            CONTENT, 
--            NICKNAME,     
--            PASSWORD, 
--            VIEW_COUNT, 
--            LIKE_COUNT, 
--            DISLIKE_COUNT
--        ) VALUES (
--            MOD(i, 4) + 1, -- 1(잡담), 2(질문), 3(정보), 4(창작) 순서대로 순환
--            '테스트 게시글 제목입니다 [' || i || ']',
--            '목록 조회 및 페이징 처리를 테스트하기 위한 더미 본문 데이터입니다. ' || i,
--            '익명유저' || i,
--            '1234',
--            TRUNC(DBMS_RANDOM.VALUE(0, 100)), -- 0~100 사이 랜덤 조회수
--            TRUNC(DBMS_RANDOM.VALUE(0, 10)),  -- 0~10 사이 랜덤 추천수 (15 미만으로 설정)
--            TRUNC(DBMS_RANDOM.VALUE(0, 5))    -- 0~5 사이 랜덤 비추천수
--        );
--    END LOOP;
--
--    -- 2. 개념글 필터 테스트용 게시글 3개 수동 생성 (추천수 15 이상)
--    INSERT INTO POSTS (CATEGORY_ID, TITLE, CONTENT, NICKNAME, PASSWORD, VIEW_COUNT, LIKE_COUNT, DISLIKE_COUNT)
--    VALUES (3, '[공략] 뉴비를 위한 게임 기초 가이드 및 루트 정리', '처음 시작하시는 분들은 꼭 읽어보세요.', '고인물', '1234', 500, 35, 2);
--    
--    INSERT INTO POSTS (CATEGORY_ID, TITLE, CONTENT, NICKNAME, PASSWORD, VIEW_COUNT, LIKE_COUNT, DISLIKE_COUNT)
--    VALUES (4, '직접 그린 캐릭터 팬아트 올려봅니다', '열심히 그렸어요. 부거 아님!', '금손', '1234', 850, 50, 1);
--    
--    INSERT INTO POSTS (CATEGORY_ID, TITLE, CONTENT, NICKNAME, PASSWORD, VIEW_COUNT, LIKE_COUNT, DISLIKE_COUNT)
--    VALUES (1, '오늘자 레전드 역전승 장면.gif', '이걸 이기네 ㅋㅋ', '루미아섬주민', '1234', 1200, 65, 5);
--
--    -- 3. 저장
--    COMMIT;
--END;
SELECT *
FROM posts;
-- 전체글이 최신순(POST_ID 역순)으로 28개가 잘 나오는지 확인
SELECT POST_ID, CATEGORY_ID, TITLE, LIKE_COUNT, DISLIKE_COUNT, NET_LIKES 
FROM POSTS 
ORDER BY POST_ID DESC;