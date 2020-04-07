/*
[1���� ����]
1. ����Ŭ ����Ʈ���� �ٿ�ε�
Oracle Database Express Edition 11g Release 2
https://www.oracle.com/database/technologies/xe-prior-releases.html

������
https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper)  ,
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^ ��峪 sqlgate ��õ ���ֽ�

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : bit

-- USER SQL
CREATE USER bituser IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bituser QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bit WITH ADMIN OPTION;
GRANT "RESOURCE" TO bit WITH ADMIN OPTION;

�ǽ� ȯ�� �����ϱ�

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

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

select*from emp;
SELECT*FROM dept;
SELECT*FROM SALGRADE;

/*
SELECT [DISTINCT] {*,column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
[] ���� �����������
{} ���� ������ �� ���. 
*/

--1. ��� ���̺��� ��� �����͸� ����ϼ���.
select*from emp; -- ���� ���ڴ� ��ҹ��� ���� ���ؿ�
--SELECT*FROM EMP;  

--2. Ư�� �÷� ������ ����ϱ�    //�÷��� ���̿��� , �� ����
select empno, ename, sal from emp;
select ename from emp;

--3.�÷��� ����Ī(��Ī)(alias)  �ο��ϱ�    //��µǴ� �÷��� ���� ���, �̸����� �ٲܼ� �ִ�.  �÷��� + �����̽���+�ٲٰ�����̸�
select empno ��� , ename �̸�
from emp;
--alias ���ӿ� ""�� �ٿ��� �ϳ��� �������� �ν� ������ �� �ִ�.
/*
select empno "��    ��" , ename "��     ��"   
from emp;
*/
--����(ǥ��)(ansi ����)    �ϳ��� ���� �ٸ� DB 60%�� ��밡���ϴ�!~
select empno as "��    ��" , ename  as "��     ��"   
from emp;

select empno as "�̷���", comm as "�ٲ�ٴ� ����" from emp;



--Oracle ������ ���� (���ڿ� : ��ҹ��� ����)
--���ڿ� ǥ��('���ڿ�') �� ���ڿ���
--�ҹ��� 'a' �빮�� 'A'�� �ٸ� ���� ���̴�. 
--emp���̺��� ename �÷����� ŷ�λ�� ������.
--�ҹ����϶� �ȳ���.



select empno, ename
from emp
where ename = 'KING';

--Oracle SQL ���:  ������ (���� ������(||), ���������(+)) �����ؼ� ����. 

--java + �� (����+���� >> ����)    �ڹٴ� + �ϳ��� ���ظ���!!
--java + (���ڿ� + ���ڿ� >> ����)
--Tip) ms-sql(+ ����, ����) ���� ���̰� �ִ�.

select '����� �̸��� ' || ename || '�Դϴ�' as "�������"
from emp;



--empno, ename >> �÷� >> Ÿ��
--Ÿ��(�ڷ���) :����, ����(���ڿ�) , ��¥...
desc emp;
/*
���̺��� �⺻ ����(�÷���, null ����, Ÿ������
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) ���ڿ� ���尡�� �ѱ��� 5��.. ����� 10��..
JOB               VARCHAR2(9)  
MGR               NUMBER       ����
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER   
*/

select empno || ename     --����||���ڿ� (���������� ����-> ���ڿ�)   �����̴ϱ� �ߵ�!!!!
from emp;
select empno + ename      --���ڶ� ���ڸ� + �ϸ�  ��� ��������� ����.   ���ڶ� ���� ����� ������!!!!!
from emp;

--����� .. �츮 ȸ�翡 ������ ��� �ֳ�??

select job from emp; 
--distinct : �� �ߺ� ������ �����ϰ� �ϳ��� �����ش�
--distinct : grouping  �׷������ؼ� �ߺ����� �����Ѵ�. 

select distinct job from emp;    --5���� �� ���´�. 

select * from emp;
select distinct job , deptno from emp;
select distinct job , deptno from emp order by job;  --�����͵��� �׷�������� �׾ȿ� �� �׷��� �����. ���Ŀ� �ϳ��� ������ �̶�µ�..?
select distinct deptno,job from emp order by deptno; --deptno 10�� �׷�ȿ� ������ ������ �ϳ��� �̾ƿ´�.


--Oracle ���
--java ���
--Oracle �����ڰ� Java ���� ���� (+,*,- ...)
--% �ڹ�(�������� ���ϴ� ������) , % ����Ŭ���� �����ڰ� �ƴ϶� (�˻��� �ϴ� ����)�� ���δ�. 
--����Ŭ(+, -, * ,/) ������ �Լ� >> Mod()

--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���.
--desc emp; �ϸ� � �÷����� �˼� ����

select empno, sal, sal+100 as "�λ�޿�" from emp;

--dual �ӽ� ���̺��������Ѵ�.
select 100 + 100 from dual; --dual�� ��������� ����� �׾ȿ� ����ִ´�.  200
select 100 || 100 from dual; --|| ���������� ����ȯ�� �Ͼ�� 100100 ���ڿ��μ� �����Ѵ�.
select '100' + 100 from dual; -- + �̰� ������ ����̴ϱ� ����ȯ  200
--select '100A' +100 from dual; --�̰� �׳� ����

--�񱳿�����
-- > < <=
--java ����(==) �Ҵ�(=)
--Oracle ����(=) �����ʴ�.(!=) �Ҵ� ����.

--��������
--AND , OR ,  NOT

--������ (���ϴ� row�� �� �������ڴ�)
select*
from emp
where sal >=3000;   --������̺��� �޿��� 3000���� ũ�ų� ���� ��� ����� ����϶�

select empno, ename, sal
from emp
where sal > 3000;    

--�̻�, ���� (=)
--�ʰ�, �̸�      ��Ȯ�� Ȯ���ؾ� �Ѵ�. 


--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���.


--������, ������, Ʃ��(���� ¯�߹���)(������ �� ���� �׿����Ѵ�..) , ������

--������� : from ���� ���ͼ� where ���� �Ÿ��� select ���� �̾Ƴ���.     
select empno, ename, job, hiredate  --ó������ * �� �غ������� �÷����� �������� ������ �� ����. 
from emp
where empno =7788;

--����� �̸��� king�� ����� ���, �̸�, �޿� ������ ����ϼ���
select empno, ename, sal
from emp
where ename = 'KING';  --'' �̱������̼��� ���δ�.

--�� (AND , OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���.
--���� �ִ� �ΰ��� ������ ��� �����ϴ� ������(�Ѵ� ����)   


select *
from emp
where sal >= 2000 and job = 'MANAGER';   --��� 3�� ���´�. 

--�޿��� 2000�޷� �̻��̰ų�(�Ǵ�) ������ manager �� ����� ��� ������ ����ϼ���.
select *
from emp
where sal >= 2000 OR job = 'MANAGER';  --OR �� ���� �������� ������ �о�����.     ��� 6�� ���´�. 


--����Ŭ ��¥(DB������ ��¥)
--����Ŭ ��¥ (sysdate) ���� ����Ŭ�� �����ִ� ��¥ ������ ���´�.

select sysdate from dual;    --20/03/31

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';  
--���� ���������� �����(����)�� ��¥ ������ 'YYYY-MM-DD HH24:MI:SS' �̷��� ������ �����ϰڴ�.

select* from SYS.nls_session_parameters; --�ý��� ������ ������ �ִ� ȯ�����̺�
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS  --���� ������ ����ڰ� �����ְ��� ���� --����Ű�� �������. DB�� �ǵ�� �ƴ϶� 
--NLS_DATE_LANGUAGE	KOREAN --�ѱ��� ����
--NLS_TIME_FORMAT	HH24:MI:SSXFF 

select sysdate from dual;
--2020-03-31 14:37:32

select hiredate from emp;    --1980-12-17 00:00:00  �̷��� �ٲ�� ���´�.   ���� ������ ���˿� ���� �� : �� : �� ���� �پ� ���´�.

--�Ի����� 1980-12-17 �� ����� ��� ������ ����ϼ���.
select *
from emp
where hiredate = '1980-12-17';  --��¥ �� ���� ���� �̱� �����̼� �̴�.  

select *
from emp
where hiredate = '1980/12/17';  --   -, /   �ǰ�  . �� ������   .�� �����ϸ� ���� ����. 

select *
from emp
where hiredate = '1980.12.17';

select *
from emp
where hiredate = '80-12-17';  --�̰� ��ȸ�� �ȵȴ�. ������ : RR-MM-DD   >> YYYY-MM-DD �̷��� �ٲپ��� �����̴�. 

--����� �޿��� 2000�޷� �̻��̸鼭 4000������ ��� ����� ������ ����ϼ���
select *
from emp
where sal >=2000 AND sal<=4000;

--������ : between A and B (=  �����ϰ� �ִ�.)
--�̸�, �ʰ������� ������ (= �� �����ϸ� �ȵǱ⶧������!)

select *
from emp
where sal between 2000 and 4000; --������ ����� ���´�. 

--����� �޿��� 2000�޷� �̻��̸鼭 4000������ ��� ����� ������ ����ϼ��� (��� �ߺ��̾ �׳� �����)

select *
from emp
where sal >2000 AND sal<4000;

--�μ���ȣ�� 10 �Ǵ� 20�� �Ǵ� 30 ���� 
--����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���.
select empno, ename, sal, deptno
from emp
where deptno =10 or deptno =20 or deptno =30;



--IN ������ 
select empno, ename, sal, deptno
from emp
where deptno in(10,20,30); 
--in �����ڸ� Ǯ� ������... where deptno =10 or deptno =20 or deptno =30; 

--�μ���ȣ�� 10 �Ǵ� 20�� �ƴ� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���.
select *
from emp
where deptno != 10 and deptno !=20;

--In �� ������ .....,NOT IN     AND �� Ǯ������.
select *
from emp
where deptno NOT IN(10,20);   --10�� 20 �Ѵ� �ƴѰ�. 
--������ and ������ and ....  deptno != 10 and deptno !=20;    



--distnct  In  NOT IN   between A and B   �̷��� �� �ܿ��O!!!!!!!!

--POINT : Oracle ������ �� ǥ���� �Ҽ��ִ�.(������ ����) >> null
--null �ʿ�� �̴�.

create table member (
  userid varchar2(20) not null,   --userid��� �÷����� �ʼ� �Է��̴�. 
  name varchar2(20) not null,  --�ʼ��Է�
  hobby varchar2(50) --default �� null �ٴ´�.  = null ���� ����ϰڴ�.  = ������ �ȹ޾Ƶ� ��.
  
);


select * from member;
--insert into member(userid,hobby) values('hong','���');
--cannot insert Null into("bit"."Member"."NAME")
insert into member(userid,name) values('hong','ȫ�浿'); --hobby �� ���̺��� ����������� ���� ���� �����Ƿ� null�� ��
--hobby �÷��� �����ʹ� null �ڵ�����...
insert into member(userid,name,hobby)
values('kim','�达','����');

--������ �ݿ��� �ϰ� ������
commit; --�� ����� ��.   ������ �������� �ʴ��� ���������� ���� �����Ͱ� �ȴ�. 
--����Ŭ�� �⺻������ commit�� ����� �Ѵ�.  auto commit �� �ƴ� �̻�.  

--����(comm)�� ���� �ʴ� ��� ����� ������ ����ϼ���.
--0�� ������ ��� (�޴� ���ǿ� ����)
--comm �÷��� �����Ͱ� null�ΰ͸� !!

--select *from emp where comm = ; ���� ����

--null�� �񱳴� (is null)
select * from emp where comm is null; --��� null�� �ֵ鸸 �̾Ƴ���� �����̴�. 

--���� (comm)�� �޴� ��� ����� ������ ����ϼ���.
select * from emp where comm is not null;   -- null�� �ƴ� ��� �ֵ��� �������°�. 

--��� ���̺��� ���, �̸�, �޿�, ���� , �� �޿��� ����ϼ���.
--�ѱ޿�( �޿� +����)
select * from emp;

select empno, ename, sal, comm, sal + nvl(comm,0) as "�ѱ޿�"
from emp;

--isnull, is not null, nvl(),nvl2()  ��׸� �˰� �־����


--POINT >> null 
--1. null ���� ��� ������ �� ����� null �̴�.     ���ص� �� null ����. 
--2.�� ���� �ذ��ϴ� ��� : nvl() , nvl2()   >> null ���� replace ġȯ....
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

select null + 100 from dual; --null
select 'ȫ�浿' || null from dual; --ȫ�浿  �����̱� ������ null�� �ǹ̰� ����.   �����̶� �ٸ������
select 100 + nvl(null,0) from dual;  --null ���� 0���� �ٲ㼭 �����Ѵ�.  �׷��� 100 �� ���´�.

select comm , nvl(comm,1111) from emp;

--������ ���������ϴ� ����� ���� ���� ���ι��̴�.

--����� �޿��� 1000�̻� �̰� ������ ���� �ʴ� ����� ���, �̸�, ����, �޿�, ������ ����ϼ���
select empno, ename, job, sal,comm
from emp
where sal >= 1000 and comm is null;


---------------------------------------------------------------------------------------------------

--DQL( data query language) : SELECT (60%) ���� ���� �ִ°�. �����͸� ������ ���� ���
--DDL : create, alter, drop (��ü(���̺�) ����, ����, ����) (30%)
--DML : insert , update , delete (������ ����) (10%)    ��׸� Ŀ���Ѵ�.
--���ο� �����Ͱ� ���ų� ����ǰų� ����ų� �ϴ°�.

--java : class Board{ private boardno int}
--Oracle : create table Board(boardno number not null)    

create table board(
 boardid number not null , --���� ������ �����͸� �Է��Ҽ� �ְ�, �ʼ� �Է� �ؾ��Ѵ�.  not null  �� ������� �̶�� �Ѵ�.   ex)����������� �ֹι�ȣ��~ �Դϴ�. �̷���
 title varchar2(20) not null , --�ѱ� 10�� , ������, Ư������, ������ 20��   �׸��� �ʼ��Է�
 content varchar2(2000) not null, --�ʼ��Է�
 hp varchar2(20) --default null���( �ʼ� �Է��� �ƴϴ�)     hp varchar2(20)  null    �� �Ȱ���.
);

select * from board;
--desc board;

--DML(������ ���۾�) �� �ݿ� ���θ� ����
--insert
--update(����)
--delete 
--�ݵ�� �� ����� �ݿ� ����, ��� ���� �ǻ� �����ؾ���
-- commit(�����ݿ� �Ұž�)
-- rollback(�����ݿ� ���)

insert into board(boardid, title, content)
values(100,'����Ŭ','�� �Ҹ��ѵ�');

commit;
select* from board;

insert into board(boardid, title, content)
values(200,'�ڹ�','�׸���');

select * from board;
rollback; --������ ������ Ŀ�� or �ѹ� .. 

insert into board(boardid, title, content)
values(200,'�ڹ�','�׸���');

select * from board;
commit;

--�������... �ۼ��ϴ� ������ �������. 
-------------------------------------------------------------------------------------------------------20200401


select sysdate from dual;


insert into board(boardid, title, content,hp)
values(300,'����','������','010-0000-0000');

select* from board;
commit;

