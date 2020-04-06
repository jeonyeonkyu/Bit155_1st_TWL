--DDL ���̺� �ٷ��(pdf 138page)


--DDL ���̺� �ٷ��(�ΰ������� �˸� ������, ���� �ܿ� �ʿ�� ����(�����Ե� �ȿܿ�))
--1. ���̺� �����ϱ�
create table temp6(id number);

--2.���̺��� �����ߴµ� �÷� �߰��ϱ�
desc temp6;

alter table temp6
add ename varchar2(20);

--3.���� ���̺� �ִ� �÷��� �̸��� �߸� ǥ��(ename -> username)
--���� ���̺� �ִ� �÷��� �̸� �ٲٱ�(rename)
alter table temp6
rename column ename to username;

--4.���� ���̺� �ִ� ���� �÷��� Ÿ�� �����ϱ�
--(modify)
alter table temp6
modify(username varchar2(100));

--5.���� ���̺� �ִ� ���� �÷� �����ϱ�
alter table temp6
drop column username;

--6.���̺� ����
--6.1 ������ ���� : delete
--���̺� ó�� ����� ó�� ũ��(20��) -> 20�򺸴� ū �����͸� ������ >> �ڵ����� �ø�(����Ŭ�� OS ��ũ��ŭ..)
--ex) ó�� ���̺� ũ�� 1M >> 10���� >> 100M��ŭ ���̺� ���� >> delete 10���� ���� >> ���̺� ũ�� 100M

--���̺��� �����͸� �����ϸ鼭 ������ ũ�⵵ ���� �� �ִ�
--truncate (where �� ����� ���� ����) �ѹ��� ó�� ������� ���� ũ��� �پ��(���� ���ϴ� �κи�ŭ�� ũ��� ������ ����)
--ex) ó�� ���̺� ũ�� 1M >> 10���� >> 100M��ŭ ���̺� ���� >> truncate 10���� ���� >> ���̺� ũ�� 1M
--�����ڰ� trunacte�� �� �ʿ�� ����, �ǹ������� DBA�� ��

--7.���̺� ����(drop)
--������� �ʴ� �̻� ���� �Ұ�
drop table temp6;

-----------------------------------------------------------------------
--���̺� ���� �����ϱ�(pdf 144page)
--�ڵ�����[���Ἲ] Ȯ��
--select(������ X)
--����(constraint : insert, update, delete(FK)) 
/*
PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)
--���̺� �Ѱ��� �ɼ� ����(���̺�� �Ѱ�(�÷��� ������ ��� ���� : ����Ű))
--���������� �˻��� ����� ���ؼ� (index) �ڵ� ����(select ���) 
index�� ����
1.�뷮�� ������ ����� ����
2.

FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�.
--��������[���̺�]�� [���̺�]���� ���� ����

��UNIQUE key(UK) ���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL �� ���)
NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�.
CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
������ ������ ���� �ްڴ� �÷��� gender in ('��','��') �ϸ� ...
ex) where gender in ('��','��')
*/

--������ ����� ����
--1.���̺� ����鼭 �ٷ� ����(create table ...)
--2.���̺� ���� ���� �߰�(����)(alter table add constraint) ...)(��¼�� �� ����� ���� ���� �� ����)
--  2���� �ڵ�ȭ�� �� ���� ����ϴ� ���

--1.���� ���� Ȯ���ϱ�(�̰��� �ϱ��ϸ� ����)
select * from user_constraints where table_name='EMP'; --���̺� ���� �빮��
--SYS_C006997 ���������� ������ ���� �̸�
--"EMPNO" IS NOT NUL

create table temp7(
    --id NUMBER PRIMARY KEY ����ǥ��(�����̸� : SYS_C006997), PRIMARY KEY�� �̸��� ���ﶧ �����̸��� �˾ƾ� ���� �� ����) -> ����
    id number constraint pk_temp7_id primary key, --�������, pk_���̺��_�÷���(������)
    name varchar2(20) not null,
    addr varchar2(50)
);

select * from user_constraints where table_name='TEMP7';
--�츮�� ������ ������ ���� �����̸��� �� (���� ����, ����) ���� ��� ����

insert into temp7(name,addr) values('ȫ�浿','����� ������');
--null�� �Ұ�
--�ڹ��ڵ忡�� ���°ͺ��� DB���� ���°� ���� �߿�

insert into temp7(id,name,addr) values(10, 'ȫ�浿','����� ������');
commit;
select * from temp7;

insert into temp7(id,name,addr) values(10, '�ƹ���','����� ������');
--�ߺ� ������ �Ұ�

--1.���̺� primary key�� ����� �ɼ� ������ 1��
--(name, num) �������� �÷��� ��� 1�� ... >> ����Ű

create table temp8(
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin char(6) constraint uk_temp8_jumin unique,
    addr varchar2(20)
);

select * from user_constraints where table_name='TEMP8';
insert into temp8(id,name,jumin,addr) values(10,'ȫ�浿','123456','��⵵ ������');
commit;
select * from temp8;

insert into temp8(id,name,jumin,addr) values(20,'�ƹ���','123456','��⵵ ������');
--ORA-00001: unique constraint (BIT.UK_TEMP8_JUMIN) violated

--��null ....unique ���(null�� �ߺ�üũ�� �ұ�) -> ����
--result : null ���(null�� �ߺ�üũ�� ����� �ƴϴ�)
insert into temp8(id,name,addr) values(30,'�达','��⵵ ������');
insert into temp8(id,name,addr) values(40,'�ھ�','��⵵ ������');

--create table temp9(
--    jumin not null constraint .. unique --not null�ϸ鼭 unique�� ��
--)
--unique������ ���̺� � : �÷�������ŭ ...
----------------------------------------------------------------------------
create table temp9(
    id number
);

--���� ���̺� ���� �߰��ϱ�
--����) ���� �����Ͱ� �ִ� ��� ������ �����ϴ� �����Ͱ� ������ ������ �߰����� ����
--���� �ɱ����� ������ �˻� ���� ����

--��
alter table temp9
add constraint pk_temp9_id primary key(id);
select * from user_constraints where table_name='TEMP9';
--���̺��� ����� �߰��� ������ �Ŵ� ����� ����(ó�� ���̺� ����� ������ �����ϴ� ���� �����)

--������ �÷�(����Ű)
--add constraint pk_temp9_id primary key(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--not null �߰��ϱ�(�̹���� �� �Ⱦ�)
alter table temp9
modify(ename not null);


--������ �𵨸� ��
--exerd(�ѱ���ǰ)

---------------------------------------
--[check ����]
--where ���ǰ� ������ ������ ���� >> where age > 19
--�÷��̸� age > 19

create table temp10(
    id number constraint pk_temp10_id primary key,
    name varchar2(20) not null,
    jumin char(6) constraint uk_temp10_jumin unique,
    addr varchar2(20),
    age number constraint ck_temp10_age check(age >= 19) --search_condition
);

select * from user_constraints where table_name='TEMP10';

insert into temp10(id,name,jumin,addr,age) values(100,'ȫ�浿','123456','����� ������',20);

select * from temp10;
commit;

insert into temp10(id,name,jumin,addr,age) values(200,'ȫ�浿','123456','����� ������',18);
--ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
----------------------------------------------------------------------------------
--���� ���� : RDBMS : ���̺�� ���̺��� ���� ����(��)
--emp ���̺� �ִ� deptno �÷��� dept ���̺� �ִ� deptno�� �����Ѵ�.
--�����ϴ� �ʿ� �Ŵ� ���� : FK
--������ ���ϴ� �ʿ� �Ŵ� ���� : PK

create table c_emp 
as 
    select empno, ename, deptno from emp where 1=2;
    
create table c_dept
as
    select deptno, dname from dept where 1=2;

select * from c_emp;
select * from c_dept;

--��

--c_emp(deptno) >> c_deptno(deptno)�� ���� ���ž�
--c_dept(deptno) �ٸ� ������� �����ֱ� ���ؼ� �ſ��� Ȯ��(primary key)
--c_dept(deptno) primary key�� ���� �ɾ������
--1.
desc c_dept;

alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);
--2.
alter table c_emp 
add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);
--c_emp(deptno) --- c_dept(deptno) ���谡 ����(1:N) / �ٴ�ٴ� ���� ����
--1:1���� 
--ȸ���� 5���� ������ 2���� ����(id,�̸�)�� ����ϸ� ������ 3���� ����(id,����,�ּ�)�� �ٸ� ���̺� �ְ� �ϴ��� ����(id - id)�� �ξ���
--å�� ����(�ٴ�ٰ���)

insert into c_dept(deptno,dname) values(100,'�λ���');
insert into c_dept(deptno,dname) values(200,'������');
insert into c_dept(deptno,dname) values(300,'ȸ����');
commit;
select * from c_dept;

