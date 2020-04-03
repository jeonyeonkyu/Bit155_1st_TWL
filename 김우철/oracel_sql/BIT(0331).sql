--CREATE TABLE EMP
--(EMPNO number not null,
--ENAME VARCHAR2(10),
--JOB VARCHAR2(9),
--MGR number ,
--HIREDATE date,
--SAL number ,
--COMM number ,
--DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--
--INSERT INTO EMP VALUES
--(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
--INSERT INTO EMP VALUES
--(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
--INSERT INTO EMP VALUES
--(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
--INSERT INTO EMP VALUES
--(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
--INSERT INTO EMP VALUES
--(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
--INSERT INTO EMP VALUES
--(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
--INSERT INTO EMP VALUES
--(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
--INSERT INTO EMP VALUES
--(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
--INSERT INTO EMP VALUES
--(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
--INSERT INTO EMP VALUES
--(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
--INSERT INTO EMP VALUES
--(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
--INSERT INTO EMP VALUES
--(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
--INSERT INTO EMP VALUES
--(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
--INSERT INTO EMP VALUES
--(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);
--
--COMMIT;

--CREATE TABLE DEPT
--(DEPTNO number,
--DNAME VARCHAR2(14),
--LOC VARCHAR2(13) );
--
--INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
--INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
--INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
--INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');
--
--COMMIT;



--CREATE TABLE SALGRADE
--( GRADE number,
--LOSAL number,
--HISAL number );
--
--INSERT INTO SALGRADE VALUES (1,700,1200);
--INSERT INTO SALGRADE VALUES (2,1201,1400);
--INSERT INTO SALGRADE VALUES (3,1401,2000);
--INSERT INTO SALGRADE VALUES (4,2001,3000);
--INSERT INTO SALGRADE VALUES (5,3001,9999);
--COMMIT;

select * from emp;
select * from dept;
select * from salgrade;


/*
SELECT [DISTINCT] {*, column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
*/
--1.��� ���̺��� ��� �����͸� ����ϼ���
select * from emp; --���� ���ڴ� ��ҹ��� ������ ���� �ʴ´�.

--2.Ư�� �÷��� �����͸� ����ϼ���.
select empno, ename
from emp;

--3.�÷��� ����Ī(��Ī,alias) �ο��ϱ�
select empno ����
from emp;

--4.����
select empno "��  ��"
from emp;

--����(ǥ��) (ANSI ����)
select empno as "��  ��", ename as "��  ��"
from emp;

--Oracle ������ ����(���ڿ� : ��ҹ��� ����)
--���ڿ� ǥ��(���ڿ� ǥ��� �� �̱������̼�(')���� ��)
--�ҹ��� 'a' != 'A' : ���� �ٸ�
select empno, ename
from emp
where ename = 'king';
--�빮�� KING���� �Ǿ��־ ��ȸ�� �ȵ�

--Oracle SQL ��� : ������ (���� ������(||), ��� ������(+)) ����
--java + (���� + ���� >> ����)
--java + (���ڿ� + ���ڿ� >> ����) 
--TIP) ms-sql(+ ����,����)

select '����� �̸��� ' || ename || ' �Դϴ�' as "�������"
from emp;

--empno, ename >> �÷� >> Ÿ��
--Ÿ��(�ڷ���) : ����, ����(���ڿ�), ��¥...
DESC emp;
/*
���̺��� ������ �� �� ����
�̸�       ��?       ����           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10)
*/

select empno || ename --���� || ���ڿ� (���������� ���� -> ���ڿ�)
from emp;

select empno + ename
from emp;

--�����..�츮 ȸ�翡 ������ ��� �ֳ�
select distinct job from emp;
--distinct : �ߺ� ������ ����
--distinct ���� : grouping ���� �����͸� ó��(���� ���� ���� ���� �ϳ��� ���)

select DISTINCT job, deptno from emp;
select DISTINCT deptno, job from emp;
select job, deptno from emp;
--ó���� job���� �׷��� -> �׾ȿ��� deptno�� �׷���

--Oracle ���
--Java ���
--Oracle �����ڰ� Java ���� ����(+, *, - ...)
-- % �ڹٿ��� ������ ���ϴ� ��� , % ����Ŭ���� ������(�˻�����)
--����Ŭ (+, -, *, /) ������ �Լ� >> Mod()

--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���.
--desc emp;
select empno, sal, sal + 100 as "�λ�޿�"
from emp;

--dual �ӽ� ���̺�
select 100 + 100 from  dual;
select 100 || 100 from dual;
select '100'+100 from dual; -- +�� ������ ����̹Ƿ� ���ڿ��� �������·� �ٲ㼭 ����
select '100A'+100 from dual;

--�񱳿�����
-- > < <=
-- java���� ����(==) �Ҵ�(=)
-- Oracle ����(=) : ����Ŭ�� �Ҵ��� ����
-- Oracel �����ʴ�(!=)

--��������
--AND, OR, NOT

--������(���ϴ� row ������ ���ڴ�)
select *
from emp
where sal >= 3000;

select empno, ename, sal
from emp
where sal > 3000;

--�̻�, ���� (=)
--�ʰ�, �̸� 

--����� 7788���� ����� ���,�̸�,����,�Ի����� ����ϼ���.
select * from emp;
select empno, ename, job, hiredate
from emp
where empno=7788;

--����� �̸��� 'KING'�� ����� ���, �̸�, �޿� ������ ����ϼ���.
select * from emp;
select empno, ename, sal
from emp
where ename='KING';

--��(AND, OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager�� ����� ��� ������ ���
select *
from emp
where sal >= 2000 and job='MANAGER';

--�޿��� 2000�޷� �̻��̰ų� ������ manager�� ����� ��� ������ ���
select *
from emp
where sal >= 2000 or job='MANAGER';

--����Ŭ ��¥(DB������ ��¥)
--����Ŭ ��¥(sysdate)

--���� ������ ����ڰ� ��¥ ������ YYYY-MM-DD HH24:MI:SS�� ������ �����ϰڴ�.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual;

select * from SYS.nls_session_parameters; --��̷� �ϴ°�, �ý��� ������ ������ �ִ� ȯ�� ���̺�

select hiredate from emp;

--�Ի��� 1980-12-17�� ����� ��� ������ ����ϼ���.
select *
from emp
where hiredate = '1980/12/17'; --'/'��'-'��'.'�� ��
-- 80-12-17�� �ȵ�

--����� �޿��� 2000�̻��̸鼭 4000������ ��� ����� ������ ���
select *
from emp
where sal >= 2000 and sal <= 4000;

select *
from emp
where sal between 2000 and 4000;
--������ : between A and B (=����)
--�̸�,�ʰ������� ��� ����(=�������� �ʾƼ�..)

--�μ���ȣ�� 10 �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select empno, ename, sal, deptno
from emp
--where deptno = 10 or deptno = 20 or deptno = 30; --����
where deptno in(10,20,30); --��
--in �����ڸ� Ǯ� ���� --where deptno = 10 or deptno = 20 or deptno = 30; �� ���

--�μ���ȣ�� 10�Ǵ� 20�� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���.
select empno, ename, sal, deptno
from emp
--where deptno = 10 or deptno = 20 or deptno = 30; --����
where not deptno in(10,20); --��

--IN �� ������ NOT IN

--POINT : Oracle �� ǥ��(������ ����) >> null
--null�� �ʿ�� ���� ����

create table member (
    userID varchar2(20) not null, --�ʼ��Է�
    name varchar2(20) not null, --�ʼ��Է�
    hobby varchar2(50) -- default�� null�� ��(null���� ��� / ������ �ȹ޾Ƶ� ��)  
);

--insert into member(userID, hobby) values('wlsgmdchemd', '�߱�'); //�ȵ�
insert into member(userID, name) values('wlsgmdchemd', '��ö'); 
--hobby �÷��� �����ʹ� null�� �ڵ����� �־���
insert into member(userID, name,hobby) values('wlsgmdchemd', '��ö','����'); 

insert into member values('wlsgmdchemd', '����', 'ss'); --�÷��� ������ values�� ���� �Ұ�

--�ǹݿ�
commit;

--������ ���� �ʴ� ��� ����� ������ ����ϼ���.
select * from emp;
select *
from emp
where comm is null;

--������ �޴� ��� ����� ������ ����ϼ���
select * from emp where comm is not null;

--��� ���̺��� ���, �̸�, �޿�, ����, �ѱ޿��� ����Ͻÿ�.
--�ѱ޿�(�޿� + ����)
select * from emp;
select empno, ename, sal, nvl(comm,0), nvl(sal+comm,0) as ����
from emp;

--POINT >> null
--1. null ���� ��� ������ �� ����� >> null
--2. �� ������ �ذ� ��� : nvl(), nvl2() >> null���� replace ġȯ..
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

select null + 100 from dual;
select 'ȫ�浿' || null from dual;
select 100 + nvl(NULL, 0) FROM dual;
select comm, nvl(comm, 0) from emp;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����Ͻÿ�.
select * from emp;
select empno, ename, job, sal, nvl(comm, 0)
from emp
where sal >= 1000 and comm is null;
--------------------------------------------------------------------------------------------

--DQL(Data query Language) : SELECT(60%)
--DDL(Data Definition Language) : CREATE, ALTER, DROP(��ü(���̺�) ����, ����, ����) (30%)
--DML(Daa Manipulation Language) : INSERT, UPDATE, DELETE(������ ����) (10%)

--java : class Board { private boardNo int}
--Oracle : create table Board (boardNo number not null)

create table board(
    boardID number NOT NULL, --����, �ʼ� �Է�
    boardTitle varchar2(20) NOT NULL, --�ѱ�10��, ������,Ư������,������ 20��, �ʼ� �Է�
    boardContent varchar2(2000)NOT NULL, --�ʼ��Է�
    hp varchar2(20) --default null ���(�ʼ� �Է��� �ƴϴ�)
);

select * from board;
desc board;

--DML(������ ���۾�) �� �ݿ� ���並 ����
--insert
--update
--delete
--�ݵ�� �� ����� �ݿ�����, ��������� �ǻ���� �ؾ��Ѵ�
--commit(�����ݿ�)
--rollback(���� �ݿ��� ���)

insert into board(boardID, boardTitle, boardContent)
values(100, '����Ŭ', '�� �Ҹ��ѵ�');

insert into board(boardID, boardTitle, boardContent)
values(200, '�ڹ�', '��������');

insert into board(boardID, boardTitle, boardContent)
values(300, '�׸���', '�׸���');

select * from board;
commit;
rollback;
