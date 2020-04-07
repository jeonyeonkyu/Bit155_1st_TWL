/*CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;


CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;


CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;
*/

select * from emp;
SELECT * FROM dept;
SELECT * FROM salgrade;


/*
select [DISTINCT] { *, column [ alias], . . .}
from table_name
[where condition]
[order by {column, expression} [ASC | DESC]];
*/


--1. ��� ���̺��� ��� �����͸� ����ϼ���.
select *FROM emp; --���� ���ڴ� ��ҹ��� ����X

--2. Ư�� �÷� ������ ����ϱ� --select ~ from ~ ���̺��̸�
select  ename, empno, sal from emp;
select ename from emp; 


--3. �÷��� ����Ī(��Ī) (alias) �ο��ϱ� ��µǴ� �÷��� �̸� �ٲٱ� ��ĭ ���� ���� �߰�
select empno ���, ename �̸�
from emp;

--�ֵ���ǥ �ٿ��� ���� ������ �� ���������� �ν� �� �� �ֵ��� �̷��� ���⵵ �� �� ����
select empno "��    ��", ename "��    ��"
from emp;

--����(ǥ�� ( ansi ���� ) ) �������� ����ϴ� ���� (as = alias name�� ǥ���Ұž� �� �ظ�)
select empno as "��    ��", ename as "��    ��"
from emp;

--Oracle�� �����͸� �����ϴµ� (���ڿ� "������"(A~a) : ��ҹ��ڸ� �����ϰ� �����Ѵ�)
--���ڿ��� ǥ�� ( ' ���ڿ� ' )
--�ҹ��� 'a' <-> �빮�� 'A' �ٸ���! king���� �ϸ� ������ ����� �ȵ�.

select empno, ename
from emp
where ename = 'KING'; 

--Oracle SQL�� ���� �ִ� ���Դϴ�... ����ȭ�� ����(���Ǹ� �� �� �ִ�) ������ : �� �����ڰ� �����Ѵ� ! (���տ����� = (||) , ��������� = (+)) ����
--java  + (���ڿ� + ���ڿ� >> ����)
--java  + (���� + ���� >> ����) 
--tip ) ms-sql�� + �ϳ��� ����, ����

select '����� �̸��� ' || ename ||  ' �Դϴ�' as "�������"
from emp;

--empno, ename �� �÷��̶�� �Ѵ�. �÷��� �⺻������ Ÿ���� ������ �ִ�.
--Oracle�� Ÿ��(�ڷ���) : ���� , ���ڿ� , ��¥����.... 
desc emp;
/*
���̺��� �⺻������ �� �� �ִ�. 'desc' (�÷���, null�� ��뿩��, Ÿ��)
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) --���ڿ�Ÿ�� 10byte���尡��(�ѱ� 5��, ������ Ư������ ���� 10��) VARCAHR
JOB               VARCHAR2(9)  
MGR               NUMBER            --����Ÿ�� NUMBER
HIREDATE          DATE             --��¥����Ÿ��
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER     



*/

select empno || ename -- ����  ||  ���ڿ� ������ �����ϴ�? (�پ ����� �� ���ڸ� ���ڿ��� �ٲ����. ���������� ����Ÿ��->���ڿ��� ����ȯ��)
from emp;

select empno + ename
from emp; --���� + ������ ��������� �Ұ����ϴ�. �翬����;;;      --'ORA-01722: invalid number(�������)'

--������� ���̴� �츮 ȸ�翡 ������ ��� �ִ�?
select job from emp; --�̷��� ���� ���͹����Ƿ� ������ �����? ��� �ߺ��� �����ؼ� ������� �Ѵ�.
--distinct ( �ߺ� ������ ���� ) >> �׷����� �ؼ� �ߺ����� �����Ѵ�.
select job, deptno from emp;
select distinct job from emp;

select distinct job , deptno from emp order by job; --order by �������� ���� job���� �ѹ� ����, �� �ȿ��� deptno(�μ���ȣ)�� ������ ���� ���� job �׷� ���� deptno�� ���� �׷�

select distinct deptno, job from emp order by deptno; --���� �μ��ѹ��� ��� ����, �� �ȿ��� job�� ���� ������� �� ����



--Oracle ���
--Java ���
--Oracle �����ڰ� Java�� ���� �����ϴ�( + ,* , - ...)
-- '%' �� �ٸ���! java������ �������� ���ϴ� ������������, Oracle������ ����� ���Ѵ�. (�˻� ���Ͽ����� �̹� �����)
--�׷��Ƿ� �������� �Լ��� ���ؼ� ����ؾ� �Ѵ�. Mod()

--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϱ�
select empno as"�����ȣ", sal as "�λ� �� �޿�", sal + 100 as "�λ� �� �޿�" from emp;

--dual �̶�� �ӽ� ���̺� ����� �ִ�. 100+100 ����� ����ϱ� ���� dual�̶�� ��������� ���� �� ���̺� ����ְ� ��� select�� ��±���� ���
select 100 + 100 from dual; --�����̶� 200�� ���
select 100 || 100 as "100�� 100" from dual; --�����̶� 100100�� ��� (���������� ����ȯ�� �Ͼ�� ���ڸ� ���ڷ� �ٲ� �Ŀ� ����)
select '100' + 100 from dual; -- '+'�� ������ ������̶� �������� �ʰ� ���������� ���ڷ� �ٲپ ����� �� = 200���
select '100A' + 100 from dual; --�������ϴ�. ���ڿ��� ���� ������ �ȵǹǷ�

--�񱳿�����
-- > < <=
--java�� ����(==) , �Ҵ�(=)
--Oracle( ���ٶ�� ǥ���� = ���� ����Ѵ�) �Ҵ��� ����! (���� �ʴٴ� !=)

--��������
--AND, OR , NOT

--������ (���ϴ� row(��)�� ����������) --emp���� sal�� 3000�̻��� ��� ���(*)�� ���
select  *
from emp
where sal >= 3000;

select empno, ename, sal
from emp
where sal > 3000;

--�̻�, ���� (= ����)
--�ʰ�, �̸� (= ����X)

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���.
--������� : 2 -> 1-> 3���� ���� emp ���̺��� 7788�� ���͸��ϰ�, �������� select empno... ������ �ͼ� ���
select empno, ename, job, hiredate
from emp
where empno = 7788;

--����� �̸��� KING�� ����� ���, �̸�, �޿������� ����ϱ�
select empno, ename, sal
from emp
where ename = 'KING';

--��~ (AND , OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager�� ����� ��� ������ ���

select *
from emp
where sal >= 2000 and job = 'MANAGER';


--�޿��� 2000�޷� �̻��̰ų� ������ manager�� ����� ��� ������ ���
select *
from emp
where sal >= 2000 OR job = 'MANAGER';


--����Ŭ�� ��¥(DB������ ��¥)
--����Ŭ ��¥(sysdate)



--���� ������ ����ڰ� ��¥ ������ YYYY-MM-DD �̷��� ������ �ϰڴٶ�� �ǹ�

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'; 

select * from SYS.nls_session_parameters; --����Ŭ ���� �� ���� �̹� ������� �� (�ý��� ���̺�, ȯ�� ���̺�)
--NLS_DATE_FORMAT	RR/MM/DD --���� ������ ����ڰ� �� �� �ִ� ��¥����
--NLS_DATE_LANGUAGE	KOREAN --�ѱ��� ����
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select hiredate from emp;

--�Ի��� 1980-12-17�� ����� ��� ������ ����ϱ�
select *
from emp
where hiredate = '1980-12-17';

select *
from emp
where hiredate = '1980/12/17'; -- ' / ' �� �ص� ��������


select *
from emp
where hiredate = '80/12/17'; --������ ���� RR-MM-DD�� ���¿��� YYYY-MM-DD�� �ٲ���� ��ȸ�� �ȵ� ����Ŭ ���ٰ� Ű�� ���� �������� ���ư��� �׶��� ��ȸ�� �� ����.

--����� �޿��� 2000�޷� �̻��̰�, 4000�޷� ������ ��� ����� ������ ���

select *
from emp
where sal >= 2000 and sal <= 4000; --���Ⱑ �����ؼ� ������ �߰� between A and B

--between A and B(= ����)
--�ʰ�, �̸������� ����ϸ� �ȵ�!(=�� �⺻������ ���ԵǾ��ֱ� ������ �̻�, ���� ������)

select *
from emp
where sal between 2000 and 4000;

--����� �޿��� 2000�޷� �ʰ��̰�, 4000�޷� �̸��� ��� ����� ������ ���
select *
from emp
where sal > 2000 and sal < 4000;

--�μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ ���

select empno, ename, sal, deptno
from emp
where deptno =10 OR deptno = 20 OR  deptno= 30;

--IN ������
select empno, ename, sal, deptno
from emp
where deptno in(10,20,30); --OR�� ����

--in �����ڸ� Ǯ���. where deptno =10 OR deptno = 20 OR  deptno= 30;

--�μ���ȣ�� 10�� �Ǵ� 20���� '�ƴ�' ����� ���, �̸�, �޿�, �μ���ȣ ���

select *
from emp
where deptno != 10 and deptno != 20;

--IN�� ������ �ִ�. (NOT IN) �� ���� AND

select *
from emp
where deptno NOT IN(10,20); --deptno != 10 and deptno != 20; �̰Ŷ� ���� //�������� and �������� and..... ������ ������� �ݺ��Ͻɤ�������


--POINT : Oracle �� ǥ��(�����Ͱ� ���� null) >> null : �ʿ��

create table member (
userid varchar2(20) not null, --�ʼ��Է�
name varchar2(20) not null,
hobby varchar2(50) --�ƹ��͵� �Ⱦ��� default�� null�� ����. �� null�� ��� �ʼ��Է¿�Ұ� �ƴ�.
);

select * from member;
--insert into member(userid, hobby) values('hong' , '���');
insert into member(userid, name) values('hong' , 'ȫ�浿'); --hobby�� ���̺��� ����������� ���� ���� �����Ƿ� null�� ��
insert into member(userid, name,hobby) values('kim' , '�达','����');
--������ �����͸� �ݿ��ϱ� ���ؼ��� Ŀ���̶�� ��ɾ ����� �Ѵ�. ���� �������� commit�� ���� �ʾƼ� ����Ŭ ���� Ű�� disc�� �������� ����
commit;

--������ ���� �ʴ� ��� ����� ���� ����ϱ�
--0�� �����ͷ� ��� (�ް��ִ°ɷ�)
--select * from emp where comm = null; ����� ���� �ʴ´�.
select * from emp where comm is null; -- null�� �̷��� ��� ���´�. �߿��߿� ! ! ! !

--����(comm)�� �޴� ��� ����� ������ ���
select * from emp where comm is not null; --not null ! ! !

--��� ���̺��� ���, �̸�, �޿�, ����, �� �޿��� ���
--�� �޿��� ���Ǵ� �޿� + ����

select empno, ename, sal, comm, sal +  nvl(comm, 0) as "�ѱ޿�"--(�÷��� null���� 0���� �ٲٰڴٴ� �ǹ�)
from emp;

--Point >> null
--1. null ���� ��� ������ �� ����� null�� ���´�. null + 100 = null; null + ȫ�浿 = null;
--2. �� ������ �ذ��ϱ� ���� �Լ��� �������.      'nvl()'     'nvl2()' >> null���� replace �ϴ� �Լ�
--tip. ) ms-sql ������ convert()        my-sql ������ if null()


select null + 100 from dual; --null ���
select 'ȫ�浿' || null from dual; --�����̶� null�̾ ���� �����϶��� null�� Ư��
select 100 + nvl(null, 0) from dual; --null���� 0���� �ٲپ ����.

select comm, nvl(null, 1111) from emp;

--����� �޿��� 1000�޷� �̻��̰�, ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ���

select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;
---------------------------------------------------------------------
--DQL(data query language) : select ���� (������ �������� ��)
--DDL(create, alter, drop(��ü(���̺�) ����, ����, ���� �� �� ���� ��ɾ�))
--DML(insert, update, delete) (������ ����)

--java������ Ŭ������ ���� �� class Board{private boardno int}
--Oracle������ create table Board (boardno number not null)

create table board (
    boardid number not null, --���������� �����͸� �Է� �� �� �ְ�, �ʼ��� �Է��ؾ� �Ѵ�.
    title varchar2(20) not null, --�ѱ� 10��, ������ Ư������ ���� 20�� �ʼ��Է�
    contents varchar2(2000) not null, --�ʼ��Է� 
    hp varchar2(20) --default�� null ��� ( �ʼ��Է��� �ƴ�)
);
select * from board;
--Ȥ�� 
desc board; 

