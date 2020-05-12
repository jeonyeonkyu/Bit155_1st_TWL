
create table tb_text(
text_no number(5) primary key, --기본 키는 고유성 nullX 중복X
title varchar2(500) not null, --title은 한글 500자까지 허용, null안됨
content varchar2(4000) not null,
user_id varchar2(16), --id중복가능
reg_time not null,
read_count number(5) not null,
recom_count number(5) not null
);

create table tb_user(
user_id varchar2(16) not null,
password varchar2(16) not null,
email varchar2(60)
);

create table tb_read_recom(
text_no number(5) not null,
user_id varchar2(16) not null,
reg_time date not null
);

insert into tb_user(user_id, password, email)
values('root', 'abcd1234', 'root@noname.com'); --insert를 할 때 values에 문자열이면 꼭 ' ' 를 넣자

insert into tb_user(user_id, password, email)
values('user1', 'abcd1234', 'user1@noname.com');

insert into tb_user(user_id, password)
values('user2', 'abcd1234');

insert into tb_user(user_id,password)
values('user3','abcd1234');

select * from tb_user;

update tb_user --update해라(변경해라)
set password = '12341234' --tb_user테이블의 user_id가 user1인 사람의 password를 12341234로
where user_id = 'user1'; --여기도 ' ' 붙여줄 것 컬럼명 아닌 문자열은 다 ' ' 인듯?


update tb_user
set email = 'user3@noname.com'
where user_id = 'user3';


create table tb_text(
text_no number(5) primary key, --기본 키는 고유성 nullX 중복X
title varchar2(500) not null, --title은 한글 500자까지 허용, null안됨
content varchar2(4000) not null,
user_id varchar2(16), --id중복가능
reg_time date not null,
read_count number(5) not null,
recom_count number(5) not null
);

insert into tb_text(text_no, title, content, user_id, reg_time, read_count, recom_count)
values(1, '오늘하루', '할 일 없었다.', 'user1',sysdate, 0,0);



















