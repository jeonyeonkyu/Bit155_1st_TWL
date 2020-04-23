문제 1.

CREATE TABLE TB_TEXT (
    text_no NUMBER(5) PRIMARY KEY,
    title VARCHAR2(500) NOT NULL,
    content VARCHAR2(4000) NOT NULL,
    user_id varchar2(16),
    reg_time DATE,
    read_count NUMBER(5) NOT NULL,
    recom_count NUMBER(5) NOT NULL
);

CREATE TABLE TB_USER (
    user_id   varchar2(16) PRIMARY KEY,
    password varchar2(16) NOT NULL,
    email    VARCHAR2(60)
);

CREATE TABLE TB_READ_RECOM (
    text_no number(5) NOT NULL,
    user_id varchar2(16) NOT NULL,
    reg_time DATE NOT NULL,
    PRIMARY KEY (text_no, user_id)
);


문제 2.

INSERT INTO TB_USER(user_id, password, email) VALUES('root', 'abcd1234', 'root@noname.com');
INSERT INTO TB_USER(user_id, password, email) VALUES('user1', 'abcd1234', 'user1@noname.com');
INSERT INTO TB_USER(user_id, password) VALUES('user2', 'abcd1234');
INSERT INTO TB_USER(user_id, password) VALUES('user3', 'abcd1234');

SELECT * FROM TB_USER;


문제 3.

UPDATE TB_USER
   SET PASSWORD = '12341234'
 WHERE user_id = 'user1';


문제 4.

UPDATE TB_USER
   SET email = 'user3@noname.com'
 WHERE user_id = 'user3';
 
SELECT * FROM TB_USER;


문제 5.

INSERT INTO TB_TEXT(text_no, title, content, user_id, reg_time, read_count, recom_count)
VALUES(1, '오늘하루', '할 일 없었다', 'user1', SYSDATE, 0, 0);


문제 6.

INSERT INTO TB_TEXT(text_no, title, content, user_id, reg_time, read_count, recom_count)
VALUES(2, '오늘하루', '할 일 많았다', 'user2', SYSDATE, 0, 0);


문제 7.

INSERT INTO TB_TEXT(text_no, title, content, user_id, reg_time, read_count, recom_count)
VALUES(3, '오늘하루', '할 일이란 과연 무엇일까?', 'user3', SYSDATE, 0, 0);


문제 8.

-- user3이 쓰지 않았다면 카운트는 0이다.
SELECT COUNT(*)
  FROM TB_TEXT
 WHERE text_no = 1
   AND user_id = 'user3';

-- 자신이 쓴 글이 아닐 경우(카운트가 0이면) 업데이트 구문 시작
UPDATE TB_TEXT
   SET read_count = read_count + 1
 WHERE text_no = 1;


문제 9.

-- user1이 쓰지 않았다면 카운트는 0이다.
SELECT COUNT(*)
  FROM TB_TEXT
 WHERE text_no = 1
   AND user_id = 'user1';

-- 자신이 쓴 글이 아닐 경우(카운트가 0이면) 업데이트 구문 시작
UPDATE TB_TEXT
   SET read_count = read_count + 1
 WHERE text_no = 1;


/*
문제 10. user2이 1번 글을 추천합니다.
- 자신이 쓴 글인지 아닌지를 조사합니다. 자신이 쓴 글은 추천할 수 없습니다.
- 기존에 추천한 기록이 있는지 조사합니다.
- 없을 경우 추천 횟수를 증가시키고 추천 기록을 테이블에 입력합니다.
*/
-- 자신이 쓴 글인지 아닌지를 조사합니다. 자신이 쓴 글은 추천할 수 없습니다.
SELECT COUNT(*)
  FROM TB_TEXT
 WHERE text_no = 1
   AND user_id = 'user2';

-- 기존에 추천한 기록이 있는지 조사합니다.
-- 자신이 쓴글이 아닐 경우에만 처리부분(count가 0이면 진행)
SELECT COUNT(*)
  FROM TB_READ_RECOM
 WHERE text_no = 1
   AND user_id = 'user2';

--  없을 경우 추천 횟수를 증가시키고 추천 기록을 테이블에 입력합니다.
--  위의 커리 결과가 0일 경우 진행
UPDATE TB_TEXT
   SET recom_count = recom_count + 1
 WHERE text_no = 1;

INSERT INTO TB_READ_RECOM(text_no, user_id, reg_time)
VALUES(1, 'user2', sysdate);


/*
문제 11. user3이 1번글을 추천합니다.
- 자신이 쓴 글인지 아닌지를 조사합니다. 자신이 쓴 글은 추천할 수 없습니다.
- 기존에 추천한 기록이 있는지 조사합니다.
- 없을 경우 추천 횟수를 증가시키고 추천 기록을 테이블에 입력합니다.
*/
-- 자신이 쓴 글인지 아닌지를 조사합니다. 자신이 쓴 글은 추천할 수 없습니다.
SELECT COUNT(*)
  FROM TB_TEXT
 WHERE text_no = 1
   AND user_id = 'user3';

-- 기존에 추천한 기록이 있는지 조사합니다.
-- 자신이 쓴글이 아닐 경우에만 처리부분(count가 0이면 진행)
SELECT COUNT(*)
  FROM TB_READ_RECOM
 WHERE text_no = 1
   AND user_id = 'user3';

--  없을 경우 추천 횟수를 증가시키고 추천 기록을 테이블에 입력합니다.
--  위의 커리 결과가 0일 경우 진행
UPDATE TB_TEXT
   SET recom_count = recom_count + 1
 WHERE text_no = 1;

INSERT INTO TB_READ_RECOM(text_no, user_id, reg_time)
VALUES(1, 'user3', sysdate);