--DML(������ ���۾�) �� �ݿ� ���θ� ����
--insert
--update
--delete �� �ص� ���� DB�� �ݿ��� ���� ����. �׷��Ƿ� �ݵ�� �� ����� �ݿ�����, ��������� ���� �ǻ������ ����� �� 
--�� commit(�����ݿ�) �� rollback(���) ����� ��.
--������ insert, update, delete �۾��� ���ؼ���

insert into board(boardid, title, contents)
values(200, '�ڹ�', '�׸���');

select * from board;
commit; --commit�� rollback ������ ������ rollback 
--insert -> commit or rollback 

insert into board(boardid, title, contents,hp)
values(300, '����', '������ ������','010-1234-4690');

select * from board;
commit;

select boardid, nvl(hp,'EMPTY') as "hp" from board; --��� �� �� null �� empty�� ����ض�

--���ڿ� �˻�
--�ּҰ˻� : �� �Է� >> ���ﵿ, ����, ��... �ٳ��� (Like ���ϰ˻�)
--���ڿ� ������ �˻��ϴ� �����ڰ� �ִ�. --> like
--like�����ڸ� �����ִ� �͵��� �ִ�. (���ϵ�ī�� ����) ( % : ��� ������ �ؼ�,  _ : �ѹ���) �̰͵��� �����ؼ� ���ϴ� ������ �����͸� ã��.

select ename from emp where ename like '%A%'; --%�� ��� ���̹Ƿ�, A��� �ܾ ã���� �־ �յڷ� � ���� �͵� ����� ����.
                                                                               --ename�÷��� ������ �߿��� A��� ���ڰ� ����ִ� ��� ��� �˻�

select ename from emp where ename like '%a%'; --���ڿ� ������ �����ؼ��� �����ϰ� ��ҹ��� ����

select ename from emp where ename like 'A%'; --�̸��� ù���ڰ� A�λ�� �� ã��

select ename from emp where ename like '%S'; --�̸��� ������ ���ڰ� S�� ���

--ex)select * from member where name like '%���ѹ�%' --�̸��� ���ѹ��� ���������� �̾����ִ� ��� ã��

select ename from emp where ename like '%LL%'; --LL�� '����'���� �̾����ִ� ��� (�� �ڷξƹ��ų� �͵� �������)

select ename from emp where ename like '%L%L%'; --���� �޸� �̰� �پ��־ �ǰ� ������־ �� L�� 2���� �������� ��

select ename from emp where ename like '%A%A%'; --ADAMS �� ���

select ename from emp where ename like '_A%'; --ù ���ڴ� � ���� �͵� ��� ����. �ι�°���ڴ� �ݵ�� A�� �;��Ѵ�. = �ι�°�� A�� ���� ��� ���� = _�� �ڸ��� ����

--���� ǥ������ ��� �� �� �ִ�. (������.��)
--regexp_like
select * from emp where regexp_like(ename, '[A-C]'); --������ �˻��� ����������.

--����ǥ�� ���� 5�� ����� ( ���Ŀ�~)
--------------------------------------------------------------------------------------------------------------------

--������ �����ϱ�
--order by �÷��� ������ ����ؼ� ������ ��ų �� �ִ�. : ���ڿ�, ����, ��¥
--�������� : asc : ���������� ����(default����)
--�������� : desc : ���������� ����

select * from emp order by sal; --������������ ���ĵǾ ��� 
                                             --+asc (����Ʈ�� ��������)
                                             
--�޿��� ���� �޴� ������ �����ؼ� ���

select * from emp order by sal desc;

--�Ի����� ���� '���� ��'���� �����ؼ� ���, �̸�, �޿�, �Ի��� �����͸� ���

select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
select��        3
from��           1
where��        2
order by��    4 --select �� ����� �����ϴ� ���� ȿ�����̹Ƿ� ���������� �̷� ������ ������ �ȴ�. �����ϴ°� DB���忡�� ���� ����ٰ� ��... ������~
*/

select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;

--order by ��ȭ��
--order by �÷��� desc, �÷��� asc, �÷��� desc

select job, deptno
from emp
order by job asc, deptno desc; --job�� ���ĺ� ������� �����ϰ�,�� �ȿ��� (�׸���) deptno�� ������������ �����ض�. '�׷���' --�Խ����ڵ� �Խ��ǿ��� ����ҵ�?

----------------------------------------------------------------------------------------------------------------

--������
--������(union) : ���̺� + ���̺� �� ���̺��� �����͸� union�ϴ� �� ���� ���̺��� �����͵��� �ٸ��� ���̺��� �����Ͱ� �ڷ� �ٴ� �� ������ ���� �� �����Ƿ� ��Ģ�� �ִ�.
--(�⺻������ �ߺ��� ������Ŵ)
--������(union all) �� �ߺ��� ���

--���̺� �����
create table uta (name varchar2(20));

insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;

create table ut (name varchar2(20));

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from uta;
select * from ut;

--------------------------------------------------------------------
select * from ut
union
select * from uta; --ut�� uta �����͸� ��ġ�ڴ�. �ڵ����� �ߺ����Ű� �Ǿ ���

select * from ut
union all
select * from uta; --�ߺ����� ���ϰ� �� ���

-------------------------------------------------------------------
/*           union��
              1. �����Ǵ� �÷��� Ÿ���� �����ؾ� �Ѵ�.
              
                select empno, ename from emp
                union
                select dname, deptno from dept; --empno�� dname��, ename�� deptno�� ���̷��� �ϴµ� Ÿ���� �ٸ��Ƿ� ������ ����. ���ڿ�, ���� ��ġ���Ѿ���
              
                select empno, ename from emp
                union
                select deptno, dname from dept; �� �����ָ� ����� �ȴ�. 
              
              2.  �����Ǵ� �÷��� ������ �����ؾ� �Ѵ�. (��ĥ �÷��� ������ �÷��� ������ �¾ƾ� �Ѵ�)
              
              select empno, ename, job, sal from emp
              union
              select deptno, dname, loc from emp; --�÷��� ���� ���� �ʾƼ� ����
              
             --- null�� ����ϸ� sal�÷��� null�� ��--- ���� ���� �� �־���
             
              select empno, ename, job, sal from emp
              union
              select deptno, dname, loc, null from emp;  --null�� ä����
             
*/

select empno, ename from emp
union
select deptno, dname from dept; --empno�� dname��, ename�� deptno�� ���̷��� �ϴµ� Ÿ���� �ٸ��Ƿ� ������ ����.

--�ǹ������� union�� subquery(in line view)�� ����Ѵ�. union�� ����� ������ ���𰡸� ��...
select empno, ename
from (
            select empno, ename from emp
            union
            select deptno, dname from dept     
) order by empno desc; --�������� ���̺��� �ƴ� �������̺��� �����ؼ� �����غ���

--��������� �ʺ� ������ �������� �ǹ������� �ؾ��ϴ� �� �������� ���±��� ���̺��� 1������
---------------------------------------------------------------------
--Oracle�� �Լ��� �����غ��� (pdf : 50page�� ����)

/*

1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
    �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�. (to_char(), to_number(), to_date())
5) �Ϲ����� �Լ� : NVL, DECODE

*/

--���ڿ� �Լ�
select INITCAP('the super man') from dual; --ù���� �빮�ڷ� �����

select lower('AAA'), upper('aaa')from dual; 
--�빮�� �ҹ��ڷ� �ٲٱ�, --�ҹ��� �빮�ڷ� �ٲٱ�

select ename, lower(ename) as "ename" from emp;

select * from emp where lower(ename)  = 'king'; --�Լ��� ���� ����. ���꺸�� select, where�� �� �� ��� ����

--���ڿ� ����
select length('abcd') from dual; --���ڿ��� ���� ��� --���ڿ��� �迭�� �����ϰ��ִ�.

select length('ȫ�浿') from dual; --length 3 ��� ���� �� ������

select length(' ȫ a�� ��') from dual; --7 ���

--���տ����� ||
--concat()

select 'a' || 'b' || 'c' as "data" from dual; --abc���

-- select concat('a','b','c') from dual; --�Ķ������ ������ �������̶� 2�������� ��ĥ �� �ִ�. ���տ��������� �� ������

select concat(ename, job) as "ename+job" from emp;
select ename || '     '  || job as "ename+job" from emp; --�ϳ��� �÷��� ������ �ΰ��� ���ļ� ��� �� �� ����. �����ڸ� �̿��ϸ� ���鵵 ���� �� ����.

--�κ� ���ڿ� ����
--java(substring)
--Oracle(substr)

select substr('ABCDE' ,2,3) from dual; --BCD���
select substr('ABCDE',1,1) from dual; --A ���
select substr('ABCDE',1,2) from dual; --ù��° �ε����� �������� ���ķ� ���ڸ�ŭ ��� 
select substr('ABCDE',3,1) from dual; --C���
select substr('ABCDE',3) from dual; --CDE��� 3 ���ķ� ���� �� ���


select substr('ABCDE' ,-2,1) from dual; -- -�� ���̸� �ڿ������� ���� 

/*
������̺��� ename �÷� �����Ϳ� ���ؼ� ù���ڴ� �ҹ��ڷ��Ѵ�. ������ ���ڴ� �빮�ڷ� ����Ѵ�.
��, ���� �÷��� �ϳ��� �÷����� ��� �÷��� �̸��� fullname����, ù���ڿ� ������ ���� ���̿� ���� �ϳ��� �ֱ�
*/

select lower(substr(ename, 1,1)) from emp;
select upper(substr(ename, 2)) from emp;

select  lower(substr(ename, 1,1)) ||  upper(substr(ename, 2)) as "fullname"
from emp;


--lpad, rpad(ä���)
select rpad('ABC', 10, '*') from dual; --10ĭ �� ���ʺ��� *�� ä���, �������� ABC�� �ְڴ�.

select rpad('ABC',10,'^') from dual; --10ĭ �� ABC�� ���� �ְ� �������� ^�� ä��ڴ�.

--quiz
--������� ��й�ȣ�� �Է� : hong1006
--ȭ�鿡 ��й�ȣ�� �� �����ָ� �ȵǴ� ho******���� ����ϰ� �ʹ�.(���࿡ ��й�ȣ�� 1004�� ����� > 10**���� ���;� �Ѵ�) �� �α��ڸ� ȭ�鿡 ���̰� �������� *�� ��µǵ���

select lpad(substr('hong1006',1,2),length('hong1006'), '*') from dual;
select rpad(substr('1004',1,2),length('1004'),'*') from dual;

--emp���̺��� ename�÷��� �����͸� ����ϴµ� ù ���ڸ� ����ϰ� �������� *��

select rpad(substr(ename,1,1),length(ename),'*') as "ename" from emp; --length ��ü ����dp *�� �ְڴ�?


create table member2(
 id number,
 jumin varchar2(14)
);

insert into member2(id, jumin) values(100, '123456-1234567');
insert into member2(id, jumin) values(200, '234567-1234567');
commit;

select * from member2;

--�ϳ��� �÷����� ������� ���
--100 : 123456 -*******
--200 :234567 -******* 
--��°���� �÷����� "juminnumber"

select id || ' : ' || rpad(substr(jumin, 1,7), length(jumin),'*') as "juminnumber" from member2;

--rtrim �Լ�
--[������ ���ڸ� ������]
select rtrim('MILLER', 'ER') from dual; --ù��° �Ķ���Ϳ��� �ι�° �Ķ���͸� �����ʺ��� ã�Ƽ� ������
select ltrim('MILLLLLLLLER', 'MIL') from dual; --��°� : ER         'MIL'�� ����� ER�� ���� (�ߺ��� ������)

select '>'|| rtrim('MILLER           ', ' ') || '<' from dual; -->MILLER< ������ ���� ���� ���� rtrim, ltrim ���� ����ϸ� ���� ���� ���� ����

--ġȯ�Լ�(replace)
select ename, replace(ename, 'A', '�ٲ��') from emp;

------------------��������� ������ �Լ�----------------------

------------------������ �Լ�--------------------
--round(�ݿø�)
--trunc(�����Լ�)
--mod() ������ ���ϴ� �Լ�


--round(�ݿø�)
--   ... -3,  -2 ,  -1,  0,  1,  2,  3 ... �ι�° �Ķ������ ���ڰ����� ��� �� �� �ִ� ���ڵ�...
select round(12.345, 0) as "r" from dual; --ù��° �Ķ���ʹ� �ڿ�, �ι�° �Ķ���Ͱ� ���ڰ��ε� 0�� �����κи� ������ �ǹ� �����ڸ��� �ݿø��� �����ϴٸ� �ϰ� ������ =12���
select round(12.567, 0) as "r" from dual; -- 13��� 