select boardid, nvl(hp,'EMPTY') as "hp"  from board;   --hp�÷����� �ΰ��� ������  ����Ƽ�� �ٲ��. 

--���ڿ� �˻�
--�ּҰ˻� : [��] �Է� >> ���ﵿ , ���� , ....(Like ���� �˻�) ������ �͵��� �̾Ƴ��� �˻�
--���ڿ� ���� �˻� ������ : like
--like �����ڸ� �����ִ� �ְ� �ִ�. (���ϵ� ī�� ���� ( % : ��� ��,  _ : �ѹ���) ����

select ename
from emp
where ename like '%A%';   --%A% A��� �ܾ ã�µ� ���̳� �ڿ� ����� �͵� ����� ����.   ename �÷��� ������ �߿��� A�� ����ִ� ��� ���ڸ� ã���ּ���.   

select ename
from emp
where ename like '%a%';  --���ڿ� ������ �˻������� �����ϼ� ��ҹ��� �����Ѵ�.

select ename
from emp
where ename like 'A%'; --�̸��� ù���ڰ� A�� ����� ã�ƶ�.

select ename
from emp
where ename like'%S'; --�̸��� ������ ���ڰ� S�� ���

--select * from member where name like '%���ѹ�%';  �ѱ۵� ��

select ename
from emp
where ename like '%LL%';  --LL�� �� ��� ���ڸ� �����Ͷ�         LL�� �پ� �־�߸���!

select ename
from emp
where ename like '%L%L%';   --    L�� 2�� �ֱ⸸ �ϸ� ��.   �˻������� �갡 �� �о���

select ename
from emp
where ename like '%A%A%';   --ADAMS  �� ����

select ename
from emp
where ename like '_A%';   --ù���ڴ� ����� �͵� ������� �ι�°���ڴ� �ݵ�� A�� �;߸� ��.     = �ι�° ���ڰ� A�� �����ϴ� ��� ��     - :�ѹ���    �� �ؼ��Ѵ�.

--���� ǥ����
--regexp_like

select * from emp where regexp_like(ename,'[A-C]');
--���� ǥ�� ���� 5�� ����� (���� ī�� ������ �ø���..)

------------------------------------------------------------------------------------------

--������ �����ϱ� 
--order by �÷���   :  ���ڿ�, ����, ��¥   ���� ������
--�������� : asc : ������ (default)
--�������� : desc : ������

select * 
from emp
order by sal;    --default �������� ���� ��  

select *
from emp
order by sal asc;    --���� ��� ����

--�޿��� ���� �޴� ������ �����ؼ� ����ϼ���.

select *
from emp
order by sal desc;   --�޿��� ������� ����  ���� ��������.


--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի��� �����͸� ����ϼ���.
--( ���� �ֱٿ� �Ի��� ������)

select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
select ��                              3
from ��                                1
where ��                              2
orderby ��  �̶�� �θ���.      4    (select ����� ����)>> DB ���� ���� �۾�

�ҷ�����, �ɷ�����, �÷� ���ϰ�, �����Ѵ�.
1-2-3 ���� �ؼ� ���� ������ 4�� ���̴� ������� �ص� ����. 
*/

--������ �˸� �ؼ��ϱ� ���ϴ�.
select empno, ename , sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc; 

--order by �÷��� desc , �÷��� asc , �÷��� desc    �̷��� ������ ���⵵ ��    ********************************������ ���� ����. �Խ��� �ڵ��.
--where ���� �ɷ����� ������ ���������ϴ�

select job ,  deptno
from emp
order by job asc, deptno desc;     --grouping ����
--�굵 �׷����̴�.  job�� ���ĺ������� ���� �Ѵ����� �� �׷�ȿ��� deptno �� ���� ���ڸ��� ������������ �����Ѵ�. 

-------------------------------------------------------------------------------
--������
--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�⺻: �ߺ��� ����) 
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�ߺ��� ���) 
--���̺� �ִ� �����Ϳ� ���̺� �ִ� ������ ... �� ���̺��� ������ �鿡 �ٸ� ���̺� �����͵��� ���� �ڷ� �ٴ´�       

create table uta (name varchar2(20));
 insert into uta(name) values('AAA');
 insert into uta(name) values('BBB');
 insert into uta(name) values('CCC');
 insert into uta(name) values('DDD');
    commit;
    
    select * from uta;
    
create table ut (name varchar2(20));
 insert into ut(name) values('AAA');
 insert into ut(name) values('BBB');
 insert into ut(name) values('CCC');
  
    commit;
    
    select * from ut;
       
  --union   --ut �� �濡 uta�� �����  --�ߺ����� �����ϰ� ���ͼ� 4���� ����
  select * from ut
  union
  select * from uta;
  
  --union all    --�ߺ������� ���δ� ���´�.
 select * from ut
  union all
  select * from uta;
  
  --union------------------------------------------------------------------�����Ǵ� �÷��� Ÿ�԰� ������ ������ �� ��ĥ�� �ִ�.
  --1. ���� �Ǵ� �÷��� Ÿ���� �����ؾ� �Ѵ�.*****************************************************************
  select empno, ename from emp    --emp�濡 dept�� �����. 
  union
  select dname , deptno from dept;
--expression must have same datatype as corresponding expression  ������ �÷�Ÿ���� �ƴ϶� ���� ����. 


  select empno, ename from emp   
  union
  select deptno , dname from dept;
  --�÷��� Ÿ���� �����ؼ� �ȴ�.
  
  --2. �����Ǵ� �÷��� ������ �����ؾ� �Ѵ�.    (null �� ����ȴ�.. ������)****************************************
  select empno, ename, job, sal from emp
  union
  select deptno, dname, loc from dept;
  --query block has incorrect number of result columns       emp ���� 4���ε� dept�� 3���� ������ ���� �׷���.
 
  select empno, ename, job, sal from emp
  union
  select deptno, dname, loc, null from dept;    --null �� �־ ������ �����ش�.
  
  --�ǹ� >> subquery (in line view)   �ǹ������� �̷������� ���δ�.  ���Ͽ� �� ����� ������ ��� ����. 
  select empno , ename
  from (
            select empno, ename from emp   
            union
            select deptno , dname from dept
          ) order by empno desc;
          
  --������� �ʺ� ������......�ǹ�������.....���̺� �Ѱ�...(�������̺�)
  
  ---------------------------------------------------------------------���⼭ ���� ����Ŭ�� �Լ� ����-------------------------------------------
  --����Ŭ �Լ�(���� ���� : 50 page)
  
  /*
 1.2.2 ���� �� �Լ��� ���� 
 
 1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�. 
 2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�. 
 3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�. 
 4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.  (to_char(), to_number(), to_date())
 5) �Ϲ����� �Լ� : NVL, DECODE 
 
  */
  /*
  �ѱ� ����.......�����ϰ� ������ �ȴ�.  ���ĺ��� ���� 
  
  select * from SYS.nls_database_parameters;
  --NLS_CHARACTERSET	AL32UTF8  �ѱ� 3byte �ν�
  --KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���) �׷��� �׳� ��밡���� ����Ʈ ���� �ø��� ����!
  select * from SYS.nls_database_parameters where parameter like '%CHAR%';
  */
  
  --���ڿ� �Լ�
  
  select initcap('the super man') from dual;     --The Super Man    
  
  select lower('AAA') , upper('aaa') from dual;    --aaa	AAA
  
  select ename, lower(ename) as "ename" from emp;    --�÷�������� �ҹ��ڷ� ���´�.
  
  select * from emp where lower(ename) = 'king';  --7839	KING	PRESIDENT		1981-11-17 00:00:00	5000	3500	10
  
  --���ڿ� ����
  
  select length('abcd') from dual; --4
  
  select length('ȫ�浿') from dual; --3
  
  select length(' ȫ a�� ��') from dual;  --7   ����� ���ĺ� �ѱ� �� ������ ��
  
  --���� ������ ||
  --concat()
  
  select 'a' || 'b' || 'c'  as "data" from dual;    --abc
  
  select concat('a','b','c') from dual;     --����
    select concat('a','b') from dual;   --ab     
    --concat �� �ΰ��� ���ڸ� �����ִ� �Լ��̴�.
    
    select concat(ename,job) as "concat" from emp;  --SMITHCLERK ....    
     select ename || '      '  || job as "concat" from emp;  --SMITH      CLERK   ....       --��� �����ϴ�.. ����� ���鵵 ���� �� �ִ�.
     
--�κ� ���ڿ� ����
--���� ����ѵ� �ٸ���. 
--java(substring)
--oracle(substr)

select substr('ABCDE',2,3)  from dual;  --BCD              2��° ���� 3���̾ƶ�
select substr('ABCDE',1,1)  from dual;  --A   �ڱ��ڽ�   1��°���� 1��.
select substr('ABCDE',3,1)  from dual;  --C                  3��° ���� 1��.
  
select substr('ABCDE',3) from dual;     --CDE               �Ѱ��� �־����� �־��� ������ �� �����´�. 
  
select substr('ABCDE',-2,1)  from dual;--D                   - �� �ڿ��� ���� ����.     �ڹٿ����� �ڿ��� ���� �ȵ����� ��� �ȴ�.
select substr('ABCDE',-2,2)  from dual;--DE                 

/*
������̺��� ename �÷� �����Ϳ� ���ؼ� ù ���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� ����ϼ���.
��, �� ����� �ϳ��� �÷����� ����ϼ���. 
�÷��� �̸��� fullname
ù ���ڿ� ������ ���� ���̿� �����ϳ��� �־ ����ϼ���.
*/

select lower(substr(ename,1,1)) || '  ' || substr(ename,2) as "fullname"
from emp;

--lpad , rpad (ä���)

select lpad('ABC' ,10, '*') from dual; --*******ABC
select rpad('ABC',10, '^') from dual; --ABC^^^^^^^

--Quiz   dual �� ����
--����� ���: hong1006 
--ȭ�� : ho****** ����ϰ� �;��. ( ����� �ױ��ڿ���  : 1004 > 10**)
select  rpad(substr('hong1006',1,2),length('hong1006'),'*') 
from dual; 
--rpad �� �Ķ���͸� �Լ��� �ϳ� �� ä���ذŴ�. 

select  rpad(substr('1004',1,2),length('1004'),'*') 
from dual;
--rpad �� �Ķ���͸� �Լ��� �ϳ� �� ä���ذŴ�. 

--emp ���̺��� ename �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� ������ *�� ǥ���ϼ���.  table �� ����
select rpad(substr(ename,1,1),length(ename),'*') as "ename"
from emp;

create table member2(
     id number,
     jumin varchar2(14)
     );
     
insert into member2(id, jumin) values(100,'123456-1234567');     
insert into member2(id, jumin) values(200,'234567-1234567');
commit;

select * from member2;

--�ϳ��� �÷����� ������� ���
--100 : 123456-*******
--200 : 234567-*******
--�÷����� "juminnumber"

select id || ' : ' ||  rpad(substr(jumin,1,7),length(jumin),'*')  as "juminnumber"
from member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim �Լ� 
--[������ ���ڸ� ������]
select rtrim('MILLER','ER') from dual;          --MILL    --ù��° �Ķ���Ϳ��� �ι�°�Ķ���͸� �����ʿ��� ã�Ƽ� ������.
select ltrim('MILLLLLLER','MIL') from dual;  --ER        

select '>' || rtrim('MILLER         ',' ') || '<' from dual;     -- >MILLER<           --�����ʿ� �ִ� ������ �����.

--ġȯ�Լ�(replace)
select ename, replace(ename, 'A', '�Ϳ�')
from emp;
--SMITH	SMITH
--ALLEN	�Ϳ�LLEN

----------���ڿ� �Լ�(END)------------------------------------------------------------------------------------------------------------------------

--[���� �Լ�] 
--round(�ݿø��Լ�)
--trunc(�����Լ�)
--mod()   ������ ���ϴ� �Լ� 


--round
--        ...  -3 -2 -1  0  1  2  3 ...
select round(12.345,0) as "r" from dual;  --12       �����κи� ���ܶ�  !!!!
select round(12.567,0) as "r" from dual;  --13
select round(12.345,1) as "r" from dual;  --12.3    �ι�° �Ķ���Ͱ� 1�̸�   �Ҽ������� ù��° �ڸ� ���� ���ܶ�!!
select round(12.567,1) as "r" from dual;  --12.6    �ϳ� �ڸ��� �Ҽ��� �ι�°�ڸ��� �ݿø��Ǿ 12.6 �� ���´�.

select round(12.345,-1) as "r" from dual; --10      �����ڸ����� ����� ���� �ڸ��� �ݿø� �Ѵ�.
select round(15.345,0) as "r" from dual;   --20     �׷��� ��� 20
select round(12.345,-2) as "r" from dual;  --0       ��ȯ�ڸ� ���� ��� 0 �� ���´�.



--trunc(�����Լ�)
select trunc(12.345,0) as "r" from dual;  --12       
select trunc(12.567,0) as "r" from dual;  --12
select trunc(12.345,1) as "r" from dual;  --12.3    
select trunc(12.567,1) as "r" from dual;  --12.5    

select trunc(12.345,-1) as "r" from dual; --10     
select trunc(15.345,-1) as "r" from dual; --10    
select trunc(12.345,-2) as "r" from dual; --0       


--mod()  ���������ϴ� �Լ�
select 12/10 from dual;                          --1.2    ���� 1  ������ 2
select mod(12,10) from dual;                  --2      �������� ��������.  

select mod(0,0) from dual;                      --0     ���⼱ ��������. �ڹٿ����� ���� ������!

---------------------------------------------------�����Լ� [END]------------------------------------------------------------------
--[ ��¥ �Լ� ] 
select sysdate from dual;  --2020-04-01 12:16:15
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';    ������ ����ϸ� ����.

--��¥ ���� (POINT)
--Date + Number >>  Date
--Date - Number >>  Date 
--Date - Date >> Number   (�ϼ��� ���´�)      �ټ��ϼ� ������ ���Ҷ� ����....



select hiredate from emp;

select MONTHS_BETWEEN('2018-01-01','2010-01-01') from dual;      --96     96 ���� ���̳���~!

select MONTHS_BETWEEN(sysdate,'2010-01-01') from dual;              --123      ��� �� ��������.
 
select MONTHS_BETWEEN(sysdate,'2010-01-15') from dual;      --  122.565055630227001194743130227001194743       �̷��� �����µ� �߶󳻰ų�  �ݿø��ϰ� ������ ���� �Լ��������

select round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) from dual;    --122.6

select trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) from dual;      --122.5

--POINT
--��¥ ������ ���ڿ��� ��¥�� �ٲٴ� �Լ�(to_date()) 
select to_date('2020-04-01') + 100 from dual;   --2020-07-10 00:00:00
select to_date('2020-04-01') - 100 from dual;   --2019-12-23 00:00:00
select sysdate + 1000 from dual;   --2022-12-27 12:26:39 

--Quiz
--1.��� ���̺��� ������� �Ի��Ͽ��� ���糯¥���� �ټӿ����� ���ϼ���
--�� �ټӿ����� �����κи� ����ϼ���(�ݿø� ���� ������)

