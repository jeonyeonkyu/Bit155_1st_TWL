--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
select ename, sal
from emp
where sal > (select sal
                from emp
                where ename='SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.
select ename, sal, deptno
from emp
where sal in (select sal
                from emp
                where deptno=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
select ename, hiredate
from emp
where ename != 'BLAKE' and deptno in (select deptno
                from emp
                where ename='BLAKE');

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������ ** �ǹ����� �̷� ������ ���������� ����(����� ����� ��)
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
select empno, ename, sal
from emp
where sal > (select round(avg(sal),0)
                from emp)
order by sal desc;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
select empno, ename
from emp
where deptno in (select deptno
                from emp
                where ename like '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
select ename, deptno, sal
from emp
where sal > all(select sal
                from emp
                where deptno = 30);

--�ι�° ���(�׳� �̰ž���, all�� �� �Ⱦ�)
select ename, deptno, sal
from emp
where sal > (select max(sal)
                from emp
                where deptno = 30);
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.
select ename, deptno, job
from emp
where deptno in (select deptno
                from dept
                where loc = 'DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
select deptno, ename, job
from emp
where deptno in (select deptno
                from dept
                where dname = 'SALES');

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
select ename, sal
from emp
where mgr in (select empno
                from emp
                where ename = 'KING');
                
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ���� ???????
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                from emp) and deptno in (select deptno
                                        from emp
                                        where ename like '%S%');

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����(0�� Ŀ�̼��� ����) 
-- �̸�, ����, �μ���ȣ�� ����϶�.
/*
select DISTINCT e.ename, e.sal, s.deptno
from emp e join (select deptno, sal from emp where comm is not null) s
on e.deptno = s.deptno
where e.deptno = s.deptno; 
���� Ǭ�� ����*/

select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null);

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����(0�� Ŀ�̼��� ����) 
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.
--30���μ���� ������ ���� �ʰ�, 30�� �μ���� Ŀ�̼��� ���� ����...
/*select e.ename, e.sal, e.comm
from emp e join (select sal, comm, deptno from emp where deptno = 30) s
on e.deptno = s.deptno
where e.sal != s.sal and e.comm != s.sal;
���� �Ѱ� ����*/
select ename, sal, comm
from emp
where sal not in(select sal from emp where deptno=30)
and comm not in(select nvl(comm,0) from emp where deptno=30 and comm is not null);

/*
join (�ϳ� �̻��� ���̺��� ������ �������� : ���� ���̺� : ����)
subquery
�ʱ� ������ �⺻ �Ҿ�....
*/
----------------------------
--[INSERT], [UPDATE], [DELETE] >> �ϱ�
/*
����Ŭ ����
DDL(������ ���Ǿ�) : create, alter, drop, truncate(�޸� �������� ����), rename, modify
DML(������ ���۾�) : insert, update, delete : 20%
DQL(������ ���Ǿ�) : select                 : 70%
DCL(������ �����) : ����(grant, revoke) ->�̰Ŵ� �����ڰ� ���� ����, DBA�� ��(������ : ����͸� : ��� ����)
TCL(Ʈ�����)     : commit, rollback, savepoint
������ : CRUD(create���ƴϰ� insert(������ ���忡�� ����), select, update, delete)
*/

--DML(Ʈ����� : �ϳ��� ������ �۾� ����) > LOCK �ڡڡڡ�(���� �߿�, ���������� ���� ����) ex)������û, �¶��� ���� �ý���
--A��� ���࿡�� �� ���� B��� ���࿡ �Ա�
--A : update ... 1000 > 500
--B : update ... 1000 > 1500
--�Ѵ� ���� : commit
--���߿� �ϳ��� ���� : rollback

select * from tab; --������ ����ڰ� ���� ��� ���̺��� �� �� ����
select * from tab where tname='BOARD'; --BOARD���̺��� ���������� Ȯ��

select * from col; --���� �÷�
select * from col where tname='EMP'; --emp��� ���̺��� �÷��� ����ʹ�, ������ DB ���� ���鶧 �̷����� ���� ��

select * from user_tables; --�����ڰ� ���ֺ�
select * from user_tables where table_name='DEPT';
--tab�� col������ �˾Ƶ� ����
-----------------------------------------------------------------
--pdf 10��, 168page

create table temp(
    id NUMBER primary key, --not null �ϰ� unique�� �����͸� �� �� �ִ�.
    name varchar2(20) --default null �� ���
);

/*
���� Ÿ��
char(20) >> 20byte >> �ѱ�10��, ������20�� >> �������� ���ڿ�
varchar2(20) >> 20byte >> �ѱ�10��, ������20�� >>�������� ���ڿ�

char(20)    >> 'ȫ�浿' >> 6byte >> [ȫ�浿    ] >> 20byte
varchar(20) >> 'ȫ�浿' >> 6byte >> [ȫ�浿] >> 6byte
ex)
�������� ������ : ��, ��
�������� ������ : �̸�...

���ɻ��� ���� : char() > varchar() �켱..
�׷�....�������� ������ char() .... ����, �ֹι�ȣ, �����ȣ

�ѱ۹���(unicode : 2byte) >> �ѱ�,������,Ư������,����

nchar(20) >> 20 >> ���ڼ�(����,�ѱ� �������) >> ��byte >> 2 * 20 >> 40byte
nvarchar(10) >> 10����

*/

--1.���� �Ϲ����� insert
insert into temp(id,name)
values(100,'ȫ�浿');

select * from temp;
--�ǹݿ�
commit;

--2.�÷� ��� ����(�ǵ��� ���� ���� / ������ ������)
insert into temp 
values(200,'������'); --�����Ͱ� �÷��� ����, ������ ��ġ�ؾ� �Ѵ�
commit;

--1.���� ��Ȳ
insert into temp(id, name) --id primary key
values(100, '�ƹ���');

--2.���� ��Ȳ
insert into temp(name)
values('�ƹ���');
----------------------------------------------------
--�Ϲ� SQL ���� ���α׷��� ���(X)
--PL/SQL(��� SQL) : ���α׷��� ���� ���(���, ����), ������ ���� ������
--create table temp2(id varchar2(20));

--������ �׽�Ʈ.. ������ 1000�� 1000�� ����...(�����͸� ���� �ְ� ������ ���)
--BEGIN
--    FOR i IN 1..1000 LOOP
--        insert into temp2(id) values('A' || to_char(i));
--    END LOOP;
--END;
--
--select * from temp2;
--commit;
--
--select * from temp2 order by id desc;

-----------------------------------------------
create table temp3(
    memberid number(3) not null,
    name varchar2(10), --null ���
    regdate date default sysdate --�⺻�� �����ϱ�(��¥ insert ���� ������...)
);

select sysdate from dual;

insert into temp3(memberid, name, regdate)
values(100, 'ȫ�浿', '2020-04-03'); --��¥�� ���� �־ �������


select * from temp3;
commit;

insert into temp3(memberid, name)
values(200, '�ƹ���');

insert into temp3(memberid)
values(300);

-----

select * from temp3;
--300   null   2020-04-03 12:15:35

insert into temp3(name)
values('�̸���'); --null���� ������ �ȵ�

--insert(TIP)
--1. �뷮 ������ insert �ϱ� 

create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;

select * from temp4;

--��
--�䱸���� : temp4�� �ִ� ��� �����͸� temp5�� �־��
--insert into ���̺��(�÷�����Ʈ) values(������Ʈ);
--insert into ���̺��(Į������Ʈ) select �� (�÷�����Ʈ�� ������ Ÿ�� ����) ����

insert into temp5(num)
select id from temp4;
--temp4�� �����͸� temp5�� �̵�
select * from temp5;

--2. insert TIP
--���̺��� ���� ��Ȳ����[���̺� ����] + [�뷮 ������ ����]
--�� ���� ����(���� ������ ���簡 �ȵ� ex)foreign key, primary key ��..)
--������ ���̺� ����(schema), �÷��̸��� Ÿ���� �����

--create table copyemp(id number)
create table copyemp --emp�� ���� ������ �����.... ������ ���Ա�����
as 
    select * from emp;

select * from copyemp;

create table copyemp2
as 
    select empno, ename, sal 
    from emp
    where deptno = 30;

select * from copyemp2;
select * from col where tname='COPYEMP2';

--���� : ����(Ʋ)�� �����ϰ� �����ʹ� �����ϰ� ���� ���� ��
create table copyemp3
as 
    select empno, ename, sal 
    from emp where 1=2;

select * from copyemp3;

/*
update table_name
set colum1 = value1, colum2 = value2...
where ����

update table_name
set column1 = (subquery)
*/

select * from copyemp;
rollback;

update copyemp
set sal = 0
where deptno=20;

select * from copyemp order by deptno;
commit;

update copyemp
set sal = (select sum(sal) from emp)
where deptno = 20;

select * from copyemp;
commit;

--�������� �÷��� update
update copyemp 
set ename='AAAA', job='BBBB', hiredate=sysdate, sal=1111
where deptno = 10;

select * from copyemp where deptno=10;
commit;

------[update end]-------------
--[delete]
--��Ģ>> delete -> commit, rollback -> ���� �Ұ� -> �� ���..

delete from copyemp;

select * from copyemp;
rollback;