select round(12.345, 1) as "r" from dual; --ù��°�ڸ����� ����� �ݿø� �� ������ 12.3 ��� 
select round(12.567, 1) as "r" from dual; --ù��°�ڸ����� ����� �ݿø� �� ������ 12.6 ���

select round(12.345, -1) as "r" from dual; -- -1�� 10���ڸ����� ����� 2�� ������
select round(15.345, -1) as "r" from dual; --20
select round(15.345, -2) as "r" from dual; --0 100���ڸ��� �����Ƿ�

--trunc(�����Լ�) -�ݿø� ���� �ʰ� ��������
select trunc(12.345, 0) as "r" from dual;  --12���
select trunc(12.567, 0) as "r" from dual; --12���
select trunc(12.345, 1) as "r" from dual;  --12.3
select trunc(12.567, 1) as "r" from dual; --12.5

select trunc(12.345, -1) as "r" from dual; --10
select trunc(15.345, -1) as "r" from dual; --10
select trunc(15.345, -2) as "r" from dual; --0


--mod() ������ ���ϴ� �Լ�

select 12/10 from dual; --1.2 �� 1, ������ 2 �������� ����������� �����ڰ� �ƴ� mod�Լ� ���
select mod(12,10) from dual; --�������� ���

select mod(0,0) from dual; --java������ 0/0�� �ȵ����� Oracle������ �ǳ׿�~


--------------------��������� ������ �Լ�--------------------------

------------------��¥�� �Լ�--------------------
select sysdate from dual;                       --2020-04-01 12:16:11

--��¥ �Լ�... ���ڰ� �ƴ�... ���� �ٲٱⰡ �ָ���... �������� �ؾ���... �߿��߿��߿�

--Date + Numb >> Date
--Date - Numb >> Date
--Date - Date >> Number 2019-10-10 - 2019-10-1 �� �ϼ� (�ٹ��ϼ�? ������)


select hiredate from emp;

select months_between('2018-01-01', '2010-01-01') from dual; --��� ���̳�����
select months_between(sysdate, '2010-01-23') from dual; --���糯¥~ 2010�� 01-01������ ���� ��  122.306949298088410991636798088410991637 
select round(months_between(sysdate, '2010-01-23'),1) from dual;      --122.3
select trunc(months_between(sysdate, '2010-01-23'),1) from dual;      --�ݿø� ���� �ʰ� ����


----�߿��߿�
--��¥������ ���ڿ��� ��¥�� �ٲٴ� ��� �Լ� ? (to_date) ���� ������� ��~!
--select '2020-04-01' + 100 from dual;  �̷��� ���� �ȵ�
select to_date('2020-04-01') + 100 from dual; --2020-4-1���� + 100�� �� ������� ��� "�� ���� 100���� ^^ 2020-07-10 00:00:00"
select to_date('2020-04-01') - 100 from dual; --2019-12-23 00:00:00
select sysdate + 1000 from dual; --���ݽð� �������� 1000�� ���� 2022-12-27 12:26:43

--quiz
--��� ���̺��� ������� �Ի��Ͽ��� ���� ��¥���� �ټӿ����� ���ϼ���
--��, �ټӿ����� �����κи� ���(�ݿø�X)

--�Ѵ��� 31���̶�� ���ؿ��� �ټӿ����� ���ϼ���(�ݿø�X)
--�Լ� ���X �����̿��ؼ�(��¥ - ��¥ >> 150��)

select ename, trunc(months_between(sysdate, hiredate)) as "�ټӿ���" from emp;

select ename, trunc((sysdate - hiredate)/31,0) as "�ټӿ���" from emp;

--------------------��������� ��¥�� �Լ�--------------------------

------------------��ȯ�� �Լ�--------------------
--��ȯ�Լ� ���� �߿��մϴ�.
--Oracle : ����, ����, ��¥ ���� ��ȯ�� �����ϴ�. to_ �� ���� �Լ���

--to_char() : ���ڸ� ���ڷ� �ٲٴ� ��� (1000 -> $1000)�� ���� ǥ���� ���� �����ÿ�
            --   : ��¥�� ���ڷ� �ٲٴ� ��� (2020-01-01 -> 2020�� 01�� 01��)�� ���� ǥ���� ���� �����ÿ�
            
--to_date() : ���� -> ��¥ >> select '2020-12-12' + 100 �� ���ڿ��� ������ �����̱� ������ ������ �Ұ����ϳ�, 
--                                       select to_date('2020-12-12') + 100             �� �ϸ� �����ϴ�      

--to_number() : ����-> ����(���������� �ڵ�����ȯ�� �����ȴ�)
select '100' + 100 from dual; -- ���������δ� select to_number('100') + 100 from dual; �̴�.

--to_number(���� -> ���ڷ� �ڵ�����ȯ)

select '1' + 100 from dual; --���������� �ڵ���ȯ��
select to_number( '1')  + 100 from dual;

--to_char(): format >> ���� or ��¥�� ���Ĺ��ڷ� �ٲ� �� ���

select to_char(sysdate) from dual; --���ڵ����ͷ� ��ȯ�Ǿ ��µȴ�.  �׷��Ƿ� �ٸ� ���ڿ��� ������ ����������.
select to_char(sysdate) || '��' from dual; 

select sysdate, --������ pdf���� 69page ����
to_char(sysdate,'YYYY')||'��' as "YYYY",
to_char(sysdate, 'YEAR'),
to_char(sysdate, 'MM'),
to_char(sysdate, 'DD'),
to_char(sysdate, 'DY')
from dual;

--�Ի����� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ���

select empno as "���" ,  ename as "�̸�",
TO_char(hiredate, 'YYYY') as "YYYY",
TO_char(hiredate, 'MM') as "MM"
from emp
where to_char(hiredate, 'MM') ='12';

select to_char(hiredate, 'YYYY MM DD') from emp; --1980 12 17

select to_char(hiredate, 'YYYY"��" MM"��" DD"��"') from emp; 
--���ڸ� ���̷��� ���ڸ� " " �ȿ� �־�� �Ѵ�.

--select to_char() ����->���ڷ� ����
--pdf 71page ǥ ����
--100000 >> ��� >> $100,000 >> ���ڿ��̱� ������ ���ڿ��� �νĽ��Ѿ� �Ѵ�.

select '>' || to_char(12345, '9999999999') || '<' from dual; --��� >      12345<

select '>' || to_char(12345, '09999999999') || '<' from dual;  --��� > 00000012345<

select '>' || to_char(12345, '$99,999,999,999') || '<' from dual;  --���  >         $12,345<

select sal, to_char(sal, '$9,999') from emp;
 --  $800
 --  $1,600 ���

--HR���� ��ȯ�۾�(������ ��)
select * from employees;

/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� ������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/

select employee_id, 
LAST_NAME || FIRST_NAME as "fullname",
to_char (hire_date, 'YYYY-MM-DD') as "hire_date",
salary, salary*12 as "����",
to_char((salary * 12) * 1.1, '$9,999,999,999') as "�λ��",
hire_date
from employees 
where to_char(hire_Date, 'YYYY') >= '2005'
order by "����" desc;

/*
select     employee_id,
           first_name || last_name as "fullname",
           to_char(hire_date,'YYYY-MM-DD') as "hire_date",
           salary,
           salary * 12 as "����",
           to_char((salary * 12)*1.1,'$9,999,999,999') as "�λ��",
           hire_date
from employees
where to_char(hire_date,'YYYY') >= '2005'
order by "����" desc;  -- order by ���� ��Ī�� �ü� �ִ� (order by ������ ����)

*/

--bit�������� �̵�

-------��ȯ�Լ� ( to_char(), to_date(), to_number())----------

--[�Ϲ��Լ�(���α׷������� ������ ���ϴ�)]
--nvl(), nvl2() >> nulló�� ���
--decode() �Լ� >> java if��(switch)
--case() �Լ� >>java�� if��(switch)

select comm, nvl(comm, 0) from emp;

create table t_emp(
id number(6), --6�ڸ� ������
job varchar2(20)
);

insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500, 'MGR');

select * from t_emp;
commit;

select id, decode(id, 100, '�λ��',
                                  200, '������',
                                  300, 'ȸ���',
                                            '��Ÿ�μ�')as"�μ�";
from t_emp;
                                            


select deptno, decode(deptno, 10, '�λ��', 
                                                 20, '������', 
                                                 30, 'ȸ���', 
                                                 '��Ÿ�μ�') as "�μ�"
from emp;

CREATE TABLE t_emp2(
id NUMBER(2),
jumin CHAR(7)
);
INSERT INTO t_emp2(id, jumin) VALUES(1,'1234567');
INSERT INTO t_emp2(id, jumin) VALUES(2,'2234567');
INSERT INTO t_emp2(id, jumin) VALUES(3,'3234567');
INSERT INTO t_emp2(id, jumin) VALUES(4,'4234567');
INSERT INTO t_emp2(id, jumin) VALUES(5,'5234567');
COMMIT;
SELECT * FROM t_emp2;

/* t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin�÷��� ���ڸ��� 1�̸� '����'���, 2�̸� '����'�̶�� ��� 3�̸� '�߼�'�̶�� ���
�� �ܿ��� ��Ÿ��� ���
*/

select id, decode(substr(jumin,1,1), 1, '����', 
                                                         2, '����',  
                                                         3, '�߼�', 
                                                             '��Ÿ') as "����"
from t_emp2;


/*

2�� Ŀ��
if ���ȿ� if �� (��ø ) >> decode
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
�μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
*/


select empno, ename, decode(deptno, 20,
                                                decode(ename, 'SMITH', 'HELLO', 'WORLD'),
                                                
                                                'ETC')
from emp;

--case��
--java switch
/*
case ���ǽ� when ���1 then ���1
                  when ���2 then ���2
                  when ���3 then ���3
                  ELSE ���4
END "�÷���"

*/

create table t_zip(
    zipcode number(10)

);

insert into t_zip(zipcode) values (2);
insert into t_zip(zipcode) values (31);
insert into t_zip(zipcode) values (32);
insert into t_zip(zipcode) values (33);
insert into t_zip(zipcode) values (41);

commit;

select * from t_zip;

select '0' || to_char(zipcode) as "������ȣ", 
                case zipcode when 2 then '����'
                                      when 31 then '���'
                                      when 32 then '����'
                                      when 41 then '��û'
                                      else '��Ÿ����'
                                      END "regionname"
    from t_zip;

/*
������̺��� ����޿��� 1000�޷� ���ϸ� '4��'
1001�޷� 2000�޷� ���ϸ� '3��'
2001�޷� 3000�޷� ���ϸ� '2��'
3001�޷� 4000�޷� ���ϸ� '1��'
4001�޷� �̻��̸� 'Ư��' �̶�� �����͸� ����ϼ���

1. case �÷��� when ��� then ��� ( = ����ó��)
2. ������ �϶����� 
    case when �÷��� ���� �񱳽� then ���
*/

select sal as "�޿�", --between����ص� ��
                case when sal <= 1000 then '4��'
                         when sal between 1001 and 2000 then '3��'
                         when sal between 2001 and 3000 then '2��'
                         when sal between 3001 and 4000 then '1��'
                                      else 'Ư��'
                                      END "�޿����"
    from emp;

--------------------------------------------------------------------------------------------
--�����Լ�
--�����Լ�
--��¥�Լ�
--��ȯ�Լ� ( to_char, to_date, to_number)
--�Ϲ��Լ� (nvl(), decode(), case())

--------------------------------------------------------------------------------------------

--�����Լ� pdf page 75
/*
1. count(*) > row �ټ��� ����ʹٸ�, count(�÷���) �׷��� ������ �Ǽ��� (null�� �������� ���� �Ǽ��� ���´�.)
2. sum()
3. avg()
4. max()
5. min()
���...
*/
/*

�����Լ�

1. �����Լ��� group by ���� ���� ���
2. ��� �����Լ��� null�� �������Ѵ�.
3. select ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ��õǾ�� �Ѵ�.

*/

select count(*) from emp; --14���� �ִٴ� �� ��w��w��w

select count(comm) from emp; --6���� �ִٴ� �� (null ���� ����)

select count(empno) from emp;

select count(nvl(comm, 0)) from emp; --null���� �����ؼ� ����ϰ� �ʹٸ� nvl �Լ��� �̿��ؼ� 0���� ������� ���� count�Լ��� ���

--�޿��� ���� ���ϱ� sum()
select sum(sal)as "�޿��� ��" from emp; 

--�޿��� ����� ���ϱ� average()
select round(avg(sal),0) as "��ձ޿�" from emp;

--������� ȸ�� �� ������ ����� ����?

select trunc(avg(comm),0) as"��ռ���" from emp; --721�޷�

select trunc(sum(comm) / count(comm)) from emp; --null�� ���Ե��� �ʾƼ� �� ������� ���� ���� �ƴ�
--������~~!!! �������� ��ߴ�� ��?

select trunc(avg(nvl(comm, 0)),0) as"��ռ���" from emp; --309�޷� (�� ����)
select trunc(sum(comm) / 14) from emp; 

--ȸ���� ������ ��ü������� ������ �Ѵٰ� �ϸ� 309�޷��� �°�,
--ȸ���� ������ ������ �޴� ����� ���ؼ��� ��ռ����� å���ϴ°Ŷ�� 721�޷��� ����

--���� : �ڵ�

select count(*) from emp where comm is null; --comm�÷����� null���� ���� ī��Ʈ --8���� ����

--max()
select max(sal) from emp; --�ִ밪 ���ϱ�

--min()
select min(sal) from emp; --�ּҰ� ���ϱ�

--�߿��߿��߿��߿��߿��߿�T�����߿��߿��߿��߿�

select empno, count(empno) from emp;
-->select empno�� 14���� ���;��ϴµ�, count(empno)�� ��µǴ� �����Ͱ��� 1���� �ȵ� 1�ٷ� ǥ���� �ȵż� �ȵ�!

select sum(sal) , avg(sal), max(sal), min(sal), count(sal), count(*) from emp; -->1��¥�� ��°��� �����̶� �������

--�μ��� ��� �޿��� ����ϼ���
select deptno, avg(sal) --�����Լ� �̿ܿ� ������ �÷��� �� ��� group by �� ����� �Ѵ�.
from emp
group by deptno;

--������ ��� �޿��� ����ϼ���
select job, trunc(avg(sal)) --job�� �����ϸ� ������� ������ ������ ���� ���� ��������� �� ���� �����Ƿ� job�� �Ἥ �������� ������� �˷��ش�..        3
from emp                                                                                                                                                                                                -- 1
group by job;                                                                                                                                                                                       --  2 ������ ó����

--������ ��ձ޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ� ���

select job, trunc(avg(sal)) as "��ձ޿�", sum(sal) as"�޿��� ��", max(sal) as"�ִ�޿�", min(sal)as"�ּұ޿�", count(*)as"�Ǽ�"
from emp
group by job;


/*
 grouping ����
 
distinct �÷���1, �÷���2
order by �÷���1,�÷���2
group by �÷���
*/

--�μ���, ������, �޿��� ��

select deptno, job, sum(sal)
from emp
group by deptno, job order by deptno;

/*

10	CLERK	        1300	    1
10	MANAGER 	2450	    1
10	PRESIDENT	5000	1
20ANALYST	    6000	2
20CLERK	        1900	    2
20MANAGER	    2975    	1
30CLERK	        950	    1
30MANAGER	    2850    	1
30SALESMAN	5600	4

*/
/*

select             4
from                1
where             2
group by        3
order by         5


from where group by�� ��Ʈ
group�� ����� selecting �ؼ� order by�� ����

*/

--������ ��� �޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ���

select job, avg(sal)
from emp
--where  avg(sal) >= 3000 --where���� group by ������ �����ϱ� ������ where�� �׷��� �������� ��� �� �� ����. 
                                           -- ó�� ������ select ���ķ� ���� �ϱ� ������ group by�� having���̶�� ���ǹ��� ����ؾ� �Ѵ�.
group by job;

--group by�� ������ >>having ��

select job, trunc(avg(sal)) as "��ձ޿�"
from emp
group by job                               --�̷��� ���� �� ������� ������ �ɾ�� �Ѵ�. � ������ ó���� �Ǵ����� �� �˰� �־�� �ҵ�...�Ф�
having avg(sal) >= 3000;           --group by ~ having�̱� ������ select���� ���� having�� ó���ȴ�. from ~where from���� �������� where/ group by�� �������� having ��Ʈ��!

--PRESIDENT	5000
--ANALYST	3000

/*
�ϳ��� ���̺��� ������� �� �� �ִ� ��� ����
select             5 -������
from                1
where             2-�ܵ���� �Ұ�(from�� ����Ǿ�� where�� �� �� ����)
group by        3
having           4 -�ܵ���� �Ұ�(group by�� ����Ǿ�� having�� �� �� ����)
order by         6 -����

*/

select job as "����" ,sum(sal) as "�޿��� ��" --1. empno, job
from emp
where comm is not null
group by job -- 2. group by job, empno �� ���� �ֱ� ������ job���� ���� ���¿��� �ٽ� empno�� ���� ���̹Ƿ� �ǹ̰� ������ (��ü ��� ����ŭ ��µ�)
having sum(sal) >=5000
order by "�޿��� ��";

select deptno as "�μ���ȣ", count(deptno) as "�ο� ��", sum(sal) as"�޿��� ��" --count(*) null�� ������ ������ ������� ī����
from emp
group by deptno
having count(deptno) > 4
order by deptno;


select job as "����" , sum(sal) as"�޿��� ��"
where job != 'SALESMAN'
from emp
group by job
having sum(sal) > 5000
order by "�޿��� ��" desc

------------------------------------------------------------------------------------------------------
-------JOIN--------(pdf 85 page)
--������ ������ ���̽� (RDBMS) >> ������ ���°� ORDB(object relation) ��üDB�ε� ������� ���� >>��ſ� ���� ���� Framework (��ü���� = ��üȭ��Ű�� ��, java�� db ���̿��� ����) JPA, MYBATIS
--noSQL(mongoDB)

/*
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;
*/

select * from m;
select * from s;
select * from x;

--������ ����
--1. ����� (���� ��) (equi join)
--�� ���̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1�� ����
--JOIN�� ����
--1. SQL JOIN ���� ��ǰ���� ������ ����(����Ŭ������ ����)
--2. ANSI ����(����) ǥ�ع����̹Ƿ�

--SQL JOIN ����
select *
from m, s
where m.m1 = s.s1; --null�� ���� ��� �񱳴�� ���Ե��� �ʴ´�. ��������� ���ܵ� --������ ���̺��� ���� union�� ���̺��� �Ʒ��� ����

select m.m1, m.m2, s.s2 -- ��� ����� M1, S1�� A,B�� ���� ���ֱ� ������ �ߺ��Ǵ°� ��� ����.
from m, s
where m.m1 = s.s1; 
----------------���� ������ �ǵ����̸� ������� ����-----------------

--ANSI ����
--where���� from���� �������� �����ε� join������ join �� ���� �������� ���̰� �־
--where���� join�� ���ǰ� �Ϲ� ������ �� ��� ������� ������ �ȵǾ ȥ���������
--join�� ������ ���� �и��ϱ�� ���� >> ON���� ������� �׸��� , �� ���ְ� 'from M INNER JOIN S' �� ���(INNER JOIN = �JOIN�� �����ε� ���� �����ϴ�. �׷��Ƿ� JOIN�� �ᵵ ����)

SELECT *
FROM M INNER JOIN S
ON M.M1 = S.S1;

SELECT M.M1 , M.M2, S,S2 --ó���� *�� �����ϰ� ���̺��� Ȯ�� �� �� �ʿ��� �����͸� �����ϴ� ������ ���ҵ� SELECT������ ��üȭ�� ���� ���߿�
FROM M JOIN S --INNER ���� ���� 
ON M.M1 = S.S1;

--�����ȣ,  ����� �̸�, ��� �μ���ȣ, ����� �μ����� �˰� �ʹٸ�
SELECT e.empno as"�μ���ȣ", e.ename as "����̸�", d.deptno as "�μ���ȣ", d.dname as "�μ���"
from emp E join dept D --emp E ��Ī ���̱� ���̺���� ��, dept�� d�� ����Ī�� �ο��ؼ� �� �̸����� �����Ѵ�.
on e.deptno = d.deptno;

--join�� (2��, 3��... 4��... �������� ���̺� ���� ����)
--SQL JOIN����
SELECT M.M1, M.M2, S.S2, X.X2
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;
-- ���� ������ A == B == C , A==C �� ���� ��

--ANSI����
SELECT M.M1, M.M2, S.S2, X.X2
FROM M JOIN S ON M.M1 = S.S1
               JOIN X ON S.S1 = X.X1;
--          JOIN Y ON X.X1 = Y.Y1 --�̾ ���� ��

--HR�������� �̵�
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

--1. ���, �̸�(LAST NAME), �μ���ȣ, �μ��̸� ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID;
--106�� -107���̾�� �ϴµ� JOIN�� NULL�� �������� �ʾƼ� NULL�� �ϳ��� ����� �ȵ� ���� 

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; --�μ� ID�� NULL�� ���� ����� ����
--� JOIN���δ� �ذ� �Ұ�
--(OUTER JOIN)�� ����ؾ� ��

--2. ���, �̸�(LAST NAME), �μ���ȣ, �μ���, �����ڵ�, ���ø� ���

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;



-----bit ����----
--2. �� ����(non-equi join) >>�ǹ̸� �����Ѵ� >>����ι���
--�� ���̺�� �����Ǵ� ���̺��� �÷��� 1:1�� ���ε��� �ʴ� ���

select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.LOSAL and s.HISAL;

------------------------------------------------------------------------
--3. OUTER JOIN(equ join + null) ���������� equi join�� ���� ����ȴ�.
--outer join ( ��, �� ���踦 �ľ��ؾ� �Ѵ�. left�� ����, right�� ������, �� ���� ���̺��� ���� �� ���̺��̰� ���� �������̺����� Ȯ���ϴ� �� . �ľ��ؼ� �ְ� �Ǵ� ���̺��� �ִ� ���� �����͸� �������� ��)
--���� 3������ �ִ�.
--left outer join ( ������ ������ ��� )
--right outer join (������ ����)
--full outer join (������ ������ ���� �������� ������ ���� union �� ��)
--left [ outer ] ���� ���� join
--left join , outer join

select *
from m;

select *
from s;

select *
from m join s
on m.m1 = s.s1;

select *
from m left outer join s
on m.m1 = s.s1;


select *
from m right outer join s
on m.m1 = s.s1; 

select *
from m full outer join s
on m.m1 = s.s1; --�� left outer join �� right outer join �� ���� ��ġ�� �ߺ��� ���ŵ�ä�� ���´�. union �� �ߺ����� ����Ʈ��. union all�� �ߺ����� ���ϴ°�
--order by ���� �ʾƼ� �������� ��Ģ�� ���� �ڵ����� ���ĵǾ ��µȴ�.


--HR�������� �̵�--
--1. ���, �̸�(LAST NAME), �μ���ȣ, �μ��̸� ���
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E left outer JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID
order by E.EMPLOYEE_ID;
--107�� ���� ����� �ȴ�.
------------------------------------------------------------------------------------------------------
--self join (�ڱ�����) -> �ǹ̴� �ٸ����� ���� ��ü�� (�����)�� �̿��Ѵ� = �� ���̺� �ȿ��� �ٸ� ���� ã�� ��
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���

--join�� ���̺��� �ϳ� �̻��̾�� �ϴµ�(���̺� ���� �����͸� �̾ƾ� �ϴϱ�)
--���̺��� ����Ī�� �ٸ��� �ؼ� ������ó�� ���

select e.empno, e.ename, m.empno, m.ename
from emp e join emp m --�ϳ��� ���̺��� ������ �ٿ��� �ΰ�ó�� ���
on e.mgr = m.empno;
--�����߻� ����� ��ü 14���ε� ���� ���� 13���̴�.

select * from emp; --prejident�� null�̶�

select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m --left join�� �̿��ؼ� null������ ����
on e.mgr = m.empno

--����join���� �ϴ� ������ �����ڵ� ȸ�� ���� ����̱� ������ ( ���� ���̺� ���� ��� ������ �̿��ϴ°ű� ������ )


--------------------JOIN �׽�Ʈ----------------------------�ٽ� �غ���

select * from emp;
select * from dept;
select * from salgrade;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;


-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select e.ename as "�̸�" , e.job as "����", e.deptno as"�μ���ȣ", d.dname as"�μ��̸�"
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select e.ename as "�̸�", d.dname as "�μ��̸�"
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';


-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�
---------------------------�ٽ�
select e.ename, d.dname, e.sal, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.

select e.job, e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����

select e.empno as "�����ȣ", 
            e.ename as "����̸�", 
            e.sal*12 as "����",
            e.sal*12+comm as "�Ǳ޿�", 
            s.grade as "�޿����"
from emp e inner join salgrade s 
on e.sal between s.losal and s.hisal
where e.comm is not null;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
 on e.deptno = d.deptno
 join salgrade s
on e.sal between s.losal and s.hisal
 where e. deptno = '10';
 
 
 select * from emp;