select ename, hiredate,  trunc(MONTHS_BETWEEN(sysdate, hiredate),0) as "�ټӿ���"
from emp;


--2. �Ѵ��� 31 �� �̶�� ���ؿ��� �ټ� �ϼ��� ���ϼ��� (�ݿø� ���� ������)
--�Լ� ������� ���� >> (��¥ - ��¥ >> 150 ��)


--�̰� ���� �Ѱ�
select trunc(trunc(sysdate - hiredate,0)/31) as "�ټӿ���"
from emp;

--������ ���
select trunc((sysdate-hiredate) /31,0) as "�ټӿ���"
from emp;

------------------��¥ �Լ�[END]----------------------------

--[��ȯ�Լ�] : TODAY POINT
--����Ŭ : ����, ����, ��¥
--to_char() : ���� -> ���� (1000 -> $1000)   ���ڸ� ���� ���·�...� ���յ� �������� �ϱ� ���� ������� ���δ�.    *************************************�̰� ���� ���� ����. 
--                ��¥ -> ���� (2020-01-01 -> 2020��01��01��) format

--to_date() : ���� -> ��¥ >>  select '2020-12-12' + 100
--                                        select to_date( '2020-12-12') + 100

--to_number() :���� -> ���� (���������� �ڵ� ����ȯ ������)

select '100' + 100 from dual;   --200
select to_number('100') + 100 from dual;   --���������� �̷��� ���ְ� �ִ�. 

--to_number  (���� ->����) �ڵ� ����ȯ
select '1' + 100 from dual; --101
select to_number('1') + 100 from dual;

--to_char() : format >> ����, ��¥(���Ĺ���)
select to_char(sysdate) || '��' from dual;  --2020-04-01 12:55:34��

--pdf 69page (���Ĺ��� ǥ)
select sysdate,
to_char(sysdate,'YYYY') || '��' as "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
from dual;
--2020-04-01 12:58:03	2020��	TWENTY TWENTY	04	01	��   �̷��� ���´�.

--�Ի� ���� 12���� ������� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���.
select empno as"���", ename as"�̸�",
to_char(hiredate,'DD') as "�Ի���",
to_char(hiredate,'YYYY') as "�Ի�⵵",
to_char(hiredate,'MM') as "�Ի��"
from emp
where to_char(hiredate,'MM')  = '12';

select to_char(hiredate,'YYYY MM DD') from emp;   --1980 12 17 �̰� ���ڿ��̴�.

select to_char(hiredate,'YYYY"��" MM"��" DD"��"') from emp;    --1980�� 12�� 17��     Ư���� ǥ������  'YYYY"��" MM"��" DD"��"'     ���־� �Ѵ�.

--to_char() ���� -> ���ڷ�( ���Ĺ���)
--pdf ���� 71 page ǥ
--100000 >> ��� >> $1,000,000( ����)

select '>' || to_char(12345,'999999999999') || '<' from dual;
-->        12345<

select '>' || to_char(12345,'0999999999999') || '<' from dual;
--> 0000000012345<

select '>' || to_char(12345,'$9,999,999,999') || '<' from dual;
-->        $12,345<

select sal , to_char(sal,'$999,999') from emp;
--800	     $800
--1600	   $1,600



----HR �������� ��ȯ-------------------------------------------------------------------------------------------------------------------------------------��������
--�̷��� �� ��� HR ���� ��Ű��? ���� �� �� �ִ�.
select * from employees;

/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ�
fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� 
����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ���� ����ϰ� 
�� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select concat(first_name,last_name) as "full name",
to_char(hire_date,'YYYY MM DD') as"�Ի�����",
salary,
salary *12 as "����" ,
 to_char((salary *12)*1.1,'$9,999,999,999') as "�λ��",
 hire_date
from employees
where  to_char(hire_date,'YYYY')  >= '2005' 
order by "����" desc;    --select �� �ִ� alias�� ����Ҽ� �ִ�.


--bit �������� ��ȯ---------------------------------------------------------------------------------------------------------------
----- ��ȯ�Լ�( to_char(), to_date() , to_number()) -----------------------------------------

--[�Ϲ��Լ�(���α׷������� ����)]
--nvl() ,  nvl2() >> null ó�� ���
--decode() �Լ� >> java if��(switch)
--case() �Լ� >>  java if��(switch)

select * from emp;

select comm, nvl(comm,0)
from emp;

create table t_emp(
  id number(6) , --6�ڸ� ������
  job varchar2(20)
);


insert into t_emp(id,job) values(100,'IT');
insert into t_emp(id,job) values(200,'SALES');
insert into t_emp(id,job) values(300,'MGR');
insert into t_emp(id,job) values(400);
insert into t_emp(id,job) values(500,'MGR');


select id, decode(id,100,'�λ��'    --���ٷ� ���� �򰥸��ϱ� ������ ���� ������ ���̸� ����.
                                   ,200,'������'
                                   ,300,'ȸ���',
                                    '��Ÿ�μ�') as "�μ�"   
from t_emp;



select * from t_emp;
commit;


select deptno, decode(deptno,10,'�λ��'
                                          ,20,'������'
                                          ,30,'ȸ���',
                                          '��Ÿ�μ�') as "�μ�"    --�μ���� �÷��� �����,    �ڹٶ�� if(10 == "�λ��") ó�� �ɷ����� else ��Ÿ�μ��� ������ ����� ���Ҵ�.    
from emp;

--Quiz
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

/*
t_emp2 ���̺��� id, jumin �����͸� ����ϵ� jumin�÷��� ���ڸ��� 1�̸�
'����' ��� 2�̸� '����' 3�̸� '�߼�' �̶�� ����ϸ� �ȴ�.   �׿ܿ��� '��Ÿ'

*/
select id, decode(substr(jumin,1,1),1,'����' , 
                                                 2,'����',
                                                 3,'�߼�',
                                                  '��Ÿ') as "gender"   
from t_emp2;

---------------------------------------------------------------------Ŀ������.
/*
2�� Ŀ�� (2��)
if ���ȿ� if �� (��ø ) >> decode
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
�μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
*/
select empno,ename, decode(deptno,20 ,
						   decode(ename,'SMITH','HELLO','WORLD') , 
						  'ETC')
from emp;



--CASE ��
--java switch
/*
  CASE ���ǽ� WHEN ���1 THEN ���1
                    WHEN ���2 THEN ���2
                    WHEN ���3 THEN ���3
                    ELSE ���4
  END "�÷���"                  

*/

create table t_zip(
  zipcode number(10)

);

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(33);
insert into t_zip(zipcode) values(41);

select * from t_zip;

commit;

select '0' || to_char(zipcode) ,
          case zipcode when 2 then '����'
                              when 31 then '���'
                               when 32 then '����'
                                when 41 then '����'
                                else '��Ÿ����'
        end "regionname"
 from t_zip;       


/* emp
������̺��� ����޿��� 1000�޷� ���ϸ� '4��'
1001�޷� 2000�޷� ���ϸ� '3��'
2001�޷� 3000�޷� ���ϸ� '2��'
3001�޷� 4000�޷� ���ϸ� '1��'
4001�޷� �̻��̸� 'Ư��' �̶�� �����͸� ����ϼ���

1.case �÷��� when ��� then ���     (= ������ ������ ó���Ҷ� ���°�)
                    when ��� then ���
                     when ��� then ���
                     
2. ������ �϶���
  case when �÷��� ���� �񱳽� then 
         when �÷��� ���� �񱳽� then
         when �÷��� ���� �񱳽� then
*/

select sal ,
          case when sal<= 1000 then '4��'
                              when 31 then '3��'
                               when 32 then '2��'
                                when 41 then '1��'
                                else 'Ư��'
        end "regionname"
 from emp;       
 
 
 -----------------------------------------------------------
--�����Լ� 
--�����Լ�
--��¥�Լ�
--��ȯ�Լ� (to_char ,to_date , to_number)
--�Ϲ��Լ� (nvl() , decode() , case())
------------------------------------------------------------
 --[�����Լ�]  page 75
 /*
 1. count()    > row �ټ�, count(�÷���) >> ������ �Ǽ�(null �� �������� �ʴ´�.)
 2. sum()     
 3. avg()
 4. max()
 5. min()
 ���....
 
 �����Լ�
 1. �����Լ��� group by ���� ���� ���
 
 2. ��� ���� �Լ��� null ���� �����մϴ�. 
 
 3.select ���� �����Լ� �̿� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ��� �ؾߵȴ�.
 
 */
 
 select count(*) from emp; --14��
 select count(comm) from emp; --6 �� ( null ���� ����)
 select count(empno) from emp; --14
 
 select count(nvl(comm,0)) from emp; --null >> nvl()
 
 --�޿��� ��
 select sum(sal) as "�޿���" from emp; --29025
 
 select avg(sal) as "��ձ޿�" from emp; --2073.214285714285714285714285714285714286
 
 select round(avg(sal),0) as "��ձ޿�" from emp;  --2073
 
 --������� ȸ�� �� ���� �󸶳� ���� �ǰ� �ֳ�? ( ������ ����� ����?)
 select trunc(avg(comm),0) from emp;   --721   �޷�
 select trunc(sum(comm) /6) from emp; -- �����(6��)
 
 --���� ..����...������.......
 
  select trunc(avg(nvl(comm,0)),0) from emp;  --309�޷�
  select trunc(sum(comm) /14) from emp;    
  
  --ȸ���� ������ (��ü ������� ������...309)
  --ȸ���� ������ (�޴� ����� ���ؼ��� å���Ѵٸ� 721)
  
  
  --�׻� �����͸� �޴� �÷��� null���� �ִ��� Ȯ���غ����Ѵ�.
  --����: �ڵ�
select count(*) from emp where comm is null;  --8
  
select count(*) from emp where empno is null;   --0

select max(sal) from emp;

select min(sal) from emp;

--POINT 
select empno , count(empno) from emp;  --empno�� 14��, count() �� 1�� �̶� �ȵȴ�.
--not a single-group group function
select sum(sal) , avg(sal) , max(sal), min(sal), count(sal), count(*) from emp; --row �ϳ��� ��������� ���� ����.


--�μ��� ��� �޿��� ����ϼ���
--not a single-group group function
select deptno , avg(sal) from emp;


select deptno , avg(sal)
from emp
group by deptno;

--������ ��� �޿��� ���ϼ���.
select job, avg(sal)   --�տ� job�� �Ⱥ��̸� � �������� ������� �˼� �����ϱ� �ٿ��� �Ѵ�.
from emp
group by job;

select * from emp;
--������ ��� �޿�, �޿���, �ִ�޿�, �ּұ޿�, �Ǽ��� ����ϼ���.
select job, trunc(avg(sal)), sum(sal) , max(sal), min(sal), count(sal)
from emp
group by job;   --�갡 �ڵ� ���� �ȳ����� ������ �����ִµ� ���� �����ϸ� �ʰ� �˰���..?


select job, avg(sal), sum(sal) , max(sal), min(sal), count(sal)
from emp;


/*
grouping ����

distinct �÷���1 , �÷���2
order by �÷���1, �÷���2
group by �÷���1 , �÷���2, �÷��� 3   

������ ���� ���̴�.

*/
  
--�μ��� ,������ �޿��� ���� ���ϼ���.
 select deptno, job, sum(sal) ,count(sal)
 from emp
 group by deptno, job
 order by deptno;
 
--�μ� ��ȣ ��������, �׾ȿ� ������ �׷����Ѵ㿡 �� �μ��� �������� �հ踦 ���ߴ�. �´�.

/*   �ϴ��� ������ from where �׸��� group by �� ���´�.  �׸��� select �Ѵ㿡 order by �� �����Ѵ�.    (having) ���� ���� ����

�ϳ��� ���̺��� ������� ���� �ִ� ����...


select             5
from              1
where             2
group by         3
having             4     (ȥ�ڸ����� group by �� �־����.   group by �� �������̶�!)
order by          6

*/
-----------------------------------------------------------------------------------------------------20200402
--Quiz    ������ ��� �޿��� 3000 �޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���.

--group by ������ >>having �� 
--where avg(sal) >= 3000 ������...(x)
select job, avg(sal) as "��ձ޿�"
from emp
group by job   -- �� �������  ������ �Ŵ� ��   �װԹٷ� having!!!!!!
having avg(sal) >= 3000 ;  
--PRESIDENT	5000
--ANALYST	3000

--from ������ >>where           *******
--group by ������ >> having    *******

--from ������ �����ε� where�������� ������ group by �� �ȵǴϱ� ������.
--������ �ѹ��� �ٸ����� ���� ���ݾ� �����غ��鼭 ����°� �� ����!!!!!!!!!!!!!!!!


/* ������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻��� ������� ����� ����ϼ���
--�޿��� ���� ���� ������ ����ϼ��� */

select  job, sum(sal) as "�޿���"
from emp
where comm is not null
group by job  
having  sum(sal) >= 5000
order by sum(sal);

select  job, sum(sal) as "sumsal"
from emp
where comm is not null
group by job
having  sum(sal) >= 5000  --���⿡�� alais ������ �ü� ����
order by "sumsal";  --���⿡�� alais ������ �ü� ����

/* ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,�ο��� , �޿��� ���� ����ϼ��� */

select * from emp;

/* ������ Ʋ����. 
select count(deptno), count(ename), sum(sal)
from emp
group by deptno
having count(deptno) > 4 ;
*/

select deptno, count(*), sum(sal)
from emp
group by deptno
having count(*) >4;



select deptno, count(*) as "�μ��� �ο���"  ,sum(sal) as "�μ��� �޿��� ��"
from emp
group by deptno
having count(*) > 4;


/* ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ�����(salesman) �� �����ϰ� �޿������� �������� �����ϼ��� */

select job, sum(sal) as "�޿���"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000;

select job , sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000    --having���� salesman �� �ɷ��� ������,  ������� �������� �ʴ°� ���������� ����.
order by "sumsal" desc;

----------------------------------------------------------------------------------------------------------------------------------------JOIN
--  join    (pdf 85 page)    
-- ������ ������ ���̽� (RDBMS)    relations database management system   >> (ORDB)  ������� ���� �ʴ´� >> Framework (��ü������ �� �� �ִ� : JPA, Mybatis ) >> noSQL : cassandra , MongoDB  
-- ������ ������ ���̽� (RDBMS)    relations database management system �̰� �츮�� �ϰ� �ִ°�.

--���� ������ ���̺��� ������ �̾ƿ��� ��~!!!!!!!!!
--�ϳ��� ���̺� ��� ������ �� �־ ���� �Ǿ�����..  ������ �����Ҷ� ���� Ƚ��� ���̰� ����.  
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

--JOIN �� ������ ����������. --�Ի���� ������.. 
--1.����� (equi join)  >> [inner] join    inner�� ����������
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 �� ���� �ϴ°�. 
--JOIN ����
--1. SQL JOIN����(��ǰ...)
--2. ANSI ����(����)(ǥ��)

--SQL JOIN ����   
select *
from m, s
where m.m1 = s.s1;  -- ���̺�����  ���� �����ͼ� ���� ���δ�. null ���� ������ �ʴ´�.

select m.m1, m.m2, s.s2    --m1�� s1�� �̹� �����ϱ� s1�÷��� ���� �����´�.
from m, s
where m.m1 = s.s1;