--���Ի�� �Ի�
insert into c_emp(empno, ename) values(100,'ȫ�浿');
--deptno�� not null�� �Ȱɷ��� ������ �ȶ�
--not null �ɾ ���� ���� �´�(100~300), �ƴϴ�(null���)(100~300_
--null ���� : ���Ի���� �μ���ġ�� �ʰ� ���� ���� �ִ�.
--not null ���� : �Ի��ϴ� ��� ����� �ݵ�� �μ��� ������ �Ѵ�.
--DB ����� ������ ����..
select * from c_emp;

update c_emp
set deptno = 500;
where empno = 100;
--���Ἲ ���� ����

update c_emp
set deptno = 100;
where empno = 100;

select * from c_emp;
commit;

insert into c_emp(empno, ename, deptno)
values(200,'�ƹ���','100');
commit;
select * from c_emp;
--------------------------------------------------------------------------------
--�ΰ��� ���̺�
--(�θ�� �ڽ� ����)
--(master , detail)

--emp(deptno) �� dept(deptno) ���迡�� �����̺�(�θ�)
--�θ�(PK�� ������ �ִ����� �θ��) > dept     

select * from c_dept;
select * from c_emp;


delete from c_dept where deptno = 300;
delete from c_dept where deptno = 100;
--ORA-02292: integrity constraint (BIT.FK_C_EMP_EMPNO) violated - child record found
--�ڡڡ�
--integrity constraint (BIT.FK_C_EMP_EMPNO) violated 
-- child record found
--�� ����� �;�� ....
--child (100 �� �μ��� ���� , ����) ...
--�ڽ��� ���� �����ϰ� �θ� ���� .....
COMMIT;

/*
--��cascade �ɼ�
--on delete cascade : �θ����̺�� ������ ���� �ϰڴ�
--mysql, mssal�� on update cascade�� ����

/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
-- [ON DELETE CASCADE]  �θ����̺�� ������ ���� �ϰڴ�
-- 300 ���� �� �ֳ���?  �� 
-- delete from c_dept where detpno=300;
-- �����ϴ� �ڽ� ������ ���� ����
-- delete from c_emp where deptno=300; ���� ����

alter table c_emp
drop constraint fk_c_emp_empno; --������ ����

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;
--�θ��ʿ� �ִ� �����͸� ����� �ڽ��ʿ� �ִ� �����͵� ������

select * from c_emp;
select * from c_dept;

delete from c_dept where deptno=100;
rollback;


/*
--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ� (����� �Ҽ�����2�ڸ����� / �ݿø�)
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�

--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�(�����.)

--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�

--�а��ڵ� , �а���

--�׸��� select �����
--���� ������ 3�� ����
--�й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���
*/

create table score(
    id number(10),
    name varchar2(10) not null,
    korea number(10) default 0,
    english number(10) default 0,
    math number(10) default 0,
    sum number generated always as (korea + english + math) virtual,
    avg number generated always as ( round((korea + english + math)/3,2) ) virtual,
    majorCode number(10)
);

alter table score
add constraint pk_score_id primary key(id);

create table major(
    majorCode number(10) constraint pk_major_majorCode primary key,
    majorName varchar2(10) not null
);

alter table score
add constraint fk_score_majorCode foreign key(majorCode) references major(majorCode);

--�μ�Ʈ ������

insert into major(majorCode,majorName)
values(1000,'��ǻ��');

insert into major(majorCode,majorName)
values(2000,'����');

insert into major(majorCode,majorName)
values(3000,'���');


insert into score(id,name,korea,english,math,majorCode)
values(1,'���ö',50,50,50,1000);

insert into score(id,korea,english,math,majorCode)
values(1,50,50,50,1000);
--����, �̸� NULL�� ��� X

insert into score(id,name,korea,english,math,majorCode)
values(2,'��κ�',70,80,90,2000);

insert into score(id,name,korea,english,math,majorCode)
values(3,'������',10,20,15,4000);
--���� �߻�, major�� �а��ڵ忡 4000�� ���� ����.

insert into score(id,name,majorCode)
values(4,'������',2000);
--��,��,�� ����Ʈ ������ 0 ��

--select�� ������
select * from score;
select * from major;

commit;

--3���� ���
create table major(
    m_code number,
    m_name varchar2(20) not null,
    constraint pk_major_mcode primary key(m_code),
    constraint fk_grade_mcode foreign key(m_code) references major(m_code)
);


---------------���� �����ϱ�--------------------------
--view ��ü(���� ���̺�), ����Ŭ.pdf (192page) 

create view v_001 --vie�� ���̺��� �ƴ϶� ��ü�ϻ�
as
    select empno,ename from emp;
--view �� ������ �־�� ������ �����ϴ�

select * from v_001; --view�� sql ������ ������ �ִ� ��ü

--view�� ��ü(create ...)
--create view ���̸� as [sql����] (view�� ���ؼ� �� �� �ִ� ������ ����� ����)
--view�� ���̺�ó�� ��밡�� (���� ���̺�) -> ���� ���(emp, dept) �����ϰ�
--view �޸𸮿��󿡼� �����ϴ� �������̺� (ex) in-line-view

--view ����
--�Ϲ� ���̺�� ����...(select, where ...) 
--DML(insert, update, delete) -> view�� ���ؼ� �� �� �ִ� ������ -> DML
--view�� �� �� �ִ� �����͸�..

--view ��� ����
--1.����(���� ó��) -> �����ϰ� ���� �����͸� ��Ƽ� view�� ���� ...
--��2.����(������ ������ ��Ƽ� view�� �����ϸ� ���߿� ���ĵ� ��)

--1.���� ����
--�λ� ���̺�
--Emp �ٷ� ���� ...Sal ����
create view v_emp
as 
    select empno, ename, job,hiredate from emp;
    
--v_emp ����Ͻø� �ſ�
select * from v_emp;

--���Ի���� view�� �����ִ� ������ ����.

--2.���� ����(������ ������ �ܼ�ȭ)
create view v_002
as 
    select e.empno, e.ename, d.deptno, d.dname
    from emp e join dept d
    on e.deptno = d.deptno;

select * from v_002;
select * from v_002 where deptno=20;


create view v_003
as
    select deptno, avg(sal) as avgsal
    from emp
    group by deptno;

select * from v_003;

select *
from emp e join v_003 s
on e.deptno = s.deptno
where e.sal > s.avgsal;

--���̺��� 1�� �̻�
--JOIN ... �ȵǸ� ... subquery ... �ȵǸ� view(�������̺�)

--view�� �����ϰ� ���� ����� ����(������ ����߸�), �������� ���鿡���� ������ select�� ����ϴ°� ����
--�� ������ �������� ����

--view ����
drop view v_007;

create or replace view v_007 --or replace�� ������ �ִ� ���� ����ٴ� ��
as
    select avg(sal) as "ss" from emp;
--as "ss"�� ������ ����(�÷����� alias ������ ������ �����߻�)

select * from v_007;

--View�� ���� DML ���� (�ٵ� ���ϴ°� ���� / view�� select�Ҷ��� ���°� ����)
--�� view�� ������ ������ ���̺� 1���� ��츸 ����(���� View�� DML �Ұ�)
--*���� view�� ���̺� 2���̻� ������ query)
--�ܼ� view(���̺� 1��)�� DML �۾� ����

select * from v_emp; --���� �ִ� ������(empno, ename, job, hiredate)

update v_emp --v_emp �ʴ� sal�̶� �÷��� �� �� ���� ..... ���� �Ҽ� ����
set sal = 0;
--�Ұ���, v_emp�� sql�� ��� �ִ� ��ü��(���̺��� �ƴ�)

update v_emp
set job = 'IT';

select * from v_emp;
--�����δ� emp���̺��� �ٲ��!!!!!!!!!!!!!!�ڡڡڡڡڡڡڡڡڡڡڡ� v_emp�� emp�� �ּҸ� ������ �ִٰ� �����ϸ� �ɵ�
select * from emp;

create or replace view v_emp2 --or replace�� ������ �ִ� ���� ����ٴ� ��
as
    select * from emp where deptno=20;
select * from v_emp2;

update v_em2
set sal = 0;
--v_emp2�� ����Ű�°� deptno=20�� ����Ű�� deptno�� 20�ΰ͸� sal�� �ٲ�

select * from user_views; --view ��Ϻ���


select * from emp;




--1. 30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ������.
create or replace view view_test
as
    select job, ename, sal from emp where deptno=30;
select * from view_test; 
 
--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  
create or replace view view_test2
as
    select job as "����", ename as "����̸�", sal as "����" from emp where sal>300 and deptno=30;
select * from view_test2; 
 
--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
create or replace view view_test3
as
    select max(sal) as "�ִ����", min(sal) as "�ּҿ���", round(avg(sal),0) as "��տ���" from emp;
    
select * from view_test3; 

       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.
create or replace view view_test4
as
    select deptno, round(avg(sal),0) as "��տ���" from emp group by deptno having avg(sal) > 2000;
    
select * from view_test4; 
 
 
--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.
create or replace view view_test5
as
    select job, sum(sal) as "�� ����" from emp where job != 'MANAGER' group by job having sum(sal) > 3000;
    
select * from view_test5; 

