select * from dept;
select * from salgrade;
 
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.

 select e.deptno, d.dname, e.ename, e.sal, s.grade
 from emp e join dept d
 on e.deptno = d.deptno
 join salgrade s
on e.sal between s.losal and s.hisal
where e.deptno in(10,20)
 order by deptno , sal desc;
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)

select e.empno as "�����ȣ" , e.ename as "����̸�", m.empno as" �����ڹ�ȣ", m.ename as "�������̸�"
from emp e left outer join emp m
on e. mgr = m.empno;



--------------------------------------------------------------------------------
--subquery pdf (100page)
--subquery�� sql�� ���̶�� �մϴ� ��0��
--�Լ�, join �� �� ����ص� �ȳ����� ����� ������ subquery

--������̺��� ������� ��� ���޺��� �� ���� ������ �޿��� �޴� ����� ���, �̸�, �޿��� ���

select avg(sal)
from emp;  --2073.214285714285714285714285714285714286

select *
from emp
where sal > 2073; --�� �Ʒ� �ϳ��� ��ġ��

select *
from emp
where sal > (select avg(sal)from emp); --������ �ȿ� ���� ������

--subquery
/*
�÷��� �� = ����� �ϳ����� ������������ ���� �޶���.
1. single row subquery :  subquery �� ��� row�� 1�����(�����÷��� ���ϰ�) ���� �ϳ��� ������ �� �÷� �ϳ��� ���� �ϳ�
2. multi row subquery :   �����÷��� ������� �ΰ��̻���ʹ� multi row subquery

�����ϴ� ������ : ���Ǵ� "������"�� �ٸ��� ����
-multi row�� ��� : (in, not in)      (any = or , all = and)
>>ALL(and) >> sal > 1000 and  sal > 2000 and sal...
>>ANY(or) >> sal > 1000 or sal > 2000 or sal...

*subquery�� ����
1. ��ȣ �ȿ� �����ؾ� �Ѵ�. (������) (select sal from emp)
2. �����÷����� �����Ǿ�� �Ѵ�. (select sal , deptno from emp) ... �̷��� �Ⱦ�!!!!!!!!!
3. �ܵ� ������ �����ؾ� �Ѵ�. ���������� �ϳ��� �����̱� ������ �ܵ����� ���� ������ �������̾�� �Ѵ�.

���������
1. ���๮�� ���������� �����ϸ� ������ ����ȴ�.
2. ���������� ���������� ������� ������ ����ȴ�.

*/

----��� ���̺��� jones�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ���

select sal from emp where ename = 'JONES'; --2975 (�̱۷ο�)

select empno, ename, sal
from emp
where sal > (select sal from emp where ename = 'JONES'); --������ ���� ����, �� ������ from, where , select ������ ����  (�̱۷ο�)


--���������� ������ �޿��� 2000�޷� �̻�
select sal from emp where sal > 2000; --���� �������� �����Ƿ� ��Ƽ �ο�

select empno, ename, sal
from emp
where sal in (select sal from emp where sal > 2000); 
--sal�� ���� 2975 2850 2450 3000 3000 5000 �̴�. ������
--where sal = 2975 or sal = 2850 or sal =2450 or... �� ����)
--where sal > (select sal from emp where sal > 2000); �����Ͱ� ���� ���̶� �̱۷ο찡 �ƴ� ���� �������� ����־ > �����ڸ� �� �� ����.

--not in�� ���(������ and)
--�޿��� 2000�޷� �̻��� �ƴѰ��
select empno, ename, sal
from emp
where sal not in (select sal from emp where sal > 2000); 
--where sal != 2975 and sal != 2850 sal != 2450 sal != 3000 sal != 3000 sal != 5000  �� �ǹ�  �� �����Ͱ� ��������� �ȵȴٴ� �ǹ�


--���������� �ִ� ����� ����� �̸��� ����ϼ���.

select mgr from emp; --��Ƽ

select *
from emp
where empno in (select mgr from emp);
--empno = 7788 or empno = 7902  or empno = null

--���������� ���� ����� ����� �̸�

select *
from emp
where empno not in (select mgr from emp);
--empno != 7788 and empno != 7902  and empno != null = is not null
--and�� null���� ���ԵǸ� ����� null�̴�.

select *
from emp
where empno not in (select nvl(mgr,0) from emp); -- �������� ������ null���� 0���� ��ü�ع����°� ����

select *
from emp
where empno not in (select mgr from emp where mgr is not null); --�������� ������ null���� ��������

--KING���� �����ϴ� ��, ���ӻ���� KING�� ����� ���, �̸�, ����, ������ ����� ���
select empno from emp where ename = 'KING'; --king�� ����� ���� �̾Ƴ���

select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING'); --mgr ����� king�� ���� ���� ã�Ƽ� ����

--20�� �μ��� ��� �߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ���, �̸�, �޿�, �μ���ȣ ���

select max(sal)
from emp
where deptno = 20;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20); 

--POINT--
--subquery�� select ���� ��� �����ϴ�.
--                  from������ ��� �����ϴ�.
--                  where������ ��� �����ϴ�.



--�̷������� and�� �����ؼ� ��밡���ϴ�.
select *
from emp
where deptno in (select deptno from emp where job = 'SALESMAN')
                        and sal in(select  sal from emp where job = 'SALESMAN');

--quiz
--�ǹ����� ����ϴ� !
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���

select deptno, avg(sal) 
from emp 
group by deptno;