--ANSI ����  (����)
--where (from���� ������) 
--where join ���ǰ� �Ϲ� ������ ȥ���ϸ� ȥ��������. 
--�׷� join �� ������ �и�����!    >>   on ��
select *
from m inner join s    
on m.m1 = s.s1;

select m.m1 , m.m2, s.s2
from m join s  -- inner ���� ����    
on m.m1 = s.s1;

--�����ȣ, ����̸�, ����μ���ȣ, ����μ����� �˰� �;��    
--join ���̺� ����Ī �ο� >> �� �̸����� ����
select e.empno , e.ename , e.deptno , d.dname
from emp e join dept d
on emp.deptno = dept.deptno;

-join (2, 3,......) ������ ���̺� �����Ҽ� ���� 

--SQL JOIN ����(��õ���� �ʴ� ����)
select m.m1 , m.m2 , s.s2 , x.x2
from m , s, x
where m.m1 = s.s1 and s.s1 = x.x1;
-- a == b , b == c  , a == c 

--Ansi ����
select m.m1 , m.m2 , s.s2 , x.x2
from m join s on m.m1 = s.s1
            join x on s.s1 = x.x1;
            
 ------HR �������� �̵�-----------------------------------------------------------------------     

select * from employees;
select * from departments;    --department_id
select * from locations;     --location_id


--Quiz  1. ���, �̸�(last_name) , �μ���ȣ, �μ��̸� ����ϼ���.

select   e.employee_id , e.last_name , e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--106 �� 
--107���ε� why >> 106���� ������??   �װ��� null ���� ��� ���� �ʱ� �����̴�. 
select count(*) from employees;    --107
--join �� null�� �������� �ʾƿ�.

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;    --178   �� ����� �μ� id >> null
--178�� ����� �μ�id >> NULL
--��������� �ذ� �Ұ�(outer join) ����ϸ� �ذᰡ��...

--Quiz 2.���, �̸�(last_name), �μ���ȣ, �μ���, �����ڵ�, ���ø� �� ����ϼ���.



select e.employee_id,
         e.last_name,
         e.department_id,
         d.department_name,
         l.location_id,
         l.city
from employees e join departments d on e.department_id = d.department_id
                           join locations l on d.location_id = l.location_id;

                       
                               
                               
----------------------------BIT�� �̵�-----------------------------------------------------                 
--bit ����--

--2. �� ����(non -equi join) => �ǹ̸� ���� => ����ΰ� ������ �Ȱ���
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� 1:1 ���ε��� �ʴ� ���

select * from emp;
select * from salgrade;

select e.empno , e.ename , e.sal , s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal; 

----------------------------------------------------------------------------------------------
--3. outer join (equi join + null)  
--outer join ( �� ������ �ľ�)  >> �ְ� �Ǵ� ���̺� �ִ� ���� ������ �������� 


-- ���� 3����
-- left outer join (���� ����)
-- right outer join (������ ����)
-- full outer join ( ���� ���� + ������ ���� >> union)

--left [outer] ���� ����   join
--left join
--right join

select *
from m join s
on m.m1 = s.s1;

select *   --�������� ���� �����͸� �����ͼ� �ٿ��ش�.     
from m left outer join s
on m.m1 = s.s1;

select *   --�굵 ����������..
from m right outer join s
on m.m1 = s.s1;

--left , right outer union  �ߺ������� �����͸� �� �����´�. ���ʰ� ���� �ٴµ�..   
select *   
from m full outer join s
on m.m1 = s.s1;

--------------------------------------------------HR �������� ����--------------------------------------------
--������ �ȳ��Դ� 1��  null�̶�....�ȳ��� �Ѹ��� �̾ƺ���.
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
ORDER BY e.EMPLOYEE_ID;

----------------------------------------------------Bit �������� ����------------------------------------------------------------
--self join (�ڱ�����) -> �ǹ� -> ����(�����)
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���     ex)�Ŵ��� ã�� ����.
--���� (���̺� 1�� �̻� )
--���̺��� ����Ī�� �޸��ؼ� ����� �� �ִ�. 

--�����ڸ� ���� ���̺� ���� �ʿ䰡������? �������� ������ ������ �ʿ䰡 ����..   ���������� �������� �����̴�. 

select e.empno , e.ename ,m.empno, m.ename
from emp e join emp m 
on e.mgr = m.empno;

--���� : 14���� ����� ������  >> 13���� ����.   
select * from emp;

select e.empno , e.ename ,m.empno, m.ename
from emp e left join emp m 
on e.mgr = m.empno;
--�̰� 14�� �ٳ��´�.  




----------------------------------------------------------------------------JOIN test----------
select * from emp;
select * from dept;
select * from salgrade;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname  
from emp e inner join dept d    
on e.deptno = d.deptno;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.


select e.ename, e.job, e.deptno, d.dname 
from emp e inner join dept d   
on e.deptno = d.deptno 
where d.loc = 'DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.

SELECT e.ename, d.dname 
FROM emp e join dept d 
on e.deptno = d.deptno and ename LIKE '%A%';

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.

select e.ename, d.dname  , e.sal
from emp e inner join dept d    
on e.deptno = d.deptno 
where e.sal >=3000;
 
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.

select e.ename, d.dname  , e.job
from emp e inner join dept d    
on e.deptno = d.deptno and e.job = 'SALESMAN';

 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,   ***********
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select * from emp;
select * from dept;
select * from salgrade;

select e.deptno, e.ename, e.sal*12  , nvl(e.sal*12 + e.comm,0) as"�Ǳ޿�" , s.grade
from emp e inner join salgrade s    
on e.sal BETWEEN s.LOSAL  AND s.HISAL 
where e.comm is not null;

SELECT E.EMPNO AS "�����ȣ",
               E.ENAME AS "����̸�",
               E.SAL*12 AS "����",
           --E.SAL*12+NVL(COMM,0) AS "�Ǳ޿�",
               E.SAL*12+COMM AS "�Ǳ޿�",
               S.GRADE AS "�޿����"
FROM EMP E inner join SALGRADE S 
           on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.

 select e.ename, d.dname  , e.deptno, e.sal, s.grade
from emp e  join dept d  on e.deptno = d.deptno  and d.deptno = 10
                   join salgrade s on e.sal BETWEEN s.LOSAL  AND s.HISAL; 

                
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�, ********
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.

select e.ename, d.dname  , e.deptno, e.sal, s.grade
from emp e  join dept d  on e.deptno = d.deptno  
                   join salgrade s on e.sal BETWEEN s.LOSAL  AND s.HISAL
where e.deptno in(10,20)                   
order by  d.deptno asc, e.sal desc;                  
 


 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)

--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
 
 select e.empno, e.ename, p.empno , p.ename
 from emp e join emp p
 on e.empno = p.mgr;
 
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

-----------------------------------------------------------------------------------------------------------------------------------------------------subquery

--subquery ����Ŭ.pdf (100page)
--sql �� ���̴�. >>sql �� ���� �ذ��  
--�Լ� �� �ᵵ �ȳ�����>> ���� �� �ᵵ �ȳ�����...>> subquery  

--������̺��� ������� ��� ���޺��� �� ���� �޿��� �޴� ����� 
--���, �̸�, �޿��� ����ϼ���.

select avg(sal) from emp;
--�ϴ� ���س���
select*
from emp
where sal > 2073;  --�̷��� �Ѵ�. 

select *
from emp
where sal > (select avg(sal) from emp);  --�̰� subquery (���� �ȿ� ���� ����)�� subquery ��� �Ѵ�.

--��Ģ�� �ֵ�.   ���ϰ��̾�� �Ѵ�. ��ȣ�ȿ� �־ƾ߸� �Ѵ�.
--subquery
/*

1. single row subquery : subquery ��� row 1�� ( �����÷��� ���ϰ�)
2. Multi row subquery :  subquery ��� row 1�� �̻�( ���� �÷� �������� ��)
�����ϴ� ������  :���Ǵ� ������....

multi row : IN, NOT IN(ANY, ALL)
ALL : sal > 1000 and sal > 2000 and sal.......     �����͸� and �� Ǯ���.
ANY:  sal > 1000 or  sal > 2000 or  sal...           �����͸� or �� Ǯ���.

����(subquery)
1. ��ȣ �ȿ� �־�� �Ѵ�. >>  (select sal from emp)
2. ���� �÷����� ���� �Ǿ���� >>  (select sal , deptno from emp) (x)     �ΰ��� �÷� �߿��� � �÷��� �Ǵ����� �˼��� ��� �Ⱦ���.
3. �ܵ����� ���� ���� �ؾ���... ������ ��� ���Ѱ�ó��..

�������
1. ������ subquery  ���� ���� 
2. subquery �� ������� ������ main query ���� �Ѵ�. 

*/

--������̺��� jones �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���.

-jones  �� �޴��� �ȴ�����  �̾ƾ���.

select sal from emp where ename = 'JONES';  --2975

select empno, ename, sal
from emp
where sal >(select sal from emp where ename = 'JONES'); 


-- 2000 �̻��α޿��� ���� ������ �̾Ƴ���   ........  ���� �׳� ������ ����.
--subquery �� �����ϴ� �����Ͱ� ��������. 

select * from emp;
SELECT sal FROM emp WHERE sal > 2000;  --�̷��� �ϸ� �Ѱ��� �÷��� �������� �����Ͱ� ���´�.

SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal IN (SELECT sal FROM emp WHERE sal > 2000);
--WHERE sal = 2975 or sal=2850 or sal=2450 or sal=3000   �̶� ���� �ǵ� In()���� �ٿ���.
--2975 2850 2450 3000 5000 3000
--single-row subquery returns more than one ROW

SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal NOT IN (SELECT sal FROM emp WHERE sal > 2000);
--NOT IN (������ and)
--2975 2850 2450 3000 5000 3000  �� �ƴѾֵ��� �̾Ƴ���.
--where sal != 2975 and sal != 2850 and sal != 2450 and ..



--Quiz  ���� ������ �ִ� ����� ����� �̸��� ����ϼ���.   ********************
--����� mgr �÷���
select mgr from emp;

select * from emp;

select *
from emp where empno in(select mgr from emp);    --���⼭ ��µǴ� ������� �ּ��� �Ѹ� �Ǵ� �� �̻��� ���������� ������ �ִ� ���
--empno=7788 or empno=7902 or empno =null              ****** or �� null �� ������ �ȹ޴´�. *****



--Quiz  ���� ������ ���� ����� ����� �̸��� ����ϼ���.   ********************

select *
    from emp where empno not in(select mgr from emp);  --���� �ȳ���...
--empno != 7902 and empno != 7788 and empno is not null         ***** and �� null �� ������ ����� �׳� null �̴�. *****

select *
from emp where empno not in(select nvl(mgr,0) from emp);  --�̰� ���� ����


select *
from emp where empno not in(select mgr from emp where mgr is not null); --suquery ������ null �� ��������





--QUIZ      
--king ���� �����ϴ� �� ���ӻ���� king �� ����� ���, �̸�, ����, ������ ��� �� ����ϼ���.
select * from emp;

select empno from emp where ename='KING';

select empno, ename, job, mgr
from emp where mgr = (select empno from emp where ename='KING');


--Quiz    20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� 
--����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���.


select max(sal) from emp where deptno =20;

select empno, ename, sal, deptno
from emp
where sal> (select max(sal) from emp where deptno =20);

--POINT--
--subquery >> select ���� 
--              >> from  ����
--              >> where ����    �� ���� �մ�.


select *
from emp 
where deptno in(select deptno from emp where job='SALESMAN')
          and sal in(select sal from emp where job = 'SALESMAN');


--QUIZ   (��������� ���ϴ� ������)       ******************************************************
--�ǹ����� Ȱ��
--�ڱ�μ��� ��� ���޺��� �� ���� ������ �޴� 
--����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���.

select * from emp;

select deptno,  round(avg(sal)) 
from emp
group by deptno ;

--1�� ��Ʈ �μ���ȣ�� �μ��� ��տ����� ��� �ִ� ���̺��� �����Ѵٸ�
--2�� ��Ʈ from �� subquery ��밡�� ...(���� ���̺�)

/*
�μ���ȣ  ��ձ޿�
30    	        1567
20  	        2175
10  	        2917

*/

select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno,  round(avg(sal)) as avgsal
                         from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal
order by e.sal desc;

--from ���� subquery �� �������̺�� ���� ����  �׻��·� join �� �ؼ� �������Ѵ�?


------------------------------------------------------------------------------------------------------------------------20200403
--subquery �������� Ǫ����. 
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.

 select empno, ename, sal
from emp
where sal >(select sal from emp where ename = 'SMITH'); 

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');

--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,  ****************  (��Ƽ �ο� ���� �� in , not in, any , all �� ����Ѵ�)********************
-- �μ���ȣ�� ����϶�.

select ename, sal, deptno
from emp
where sal in(select sal from emp where deptno = 10);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename not in('BLAKE');

SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������     ********************���� ���� �����̴�.****************� ����� ����� �����͸� ���ϴ� ���..   
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
select * from emp;

select empno, ename, sal 
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.

select empno, ename
from emp
where deptno in(select deptno from emp where ename like '%T%');

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������     *********all  �� �����͸� and�� Ǭ��.  ������ all�� ���̸� ��� ������ �����ؾ��Ѵ�.  
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.             *********where sal > 1600 and sal > 1250 and sal > 2850 and > .........�� ���ǵ��� �����ؾ� �ϱ⶧���� max(sal) �� ���� �ʾƵ� �ȴ�.     
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)                              ********* �� ��� ������ �����ϴ� ���� max�Լ� �� ���� ������ 2850 ���� ũ��. 
select * from emp;

select ename, empno,sal
from emp
where sal > all(select max(sal) from emp where deptno=30);

SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
  FROM EMP
  WHERE DEPTNO=30);
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950
 
 
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.

select ename, deptno, job
from emp
where deptno = all(select e.deptno from emp e join dept d on e.deptno = d.deptno and d.loc = 'DALLAS');

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO    -- = �� �´µ�  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.

select e.ename, d.deptno  , e.job
from emp e inner join dept d    
on e.deptno = d.deptno and d.dname = 'SALES';

SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES');
 

 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)

select  ename, sal
from emp where mgr = (select empno from emp where ename='KING');

SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����       *************!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.


select *
from emp
where sal >(select avg(sal) from emp )
and deptno in(select deptno  from emp where ename like '%S%');

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
AND DEPTNO IN(SELECT DEPTNO
                   FROM EMP
                   WHERE ENAME LIKE '%S%');
 
--select * from emp
--where  deptno in  (
--                      select deptno from emp where sal > (select avg(sal) from emp)
--                      and ename like '%S%'
--                   )


--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����      ***********************�ٽ� �غ���.
-- �̸�, ����, �μ���ȣ�� ����϶�.

select ename, sal, deptno
from emp
where deptno in(select deptno from emp where comm is not null) and sal in(select sal from emp where comm is not null);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����           *******************�ٽ��غ���
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.
select ename, sal, comm
from emp
where sal in(select sal from emp where deptno = 30)
and comm in(select nvl(comm,0) from emp where deptno = 30);


