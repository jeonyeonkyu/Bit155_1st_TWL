--1Á¶°úÁ¦ È¸¿ø Å×½ºÆ®

select * from jo_board;

select * from jo_member;

insert into jo_member values('88','a','a','a','a','a','a','a');
commit;

delete from jo_member where userid='c';

create table calendar(
    c_id number primary key,
    c_title varchar2(100),
    c_start varchar2(100),
    c_end varchar2(100)
);

--Ä¶¸°´õ sql
select * from calendar;

update calendar set c_title = 'sss', c_start='2020-05-07', c_end='2020-05-08' where c_id=1;

delete from calendar where c_id = 0;

drop table calendar;

insert into calendar values(1, '°Å·¡Ã³ ¹ÌÆÃ', '2020-05-07', '2020-05-08');
insert into calendar values(2, 'Ç±Ç±', '2020-05-11', '2020-05-12');
insert into calendar values(3, 'Ç±Ç±', '2020-05-16', '2020-05-18');

commit;