delete from copyemp where deptno in (10,20);

select * from copyemp where deptno in (10,20);
commit;
------------------------------[delete end]--------------
/*
APP(JAVA) -> JDBC API -> ORACLE(DB)

CRUD
create : insert
read : select
update : update
delete : delete

(DML : insert, update, delete) Ʈ�����(commit, rollback�� ����)

JDBC -> Oracle -> Emp ���̺� �۾�
��ü��ȸ(�Լ�)
������ȸ(����� 100�� ����� �̸�) (�Լ�)
���� (�Լ�)
���� (�Լ�)
���� (�Լ�)
JAVA
public List<Emp> getEmpAllList() {String sql = "select * from emp"}
public Emp getEmpListByEmpno() { String sql = "select ...where empno=777")
public int insertEmpDate(Emp emp) {String sql = "insert into emp()..."}
*/
----------------------------------

--[DDL]
--create, alter, drop (���̺� ����)

select * from tab;
select * from tab where tname='BOARD';

drop table board;

create table board(
    boardid NUMBER,
    title nvarchar2(100), --�ѱ�,������ ������� 100��
    content nvarchar2(2000),
    regdate date  
);

select * from tab where tname = 'BOARD';
--�л� ���� ���̺�
--����, ����, ����, �����÷�
--10    10   10    30
--����, ����, ���� ������ ������ �ڵ����� ���� ����� �Ǹ� ���� ������...
--oracle 11g ����(�����÷�(�����÷�)) -> �ǰ� ����
--����Į���ȿ��� �����͸� ���� ���� �� ����.
create table vtable(
    no1 number,
    no2 number,
    no3 number generated always as (no1 + no2) virtual
);

--���� �ܿ��ʿ� ����
create table vtable2
(
    no number, --����
    p_code char(4), --��ǰ�ڵ�(A001, A002)
    p_date char(8), --�԰���(2020011)
    p_qty number, --����
    p_bungi number generated always as (
                                            case when substr(p_date,5,2) in ('01','02','03') then 1
                                                 when substr(p_date,5,2) in ('04','05','06') then 2
                                                 when substr(p_date,5,2) in ('07','08','09') then 3
                                                 else 4
                                            end
                                        ) virtual
);

select column_name, data_type, data_default
from user_tab_columns where table_name='VTABLE2';

insert into vtable2(p_date) values('20200101');
insert into vtable2(p_date) values('20200126');
insert into vtable2(p_date) values('20200301');
insert into vtable2(p_date) values('20200601');
insert into vtable2(p_date) values('20201201');

select * from vtable2;

select * from vtable2 where p_bungi = 2;
commit;