SELECT ENAME, SAL, COMM
FROM EMP
WHERE SAL NOT IN(SELECT SAL
                        FROM EMP
                        WHERE DEPTNO=30)
AND COMM NOT IN(SELECT NVL(COMM, 0)
                         FROM EMP
                         WHERE DEPTNO=30 and comm is not null);
 
--SELECT NVL(COMM, 0)
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;
 
--SELECT COMM
--FROM EMP
--WHERE DEPTNO=30 and comm is not null;

------------------------------------------------------------------------------------------------------ �ʱ� �������� �⺻�Ҿ�... ����������...
/*
select 
from
where 
group by
having
order by

�Լ���  -����, ��¥, ����, ��ȯ, �Ϲ�, ����

join - �ϳ� �̻��� ���̺��� ������ ��������... ���� ���̺� : ����

subquery

�ʱ� �������� �⺻�Ҿ�... ����������...

*/

----------------------------------------------------------------------------------------------------------------------------                                                         DML
--[INSERT] , [UPDATE] , [DELETE]    >>  �ϱ�..
/*

                **����Ŭ ����**
                
DDL (������ ���Ǿ�)  : create , alter ,drop , truncate (rename,modify)
DML (������ ���۾�)  :  insert (�ְ�), update(�����ϰ�) ,delete (�����)     20%
DQL (������ ���Ǿ�)  : select                                                               70%
DCL (������ �����) : ���� (grant , revoke)  >>DBA (������: ����͸�: ��� ����)
TCL (Ʈ�����)�߿�  : commit, rollback, savepoint   

������ : CRUD    (Create > insert ,  Read  > selcet , U> update , D >Delete)    �ְ�, �а�, �����Ҽ� �ְ�, ����� ������ �ȴ�. �����ڰ� �ؾ��Ұ�... 
*/

-- ������ �߿��ϴ�~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--DML  (Ʈ�����: (Transaction):  �ϳ��� ������ �۾� ����)    >LOCK                                                                                                         Ʈ������� ���ǿ� ���� ����� ������ �� ���´�. 
--A��� ���࿡�� ���� �����ؼ� B��� ���࿡ �Ա�
--A : update .....1000 ��  500����    
--B : update .....1000 ��  1500 �� �ȴ�. 
--�Ѵ� ���� : commit 
--���߿� �ϳ��� ����...rollback                 �����߿� �Ѿ����� ó������ �ٽð��� ��ǥ���� ����. �װ� Ʈ�����...    ���̺� ����Ʈ��  �߰� ����..


--ex) ���б� ������û ������...   �۾����߿��� �ٸ������ �ǵ帮�� ���ϰ� lock �� �����Ѵ�!~!~!~~!~!~!~!~!~!
--������ Ʈ����� ���� �ߴ��� ��� �����ߴ��� �����...  �ț��ٰ� �ϸ�? ������ ������ �����Ҽ� ������ �ǹ��Ѵ�. 
--���� �����ϸ�? ���������.....

select * from tab;    -- ������ ����ڰ� ���� ��� table �� �� �� �ִ�.                                                  �ַ� creat table �Ҷ� ���� �̸��� �ִ��� Ȯ���Ҷ��� ����.~
select * from tab where tname = 'BOARD';      --�̷������� Ȯ���Ѵ�.... ���尡 �̹� �����ϳ�!

select * from col;    --�÷����� �� ���´�.......     

select * from col where tname = 'EMP';    --Ư�����̺��� �÷����� �����ִµ� ���� ���ϰ� ���´�...    ���߿� ������ ��� ���鶧 �����ϰ� ���δ�. 


--������ ���ߴ� ���� �� ���� �������. 

select * from user_tables;   --�ַ� �����ڵ��� ���� ����... ���̺� �뷮.. �����ִ°�.. �䷱�� �����ش�.
select * from user_tables where table_name = 'DEPT';    

--������ tab    col ������ Ȱ���ص� ����.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--DML  ����Ŭ PDF  page 168
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])] VALUES  (value1[, value2, . . . . . . ]); 
*/

create table temp(
  id number primary key,  --not null �ϰ� unique �� �����͸� �� �� �ִ�.     ���̶� �ߺ������� ���´ٴ� ��. 
  name varchar2(20)         --default null �� ��� 
 ); 
 
 
 /*
 
 ���� Ÿ��                                                                                                                                                                                                                                                                ����Ÿ��  
 
 char(20)       >> 20byte >> �ѱ� 10��,  ������ 20��  >> �������� ���ڿ�
 varchar2(20) >> 20byte >> �ѱ� 10��,  ������ 20��  >> �������� ���ڿ�
 
 char(20)  >>  'ȫ�浿' >> 6byte >>  [ȫ�浿      ] >>   20byte    ���°��� ������� 20byte �� ��� ����. 
 varchar2(20)  >>  'ȫ�浿' >> 6byte >>  [ȫ�浿] >>   6byte      ��� 6byte ��
 
 ex) 
 �������� ������ : ��, ��  : char(2)
 �������� ������ : �̸�.... 
 
 �������� ����    ... char ()   ��  varchar() ���� �켱�Ѵ�.
 �׷�.... �������� ������ char() �� ���°��� �����̴�. ...      ���� �� ����... ��,��,  �ֹι�ȣ , �����ȣ ��...
 
 �ѱ۹��� (unicode : 2byte ) >> �ѱ�, ������, Ư������, ����
 
 nchar(20)        n �� �����ڵ��� ����.   >> 20 �� ���ڼ��� �ǹ� �� .. byte�� �ƴ϶� ���ڼ�!!!!!   �׷���  �� 40byte �� ���������� ���� �ִ�. 
 nvarchar(10)  >> 10 ���� 
 
 */

select * from temp;

-- 1. ���� �Ϲ����� INSERT
insert into temp(id,name)
values(100,'ȫ�浿');

select  * from temp;

--Ȯ���ϰ� ������� Ŀ��~~!
commit;   

-- 2. �÷� ��� ���� ( �÷� ����Ʈ ����)  --�������� �������� �ǵ��� ���� ���ƶ�.
insert into temp
values(200,'������');  --������ �÷��� ����, ������ġ

select * from temp;

commit;    --auto commit �ϸ� �Ǽ��Ѱ� �ǹݿ��Ǵϱ� ����!

-- ���� ��Ȳ
insert into temp(id, name) -- id primary key
values(100,'�ƹ���');
--unique constraint (BIT.SYS_C007006) violated   �ߺ��� ���࿡ �ɷ��� ���� ��

insert into temp(name)   ----not null, unique
values('�ƹ���');  
--cannot insert NULL into ("BIT"."TEMP"."ID")     

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--�Ϲ� SQL ���� ���α׷����� ��� �� ����.

--PL-SQL  (���) ���α׷��� ���� ��� (���, ����)      PL   = Program Language
--PL-SQL
create table temp2(id varchar2(20));

--������ �׽�Ʈ...������ 1000 �� 1000�� ����..

/*
begin 
       for i in 1..1000 loop    --i�� 1���� 1000���� ���鼭 �Ʒ� ������ �����Ѵ�.
             insert into temp2(id) values('A' || to_char(i));
       end loop;
end;
*/

select * from temp2;     --������ 1000�� ��
--Ŀ�Ա��� �ؾ��Ѵ�.
commit;

select * from temp2 order by id desc;
commit;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table temp3(
    memberid number(3) not null,
    name varchar2(10) , --null ���
    regdate date default sysdate --�⺻ �� �����ϱ� (  ��¥�� ������ insert���� ������ sysdate ���� ����Ʈ�� ����. �ַ�...�Խ��ǿ� �۾������..)
);

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


insert into temp3(memberid, name, regdate)
values(100,'ȫ�浿','2020-04-03');

select * from temp3;
commit;

insert into temp3(memberid, name)
values (200, '�ƹ���');  

select * from temp3;  --200	�ƹ���	2020-04-03 12:14:11    defalut sysdate �ݿ���.
commit;

insert into temp3(memberid)
values(300);   

select * from temp3;   --300		2020-04-03 12:15:32      �̸��� null �� ����̶� ��.
commit;

insert into temp3(name)
values ('�̸���');        --ORA-01400: cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")   

--insert (TIP)                                                                                                                       *****************insert   TIP**************

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

select * from temp4;
rollback;

commit;

--�䱸���� : temp4 �� �ִ� ��� �����͸� temp5 �� �ְ� �;��.
--insert into ���̺��(�÷�����Ʈ) values(������Ʈ)    *������ �ϴ���*
--insert into ���̺��(�÷�����Ʈ) select �� (�÷�����Ʈ�� ������ Ÿ�� ����) ����

insert into temp5(num)
select id from temp4;    --�̷��� �ű��.   (�����ڵ��� ������ ��������� temp ������ �ű�� �͵� �̷� ������� �Ѵ�.)

select * from temp5;    
select * from temp4;


--2. insert TIP
--���̺� ���� ��Ȳ���� [���̺� ����] + [�뷮 ������ ����]
--�� ���� ����( ���� ������ ���� ���� ����  (PK, FK) ���� �ֵ�)
--������ ���̺� ����(�÷��̸�, Ÿ��) ����

--create table copyemp(id number)   ���� ���̺� ����� ���.

create table copyemp
as 
      select * from emp;    --emp �� �Ȱ��� ������ ���� ����� emp �� ���� ������ ���� �־��ش�. 



select * from copyemp;   --�ű��� �� ���� �Ǿ���.   �ǽ��Ҵ� �̷��� ���纻 ����� �����ϸ� �길 �����߸����ִ�.



create table copyemp2     --����� �ֱ�.
as
    select empno, ename ,sal
    from emp
    where deptno = 30;
    
    
select  * from copyemp2;
select * from col where tname = 'COPYEMP2';


--���� :����(Ʋ) �� �����ϰ� �����͸� �ְ� ���� �ʾƿ�....  

create table copyemp3
as
   select * from emp where 1=2;    --���������̶� ����(������)�� ��������� ������ ���� �ʴ´�. 
   
select * from copyemp3;      

---------------------------------------------------------------------[INSERT END]-----------------------------------------------------------------------------------------

--[UPDATE]

/*
update table_name
set column1 = value1 , column2  = value2 .......
where ����

update table_name
set column1 = (subquery)
where ����

*/


select * from copyemp;    --������ emp�� ���....... 

update copyemp
set sal = 0;      --sal�� �� 0�� �Ǿ����


select * from copyemp;
rollback; --sal ������ ���ƿԴ�. 

update copyemp
set sal =0
where deptno = 20;   --�μ���ȣ�� 20�� �ֵ鸸 �޿��� 0���� �ٲٰ���.

select * from copyemp order by deptno;  --�μ���ȣ 20 �� �ֵ�  sal ���� 0 ���� �ٲ�
commit;

update copyemp
set sal = (select sum(sal) from emp)   --set ���� ���������� �ü� �ִ�!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
where deptno = 20;


select * from copyemp where deptno = 20 ;
commit;

--�������� �÷��� update   �ϱ�..

update copyemp
set ename = 'AAAA', job = 'BBBB' , hiredate = sysdate ,sal = 1111
where deptno = 10;

select * from copyemp where deptno = 10 ; 
commit;

---------------------------------------------------------------------------------------------------------------------------[UPDATE END]--------------------------------
--[DELETE]
--��Ģ >> delete -> commit , rollback -> ���� �Ұ� -> �� ������س��ٸ� ����.... ��Ģ�����δ� �Ұ��ϴ�.

delete from copyemp;    --�̷��� �׳� �� ������
select * from copyemp;
rollback;

delete from copyemp where deptno in(10,20); --deptno = 10

select * from copyemp where deptno in(10,20);
commit;


----------------------------------------------------------------------------------------------------------------------------[DELETE END]----------------------------------