select e.empno, e.ename, e.deptno, e.sal, s.��ձ޿�
from emp e join (select deptno, round(avg(sal),0) as ��ձ޿� from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.��ձ޿�;

------------�������� ���� Ǯ��--------------
--1. sumith���� ������ ���� �޴� ������� �̸��� ���� ���(OK)

select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.(OK)
select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�. (OK)

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
                            and ename not in ('BLAKE');
--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�. (OK) �̷� ������ ���� ����

select empno, ename, sal
from emp
where sal > (select round(avg(sal),0) as "��ձ޿�" from emp)
order by sal desc;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.(OK)

select empno, ename
from emp
where deptno in (select deptno from emp where ename like '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��) (OK)

 select ename, deptno, sal
 from emp
 where sal > (select max(sal) from emp where deptno = 30);


--Ȥ�� select enmae, deptno, sal from emp
        --where sal > all(select sal from emp where deptno = 30)

 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�. ���������� �ȿ� �ٸ� ���̺� ���� ��� �� �� �ִٴ� ���� �˰� �Ǿ���.

select * from emp;
select * from dept;
select * from salgrade;

select ename, deptno, job
from emp
where deptno in (select deptno from dept where loc = 'DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�. (�ٽ�)
select * from emp;


select ename, deptno, job
from emp
where deptno in (select deptno from dept where dname = 'SALES');

 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���) = ����� KING�� ���

select empno from emp where ename = 'KING';

select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�. (�ٽ��غ���)

select empno, ename, sal
from emp
where sal > (select round(avg(sal),0) from emp)
                    and deptno in(select deptno from emp
                                    where ename like '%S%');

 
--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�. (�ٽôٽ�)

--�μ���ȣ ���
select deptno from emp where comm is not null;

--���� ���
select sal from emp where comm is not null;

select ename, sal, deptno
from emp
where deptno in(select deptno from emp where comm is not null)
and sal in(select sal from emp where comm is not null);
                    

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
-- ������� �̸�, ����, Ŀ�̼��� ����϶�. (�ٽ�)
--30�� �μ� ����� ����
--30�� �μ� ����� Ŀ�̼�

select sal from emp where deptno = 30;
select comm from emp where deptno = 30 and comm is not null;


select ename, sal, comm
from emp
where sal not in (select sal from emp where deptno = 30)
                    and comm not in(select comm from emp where deptno = 30 and comm is not null);
                              
----------------------~��������� ������ �⺻����~----------------------
/*
select
from
where
group by
having
order by

�⺻ �Լ�
����, ��¥, ����, ��ȯ, �Ϲ�, �����Լ� !

<join>
�ϳ� �̻��� ���̺��� ������ ��������(�������̺� Ȱ�� : ���谡 �ִ�)

join���� �ذ��� �ȵǴ� ���� subquery !
--------------��������� �ʱް����ڰ� ������ �⺻�Ҿ�----------------

*/
-------------------DML----------------------
--[INSERT], [UPDATE], [DELETE] �� �������� �� �� (�ϱ�)
/*

<Oracle����>
DDL(������ ���Ǿ�) : ���� ���� ���Ӱ� �����, �� ���� ���� �����ϰ� ����� �۾� : create, alter, drop, truncate(�޸� �������� ���������� ��, rename, modify) 
DML(������ ���۾�) : insert , update, delete
DQL(������ ���Ǿ�) : select -->���±��� �� ��
DCL(������ �����) : ����ó��(developer - crate user �ؼ� bit���� �� grant, revoke) >> DBA��� ������ �ϴ� ��(������ : ����͸� : ������ ���, ����)
TCL(Ʈ�����)        : commit, rollback, savepoint

������ : CRUD DB�������� ���� (Create = insert, read = select, U = Update, D = Delete) 

*/

--DML ( Ʈ������� �����Ѵ�. ) ��ó��-> Ʈ������� ���� ?  �ϳ��� ������ �۾� ���� ----!!!!�ſ��߿�!!!!---- LOCK�� �����Ѵ�. ������ Ʈ����� ���̶�� �ٸ� ����� �ǵ帮�� ���Ѵ�. �׷��Ƿ� �ִ��� ª�� �����ؾ� �Ѵ�. �ʼ���Ҹ�
--A��� ���࿡�� ���� �����ؼ� B��� ���࿡ �Ա��� �Ϸ��� �Ѵ�.
--A : A���࿡�� �� 500���� ���� -> update ... 1000������ 500��������
--B : B���࿡�� update�� �ȴ�. ���� 1000������ ���¿��� A���࿡�� ���� �� 500������ �ԱݵǸ� �� 1500�����̶�� �ݾ����� update�� �Ǿ�� �Ѵ�.
--�׷��� A���࿡�� ����Ǵ� ���߿� ���α׷��� ����������? ( B�������� �Ա��� ���� ���� ä)

--A�� B�� �۾��� ������ �ƴ� ����(�ϳ��� ������)�Ǿ�� �ϴµ� A���� ���� �����ϴ� ���߿� ���α׷��� ������ B�� �Ա��� �ϴ� ������ ���� �������Ƿ� ó������ rollback �Ǵ� ��
-- = ����� ������ ������ �� �����ϸ� commit, ���� �� �ϳ��� �����ϴ��� rollback 
--�߰��� savepoint��� ���� ���� �߰������� �۾� ������ ���� �� ���� ������ �ϴ��� �� ������ ����

select * from tab; --tab�� ������ ����ڰ� ���� ��� ���̺� (���ݱ��� �ǽ��ߴ� ���̺���� ����) bit������ ���� ���̺� ��� create���̺� �� �� ���� �̸� ������ Ȯ�� �� ��

select * from tab where tname = 'BOARD'; -- ���̺������ �˻��ؼ� �ߺ� Ȯ��, �빮�ڷ� �ؾ���. �̹� �����ϹǷ� �ٸ� �̸����� �ؾ� ��

select * from col; --�÷��� �˻� ����

select * from col where tname = 'EMP'; --��ü������ � ���̺��� �÷������� ��������� ����

select * from user_tables; --���̺���� ����(�뷮, ��ũ ��� ����)���� �� �� ���� (�����ڵ��� ���� ���)

select * from user_tables where table_name = 'DEPT'; --dept���̺��� �ϵ�������� ���� ���� �� �� ����

--------------------------------------------------------------------------------------------------------------
/*
--DML (pdf���� : 10�� 168page)

INSERT INTO table_name [(column1[, column2, . . . . . ])] VALUES  (value1[, value2, . . . . . . ]); 
 
 */

create table temp(
id number primary key, --ID�÷����� not null �ϰ� unique�� �����͸� ��� �� �� �ִ�. = null�� �ȵǰ� �ߺ������� �ȵ�
name varchar2(20) --�ƹ��͵� �Ⱦ��� default�� null�� ���
); --temp���̺� ����


/*

[���� Ÿ��] ( )���ڴ�byte�� �ǹ�
char(20) >>�ѱ� 10���� >>"��������" ���ڿ�Ÿ��
varchar2(20) >>������, Ư������ ������ 20�� >>"��������" ���ڿ� Ÿ��

char(20) >> 'ȫ�浿' �� �־��� �� 6byte�̹Ƿ� char�� ���� [ȫ�浿                ] >> 20byte�� ���� ���� ������� ���� ���� �ִ��� �� ������ ��ȭ�� ���� 
varchar2(20) >> 'ȫ�浿' �� �־��� �� [ȫ�浿] �̸� ���� byte�� �߶������ 6byte��ŭ�� ��Ƽ� �����Ѵ�.


ex)ȸ������ �ÿ�
�������� ������ : ��, �� : char(2) �� �س����� �ٲ� ���� ���� ���� Ȥ�� �ֹι�ȣ ������ ���� ���̸� ������ ��...
�������� ������ : �̸�(���̰� �ٲ� �� ����)

�������� �����Ϳ� �������� �����͸� �������� ������ "�������� ����"�� �˻� �ÿ� varchar���� char�� �켱�Ѵ�. varchar�� ���̰� �Դٰ��� �ϱ� ������ ���� ���߿� ó����
�������� ������ ���� �� �����̶�� �ظ��ϸ� char�� ����.

�츮�� �׻� �ѱ۷����� ��ΰŸ��� �����. �׷��� ���� ���� (java�� unicode : ��� �� ���ڸ� 2byte�� ����) >>�ѱ�, ������, Ư������, ���� �� �����ϰ� 2byte�� ����
�����ڵ� ó�� nchar �� �������. 

nchar(20) >> 20 "���� ���� å��" >>���������� �� byte ���� 2 * 20 = 40byte�� ������ �ִ�.

nvarchar�ε� ��밡��
nvarchar(10) -- 10���� ��� ����
*/

select * from temp;

--1. ���� �Ϲ����� INSERT
insert into temp(id, name)
values(100, 'ȫ�浿'); --commit�� rollback�� �ݺ��ϸ鼭 �����͸� �ֱ�

select * from temp;
--�ǹݿ�

commit;

--2. �÷��� ���� ����� ���� ���� (������ �������Ƿ� �ǵ����̸� ���� ����)
insert into temp
values(200, '������'); --�����Ͱ� �÷��� ����, ������ ��ġ�ؾ���. ( ���߿� �����÷������� ���� �������� )

select * from temp;

commit; --auto commit�� ���� ���� �Ǽ��ϸ� �ǵ��� �� ���� ����

--1. ������Ȳ
insert into temp(id, name)
values(100, '�ƹ���'); --unique constraint (BIT.SYS_C007004) violated �ߺ������Ͷ� ���� table ���� �ÿ� id number primary key,  �־����

insert into temp(name)
values('�ƹ���'); --cannot insert NULL into  // not null, unique ���� �ϴµ�, id�÷��� �Է����� �ʾƼ� null���� �� �����̱� ������ ������ ��.  null�� ���� �� ���� ������
------------------------------------------------------------------------------------------------
--�Ϲ� SQL���� ���α׷����� ��Ұ� ����. ���ݱ��� �ߴ� �͵��� �Ϲ� SQL
--�������...?
--�׷��� PL-SQL�̶�� ���� �������. (��� SQL) program language --���α׷����� ��Ҹ� �̿� �� �� �ִ�.(���, ����)
--���� ��� �����͸� �׽�Ʈ �ϰ� ������ 1000���� �����Ͱ� �ִٸ� insert�� 1000���� �ؾ� �ϴ���? java��� for�� ������ ����...
--�̷� �� ��� �ϴ� ���� PL-SQL

create table temp2(id varchar2(20));
/*
begin
for i in 1..1000 loop
        insert into temp2(id) values('A' || to_char(i));
end loop;
end;

select * from temp2; --commit�ؾ� �ݿ���

commit;

select * from temp2
order by id desc;
*/

create table temp3(
memberid number(3) not null, --3�ڸ� ����
name varchar2(10), --null ���
regdate date default sysdate --�⺻�� �����ϱ� --��¥�� insert�� ���� �� regdate�� ���� ������ �˾Ƽ� sysdate�� �ԷµǴ� �� --�Խ��ǿ� �� �� �� �ø� �ð��� �Է����� �ʾƵ� �ڵ����� �ð��� ��
);


select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate)
values(100, 'ȫ�浿','2020-04-03'); --���� ��¥ �־ ��� ����

select * from temp3; --100	ȫ�浿 2020-04-03 00:00:00

commit;

insert into temp3(memberid, name)
values(200, '�ƹ���'); --200	�ƹ���	2020-04-03 12:13:59 reg�� default�� �� --ȸ������ ��¥, �Խ��� �۾� ��¥�� default�� �Կ��� �ý����� ������ ����

insert into temp3(memberid) --name�÷��� null�� ��������Ƿ� ����,  300	(null) 2020-04-03 12:15:33 �̷��� ��
values(300);

insert into temp3(name)
values('�̸��� �ֱ�'); --memberid�� not null�̶� ������ ���� �ϴµ� �ȵ��־

--insert ��
--1. �뷮 ������ insert �ϱ�
create table temp4(id number);
create table temp5(num number);

insert into temp4(id)
 values(1);

insert into temp4(id)
 values(2);
 
 insert into temp4(id)
 values(3);
 
 insert into temp4(id)
 values(4);
 
 insert into temp4(id)
 values(5);
 
 insert into temp4(id)
 values(6);
 
 insert into temp4(id)
 values(7);
 
 insert into temp4(id)
 values(8);
 
 insert into temp4(id)
 values(9);
 
 insert into temp4(id)
 values(10);

commit;

select * from temp4;

--------------�뷮 insert-------------------
--�䱸���� : temp4�� �ִ� ��� �����͸� temp5�� �ְ�ʹ�.
--insert into ���̺�� (�÷�����Ʈ) values( �� ����Ʈ ) -���� �ϳ��� ���� �����ߴµ�
--insert into ���̺�� (�÷�����Ʈ) select ��(�÷�����Ʈ�� ������ Ÿ���� �����ϴٴ� ���� �Ͽ�)

insert into temp5(num)
select id from temp4; --temp4�� �ִ� id�� temp5�� num�÷��� �Է� numŸ�԰� idŸ���� �¾ƾ� �ϰ�, �÷� ������ �¾ƾ� �Ѵ�.

select * from temp5;

--2. insert TIP
--���̺��� ���� ��Ȳ���� ���̺��� ����鼭 �����͸� insert �ϴ� ���
--��, ������ �����̱� ������ (�����ϴ� ���̺��� ���� ������ ���簡 �ȵȴ�.) primary, �� ���� �������
--������ ���̺� ����(�÷��̸�, Ÿ���� ���簡 �ȴ� =  ��Ű��)

--������ create table copyemp(id number)
create table copyemp
as 
    select * from emp; --emp�� �Ȱ��� ������ copyemp��� �̸��� ���̺��� ����� emp�� �����͸� �־���

select * from copyemp; --Ȯ���غ��� ����, �����ͱ��� ���簡�� --�������̺��� �ǵ帮�� �ʰ� ������ ���̺��� �̿��ؼ� �ǽ�

--Ư�� �÷��� �����ϱ�
create table copyemp2
as
select empno, ename, sal from emp
where deptno = 30; --select ������ 3���� �÷��� �����ȣ�� 30���� ������� �����͸� insert

select * from copyemp2;

select * from col where tname = 'COPYEMP2'; -- copyemp2�� �÷��� ã��

--���� : ����(Ʋ�� �����ϰ� �����ʹ� �ְ���� ���� ��)

create table copyemp3
as 
select * from emp where 1 =2 ; --> 1=2�� ������ �׻� false�̹Ƿ� ���� ���� ������ ������

select * from copyemp3;


-----[INSERT END]-----

----[UPDATE]----
/*

update table_name
set column1 = value1, column2 = value2 ....
where ����


update table_name
set column1 = (��������)
where ����

*/

select * from copyemp;

update copyemp
set sal = 0; --sal�÷��� ��� �����Ͱ� 0���� �ٲ� ��0��;;;;;;;;

rollback;

update copyemp
set sal = 0
where deptno = 20; --�μ���ȣ�� 20���� ����� �޿��� 0���� �ٲٰڴ�.


commit;

update copyemp 
set sal = (select sum(sal) from emp) --������������ ���� ������ �̱������� ������ = ���� �ϳ��ΰ�
where deptno = 20; -- 29025�޷��� ����

commit;

--�������� �÷��� ���ÿ� update (, )�� ���� ,
update copyemp
set ename = 'AAAA', job = 'BBB', hiredate = sysdate, sal = 1111
where deptno = 10; 

commit;

-----------
--[DELETE]
--��Ģ�����δ� delete�� �ϰ� commit, rollback�� �ϸ� ������ �Ұ����ϴ�. ��, ����� �ص״��� �ϸ� �����ϴ�.

delete from copyemp; --�����͸� �����ϰ�
select * from copyemp; --Ȯ���غ��� �����Ͱ� �����Ǿ��ִµ�
rollback; --rollback�� �ٽ� �ϰ� �ٽ� Ȯ���غ��� �����Ͱ� ������ �Ǿ��ִ�.

--������ �߰��غ���
delete from copyemp where deptno in(10,20); --copyemp���̺��� deptno�� 10,20�� �͵��� ����

select * from copyemp where deptno in (10,20);
commit;


--------------[DELETE END]-------------
/*
APP(JAVA)     ->         JDBC API     ->      ORACLE(DB)

���� ���� �������� CRUD�� �۾��� �ϰ� �ȴ�.
create : insert
read : select
update : update
delete : delete

(DML : insert, update, delete) Ʈ������� �����ϴ� �۾��̴�. �۾��� �� �Ŀ� commit�̳� rollback�� �����ȴ�.

JDBC -> Oracle�� ���ؼ� Emp ���̺��� �۾��� �Ѵٸ�
--emp ���̺� ��ü��ȸ(java���ٸ� �Լ�)
--emp ���̺� ������ȸ(����� ~�� ���~ ��� ���� ������ �ִ� ��ȸ)(java���ٸ� �Լ�)
--emp ���̺� ����(java���ٸ� �Լ�)
--emp ���̺� ������ ����(java���ٸ� �Լ�)
--emp ���̺� ����(java���ٸ� �Լ�)

java���� ����ϴ� ����� �Լ��� �ϴ� ���� ���� �� �Լ� ���뿡 sql ������ ��� ���
-��ü��ȸ : public list<Emp> getEmpAllList(){String sql = "select * from emp"}
��
-������ȸ : public Emp getEmpListByEmpno(){String sql= "select...where empno=777"}

-���� : public int insertEmpData(Emp emp){String sql = "insert into emp().....}

*/
-----------------�ڲ� ��������� �ʱް����ڰ� �� �� �ִ°� ���ϴ°Ŷ�� �Ͻø鼭 ������ �߰��ϽŴ�.....----------------

--[DDL]
--create, alter, drop(���̺� ����)

select * from tab; --create�ϱ� ���� �̸� ���̺���� Ȯ�� �ϰ� ���� ������ �����
select * from tab where tname = 'BOARD'; --create�ϱ� ���� �̸� ���̺���� Ȯ�� �ϰ� ���� ������ �����

--delete�� ���� ������ ����� �������� drop�� ���̺� ��ü�� �������� (�����͵� ����)

drop table board;

--�Ʊ� �ִ� ���̺��� drop���ױ� ������(���̺� ��ü�� �����߱� ������ �ٽ� ���� �̸����� ���� �� �ְ� �ȴ�)
create table board(
    boardid number,
    title nvarchar2(100),
    content nvarchar2(2000), --�ִ� 2000��
    regdate date
);

--Oracle 11g �������� �����Ǵ� ���( �����÷�(�����÷�))
--�л� ���� ���̺��� ����ٰ� �������� ��
--���������÷�, ���������÷�, ���������÷��� �ִٸ� ���� �� �� �����÷��� ���� ���ΰ� �ƴѰ�? �� ����ϰ� �Ǵµ�, ���� �÷��� ���� ���� �ʿ�� ����. ����? ����, ����, ���������� ������ �� ������ �� �� �ֱ� ������
--����,����,���� ������ ������ �ڵ����� ������ ���Ǹ� ���� �� ������
create table vtable(
no1 number,
no2 number,
no3 number generated always as (no1 + no2) virtual
); --no3�̶� �����÷� �����÷��ε� � ���� ������� ���� �޴� �÷� = no1,no2�÷��� �����Ͱ� ���� �� ���� �հ谪�� no3�� ����.


INSERT into vtable(no1,no2)
values (100,200);

select * from vtable; --�����͸� ����غ��� no3�� no1�� no2�� �����͸� ��ģ ���� no3�� ���ִ�.

insert into vtable(no1,no2)
values (33,44); --�Ȱ��� no3���� ���� ���� ����.

--no3���� no1,no2�� ���� ����� ���� ���� �� ����.  �ڵ����� ������ִ� �����÷��� ���� �ǹ̰� �������� ����
insert into vtable(no1,no2,no3)
values (100,200,300);

--���� �÷��� �ִ��� ������ ������ ����
select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE';
--NO3	NUMBER	"NO1"+"NO2"


--�ǹ����� ��� Ȱ��Ǵ���?
--������ ���α׷����� ��ǰ���� �ԷµǸ� (�԰���) �б⺰ ������ �ϰ� �ȴ�. 1���� 4�б�� ������ 1,2,3�� 1�б� 4,5,6�� 2�б�... �� ������ 4�б� �������� �Ѿ��� ���ض�? ����...

--�԰��� �������� 2020-03-01 ->1�б� �������̹Ƿ�, �� ��¥�� ������ �˾Ƽ� �����ͷ� �̾Ƴ��� �ʹٸ�

CREATE TABLE vtable2
(
    NO NUMBER, --����
    p_code char(4), --��ǰ�ڵ�(A001 , A002)
    p_date char(8), --�԰���(20200101)
    p_qty NUMBER, --����
    p_bungi NUMBER GENERATED ALWAYS AS (
                     CASE WHEN substr(p_date,5,2) IN ('01','02','03') THEN 1
                          WHEN substr(p_date,5,2) IN ('04','05','06') THEN 2
                          WHEN substr(p_date,5,2) IN ('07','08','09') THEN 3
                          ELSE 4
                     END ) VIRTUAL
);

select * from vtable2;


Insert into vtable2(p_date) values('20200101');
Insert into vtable2(p_date) values('20200126');
Insert into vtable2(p_date) values('20200304');
Insert into vtable2(p_date) values('20200901');
commit;

------------------------------------------------------------------------------
--DDL ���̺� �ٷ�� pdf���� 138p

--1. ���̺� �����ϱ�
create table temp6( id number);

--2. ���̺��� ����ٰ� �÷� �ϳ��� ���Ծ��ٸ�...?
desc temp6; --�÷� Ȯ���غ���

--'alter' ��� ��ɾ ���� ���̺� ���忡���� �߰�, �÷� ���忡���� add����
alter table temp6
add ename varchar2(20); --������� �Է��ϰ� Ȯ���غ��� �÷��� �߰��Ǿ�����

--3. ���� ���̺� �ִ� �÷��� �̸��� �߸� ǥ���ߴٸ�?(ename->username)
--���� ���̺� �ִ� �÷��� �̸� �ٲٱ�(rename ��ɾ� ���) ���̺� ���忡���� alter���ϴ� ��, �÷� ���忡���� rename���ϴ� ��

alter table temp6
rename column ename to username; --username���� ����Ǿ� ����


--4. �������̺� �ִ� ���� �÷��� Ÿ���� �����ϱ�(�̸��� 4�ڰ� �ִ��� �� �˾Ҵµ� 20���� ����� �־��ٸ�... Ÿ�� �����ؾ���)
--modify ��ɾ� (���̺� alter����, �÷��� modify����) ũ�� �ø��� ���̱� �� �����ϳ�, ���� �� �̹� ����ִ� �����Ͱ� ���ϸ�ŭ����
--�� ũ�� �ȵ�.

alter table temp6
modify (username varchar2(100));


desc temp6; --20byte���� 100byte�� Ŀ������

--5.username�� ������� ������ ����� ���� �ʴ´�... ���� ���̺� �ִ� �÷��� �����ϱ� (���� �� �� ���� ��)
--�÷� ����� �����͵� ���� �����ȴ�.

alter table temp6
drop column username; --username�÷� ������


--6. ���̺���� : drop
--6-1 ������ ���� : "delete" �ٸ� ������

--���̺��� ó�� ����� ó�� ũ�Ⱑ ����-> �����͸� ������ -> ó�� ������� ũ�⺸�� �� ū �����Ͱ� ���͵� �˾Ƽ� ũ�⸦ ���� 
-->����Ŭ ������ �� OS�� ���� DISC��ŭ�� �ִ�뷮 >>ó�� ������� �뷮���� ����� Ŀ�� �� �ִ�.
--ex) ó�� 1MB >> 10������ �����Ͱ� ���� ���� 1MB�� ���ڶ� ���̺� ũ�Ⱑ 100M�� �þ��. 
--�� ���� ������ 10������ �ٽ� ����("delete")�ص� �þ ������ �پ���� �ʰ� �״�� �����ִ�.

