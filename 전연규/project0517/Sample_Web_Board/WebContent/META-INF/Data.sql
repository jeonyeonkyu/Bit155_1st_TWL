create table jsp_member
(
  id varchar2(50) not null primary KEY
  ,password varchar2(50) not null
  ,name varchar2(50)
  ,gender varchar2(10)
  ,birth date
  ,mail varchar2(100)
  ,phone varchar2(50)
  ,address varchar2(200)
  ,reg date default sysdate
);



출처: https://all-record.tistory.com/111?category=733042 [세상의 모든 기록]