/*
APP(JAVA)  -> JDBC API    ->   Oracle(DB)

CRUD
create  : insert
read    : select
update : update
delete : delete

(DML : insert , update , delete)  Ʈ������� �����ϴ� �۾��̴�.  (commit , rollback)�� �����ؾ��Ѵ�.

JDBC -> Oracle -> Emp   ���̺� �۾�
--��ü��ȸ  (�Լ�)
--������ȸ(�����  ����~ã�ƶ� �̷���)   (�Լ�)
--����    (�Լ�)
--����    (�Լ�)
--����    (�Լ�)
--JAVA
--public List<Emp> getEmpAllList() {String sql="select * from emp"}    ���Ŀ� �ڹٿ��� �̷������� Ȱ���Ѵ�.
--public Emp getEmpListByEmpno(){String sql = "select... where empno=777"}
--public int insertEmpData(Emp emp){String sql="insert into emp()....}
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
--[DDR]
--create , alter , drop (���̺� ����)       ���̺� ����� , �����ϰ�, �����

select * from tab;
select * from tab where tname = 'BOARD';   

DROP TABLE board;  --drop  ���� ���̺��� �ƿ� ������ ���� �� �ִ�.

select * from tab where tname = 'BOARD';   -- ������

create table board(
   boardid number,
   title nvarchar2(100),
   content nvarchar2(2000),
   regdate date
   
);

select * from tab where tname = 'BOARD';   --����

----------------------------------------------------------------------------------------oracle 11g ����(�����÷� (�����÷�))   ���� �����ϴ� ����̴�.
--�л� ���� ���̺�
--���� , ����, ����, �����÷�
--10       10     10    �� �˸� 30 �� ����� �ִµ�...  
--���࿡ ����, ����, ���� ������ ������ �ڵ����� ���� ���Ǹ�  ���? �ϸ鼭 �������. 


-----------------------------------------------------------------------------------------oracle 11g ����(�����÷� (�����÷�))

--�̰� ���ĸ�..� �Ϳ� ���� ������� ���� �޴� �÷�..

create table vtable(
  no1 number,
  no2 number,
  no3 number generated always as (no1 + no2) virtual   --no1�� no2 �� �����Ͱ� ������ �ڵ����� �հ谪�� ����.   
                                                                               --(  * - /  �� ����)
);

insert into vtable(no1,no2)
values(100,200);

select * from vtable;   --100	  200	300            �̷�������   no1  no2    no1+no2    �� ����..

insert into vtable(no1,no2)
values(33,44);

select * from vtable;   --33	44	77                   �䷸��~

insert into vtable(no1, no2, no3)
values (10,20,30);        
--INSERT operation disallowed on virtual columns"          ���� ���� ���� �Է����� ���Ѵ�.


--�÷��� ���� ���� 
select column_name , data_type , data_default
from user_tab_columns where table_name='VTABLE';    
--NO1	NUMBER	
--NO2	NUMBER	
--NO3	NUMBER	"NO1"+"NO2"      ���� �̷��� ���´�.

--�ǹ����� Ȱ��Ǵ� �ڵ�
--��ǰ���� (�԰���)  ..�б⺰ (4�б�) 
--�԰��� : 2020-03-01  >> 1�б�  


create table vtable2
(
   no number,  --����
   p_code char(4),  --��ǰ�ڵ�(A001 , A002)
   p_date char(8),   --�԰���(20200101)
   p_qty number,   --����
   p_bungi number Generated always as ( -- ex)   �԰���   20200101   �� 5��°���� 2�� �������� ������� ��Ÿ���µ� �װ� ���� 1,2,3,4�� ����. 
                                                            case when substr(p_date,5,2) in ('01','02','03') then 1         
                                                                    when substr(p_date,5,2) in ('04','05','06') then 2
                                                                     when substr(p_date,5,2) in ('07','08','09') then 3
                                                                     else 4
                                                             end        
                                                           ) virtual
);

select column_name , data_type , data_default
from user_tab_columns where table_name='VTABLE2';    --�ϸ� ������ ó�� ���δ�.

insert into vtable2(p_date) values('20200101');
insert into vtable2(p_date) values('20200101');
insert into vtable2(p_date) values('20200301');
insert into vtable2(p_date) values('20200601');
insert into vtable2(p_date) values('20201201');

select * from vtable2;   --   ¥���� �ڵ���  p_bungi ���� �б� ���� ǥ�õȴ�. 

select * from vtable2 where p_bungi = 2 ; --		20200601		2
commit;


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------20200406
--DDL ���̺� �ٷ�� 138p
--1.���̺� �����ϱ�
create table temp6(id number);

--2. ���̺��� �����ߴµ�  �÷� �߰��ϱ�
desc temp6;   

alter table temp6
add ename varchar2(20);

select * from temp6;

desc temp6;

--3. ���� ���̺� �ִ� �÷��� �̸��� �߸� ǥ�� (ename -> username)
--���� ���̺� �ִ� �÷��� �̸� �ٲٱ� (rename)
alter table temp6
rename column ename to username;

desc temp6;

--4. ���� ���̺� �ִ� ���� �÷��� Ÿ�� �����ϱ�
--(modify)
alter table temp6 
modify(username varchar2(100));   --������ ���ϴ°�.

desc temp6;    --USERNAME    VARCHAR2(100)   ���� ���� ��

--5. ���� ���̺� �ִ� ���� �÷� ����
alter table temp6
drop column username;    --�÷��� ����� �����ʹ� �翬�� �������.

desc temp6;     --username �÷� �����.

--6.���̺� ���� : �̰� �� ��ü�� �㹫�°���

--DELETE
--6.1 ������ ���� :  delete : �����͸� ����� ����. 
--���̺��� ó�� ����� ó�� ũ��(ex)20���̴�-> �����͸� ������ -> 20�򿡼� �ø���.(������ �ø��� �ʰ�, ����Ŭ ������ �� os�� ��ũ��ŭ..) 30���� �ɼ��� �ֵ�. 
--ex) ó�� 1M >> 10���� >> 100M >> delete 10���� ���� >>    Q. �̶�  ���� ũ��� �� ���ϱ��?    A . ������ ũ��� 100M

--TRUNCATE
--���̺� ������ ����(������ ũ�⵵ ���� �� �ִ�.)
--truncate (where ���� ����Ҽ� ���� ..�κ����� ������ ��Ҵ� ����..�� �������)     ���� �����ڰ� ����� ���� �߾�����,, ������ ������ ����
--ex) ó�� 1M >> 10���� >> 100M >> truncate 10���� ���� >>    Q. �̶�  ���� ũ��� �� ���ϱ��?    A .  ũ��� 1M

--7. ���̺� ���� (drop)
drop table temp6;
select* from temp6;  --"table or view does not exist"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--���̺� ���� �����ϱ�( ����Ŭ.pdf 148page)
--������ [���Ἲ] Ȯ�� �ϱ�.
--select ( ������ ..(x))
-- ����(constraint : insert , update , delete(FK))   ������� �ǹ̰� �ִ� �۾����̴�.

/*  �������� �� �� �ִ�.

PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����)   ,�ε��� ����           �Խ����� PK �� ����~? �� ��ȣ.
     --���̺� �Ѱ��� �ɼ� �ִ�. (���̺�� �Ѱ�(�������� ��� �ϳ��� ����..:����Ű))
     --���������� �˻��� ����� ���ؼ� (index) �� �ڵ� �����Ѵ�.  (select �� ���).. 
                                                      ������ ���� ���� �����Ͱ� ������ �����Ǿ� �ֱ� ������ �˻��ӵ��� ��������.
                                                      ������ 

FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�. 
     --�������� [���̺�] �� [���̺�] ���� ����  ���� 

UNIQUE key(UK) ���̺��� ��� ���� [�����ϰ� �ϴ� ��]�� ���� ��(NULL �� ���)     >>���� null ���� �޴´�..������������ְ� �ذ��Ҽ��ִ�.
     --null �� ���� �� �ִ�. >> unique �� not null �� �ɸ� null�Ұ�.

NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�. 

CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
     --������ ������ ���� �ްڴ�. �÷��� where gender in('��','��') �ϸ�....
     --ex) where gender in('��','��')  
*/

--���Ѻ��� �ִ�....... �����ض�.........

--������ ����� ����
--1. ���̺� ����鼭 �ٷ� ����(create table...)
--2. ���̺� ���� ���� �߰� (����) (alter table add constraint...)   �̰� ��õ!!!
--3. ���̺� ���� �Ҷ� ������ �Ʒ��� ��� �����. 
--      �̰� �ڵ�ȭ�� ������ ����ϴ� ��� 

--1.  ���� ���� Ȯ���ϱ�
select * from user_constraints;  --���� �������� ����ִ�. 
select * from user_constraints where table_name =' EMP';  --���� �������� ����ִ�.                            ��� �Ʒ��� �Ѵ� �Ⱥ��δ�... 
--SYS_C006997 ���������� ������ ���� �̸�
--"EMPNO" IS NOT NULL   

create table temp7(
  --id number primary key  ���� ǥ�� (���� �̸� : SYS_C006997)
  id number constraint pk_temp7_id primary key,  --���� �̸��� �������ش�. �����̸Ӹ�Ű�� ���� 7�� �ɷ��ֱ��� �÷��� id ����! �ϰ� �˾ƾ���.  �������
  name varchar2(20) not null,
  addr varchar2(50) 
);

select * from user_constraints where table_name =' TEMP7'; 
--PK_TEMP7_ID �ؼ��� ����( �������, ����) ���   

insert into temp7(name,addr) values ('ȫ�浿','����� ������');  --ORA-01400: cannot insert NULL into ("BIT"."TEMP7"."ID")       
                                                                                           --ID �� �����̸Ӹ� Ű�� �־��⶧���� null�� �� �� ����. 

insert into temp7(id,name,addr) values (10,'ȫ�浿','����� ������');    --���� ���� �ߵ�.
select* from temp7;
commit;

insert into temp7(id,name,addr) values (10,'�ƹ���','����� ������');  --ORA-00001: unique constraint (BIT.PK_TEMP7_ID) violated
--�ߺ� ������ �� �� ��.. 


-- Q 1. ���̺� primary key �� ����� �� �� �������? 1��
--(name , num) �������� �÷��� ��� 1��....   >> ����Ű  ��� �Ѵ�. 


create table temp8(
   id number constraint pk_temp8_id primary key,   --������ �̸��� ���� �ؼ��� �����ϸ� �ȴ�.
   name varchar2(20) not null,
   jumin char(6) constraint uk_temp8_jumin unique,  --unique ������ null �� ����Ѵ�~!
   addr varchar2(20)  
);

select * from user_constraints where table_name = 'TEMP8';

insert into temp8(id, name, jumin, addr)
values(10, 'ȫ�浿', '123456','��⵵ ������');
select*from temp8;
commit;

insert into temp8(id, name, jumin, addr)
values(20, '�ƹ���', '123456','��⵵ ������');
--ORA-00001: unique constraint (BIT>UK_TEMP*_JUMIN) violated

--null.....unique ��� (null�� �ߺ�üũ�� �ұ�)  *unique   �� null �� ����Ѵ�.
insert into temp8(id, name, addr)
values(30,'�达','��⵵ ������');  --30	�达	(null)	��⵵ ������

select * from temp8;         --null �� ����!

insert into temp8(id, name, addr)
values(40,'�ھ�','��⵵ ������');
select * from temp8;                 --40	�ھ�	(null)	��⵵ ������

--create table temp8 (jumin NOT NULL CONSTRAINT ..unique)   �̷��� �ΰ��� �Ǵ�... 
--unique ������ ���̺� � :  �÷�������ŭ... �� �ɼ� �ֵ�. ������ ����!!!!

------------------------------------------------------------------------------------------------------------------------------------------------------------�̹� �������� ���̺� ���� �߰��ϱ�.(�ǹ������� �̰� �� ���� ��)

create table temp9(id number);

--���� ���̺� ���� �߰��ϱ� .  �����̶�°� ���ʿ信 ���� �ְ� ���� �ִ�. 
-- ��, ���� �����Ͱ� �ִ� ��� ������ �����ϴ� �����Ͱ� ������ ���� �߰� �Ұ���!!!!!!!!!!!
--���� �ɱ����� ������ �˻� �۾� ����

alter table temp9
add constraint pk_temp9_id primary key(id);
select * from user_constraints where table_name = 'TEMP9';     --PK_TEMP9_ID

--������ �÷�( ����Ű)
--ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--not null �߰��ϱ�

alter table temp9
modify(ename not null);    --��� �߾Ⱦ��� ����ε� not null �߰��ϴ� ����� �ֱ� �ϴ�.
select * from user_constraints where table_name = 'TEMP9';


--------------------------------------------------------------------------------------------------------------------------------------------------------check ����
--[check ����]
--where ���ǰ� ������ ������ ���� >> where age > 19 
--�÷��̸� age > 19      �����͸� ������ 19���� ū ���� �ްڴٰ� ������ �Ŵ� ���̴�.

create table temp10(
  id number constraint pk_temp10_id primary key,
  name varchar2(20) not null,
  jumin char(6) constraint uk_temp10_jumin unique,
  addr varchar2(20),
  age number constraint ck_temp10_age check(age >= 19)  
);

select * from user_constraints where table_name = 'TEMP10';    --���� ���� üũ

insert into temp10(id,name, jumin, addr, age) 
values(100,'ȫ�浿','123456','����� ������',20);
select * from temp10;

commit;    --�������̶�� Ŀ��!

insert into temp10(id,name, jumin, addr, age) 
values(200,'ȫ�浿','123456','����� ������',18);  --ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
-------------------------------------------------------------------------------------------------------------------------------check ���� ��!---------------------------

--���� ���� : RDBMS : ���̺�� ���̺���� ���� ���� 
--EMP �� deptno �÷��� DEPT �� deptno �÷��� ���� �մϴ�.
--���� �ϴ� �ʿ� �Ŵ� ���� : FK
--���� ���ϴ� �ʿ� �Ŵ� ���� : PK

create table c_emp
as 
    select empno, ename , deptno from emp where 1=2 ;  --���� �������� �����⸸ ����!


create table c_dept
as 
   select deptno , dname from dept where 1=2;
   
   select * from c_emp;
   select * from c_dept;
   
   
------------------------------------------------------------------------------------------------- --EMP ���̺��� deptno �÷��� DEPT ���̺��� deptno �÷��� ���� �մϴ�.   �̰� �غ��� ����!
 
 alter table c_emp
 add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);   --"no matching [unique] or [primary key] for this column-list"  ���� ����!!!!
--c_emp (deptno)  ��  c_dept(deptno)��  �������ž�~! ��� �Ѱ���
--c_dept(deptno) �ٸ� ������� �����ֱ� ���ؼ� �ſ��� Ȯ��(primary key)   
--c_dept(deptno) primary key �� ������ �־�� ��


select * from c_emp;
select * from c_dept;

--1�� ���� �Ǿ����.
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);      --�̷��� primary key �� �ػ��¿��� ������ ���� �ʴ´�.

--2������ ���� �Ǿ����
 alter table c_emp
 add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);     --  ���� ���� �ȴ�.
 --c_emp(deptno)     --------   c_dept(deptno) ���谡 ����... (1:N) ���� : ex) �μ� ���̺�� ��� ���̺�.... 
 -- (1:1) ���� ex)  ȸ�� ���̵� �� ���̵� ���̺��� ����.....
 -- (N:N) ���� ex) å���̺�� ���� ���̺� ����    ���δ� ���������� ������ �������� �ʴ´�. 
 
 insert into c_dept(deptno, dname) values (100,'�λ���');
 insert into c_dept(deptno, dname) values (200,'������');
 insert into c_dept(deptno, dname) values (300,'ȸ����');
 
 select * from c_dept;
 commit;
 
 --���Ի�� �Ի�
 --���� )  not null �ɾ ���� ���� �´�(100~300) ..  �ƴϴ�  null ��� �ϴ� ���� �´�!!!!  (100~300)
 --not null ���� : �Ի��ϴ� ��� ���Ի���� �ݵ�� �μ��� �����߸� �Ѵ�. 
 --null : ���Ի���� �ݵ�� �μ��� ���� �ʿ䰡 ����.
 
 --���� �Ҷ��� ������ ��Ȯ�ϴٸ� ���� �� �� �ִ�. 
 
 insert into c_emp(empno,ename)
 values(100,'ȫ�浿');   --100	  ȫ�浿	( null)    �� ȸ��� ���Ի���� �μ��� �ݵ�� ���� �ʾƵ� �Ǵ� ȸ���̴�.
 
 select * from c_emp;
 
 update c_emp
 set deptno = 500
 where empno =100;
 -- integrity constraint (BIT.FK_C_EMP_EMPNO) violated - parent key not found   �θ� Ű�� �߰ߵ��� �ʾҴ�.. : ���ʿ� 500 ����
 
update c_emp
 set deptno = 200
 where empno =100;
 
 select  * from c_emp;  --100	ȫ�浿	200
 commit;
 
 insert into c_emp(empno,ename, deptno)
 values(200,'�ƹ���',100);
 
 select * from c_emp;  --200	�ƹ���	100
 commit;
 
 --------------------------------------------------
 --�� ���� ���̺� �� ���� ��..
 --(�θ�� �ڽİ���)
 --(master , detail)  
 
 --EMP(deptno) �� DEPT(deptno)  �� ���迡��  �� ���̺�(�θ�) �� ������~?
 --�θ�(PK) Ű�� ���� ��  : DEPT 
 --�ڽ�(FK) Ű�� ���� ��  : EMP
 
 --���� ���迡�� --
 select * from c_dept;  -- Master �θ�
 select * from c_emp;  -- detail   �ڽ�  
 
delete from c_dept where deptno = 300;   -- �μ����� 300 �� �� ���� �� �ִ�? ����?    �ִ�!!!! ���������� �μ���ȣ 300�� ���⶧����!!!

delete from c_dept where deptno = 100;   -- �� �̰� ������� ���ϱ� �ڽ� ���� �����Ͱ� �߰� �ȴ�. ����
-- integrity constraint (BIT.FK_C_EMP_EMPNO) violated - child record found

-- �׷����� �ұ��ϰ� ����� �ʹٸ� ???       
-- child �ʿ���  (100�� �μ��� ����, ����)....  �������� �ʵ��� ���� �� ���� �ؾ���..
-- �ڽ��� ���� �����ϰ� �θ� ����...   *******************************************************************************************************   �̰� �߿��ϴ�~!  ***********************