--���̺��� �����͸� �����ϸ鼭 ������ ũ�⵵ ���̴� ���
--"truncate ��ɾ�" (delete�� �����͸� ����, truncate�� ó�� ������� ������ ũ��� ����) ��ſ� where������ ���Ұ�
--�ѹ��� ũ�⸦ ���̱� ������ ������ �Է��ϴ� where�������� ���� ����
--ex) ó�� 1MB >> 10������ �����Ͱ� ���� ���� 1MB�� ���ڶ� ���̺� ũ�Ⱑ 100M�� �þ��. 
--�� ���� ������ 10������ �ٽ� ����(truncate)�ϸ� ���� �Ŀ� ������ ���� ũ��� ���ƿ´�.

--7. ���̺� ����(drop) ���� ��ü�� ����
drop table temp6;

select * from temp6; --"table or view does not exist"

--------------------------------------------------------------------------------
--���̺� ���� �����ϱ� pdf���� 144p
--������ ���� : ������ [���Ἲ] Ȯ�� --�����͸� �ϰ� ���ڴ� ��� �ǹ̿��� (���ϴ� ���� ����ְ�)
--'select' �� ����� �������� ����. �����͸� �������°ű� ������
--����(constraint)�� insert , update�� ���� ��쿡 �ʿ��ϴ�.
--������� delete : FK�� ����

/*
1. PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)
--���̺� �� ���� �� �� �ִ�(���̺� �� �ϳ�... �������� ����� �����ϱ� �� = ����Ű�� ����)
--�� ���̺��� �̸� �÷��� primary key�� �ɾ������ �ٸ� �÷�(��ȭ��ȣ)������ PK�� ��� ����.
--��� ����ϰų� �ؾ� �� �̷� �� ��ȭ��ȣ�÷��� UK�� ���
--���������� �˻��� ����� ���ؼ� (index) �ڵ� ���� -> [select����� ���]
--�� ������ ũ�Ⱑ 8kb�ε� �ϳ��ϳ� �о �ѱ�� ���� scan�۾��̶�� �Ѵ�.


2. FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�. 
--���������̶�� �Ѵ�. java�ε����� Ŭ������ Ŭ�������� ��������ڸ� association�� ���� ����
--���̺�� ���̺��� ����

3. UNIQUE key(UK) ���̺��� ��� ���� "����"�ϰ� �ϴ� ���� ���� ��("NULL �� ���") 
--null�� ���� �� �ִ� -> unique�� not null�� ���ÿ� �����ϸ� null�� ����뵵 �����ϴ�.
--primary key�� �ٸ����� null�� ���� �� �ִ�. ������ ���� �� �ְ� �ذ� �� �� �ִ�.

4. NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�. 

5. CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����) 
--������ ������ ���� �ްڴ�.
--where���� ���� �Ͱ� ���� ex) where gender in('��','��') -gender �÷��� �̷��� ���ǵ��� �����ؼ� �̷��� �����͸� �޵���
--�ٸ� �����Ͱ� ���� ��������� ��
*/

--������ ����� ����
--1. ���̺��� ����鼭 �ٷ� ���� (create table ~)
--2. create�� ���̺��� ���� ������ ������ �߰��ϴ� ��(�� ����� �� ���� ����)
--alter table add constraint ...
--�ڵ�ȭ�� ������ �ַ� ����ϴ� ���

--1. �������� Ȯ���ϱ�
select * from user_constraints where table_name = 'EMP'; --��ü���� ���̺� ���� �����ϰ� �� ���̺��� ���������� Ȯ��
--SYS_C006997 ���������� ������ ������ �̸�
--"EMPNO" IS NOT NULL �̷� ������ �ɷ�����

create table temp7(
    --�������� ���� id number primary key ����ǥ�� (������ �̸��� ���������� ���Ƿ� �����Ǳ� ������ " SYS_C006997" ���߿� ����
    --�Ʒ�ó�� ������ �̸��� ���� ���ؼ� �����ϱ� (������ �̸��� ���� ��� ��� �ɷ��ִ��� �˾� �� �� �ֵ���)
    id number constraint pk_temp7_id primary key , --�������
    name varchar2(20) not null, --not null�� constraint ���� �ʾƵ� ��
    addr varchar2(50) --�ڿ� �ƹ��͵� �Ⱦ��� null ���
);

select * from user_constraints where table_name = 'TEMP7';
--pk_temp7_id �ؼ��� ���� ���� ����, �����ÿ� ���

insert into temp7(name, addr) values ('ȫ�浿', '����� ������'); --name�÷��� ��� ��������� ��
--cannot insert NULL into ("BIT"."TEMP7"."ID")

insert into temp7(id, name, addr) values(10, 'ȫ�浿', '����� ������');

commit;

insert into temp7(id, name, addr) values(10, '�ƹ���', '����� ������');
--unique constraint (BIT.PK_TEMP7_ID) violated = ID���� �ߺ��� ��� �Ұ��ε� 10���� "�ߺ�"�Ǿ

--1. ���̺� primary key�� ����� �� �� �������? '1��' but ��� 1���� ����
--(name , num) �������� �÷��� ��� 1���� ���� >> ���� Ű


create table temp8(
id number constraint pk_temp8_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp8_jumin unique, --�ֹ��÷����� �ߺ��Ǵ� ���� ���� �ʰڴ�. �׷��� null���� ����Ѵ�.
addr varchar2(20) 
);

select * from user_constraints where table_name = 'TEMP8'; --���� �ִ��� Ȯ��

insert into temp8(id, name, jumin, addr)
values (10, '������', '123456', '��⵵ �Ȼ��');

select * from temp8;

commit;


insert into temp8(id, name, jumin, addr)
values (20, '�ƹ���', '123456', '��⵵ �Ȼ��'); 
--unique constraint (BIT.UK_TEMP8_JUMIN) violated �������

--unique���࿡ null���� �־��.�׷��� null���� �ߺ�üũ�� �ұ�?


insert into temp8(id, name, addr)
values (30, '�达', '��⵵ �Ȼ��'); --jumin ���� ���� �ʾƵ� unique�� null���� ����ϱ⶧���� ��


insert into temp8(id, name, addr)
values (40, '�ھ�', '��⵵ �Ȼ��'); --null�� �ߺ�üũ�� '��'�Ѵ�.


select * from temp8;

--result : null����ϳ� �ߺ�üũ ����� �ƴϴ�. 

--���̺��� ���� ��
--�̷��� ���������� ������ �ɸ� �ȴ�. not null + unique ������ ���ÿ� �ɱ�
--create table temp8(jumin not null constraint ..unique)
--unique������ ���̺� ����� �� �� ������? primary key�� ��� �ϳ�������, unique�� �÷� ������ŭ �����ϴ�. 

-----------------------------------------------------------------------
--������� ���̺� ���� �߰��ϱ�(�Ϲ����� ���)
--���� : �����Ͱ� �ִ� ��� ������ �����ϴ� �����Ͱ� �ִٸ� ������ �߰����� �ʴ´�. primary key ������ �ɷ��� �ϴµ�, ����
--�̹� ������� ���̺� �ߺ������Ͱ� �ִٸ� primary key ������ �ɸ��� �ʴ´�.
--������ �ɱ� ���� ������ �˻� �۾��� �����ؾ� �Ѵ�.

create table temp9(id number);

alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where table_name = 'TEMP9';

--�������� �÷�(����Ű)�� ������ �ɰ� �ʹٸ�
--add constraint pk_temp9_id primary key(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--ename�÷��� not null ����ɱ�(�� �Ⱦ��� ��)

alter table temp9
modify(ename not null);

-------------------------------------------------------------------
--[check ����]
--where ���ǰ� ������ ������ ���� >> where age > 19
--�÷��̸� age > 19 ���·� ������ �Ǵ�. �ش� �÷����� 19���� ū �����͸� ���� �Ǿ�����.


create table temp10(
id number constraint pk_temp10_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp10_jumin unique,
addr varchar2(20),
age number constraint ck_temp10_age check(age >= 19) --age�÷��� check ����ɱ�
);

select * from user_constraints where table_name = 'TEMP10';

insert into temp10(id, name, jumin, addr, age)
values (100, '������', '123456', '����� ������', 20);

select * from temp10;

commit;

insert into temp10(id, name, jumin, addr, age)
values (200, '������', '123456', '����� ������', 10); --üũ���� Ȯ���غ��� check constraint (BIT.CK_TEMP10_AGE) violated
------------------------------------------------------------------------------
--[�������� : RDBMS(������ ���̺��̽�)�̱� ������ ���������� �־�� ���̺�� ���̺� ���� ���踦 ���� �� �� �ִ�.]

--EMP ���̺��� deptno �÷��� DEPT���̺��� deptno �÷��� �����Ϸ��� �� ��(FK�� �ɷ��� �� ��)
--deptno�÷��� �������� ������(PKŰ�� �ɷ����� �ʴٸ�) ���� �� �� ����.
--�׸��� FK�� �ɸ��� �Ǹ� EMP�÷��� deptno���� DEPT���̺��� deptno �÷��� ���븸 �� �� �ִ�.
--java�� has a, is a ����� ����.

--EMP ���̺� �ִ� deptno �÷��� DPET ���̺� �ִ� deptno�÷��� �����Ѵ�. �����ϴ� ��(EMP-deptno�÷�)�� �Ŵ� Ű��
--FK,
--������ ���ϴ� �ʿ� �Ŵ� ������ PK

create table c_emp
as
select empno, ename, deptno from emp where 1=2; --���̺� Ʋ�� ����

create table c_dept
as 
select deptno, dname from dept where 1=2;


select * from c_emp;
select * from c_dept;


--���̺��� ����� ������ �ɾ��

drop table c_emp;
drop table c_dept;




alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno)
references c_dept(deptno); --no matching unique or primary key for this column-list ���� dept�÷��� PK, unique�� ���
--c_emp(deptno) >> c_dept�� deptno�� �����Ϸ��� �ߴµ�, PK�� �������� �ʾƼ�(���Ἲ�� ������� �ʾƼ�) ����
--c_dept(deptno) >> �ٸ� ������� �����ֱ� ���ؼ� ���Ἲ �����ؾ� ��(PK)
--FK���� PK�� �����ؼ� �ɾ�� ��.

--1. PK����
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

--2. FK�ɱ�
alter table c_emp
add constraint fk_c_dept_deptno foreign key(deptno)
references c_dept(deptno);

--c_emp(deptno) <---> c_dept(deptno) ���谡 ������. (1 : N(��)) ����

insert into c_dept(deptno, dname) values (100, '�λ���');
insert into c_dept(deptno, dname) values (200, '������');
insert into c_dept(deptno, dname) values (300, '�ѹ���');

select * from c_dept;

commit;

--���Ի�� �Ի�
--���� not null�� �ɾ ���� ���� �´�? ����ÿ��� ���� ����. �ǵ��� ����� ���� �޶���
--null ��� : (null�� ����ϴ� ������ ���Ի���� ������ ��� �μ��� �������� �ʾ��� ���� �ֱ� ������)
--not null ����: �Ի��ϴ� ��� ����� �μ��� �������Ѵٰ� �����߱� ����

insert into c_emp(empno, ename) --�� ��쿡�� deptno�� null������ �� ��
values(100, 'ȫ�浿');

select * from c_emp;

update c_emp
set deptno = 500
where empno = 100;

update c_emp
set deptno = 200
where empno = 100;

insert into c_emp(empno, ename, deptno)
values(200, '�ƹ���', 100);

select * from c_emp;


--�� ���� ���̺�
--(�θ�� �ڽİ���)
--(master , detail) �����Ϳ� ���� ����
--emp(deptno)�� dept(deptno) ���迡�� �� ���̺�(�θ�)

--PK�� ������ �ִ� ���� �θ��̴�. �� dept���̺��� master
--�׸��� master ���̺��� ���� ����ϰ�, master ���̺��� deptno�� �μ���ȣ���� Ŭ���ϸ� �� �Ʒ��� ��ȭ��
--ex �μ���ȣ�� 10���� ������� ��µȴ�. (emp�� �������̺�)
--���� emp�� ��������� �� ���̺�������, �� ���̺��� ���迡 ���� ������ �� ���̺��� dept���̺��� �ȴ�.


delete from c_dept where deptno = 300; --dept���̺��� 300�� �μ��� ���� �� �֤���!
--���� emp���̺��� 300 �����͸� �������� �ʱ� ����

delete from c_dept where deptno = 100; --emp ���̺��� 100���� ����ϰ� �ֱ� ������ ���� �� ����.
--ntegrity constraint (BIT.FK_C_EMP_DEPTNO) violated - child record found

--���� ����� �ʹٸ�
--���� child(emp)���� ����ϰ� �ִ� �����͸� ������Ʈ�ϰų� �����ؾ���. �����Ǵ� �����Ͱ� ������

commit;

/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
--TIP > MS-SQL >> ON UPDATE CASCADE //DELETE, UPDATE
-- [ON DELETE CASCADE]  �θ����̺�� ������ ���� �ϰڴ�
-- 300 ���� �� �ֳ���?  �� 
-- delete from c_dept where detpno=300;
-- �����ϴ� �ڽ� ������ ���� ����
-- delete from c_emp where deptno=300; ���� ����

--�������
alter table c_emp
drop constraint fk_c_emp_empno; 


alter table c_emp
add constraint fk_c_emp_empno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;


select * from c_emp;
select * from c_dept;
delete from c_Dept where deptno=100;
/*
--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ� (�Ҽ� ���� 2�ڸ����� ����� �ݿø�(���ڸ�����))
--�а��ڵ�� �а� ���̺� �а��ڵ带 '����'�Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�(����ξ���)

--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�

--�а��ڵ� , �а���

--�׸��� select �����
--���õ����� 3������ �Է�
--�й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���

*/

--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����,����,���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ� (�Ҽ� ���� 2�ڸ����� ����� �ݿø�(���ڸ�����))
--�а��ڵ�� �а� ���̺� �а��ڵ带 '����'�Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�(����ξ���)azzX


create table student_table(
s_number number,
s_name varchar2(20) not null,
kor number default 0,
eng number default 0,
math number default 0,
code number,
alljumsu number generated always as (kor + eng + math) virtual,
average number generated always as (round((kor + eng + math / 3),2)) virtual,

constraint s_number primary key(s_number, s_name), --����Ű
constraint fk_grade_mcode foreign key(code) references major(majorcode) 
);


create table major(
majorcode number,
majorname varchar2(20) not null,
constraint pk_major_code primary key(majorcode)
);


insert into student_table
values(100, '������', 30 , 50 , 70);



insert into major
values (10, '����');

insert into major
values (20, '����');

insert into major
values (30, '����');

select * from major;
select * from student_table;
select * from user_constraints where table_name = 'student_table';

--------------------------���� �����ϱ�----------------------------
--view ��ü(�������̺�) pdf���� 192page
/*

CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS
Subquery 
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY] 

<����>
OR  REPLACE  �̹� �����Ѵٸ� �ٽ� �����Ѵ�. 
FORCE   Base Table ������ ������� VIEW �� �����. 
NOFORCE  �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�. 
view_name  VIEW �� �̸� 
Alias   Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�. 
Subquery  SELECT ������ ����Ѵ�. 
WITH CHECK OPTION VIEW �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�.  
Constraint  CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�. 
WITH READ ONLY  �� VIEW ���� DML �� ����� �� ���� �Ѵ�. 

*/
--ORA-01031: insufficient privileges
--���������� �����Ƿ� ������ ���� ������� ����
--���� ����-> �����ڰ���-> �ٸ� �����-> BIT -> �����ʸ��콺 ->����� ����-> �ý��� ����-> CREATE VIEW
create view v_001
as
    select empno, ename from emp;
    
    select * from v_001; --> empno, ename ������ ��ȸ�� --view�� sql������ ������ �ִ� sql���(��ü) �̴�.

--view�� ��ü�̴�. �������� ������ �ִ� ��ü (create ....)
--create view ~(view�̸�) as sql���� (select��~) => view�� ���ؼ� �� �� �ִ� ������ ����� ����
--view�� ` ��ü�� ���̺�ó�� ��� �����ϵ��� �Ǿ����� (�������̺�) -> ���� ����� emp�� deptó�� �����ϰ� ��� �� �� �ִ�.
--������ �����δ� �����͸� ������ �ִ� ���� �ƴϴ�. �޸� �󿡼��� �����ϴ� ������ ���̺���. in line view�� �̷� ���

--view ����
--�Ϲ� ���̺�� �����ϰ� ����ϸ� �ȴ�. select �ᵵ �ǰ� where�� ���� �߰��ص� �ǰ�...
--��, view�� �������� �������ִ� �����͸� �� �� �ִ�.
--DML(insert,update,delete)�� �Ǵ°�? �ȴ�! ������ view�� ���ؼ� �����ִ� �����Ϳ� ���ؼ��� �����ϴ�.

--�� ����?
--1. �������� ������ ����(join�ϰų� subquery�� ��� �� �� ���� ���̺��� �ִٸ� (�������� �Ϻκе��� ��Ƽ� �ʿ��� �����͸� ���� �� ��)
--2. ����(����ó��)- > �����ϰ� ���� �����͸� ��Ƽ� view�� ���� �� �� �ִ�.
--3. ���� (������ query�� ��Ƽ� view�� �����ϸ� ������ ���� �Ȱ��� query�� ĥ �ʿ䰡 ����.) �̸� �����α� ���� 

--�λ����̺� �۾��� �ʿ� �� �� �λ����̺��� ��� ����(�޿����������...?)�� ������� ������ ���� �� �����Ƿ�
--�� �� view�� ���� ����

create view v_emp
as
select empno, ename, job, hiredate from emp;


--���� �� v_emp ����ϵ���(���ȼ�)
select * from v_emp;
select * from v_emp where empno = 7788; --�̸���~


--����(view�� �����ΰ� ��� ����,������ ������ �ܼ�ȭ)
create view v_002
as
select e.empno, e.ename, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

select * from v_002;
select * from v_002 where deptno=20;

--
--�ڱ� �μ��� ��� ���޺���  �� ���� ������ �޿��� �޴� ����� ���, �̸�, �޿��� ���
--�μ��� ��� �޿��� ������ �ִ� �������̺��� �����. ���������� ��ȸ������, ������ ��� �������� >> in line view�� �Ҹ���.
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

--���̺��� 1�� �̻� ������
--join �� ����غ���, �ȵǸ� ��������, �� �ȵǸ� view(�������̺�)

--view ����
drop view v_007;


create or replace view v_007 --�����ϰų� ����ڴ�.
as 
select avg(sal) as AVGSAL from emp; --���� ����� ���� �� ���� ����� ���� �״�� �����ؼ� �ٽ� �����ϸ� ��� --avs(sal) �÷��� ������ ����� �Ѵ�. �󸮾�� �߰�

select * from v_007;


--view�� ���� DML�۾��� ���������� ���� ��ٷӴ� ! (insert , update, delete �� ����) �ǵ����̸� DML�� ���� �ʴ°� ���� select �������� �ϴ°� ����
--�� view�� ������ ������ �� ���̺��� �������� �ؾ��Ѵ�. ���̺� 1��¥���� �����ϴ�. ���� view�� DML�Ұ�
--���� view�� ���̺��� 1�� �̻����� ������ ������(join �ưų�...)
--�ܼ� view�� �����ϴ�. ���̺� 1���� ���� view

select * from v_emp; --�� �� �ִ� �����ʹ�(empno, ename, job, hiredate)

update v_emp
set sal = 0; --���� sal�� view�� �� �� �ִ� �����Ͱ� �ƴϱ� ������ DML�Ұ���

update v_emp
set job = 'IT';

select * from emp;

rollback;

create or replace view v_emp2
as
select * from emp where deptno= 20;

select * from v_emp2;

update v_emp2
set sal = 0; --���� sal �����ʹ� �� 14���� ������, ��� sal �����͸� 0���� ����� ���� �ƴ�, ���� view���� �������� �ִ� ������ = �����ȣ�� 20�� ������� sal �� �ٲ��.


select * from emp;

rollback;


--view�� �ִ��� ������ ��� ���� ���

select * from user_views;


--1. 30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ������.


create or replace view view001_2
as
select ename, sal, job from emp where deptno = 30;
 
 
--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  
create or replace view view001 ("����" ," ����̸�", " ����")
as
select job, ename, sal from emp where sal >= 300 and deptno = 30;

select * from view001;
 
 
--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
create or replace view view002
as
select deptno, max(sal) as maxsal ,min(sal) as minsal, avg(sal) as avgsal from emp
group by deptno;

select * from view002;

       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.

 create or replace view view003
 as
 select deptno, avg(sal) as avgsal
 from emp
 group by deptno
having avg(sal) >= 2000;

select * from view003;

 
--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.

create or replace view view004
as
select job, sum(sal) as "�ѿ���" 
from emp where job != 'MANAGER'
group by job
having sum(sal) >= 3000;

select * from view004;















