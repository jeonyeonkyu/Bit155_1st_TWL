create table dmlemp
as
    select * from emp;
    
select * from dmlemp;

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);

select * from sys.USER_CONSTRAINTS where table_name='DMLEMP';

create table trans_A(
    num number,
    name varchar2(20)
);

create table trans_B(
    num number constraint pk_trans_B_num primary key,
    name varchar2(20)
);

select * from trans_A;

select * from trans_B;


select * from dept;