commit;

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
drop constraint fk_c_emp_empno;    --������ ���ﶧ ������ �̸����� �����. 

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;

select * from c_emp;
select * from c_dept;
delete from c_dept where deptno=100;
commit;





/*
--�л� ���� ���̺�   
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�  primary key
--�̸� NULL ���� ������� �ʴ´�  not null
--���� ,���� ,���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�

--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ� .. ��� : �Ҽ������� ���ڸ� �ݿø�.
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�


--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�


--�а��ڵ� , �а���

--�׸��� select �����
--�й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���
--sample �����ʹ� �������� ������ �ȴ�. 


���� �Ѱ� ���� ����..������...
****************************************************************************************************�ٽ� �غ����� ******************************************************************* 
���ʿ� �ֱ�
�ٱ����� ����
���ʿ� �ֵ�, ������ ��� ����   --���� ����Ű���� ���ϴ�.  

*/


 
create table sgrade(
  id number constraint pk_sgrade_id primary key,
  name varchar2(20) not null,
  korean number,
  english number,
  math number
);

create table ss(
  scode number constraint pk_s_scode primary key,
  sname varchar2(20) not null
);

alter table sgrade
add scode varchar2(20);

alter table sgrade
add  summ number generated always as (korean + english + math) virtual;
alter table sgrade
add  avgg number generated always as ((korean + english + math)/3) virtual;


alter table sgrade 
modify(scode number); 
-------------------------------round �߰� ���� ���� 
alter table sgrade
modify(avgg number generated always as (round(((korean + english + math)/3),2)) virtual);  --��ȣ... ������ ���� Ʋ�� �ſ���. 

select * from user_constraints where table_name = 'SGRADE';
select * from user_constraints where table_name = 'SS';

select * from sgrade;

---------------------------------------  �����ڵ� ���� ����
--1������ ����Ǿ�� �ϴ� �� �̹� PK �Ǿ��־ 2������ ����. 
alter table ss
add constraint  pk_s_scode primary key(scode);      

--2������ ���� �Ǿ����
 alter table sgrade
 add constraint PK_SGRADE_IDD foreign key(scode) references ss(scode);

---------------------------------------

insert into sgrade(id, name, korean, english, math, scode)
values(2020,'�ƹ���',70,80,90,10);
insert into sgrade(id, name, korean, english, math, scode)
values(2021,'ȫ�浿',36,89,80,20);
insert into sgrade(id, name, korean, english, math, scode)
values(2022,'���ż�',88,90,60,30);

insert into sgrade(id, name, korean, english, math, scode)
values(2023,'���ż�',88,90,60,20);

delete from sgrade where name='���ż�';


select * from sgrade;


insert into ss(scode, sname)
values(10,'���а�');
insert into ss(scode, sname)
values(20,'���а�');
insert into ss(scode, sname)
values(30,'�����');

select * from ss;

select korean + english + math as "sum"
from sgrade
where id = 2020;

select * from user_constraints where table_name = 'SGRADE';

--------------------------------------------------------------------------------------------------------���� �����ϱ�---------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------������ ��

create table major(
  m_code NUMBER ,
  m_name varchar2(20) not null,
  
  constraint pk_major_mcode primary key(m_code)
);

create table grade(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL,
  
  --����Ű constraint pk_grade_snum primary key(s_number,name),
  constraint pk_grade_snum primary key(s_number),
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --���߿� �ɰų� (���̺� ���� �Ŀ�)
);
 


/* ��� */
CREATE TABLE EMP (
	empno NUMBER NOT NULL, /* ��� */
	ename VARCHAR2(20), /* �̸� */
	sal NUMBER, /* �޿� */
	deptno NUMBER /* �μ���ȣ */
);
ALTER TABLE EMP
ADD	CONSTRAINT PK_EMP_DEPTNO PRIMARY KEY (empno);
/* �μ� */
CREATE TABLE DEPT (
	deptno NUMBER NOT NULL, /* �μ���ȣ */
	dname VARCHAR2(20) /* �μ��� */
);


ALTER TABLE DEPT
ADD	CONSTRAINT PK_DEPT_DEPTNO	PRIMARY KEY(deptno);

ALTER TABLE EMP
ADD	CONSTRAINT FK_DEPT_TO_EMP 	FOREIGN KEY(deptno)
REFERENCES DEPT(deptno);

----------------------------------------------------------------------------------------------------------------���� �ѹ� �� ���� �غ��°�.
create table major(
  m_code number,
  m_name varchar2(20) not null,
  
  constraint pk_major_mcode primary key(m_code)
  );
  
create table grade(
  s_number number,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number,
  avg_score number generated always as (round((k_score + e_score + m_score)/3,2)) virtual,
  sum_score number generated always as (k_score + e_score + m_score) virtual,
  
  --����Ű constraint pk_grade_snum primary key(s_number,name),
  constraint pk
  









--------------------- ���� �����ϱ� (END)---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--view ��ü  ( �������̺�)   Oracle.pdf (192 page)
--���� ���ϴ� �͸� ���� �ְ� ���� ������ ���̺� : view 


/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] [WITH  READ  ONLY] 

*���⼭���ʹ� ����*

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

create view v_001
as 
    select empno, ename from emp;   --emp ���� empno, ename �� ���̴� ���̸� ����ž�!     ��� �� 
    
    -- An attempt was made to perform a database operation without
    --       the necessary privileges.     �����  view ���� ������ �����ϴ�.   �����ڿ��� ������ ��������.   ���ѹٲ� ���Ŀ��� ������ �ȴ�.
    
select * from v_001;  --��ȸ�� �ȴ� �ű���......      --view �� sql ������ ������ �ִ� ��ü��    ..�긦 �����ϸ� ���������δ� �� ���� select empno, ename from emp �� �����Ų��.


-------------------------------------------------------------------------------------------------------------------------view ����----------------------------------------------------------
--view ��ü (create....)
--create view ���̸� as sql ����( view ���ؼ� �� �� �ִ� ������ ���)
--view �� ���̺� ó�� ��� ����( ���� ���̺�) -> ���� ����� (emp, dept) �� �����ϰ�... ���̺���...����ϸ� �ȴ�.
--view �޸𸮻󿡼��� �����ϴ� �������̺� (ex)  in-line-view  <<--�˻��ϸ� ����.

--view ����!!!!
--�Ϲ� ���̺�� �����ϰ�.. select...where �� �ϸ� ��.
--��, �䰡 ���� �ִ� ���� ������ ����Ǿ����� ������ �����ֵ�...
--DML(insert, update, delete)  -> view ���ؼ� �� �� �ִ� �����Ϳ� ���ؼ��� -> DML ���� �ϴ�. 
--view �� �� �ִ� ������

--view ��� ����!!!!
--1. �������� ���� ( join, subquery) >> ���� ���̺��� �ִٸ� ....
--2. �������� ����...(���� ó��)   -> �����ϰ� ���� �����͸� ��Ƽ� view ���� �Ҽ� ����. 
--3. ���� (������ query ��Ƽ� ) view ����...... �̸� ����� ����




------------------------------------------------------------------------------�λ� ���̺�
--                                                                                                                           <<<< ���� ������ ����   >>>>>
--Emp �ٷ� �����Ű��  (����� �޿� �� ������ �κе��� ����ȴ�.)  

create view v_emp
as
  select empno, ename, job, hiredate from emp;

  
-- ����鿡�� v_emp �� ����Ͻø� �ǿ�~

select * from v_emp;        --�ص� ���̴� �� ������ ���� �װ��� �÷� ���̴�.  
select * from v_emp where empno=7788;   --7788	SCOTT	ANALYST	82/10/09    �� ���´�.


--                                                                                                                                  <<<<<���� >>>>>
--������ ������ �ܼ�ȭ �ؼ� ��� �� �� �ִ�.

create view v_002
as
  select e.empno, e.ename, d.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;    --�̷��� �̸� join�ؼ� ����� �θ� �Ҷ����� join �� �ʿ���� v_002 �� ���� �ȴ�. 
  
select * from v_002;  
select * from v_002 where deptno =20;   



--Q
--�ڱ�μ��� ��� ���޺��� �� ���� ������ �޴� 
--����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���.
--�ڱ� �μ��� ��� ���޺��� �� ���� ���� ��� �ִ� ���̺��� �ִٸ�...

create view v_003
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;
  
select * from v_003;    --�μ��� ��� ������ ��� �ִ� ���̺��̴�.                                     ��� ��ϵ� �ڵ��, in-line-view �� �׶��׶� ����� ��ȸ�� �ڵ�(���� ������~)�̴�.

select * 
from emp e join v_003 s
on e.deptno = s.deptno
where e.sal > s.avgsal;


--���̺��� 1�� �̻�
--join ....... �ȵǳ�....? �׷� subquery .......  �� �ȵǳ�???  �׶� ���°� �ٷ�~~~~~~ view(�������̺�)
--������Ʈ �� view �� �ʼ� ������ �ƴ�����, �˰������� ���ҰŰ��Ƽ� �˷��ֽ�. 

/*

CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] [WITH  READ  ONLY] 

*/

--create �� ����� drop ���� �����. 
--View ����
drop view v_007;

--OR  REPLACE  �̹� �����Ѵٸ� �ٽ� �����Ѵ�. 


create or replace view v_007    --replace ������ �ٲٰ� ������ ������.
as
   select avg(sal) as avgsal from emp;  --alias �� �־�� �������     

select * from v_007;  --2073.214285714285714285714285714285714286


--View �� ���� DML    (view�� ���� �ִ� �����Ϳ� ���ؼ��� insert, update , delete)      ����������..... select �������θ� ����ϴ°� ���� ����.
--�� view �� ������ ������ ���̺� 1���� ����
--���� view �� DML �Ұ�.    ���� view : ���̺��� 1���̻����� ������ query
--�ܼ� view  �� ���� �ϴ�.    �ܼ� view :  ���̺� 1���� ���� view

select * from v_emp;  --�� �� �ִ� ������(empno, ename ,  job, hiredate

update v_emp       --v_emp �ʴ� sal �÷��� �� �� ����... �׷��� ���� �� �� ����
set sal = 0;           --�̰� �Ұ���.. 


update v_emp
set job = 'IT';  --view�� �ٶ󺸴� ���� ���̺��� �ǵ帰��!!!!!!!!!!!!!

select * from v_emp;      
select * from emp;

rollback;


create or replace view v_emp2
as
   select * from emp where deptno=20;
   
 select * from v_emp2;
 
 update v_emp2
 set sal = 0;   --view �� �� �� �ִ� �����͸� ,,,,deptno=20�� sal =0���� �ٲ��. 
 
 select * from emp;
 rollback;
 
 select * from emp;
 
 --view ��� 
 select * from user_views;  --view �� ���� �ִ� �ҽ����� ����ȴ�. 
 
 
 -----------------------------------------------------------------------------------------------------------------------------------------��������....
 
 --1. 30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ������.
create view q_emp
as
  select job, ename, sal
  from emp
  where deptno = 30;

select * from q_emp; 
 
--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
-- create or replace view view001 (�÷���, �÷���, .....)  

create or replace view q_emp
as
  select job as "����", ename as "����̸�" , sal as "����"
  from emp
  where deptno = 30 and sal > 300;

select * from q_emp; 

 
--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.

create view q_emp2
as
  select deptno, max(sal) as "�ִ����" , min(sal) as "�ּҿ���", avg(sal) as "��տ���"
  from emp
  group by deptno;

select * from q_emp2; 


       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.


 create view q_emp4
as
  select deptno, avg(sal) as "��տ���"
  from emp
  group by deptno
  having avg(sal) >=2000;

select * from q_emp4;



 
--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.

--�̰�  �ΰ��� ������....
create view q_emp3
as
  select job, sum(sal) as "�ѿ���"
  from emp
  group by job;

select * from q_emp3;

select job
from q_emp3
where job !='MANAGER' and "�ѿ���" >=3000;


--�̰� having ���� ��ģ��
create view q_emp5
as
  select job, sum(sal) as "�ѿ���"
  from emp
  group by job
  having  job !='MANAGER' and sum(sal) >=3000;
  
 select * from q_emp5; 
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------20200407  ������
 
--������ 
--����Ŭ.pdf (page 185)

--���� �����ϱ�(��ȣ����)
--�ڵ����� ��ȣ�� �����ϴ� ��ü
--�ߺ��� ���� ������ �ʴ´� (����)

/*
CREATE  SEQUENCE  sequence_name     --��������� ����   �� �Ʒ��� �ɼ�
[INCREMENT  BY  n] 
[START  WITH  n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 

����

sequence_name  SEQUENCE �� �̸��Դϴ�. 
INCREMENT  BY  n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����. 
    �� ���� �����Ǹ� SEQUENCE �� 1 �� ����. 
START  WITH  n  �����ϱ� ���� ù��° SEQUENCE �� ����. 
    �� ���� �����Ǹ� SEQUENCE �� 1 �� ����. 
MAXVALUE n  SEQUENCE �� ������ �� �ִ� �ִ� ���� ����. 
NOMAXVALUE   ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����. 
MINVALUE n  �ּ� SEQUENCE ���� ����. 
NOMINVALUE  ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����. 
CYCLE | NOCYCLE  �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ� 
    ����. NOCYCLE �� ����Ʈ. 
CACHE | NOCACHE  �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ���� 
    �ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE. 

*/

SELECT * FROM tab WHERE tname ='BOARD';

DROP TABLE board;

CREATE TABLE board(
	boardid NUMBER CONSTRAINT pk_board_id PRIMARY KEY,
	title nvarchar2(100)
);

SELECT * FROM board;
--boardid �÷�(not null , unique , index ����)
--������ : boardid >> where boardid=? >> ������ 1�� return

--insert , update
--INSERT INTO board(boardid, title) values()
--�ִ� �����Ͱ� �ߺ����� �ƴϰ� null �ƴϴ� ..... 

--���� : ó�� ���� ���� 1 �̶�� ���� Insert .... �� ���������� ���� 2,3,4 
--�������� ������ insert �ϰ� �;��
--?? insert ���� ���� ...
--subquery >> values �ȿ� ��밡�� ...
INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'�ȳ�');

INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'�氡�氡');
SELECT * FROM board;
COMMIT;
--������ : (DML)
DELETE FROM board WHERE boardid=1;
COMMIT;

INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'����');
--unique constraint (BIT.PK_BOARD_ID) violated
--PK ���� ...
----------------------------------------------------------------------------------------------------------------------------------------------------------
--�ٸ� ���

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '����');

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '�ι�°��');

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '����°��');


select * from board order by boardid asc;

delete from board where boardid =1;
commit;

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '�׹�°');

select * from board;

-------------------------------------------------------------------------------------------------------------------------------------------------------
--sequence ��ȣ ���� : �ߺ����� ���� �������� �� >> ������ü
--create �� ����� ��ü�� ���� ��ü�� ����� drop ���� �ʴ��� ���������� ���´�. ���� â���� ���� ����.

create sequence board_num;

select * from SYS.USER_SEQUENCES;    --(�̸�)BOARD_NUM 	(�ּҰ�)1	(�ִ밪)9999999999999999999999999999	   (������)1 	N	N	20	1   


/*

 NEXTVAL �� CURRVAL �ǻ翭 

 1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�. 
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�. 
3) CURRVAL �� ���� SEQUENCE ���� ��´�. 
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�. (���ǻ���)
 
*/
--���� ��ȣ ����
select board_num.nextval from dual;    --�Ҷ����� 1���� ������� �����µ� �ѹ������� �� ������ ����

-- �ٵ� ���� ������� �̾Ҷ���...? �ϸ� ���� ��.     (�������� ä���� ���� ���´�..) �׷��� nextval ���� currval �� ������ ���� 
select board_num.currval from dual;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

create sequence kboard_num;


create table kboard(
   num number constraint pk_kboard_num primary key,
   title varchar2(100)
);
select * from kboard;
select kboard_num.currval from dual;   --���������� �� �ȳ���... nextval���� �ʾұ⶧����

insert into kboard(num, title)
values(kboard_num.nextval,'ó�� ��');

select * from kboard;

select kboard_num.currval from dual;   --1 ����
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--1. sequence ��ü (���̺� �����ڿ�) >> �������� ���̺��� �ϳ��� ä���� ���  (�츮 ���̹� ī�信�� �׷��� �ϰ�����)
--A ���̺� >>1 ,2 ,8
--B ���̺� >> 3, 4, 5
--C ���̺� >> 6, 7

--����Ʈ(�Խ���) 10��
--��ǰ�Խ���, ������ �Խ���, ȸ���Խ���
--1. �ϳ��� sequence ����   
--2. �Խ��� �۹�ȣ ���� ���� ������  sequence 3�� ���� A,B,C ���̺� ���� ���� �ȴ�. 


--   ms-sql 
--create table board(boardnum int identity(1,1)...)  1�� �����ؼ� 1�� �����Ѵ�.   -- ���̺� �������� ���̴�. 
--insert into board(title) values ('�氡')...
--ms-sql 2012 ���� ���� sequence �� ����.


--   my-sql
--create table text(
--num int(10) not null auto_increment primary key,
--name varchar(10) nor null
--);


--   MaridDB    (my-sql ������� ���ͼ� ���� ���¼ҽ� ���)
--��� �������� ���� �ִ�. 


--�߰��� Oracle... ���̳��� my-sql, maridDB ,mongoDB ? �� �Ѵ�... ���� �Ẽ���� �����ϱ�... 
--������ ũ�� �ٸ����ʰ� �뷫 70% ����ϱ� ������  ������ ���� ������� �� ��������. 


------------------------------------------------------------------------------------------------------------------------------
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;   --10 �� ���� 2�� �þ ���� ���´�.

select seq_num.currval from dual;  --���������� �������� ä���� ���� ���´�.  12

--�Խ��� ������ insert ...
--�Խ��� �ۺ��� (�ֽű� ������ ... �۹�ȣ ū��)
--select * from board order by boardnum desc

-----------------------------------------------------------------------------------------------------------SEQUENCE  [END]-------------------------------

--������ �ʼ� 2
-- rownum �ǻ��÷� : ���� ���������� �����ϴ� �÷��� �ƴϰ� ������ ����


--ROWNUM  : ���� ���̺� �÷����� �������� ������ ���������� ���ȣ �ο��Ҽ� �ִ� �ǻ��÷�  
--ROWID     : �ּҰ� ( ���� ������ ����Ǵ� �����ּҰ�) -> �ε��� �����Ҷ� ���

select * from emp;  --���⼭ ������ ��ȣ�� �׳� ���� ���ΰ���

select rownum as ���� , empno, ename from emp;   --�̰� rownum �� ������� ����...  
--rownum select ����� ����....

--Top-n ���� 
--���̺��� ���ǿ� �´� ���� (top) ���ڵ� n �� ����

--MS-SQL 
--select top 10, * from emp order by sal desc   --�޿��� ���� ������ ������ ������ ������ 10�� �߶󳻰ڴ�.   

--Oracle
--����Ŭ�� ����...����Ŭ�� rownum ���    (����¡ ó���� ���δ�)
--rownum(�ǻ��÷�)  ������ �����Ѵ�.

--rownum ���
--1. ������ ������ ����(����)   ex...   �޿��� ��������� �̰ڴ�. Ű�� ū ����� �̰ڴ�
--2. ���� �� ��Ȳ���� �տ� ���� ������ ���� ������ ����


--1 �ܰ� ~ ������ ������ ����(����)

select * 
from ( select * 
          from emp 
          order by sal desc) e;
          

--2 �ܰ�  ~ ���� �� ��Ȳ���� �տ� ���� ������ ���� ������ ����

select rownum as "num" , e.*
from ( select * 
          from emp 
          order by sal desc) e;


--3�ܰ� ~  (�޿��� ���� �޴� ���5��)

select rownum as "num" , e.*      --���� ���ϰ� alias ����. 
from ( select * 
          from emp 
          order by sal desc) e
where rownum <=5;          
---------------------------------
select e.*
from ( select * 
          from emp 
          order by sal desc) e
where rownum <=5;          


-----------------------------------------------------------------------------------------------------------------------------------------

--�Խ��� ����� ����¡ ó�� �ʼ� ������ (rownum �����÷�)

----------------------------------------------------------------------------------

select * from emp order by sal desc;   --������ ���ϱ�

----------------------------------------------------------------------------------

select *      --���������� ���� 
from (select * 
         from emp 
         order by sal desc) ;  

----------------------------------------------------------------------------------

select rownum as "num" , e.*      -- rownum �߰� 
from (select * 
         from emp 
         order by sal desc) e; 
         
----------------------------------------------------------------------------------
--1. ���������ȿ� ���������ȿ� �������� �ֱ�

select n.*      --subquery �ȿ� subquery �ֱ�
from(

select rownum as "num" , e.*      
from (select * 
         from emp 
         order by sal desc) e
       ) n
where "num" <= 5;

--2. rownum ���� ���� �ڸ��� 

select rownum as "num" , e.*      --���� ���ϰ� alias ����. 
from ( select * 
          from emp 
          order by sal desc) e
where rownum <=5; 

--������ �Ȱ��� �����.  ������ rownum , �Ʒ��� rownum ���̺��� ���� ���������� ����Ŵ�. 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------����¡ ó�� �����غ��� 
--�Խ��� (����¡ ó��)
--100�� ������ �� �ִٰ� �ؼ� �ѹ��� �������� �ʴ´� ������ �������ϱ�!
--10�Ǿ� ������ �����ֱ�


--�� 100���� �����Ͱ� �ְ�
--pagesize =10 ( �� ȭ��(������)�� ������ ������ �Ǽ�  row�� �� )
--page count = 10�� 
--[1][2][3][4][5][6][7][8][9][10]   �̷��� �������� ���� �ſ� �Ȱ���.
--���� [1] �� Ŭ��������  >> 1~10 ������ ���� �����ְ� �ʹ�. 
--       [2]                      >> 11~20 ������..... 
-- ....
--       [10]                     >> 91~100 ������..

--------------------------------------------------------------------------------------------------------------------------------------------------------------------HR�������� �̵�

select * from employees;     --107���� �����Ͱ� �ֵ�.    
-------------------------------------------------------------------------------------------------------------------
select * from employees order by employee_id asc;      --����(���� ) ��� ���� ������ ���ؼ�  206 ������ ���ĵǾ� ����.
-------------------------------------------------------------------------------------------------------------------
select *     --subquery ����.
from(
        select * 
        from employees 
        order by employee_id asc
        ) e;
-------------------------------------------------------------------------------------------------------------------         
select rownum as num , e.*     -- rownum ����  ������ �ٿ���. 
from(
        select * 
        from employees 
        order by employee_id asc
        ) e
where rownum <=50;        


-------------------------------------------------------------------------------------------------------------------    --50 ���� �۰� 40 ���� ū �����͸� �����Ŵ�.
select num, employee_id, last_name ,email            --���������ȿ� �� �־ ������ �־���.
from(

select rownum as num , e.*     
from(
        select * 
        from employees 
        order by employee_id asc
        ) e
where rownum <=50  
) s
where num>40;      --50 ���� �۰� 40 ���� ū �����͸� �����Ŵ�.  

-------------------------------------------------------------------------------------------------------------------     --10 ���� �۰� 0 ���� ū �����͸� �����Ŵ�.
select num, employee_id, last_name ,email            --���������ȿ� �� �־ ������ �־���.
from(

select rownum as num , e.*     
from(
        select * 
        from employees 
        order by employee_id asc
        ) e
where rownum <=10  
) s
where num>0; 
-------------------------------------------------------------------------------------------------------------------    --between A and B �� Ȱ���ϱ� �� �����ϴ�. 
--�Ǵ� between A and B Ȱ��

--where rownum between 10 and 20 ��밡�� 





------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------SQL �⺻���� END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------SQL ��ް��� (3�� ������Ʈ)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------PL-SQL (����, ���, Ŀ��, �Լ�, ���ν���, Ʈ����, ������)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                                                                                        --   ���� ����    --
                                                                                                        

--1> �μ����̺��� ��� �����͸� ����϶�.
 
 select * from dept;
 
--2> EMP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
 
 
 
--3> EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ�
-- ����϶�.

select distinct job
from emp;
 
--4> �޿��� 2850 �̻��� ����� �̸� �� �޿��� ����϶�.
 
 
--5> �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ����϶�.
 
 select ename, deptno
 from emp
 where empno = 7566;
 
--6> �޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸�
-- �� �޿��� ����϶�.
 
 
--7> 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� 
--�Ի����� ����϶�. �Ի����� �������� �ؼ� ������������ �����϶�.
 select* from emp;
 
 select ename, job, hiredate
 from emp
 where hiredate between '81/02/20' and '81/05/01'
 order by hiredate desc;
 
--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ��
-- ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
 
--9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ�
-- ����� �̸� �� �޿��� ����϶�.
--(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)

select ename as "Employee", sal as "Monthly Salary"
from(
select *
from emp
where deptno in(10,30)) e
where sal > 1500;
 
--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.
 
 
--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, 
-- �޿��� �������� ������������ �����Ͽ� ����϶�.
 
 select ename, sal, comm
 from emp
 where comm is not null
 order by sal;
 
--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
 
--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� 
--����϶�.
 
 select ename
 from emp
 where  ename like '%L%L%' and deptno =30;
 
 
--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� 
-- �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
 
--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� 
--�÷����� New Salary�� �����Ͽ� ����϶�.
 
 select empno, ename ,sal, round(sal*1.5,0) as "New Salary"
 from emp;
 
--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� 
-- �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�). 
 
 
 
--18> ��� ����� �̸�(ù ���ڴ� 
-- �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ�
-- ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
 
 
--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ����     ***********************************
-- ����� Ŀ�̼��� 'no commission'���� ����϶�.
 
 select nvl(comm,'NO COMMISSION') as "comm"
 from emp;
 
--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.
 
 
--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
 
 select e.ename, e.deptno, d.dname
 from emp e join dept d
 on e.deptno = d.deptno
 where d.deptno = 30;
 
--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
--(��, ���� ����� �ߺ����� �ʰ� �϶�.)
 
 
--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.

 
 select e.ename, d.dname, d. loc
 from emp e join dept d 
 on e.deptno = d.deptno
 where comm is not null;
                   
 
--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
 select * from emp;
select * from dept;
select * from salgrade;
 
--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� 
-- ����϶�.
 
  select e.ename, e.job, e.deptno,d.dname
 from emp e join dept d 
 on e.deptno = d.deptno
 where d.loc = 'DALLAS';
 
--26> ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�,
-- �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ����϶�.
 
--27> ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
 select e.empno , e.ename , e.sal , s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal; 

select e.ename, e.job, d.dname,  s.grade
from emp e join dept d on e.deptno = d.deptno
                  join salgrade s on e.sal between s.losal and s.hisal;
                  
                  
--28> Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
 
--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���,          *************************************
-- �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� 
-- Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� 
-- ����϶�.

select *
from emp
where hiredate > (
select hiredate
from emp
where mgr is not null);

 
 
--30> ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ����ϵ� 
-- �� �÷����� Maximum,Minimum,Sum,Average�� �����Ͽ� ����϶�.
 
--31> �� �������� �޿� ������.�ְ��,�Ѿ� �� ��վ��� ����϶�.
 
 select job, min(sal), max(sal), sum(sal), trunc(avg(sal),0)
 from emp
 group by job;
 
--32> ������ ������ ��� ���� ������ ���� ����϶�.
 
--33> �������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�.
-- �׸���, �÷����� Number of Manager�� �����Ͽ� ����϶�.
 
 select distinct count(mgr) as "Number of Manager"
 from emp;
 
 
--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
 
 
--35> ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�.   **********************************
-- ��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� 
-- �޿��� �������� ��� ����� ������������ �����϶�.

select min(sal) as "���� �޿�"
from emp
where empno in(select mgr from emp) 
          and "���� �޿�" >1000;
 
 
--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
-- �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
 
 
--37> Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�.
-- ��, Smith�� �����ϰ� ����Ͻÿ�
 
 select ename, hiredate
 from emp
 where deptno = (select deptno from emp where ename ='SMITH') and ename != 'SMITH';
 
--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� 
--    ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ �����϶�.
 
 
--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ
-- �� �̸��� ����϶�.
 select empno, ename
 from emp
 where deptno in(
 select deptno
 from emp
 where ename like '%T%');
 
--40> �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ����϶�.
 
 
--41> KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
 
 select ename, sal
 from emp
 where mgr =(
 select empno from emp where ename = 'KING');
 
--42> Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ����϶�.
 
 
--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� ����� ������
-- �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
 
 select empno, ename, sal
 from emp
 where sal >(select avg(sal) from emp)
 and  deptno in(select deptno from emp where ename like '%T%') ;
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� 
-- ����϶�.
 
 
--45> Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�,
--     �� �޿��� ����Ͻÿ�

select e.ename, d.dname, e.sal
from (
 select e.job
 from emp e join dept d 
 on e.deptno = d.deptno
 where d.loc = 'DALLAS') j join emp e on j.job = e.job
                                      join dept d on e.deptno = d.deptno
 where j.job = e.job;
 
 
--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� �� 
-- �޿��� ����Ͻÿ�
 
 
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ,
-- �̸�, �޿��� ����ϵ�, ����� �޿��� ���� ������ �����϶�.

 select empno, ename, sal
 from emp
 where sal > all(
 select sal from emp where job = 'CLERK')
 order by sal desc;
  
--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸���
-- ����, �μ���ȣ�� ����϶�.
 
 
--49> New  York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� 
-- ����̸��� �μ����� ����϶�.
 select e.ename, d.dname , e.comm
 from(
          select e.sal , e.comm
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK')  n join emp e on n.empno = e.empno
                                                     join dept d on e.deptno = d.deptno
 where n.sal = e.sal and n.comm = e.comm;                                                    
 
  
  

 select ename , nvl(comm,0)
 from emp
 where sal in(
          select e.sal 
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK') 
 and
          comm in(
          select nvl(e.comm,0)
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK');        
 
  
 
--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�,
--    ����,����,�μ���,Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� NoCommission
--    ���� ǥ���ϰ�, Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�.
--    ��, �ְ���޺��� ��µǰ� �Ͻÿ�



                                                                                                        






