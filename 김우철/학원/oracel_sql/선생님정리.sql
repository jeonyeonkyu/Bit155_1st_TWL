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
         https://dbeaver.io/download/
                 ����,����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : bit

-- USER SQL
CREATE USER bit IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bit QUOTA UNLIMITED ON USERS;

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
select * from emp;
SELECT * FROM dept;
SELECT * FROM SALGRADE;

/*
SELECT [DISTINCT]  {*, column [alias], . . .}   
FROM  table_name   
[WHERE  condition]   
[ORDER BY {column, expression} [ASC | DESC]]; 

*/
--1.��� ���̺��� ��� �����͸� ����ϼ���
SELECT * FROM emp; --���� ���ڴ� ��ҹ��� ���� ���ؿ�
--select * from emp;

--2. Ư�� �÷� ������ ����ϱ�
SELECT empno , ename , sal FROM emp;

SELECT ename FROM emp;

--3. �÷��� ����Ī(��Ī)(alias) �ο��ϱ�
SELECT empno ��� , ename �̸�
FROM emp;

SELECT empno "��    ��" , ename "��    ��"
FROM emp;

--����(ǥ��) (ansi ����)
SELECT empno as "��    ��" , ename as "��    ��"
FROM emp;

--Oracle ������ ���� (���ڿ� : ��ҹ��� ����)
--���ڿ� ǥ�� ('���ڿ�')
--�ҹ��� 'a'   �빮�� 'A' �ٸ� ���ڿ��̴�
SELECT empno , ename 
FROM emp 
WHERE ename = 'king';

SELECT empno , ename 
FROM emp 
WHERE ename = 'KING';

--Oracle SQL ��� : ������ (���� ������ (||) , ���������(+)) ����
--java + (���� + ���� >> ����)
--java + (���ڿ� + ���ڿ� >> ����)
--TIP) ms-sql(+ ���� ,����)

SELECT '����� �̸��� ' || ename || ' �Դϴ�' AS "�������"
FROM emp;

--empno , ename >> �÷�  >> Ÿ�� 
--Ÿ��(�ڷ���) : ���� , ����(���ڿ�) , ��¥ ...
DESC emp;
/*
���̺��� �⺻ ���� (�÷��� , null ���� , Ÿ��)
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER       
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER  
*/

SELECT empno || ename  --����  ||  ���ڿ�  (���������� ���� -> ���ڿ�)
FROM emp;

SELECT empno + ename  --ORA-01722: invalid number (��� ����)
FROM emp;

--����� ..�츮 ȸ�翡 ������ ��� �ֳ�
SELECT job FROM emp;
--distinct : �ߺ� ������ ����
--distinct : grouping �� ������ ó��
SELECT DISTINCT job FROM emp;

SELECT DISTINCT job , deptno FROM emp ORDER BY job;

SELECT DISTINCT deptno , job FROM emp ORDER BY deptno;

--Oracle ���
--Java ���
--Oracle �����ڰ� Java ���� ���� (+ , * , - ...)
-- % �ڹ�(������) , % ����Ŭ���� ������ (�˻� ����)
--����Ŭ (+ , - , * , / ) ������  �Լ� >> Mod()
--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���
--desc emp;
SELECT empno , sal , sal + 100 AS "�λ�޿�" FROM emp;

--dual �ӽ� ���̺�
SELECT 100 + 100 FROM dual;
SELECT 100 || 100 FROM dual; --���������� ����ȯ ... 100100
SELECT '100' + 100 FROM dual; -- + ������ ��� .. ����ȯ
SELECT '100A' + 100 FROM dual; -- ORA-01722: invalid number

--�񱳿�����
-- > < <=
--java ���� (==) �Ҵ�(=)
--Oracle ����(=) ���� �ʴ�(!=)

--��������
--AND , OR  , NOT

--������ (���ϴ� row ������ ���ڴ�)
SELECT *
FROM emp
WHERE sal >= 3000;

SELECT empno, ename, sal
FROM emp
WHERE sal > 3000;

--�̻� , ����  (=)
--�ʰ� , �̸� 

--����� 7788���� ����� ���, �̸�, ����, �Ի����� ����ϼ���
--������ , ������ , Ʃ�� , ���� 
--������� : 
SELECT empno, ename, job , hiredate     --3  
FROM emp                                --1 
WHERE empno = 7788;                     --2 

--����� �̸��� king �� �����  ��� , �̸� , �޿� ������ ����ϼ���
SELECT empno , ename , sal
FROM emp 
WHERE ename = 'KING';

--�� (AND , OR)
--�޿��� 2000�޷� �̻��̸鼭 ������ manager �� ����� ��� ������ ����ϼ���
--�ΰ��� ������ ��� �����ϴ� ������ (�Ѵ� ����)
SELECT *
FROM emp 
WHERE sal >= 2000 AND job='MANAGER';

--�޿��� 2000�޷� �̻��̰ų� ������ manager �� ����� ��� ������ ����ϼ���
SELECT *
FROM emp 
WHERE sal >= 2000 OR job='MANAGER';

--����Ŭ ��¥(DB������ ��¥)
--����Ŭ ��¥ (sysdate)

SELECT sysdate FROM dual; --2020-03-31 14:28:36
select * from SYS.nls_session_parameters;

SELECT sysdate FROM dual;
--20/03/31

--���� ������ ����ڰ� ��¥ ������  YYYY-MM-DD HH24:MI:SS ������ �����ϰڴ�

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from SYS.nls_session_parameters;  --�ý��� ������ ������ �ִ� ȯ�����̺�
--NLS_DATE_FORMAT	RR/MM/DD
--NLS_DATE_LANGUAGE	   KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate  from dual;  --2020-03-31 14:35:29

SELECT hiredate FROM emp;

--�Ի��� 1980-12-17 �� ����� ��� ������ ����ϼ���
SELECT *
FROM emp 
WHERE hiredate = '1980-12-17';

SELECT *
FROM emp 
WHERE hiredate = '1980/12/17';

SELECT *
FROM emp 
WHERE hiredate = '80-12-17';
--���� : RR-MM-DD  >> YYYY-MM-DD 

--����� �޿��� 2000�̻��̰� 4000������ ��� ����� ������ ����ϼ���
 SELECT *
 FROM emp 
 WHERE sal >= 2000 AND sal <= 4000;
--������ : between A and B (= ����)
--�̸� �ʰ� ������ ������ (= �������� �ʾƿ�)
SELECT *
FROM emp 
WHERE sal BETWEEN 2000 AND 4000;

--����� �޿��� 2000�ʰ��̰� 4000�̸��� ��� ����� ������ ����ϼ���
 SELECT *
 FROM emp 
 WHERE sal > 2000 AND sal < 4000;

--�μ���ȣ�� 10 �Ǵ� 20�� �Ǵ� 30���� 
--����� ��� , �̸�, �޿� , �μ���ȣ ����ϼ���
SELECT empno , ename , sal , deptno
FROM  emp 
WHERE deptno =10 OR deptno=20 OR deptno=30;
--IN ������

SELECT empno , ename , sal , deptno
FROM emp 
WHERE deptno in(10,20,30);
--in �����ڸ� Ǯ� : WHERE deptno =10 OR deptno=20 OR deptno=30;

--�μ���ȣ�� 10�Ǵ� 20�� �ƴ� ����� ��� , �̸�, �޿� , �μ���ȣ�� ����ϼ���
SELECT *
FROM emp 
WHERE deptno != 10 AND deptno!=20;

--IN �� ������ ,,,,,, NOT IN
SELECT *
FROM emp 
WHERE deptno NOT IN (10,20); -- deptno != 10 AND deptno!=20;
--������ and ������ and .......
--NOT IN ������ AND >>deptno != 10 AND deptno!=20;

--POINT : Oracle �� ǥ�� (������ ����) >> null
--null �ʿ��

CREATE TABLE MEMBER (
  userid varchar2(20) NOT NULL , -- �ʼ��Է�
  name varchar2(20) NOT NULL, --�ʼ��Է� 
  hobby varchar2(50) -- default null (null ���� ���) ������ �ȹ޾Ƶ� ��
);

SELECT * FROM MEMBER;
--INSERT INTO MEMBER(userid,hobby) values('hong','��');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(userid,name) values('hong','ȫ�浿');
--hobby �÷��� �����ʹ� null �ڵ� ...
INSERT INTO MEMBER(userid,name,hobby) 
values('kim','�达','����');
--�ǹݿ�
COMMIT;

SELECT * FROM MEMBER;

--����(comm)�� ���� �ʴ� ��� ����� ������ ����ϼ���
--0�� ������ ��� (�޴� ���ǿ� ����)
--comm �÷��� �����Ͱ� null �� �͸�
SELECT * FROM emp;
--SELECT * FROM emp WHERE comm = NULL; (x)

--null �� �񱳴�  (IS NULL , IS NOT NULL)
SELECT * FROM emp WHERE comm IS NULL;

--����(comm) �� �޴� ��� ����� ������ ����ϼ���
SELECT * FROM emp WHERE comm IS NOT NULL;

--��� ���̺��� ���, �̸� , �޿� , ���� , �ѱ޿��� ����ϼ���
--�ѱ޿�(�޿� + ����)
SELECT empno , ename, sal , comm , sal + comm 
FROM emp;

SELECT empno , ename, sal , comm , sal + nvl(comm,0) AS "�ѱ޿�"
FROM emp;

--POINT  >> null
--1. null ���� ��� ������  �� ����� >> null
--2. �� ���� �ذ� : nvl() , nvl2() >> null ����  replace ġȯ ...
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

SELECT NULL + 100 FROM dual;
SELECT 100 + nvl(NULL,0) FROM dual;
SELECT comm , nvl(comm,1111) FROM emp;

--����� �޿��� 1000�̻��̰� ������ ���� �ʴ� ����� ���, �̸�, ���� , �޿�
-- ,������ ����ϼ���
SELECT empno , ename , job , sal , comm 
FROM emp WHERE sal >= 1000 AND comm IS NULL;
-----------------------------------------------------------
--DQL(data query language) : SELECT  (60%)
--DDL : create , alter , drop (��ü (���̺�) ���� , ���� , ����)
--DML : insert , update , delete (������ ����) (10%)

--java  : class Board  { private boardno int }
--Oracle: create table Board (boardno number not null) 

CREATE TABLE board (
  boardid NUMBER NOT NULL , --���� , �ʼ� �Է�
  title varchar2(20) NOT NULL , --�ѱ�10�� , ������,Ư��,���� 20�� �ʼ��Է�
  content varchar2(2000) NOT NULL, --�ʼ� �Է�
  hp varchar2(20) --default null ��� (�ʼ� �Է��� �ƴϴ�)
 );

SELECT * FROM board;
--desc board;

--DML(������ ���۾�) �� �ݿ� ���θ� ���� 
--insert
--update
--delete
--�ݵ�� �� ����� �ݿ� ���� , ��� ���� �ǻ� ����
--commit(�����ݿ�)
--rollback(�����ݿ� ���) 

INSERT INTO board(boardid, title, content)
values(100,'����Ŭ','�� �Ҹ��ѵ�');

COMMIT;
SELECT * FROM board;

INSERT INTO board(boardid, title, content)
values(200,'�ڹ�','�׸���');

SELECT * FROM board;
COMMIT;

INSERT INTO board(boardid, title, content,hp)
values(300,'����','������','010-000-0000');

SELECT * FROM board;
COMMIT;

SELECT boardid, nvl(hp,'EMPTY') AS "hp" FROM board;

--���ڿ� �˻�
--�ּҰ˻� : [��] �Է�  >> ���ﵿ , ���� , .... (Like ���� �˻�)
--���ڿ� ���� �˻� ������ : like
--like ������ ���� (���ϵ� ī�� ���� (% : ��� �� ,  _ : �ѹ���) ����

SELECT ename 
FROM emp WHERE ename LIKE '%A%'; --ename �÷��� ������ �߿��� A�� ����ִ� �̸�

SELECT ename 
FROM emp WHERE ename LIKE '%a%'; --���ڿ� ������ ��ҹ��� ���� (����)

SELECT ename
FROM emp WHERE ename LIKE 'A%'; --�̸��� ù ���ڰ� A�� ���

SELECT ename
FROM emp WHERE ename LIKE '%S'; --�̸��� ������ ���ڰ� S�� ���

--SELECT * FROM MEMBER WHERE name LIKE '%���ѹ�%'

SELECT ename 
FROM emp WHERE ename LIKE '%LL%'; --LL �پ� �־��

SELECT ename 
FROM emp WHERE ename LIKE '%L%L%'; -- L 2�� ������

SELECT ename 
FROM emp WHERE ename LIKE '%A%A%'; --ADAMS

SELECT ename 
FROM emp WHERE ename LIKE '_A%'; --ù���ڴ� ����� �͵� ������� �ι�° ���ڴ� A
--WARD
--MARTIN
--JAMES

--���� ǥ���� (java - DB - script)
--regexp_like
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'[A-C]'); 
--���� ǥ�� ���� 5�� ����� (���� ī�� )
----------------------------------------------------------
--������ �����ϱ�
--order by �÷��� : ���ڿ� , ���� , ��¥
--�������� : asc : ������  (default)
--�������� : desc: ������

SELECT *
FROM EMP
ORDER BY sal;

SELECT *
FROM EMP
ORDER BY sal asc;

--�޿��� ���� �޴� ������ �����ؼ� ����ϼ���
SELECT * FROM emp ORDER BY sal DESC;

--�Ի����� ���� ���� ������ �����ؼ� ��� , �̸� , �޿� , �Ի��� �����͸� ����ϼ���
--(���� �ֱٿ� �Ի��� ������)
SELECT empno, ename, sal , hiredate 
FROM emp 
ORDER BY hiredate DESC;
/*
SELECT              3    
FROM                1   
WHERE               2    
ORDER BY            4  ( select ����� ����) >> DB ���� ���� �۾�  
*/

--�ؼ� 
SELECT empno , ename , sal , job , hiredate
FROM emp 
WHERE job = 'MANAGER'
ORDER BY hiredate DESC;

--order by �÷��� desc , �÷��� asc , �÷��� desc
SELECT job , deptno
FROM emp 
ORDER BY job ASC , deptno DESC; -- grouping ����

-----------------------------------------------------
--������
--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�⺻ : �ߺ��� ����)
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�ߺ���  ���)

CREATE TABLE uta (name varchar2(20));

INSERT INTO uta(name) values('AAA');
INSERT INTO uta(name) values('BBB');
INSERT INTO uta(name) values('CCC');
INSERT INTO uta(name) values('DDD');
COMMIT;

SELECT * FROM uta;

CREATE TABLE ut (name varchar2(20));

INSERT INTO ut(name) values('AAA');
INSERT INTO ut(name) values('BBB');
INSERT INTO ut(name) values('CCC');
COMMIT;

SELECT * FROM ut;

--union
SELECT * FROM ut
UNION
SELECT * FROM uta;

--union all
SELECT * FROM ut
UNION ALL 
SELECT * FROM uta;

--unioin 
--1. ������� [�÷��� Ÿ��]�� ����
SELECT empno , ename FROM emp
UNION
SELECT dname , deptno FROM dept;
--expression must have same datatype as corresponding expression
SELECT empno , ename FROM emp
UNION
SELECT deptno , dname FROM dept;

--2. ������� �÷��� ������ ���� ( null ������)
SELECT empno  , ename, job , sal FROM emp
UNION
SELECT deptno , dname, loc , null  FROM dept;
--query block has incorrect number of result columns

--�ǹ� >> subquery (in line view)
SELECT empno , ename
FROM  (
		SELECT empno , ename FROM emp
		UNION
		SELECT deptno , dname FROM dept
	  ) ORDER BY empno DESC;

--������� �ʺ� ������ ..... �ǹ������� ... ���̺� �Ѱ� ...(�������̺�)
-----------------------------------------------------------
--����Ŭ �Լ� (���� ����(pdf) : 50 page)
/*	 
���� �� �Լ��� ���� 
1)������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�. 
2)������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�. 
3)��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ��� �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�. 
4)��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�. (to_char() , to_number(), to_date())
5)�Ϲ����� �Լ� : NVL, DECODE 	 
	 
*/	 
/ 
/*
�ѱ� ���� .... ���� ... ���ĺ��� ����
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8  �ѱ� 3byte �ν�
--KO16KSC5601 2Byte (���� ��ȯ�ϸ� �ѱ� �ٱ���)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';	 
*/

--���ڿ� �Լ�
SELECT INITCAP('the super man') FROM dual;  --The Super Man

SELECT lower('AAA') , upper('aaa') FROM dual;

SELECT ename , lower(ename) AS "ename" FROM emp;

SELECT * FROM emp WHERE lower(ename) = 'king';

--���ڿ� ����
SELECT LENGTH('abcd') FROM dual; --4��

SELECT LENGTH('ȫ�浿') FROM dual; --3��

SELECT LENGTH(' ȫ a�� ��') FROM dual; --7��

--���� ������ ||
--concat()

SELECT 'a' || 'b' || 'c' AS "data"  FROM dual; --abc
SELECT CONCAT('a','b')  FROM dual; --ab

SELECT concat(ename,job) AS "concat" FROM emp; --SMITHCLERK
SELECT ename || '    ' ||job AS "concat" FROM emp; --SMITH    CLERK

--�κ� ���ڿ� ����
--java(substring)
--oracle(substr)

SELECT substr('ABCDE',2,3) FROM dual; --BCD
SELECT substr('ABCDE',1,1) FROM dual; --�ڱ��ڽ� A
SELECT substr('ABCDE',3,1) FROM dual; --C

SELECT substr('ABCDE',3) FROM dual; --CDE

SELECT substr('ABCDE',-2,1) FROM dual; --D
SELECT substr('ABCDE',-2,2) FROM dual; --DE

/*
������̺��� ename �÷� �����Ϳ� ���ؼ�  ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� 
����ϼ���
��) �� ����� �ϳ��� �÷����� 
(�÷��� �̸��� fullname)
(ù���ڿ� ������ ���� ���̿� �����ϳ� �־ ���)
SMITH -> [s MITH]

*/
SELECT lower(substr(ename,1,1)) FROM emp;

SELECT upper(substr(ename,2)) FROM emp;

SELECT lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) AS "fullname"
FROM emp; 
--s MITH

--lpad , rpad (ä���)
SELECT lpad('ABC',10,'*') FROM dual; --*******ABC
SELECT rpad('ABC',10,'^') FROM dual; --ABC^^^^^^^ 

--Quiz
--����� ���: hong1006
--ȭ�� : ho****** ����ϰ� �;�� (��� : 1004 > 10**)
SELECT rpad(substr('hong1006',1,2),LENGTH('hong1006'),'*') 
FROM dual; --ho******

SELECT rpad(substr('1004',1,2),LENGTH('1004'),'*') 
FROM dual; --10**

--emp ���̺��� ename �÷��� �����͸� ����ϴµ� ù���ڸ� ����ϰ� ������ * �� ǥ���ϼ���
SELECT rpad(substr(ename,1,1),LENGTH(ename),'*') AS "ename"
FROM emp;

CREATE TABLE member2(
	id NUMBER,
	jumin varchar2(14)
);

INSERT INTO member2(id, jumin) values(100,'123456-1234567');
INSERT INTO member2(id, jumin) values(200,'234567-1234567');
COMMIT;
SELECT * FROM member2;
--�ϳ��� �÷����� ������� ���
--100 : 123456-*******
--200 : 234567-*******
--�÷����� "juminnumber"
SELECT id || ' : ' || rpad(substr(jumin,1,7),LENGTH(jumin),'*') AS "jumin"
FROM member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim �Լ�
--[������ ���ڸ� ������]
SELECT rtrim('MILLER','ER') FROM dual; --MILL
SELECT ltrim('MILLLLLLLLLER','MIL') FROM dual; --ER

SELECT '>' || rtrim('MILLER      ',' ') || '<' FROM dual;
-->MILLER<

--ġȯ�Լ� (replace)
SELECT ename , replace(ename,'A','�Ϳ�^^') FROM emp;
--SMITH	SMITH
--ALLEN	�Ϳ�^^LLEN
----------���ڿ� �Լ� (END)------------------------------------
--[���� �Լ�]
--round(�ݿø� �Լ�)
--trunc(�����Լ�)
--mod() ������ ���ϴ� �Լ�
--                  .
--   ...-3  -2  -1  0  1   2   3 ...  
SELECT round(12.345,0) AS  "r" FROM dual; -- �����θ� ���ܶ�  12
SELECT round(12.567,0) AS  "r" FROM dual; -- 13
SELECT round(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT round(12.567,1) AS  "r" FROM dual; -- 12.6 

SELECT round(12.345,-1) AS  "r" FROM dual; --10
SELECT round(15.345,-1) AS  "r" FROM dual; --20
SELECT round(15.345,-2) AS  "r" FROM dual; --0



--trunc(�����Լ�)
SELECT trunc(12.345,0) AS  "r" FROM dual; -- �����θ� ���ܶ�  12
SELECT trunc(12.567,0) AS  "r" FROM dual; -- 12
SELECT trunc(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT trunc(12.567,1) AS  "r" FROM dual; -- 12.5 

SELECT trunc(12.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-2) AS  "r" FROM dual; --0

--������
SELECT 12/10 FROM dual; --1.2
SELECT mod(12,10) FROM dual; --2 ������ (�Լ�)

SELECT mod(0,0) FROM dual; --0

----------------------[���� �Լ� END]-------------------------
--[ ��¥ �Լ� ]
SELECT sysdate FROM dual;  --2020-04-01 12:16:14
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--��¥ ���� (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date   >> Number (�ϼ�)

SELECT hiredate FROM emp; --1981-02-20 00:00:00

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01') FROM dual; --96����
 

SELECT round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.565016427718040621266427718040621266
--122.6
SELECT trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.5

--POINT
--��¥ ������ ���ڿ��� ��¥�� �ٲٴ� �Լ� (to_date())
SELECT to_date('2020-04-01') + 100 FROM dual; --2020-07-10 00:00:00
SELECT to_date('2020-04-01') - 100 FROM dual; --2019-12-23 00:00:00
SELECT sysdate + 1000 FROM dual; --2022-12-27 12:26:30

--Quiz
--1. ��� ���̺��� ������� �Ի��Ͽ��� ���糯¥���� �ټӿ����� ���ϼ���
--�� �ټӿ����� �����κи� ����ϼ��� (�ݿø� ���� ������) MONTHS_BETWEEN
SELECT  ename ,
        hiredate , 
        trunc(months_between(sysdate,hiredate),0) as "�ټӿ���" 
FROM  emp;
--2. �Ѵ��� 31 �� �̶�� ���ؿ��� �ټӿ����� ���ϼ��� (�ݿø� ���� ������) 
--�Լ� ������� ���� >> (��¥ - ��¥ >> 150�� )
SELECT ename , hiredate , trunc((SYSDATE - hiredate) / 31,0) AS "�ټӿ���"
FROM emp;
--------------[��¥ �Լ� END]-------------------------------
--����
--����
--��¥ �Լ� �� ���� 
---------------------------------------------------------
--[��ȯ�Լ�] : TODAY POINT
--����Ŭ : ���� , ���� , ��¥ 
--to_char() : ���� -> ���� (1000 -> $1000) ,
--            ��¥ -> ���� (2020-01-01 -> 2020��01��01��) format

--to_date() : ���� -> ��¥ >> select '2020-12-12' + 100 
--                         select to_date('2020-12-12') + 100

--to_number() : ���� -> ���� (���� �ڵ� ����ȯ)
SELECT '100' + 100 FROM dual;
SELECT to_number('100') + 100 FROM dual;

--to_number  (���� -> ����) �ڵ� ����ȯ
SELECT '1' + 100 FROM dual; -- 
SELECT to_number('1') + 100 FROM dual;

--to_char() : format >> ���� , ��¥  (���Ĺ���)
SELECT to_char(sysdate) || '��' FROM dual; --2020-04-01 12:55:23��
--pdf 69page (���Ĺ��� ǥ)
SELECT sysdate , 
to_char(sysdate,'YYYY') || '��' AS "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
FROM dual;
--2020-04-01 12:57:16	2020��	TWENTY TWENTY	04	01	��

--�Ի���� 12���� ������� ��� , �̸� , �Ի���, �Ի�⵵ , �Ի���� ����ϼ���
SELECT empno,ename,hiredate ,
TO_CHAR(hiredate,'YYYY')  AS "YYYY",
TO_CHAR(hiredate,'MM') AS "MM"
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12';

SELECT to_char(hiredate,'YYYY MM DD')  FROM emp;
--1980 12 17
SELECT to_char(hiredate,'YYYY"��" MM"��" DD"��"')  FROM emp;
--1980�� 12�� 17��

--to_char() ���� -> ���ڷ� (���Ĺ���)
--pdf ���� 71page ǥ
--100000 >> ��� >> $1,000,000 (����)

SELECT '>' || to_char(12345,'999999999999') || '<' FROM dual; 
-->        12345<
SELECT '>' || to_char(12345,'099999999999') || '<' FROM dual;
--> 000000012345<

SELECT '>' || to_char(12345,'$9,999,999,999') || '<' FROM dual;
-->        $12,345<

SELECT sal , to_char(sal,'$999,999') FROM emp;
--800	     $800
--1600	   $1,600
--HR �������� ��ȯ ------------------------------
--HR ���� ��ȯ �۾�
select * from employees;
desc employees;



/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ� fullname ��Ī �ο��ؼ� ����ϰ�
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� ������ 10%(���� * 1.1)�λ��� ����
����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
select * from employees;
/*
������̺�(employees)���� ����� �̸��� last_name , first_name ���ļ�
fullname ��Ī �ο��ؼ� ����ϰ� 
�Ի�����  YYYY-MM-DD �������� ����ϰ� ����(�޿� *12)�� ���ϰ� 
������ 10%(���� * 1.1)�λ��� ���� ����ϰ� �� ����� 1000���� �޸� ó���ؼ� ����ϼ���
�� 2005�� ���� �Ի��ڵ鸸 ����ϼ��� �׸��� ������ ���� ������  ����ϼ���
*/
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

--bit �������� 
-------------��ȯ�Լ� (to_char() , to_date() , to_number())----------

--[ �Ϲ��Լ�(���α׷������� ����) ]
--nvl() , nvl2() >> null ó�� ���
--decode() �Լ� >> java if�� (switch)
--case() �Լ� >>java if�� (switch)

SELECT comm, nvl(comm,0) FROM emp;

CREATE TABLE t_emp (
   id number(6),
   job varchar2(20)
);
INSERT INTO t_emp(id,job) values(100,'IT');
INSERT INTO t_emp(id,job) values(200,'SALES');
INSERT INTO t_emp(id,job) values(300,'MGR');
INSERT INTO t_emp(id) values(400);
INSERT INTO t_emp(id,job) values(500,'MGR');

SELECT * FROM t_emp;
COMMIT;
SELECT  id, decode(id,100,'�λ��',
                      200,'������',
                      300,'ȸ���',
                      '��Ÿ�μ�') AS "�μ�"
FROM t_emp;


SELECT deptno, decode(deptno,10,'�λ��',
                             20,'������',
                             30,'ȸ���',
                             '��Ÿ�μ�') AS "�μ�"
FROM emp;

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
'����' ���  2�̸� '����' 3�̸� '�߼�' �� �ܴ� '��Ÿ' ��� ����ϼ���
*/
SELECT id, decode(substr(jumin,1,1), 1 , '����',
                                     2 , '����',
                                     3 , '�߼�',
                                     '��Ÿ') AS "gender"
FROM t_emp2;                                     
--1	����
--2	����
--3	�߼�
--4	��Ÿ
--5	��Ÿ
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
CREATE TABLE t_zip(
   zipcode number(10)
);

INSERT INTO t_zip(zipcode) values(2);
INSERT INTO t_zip(zipcode) values(31);
INSERT INTO t_zip(zipcode) values(32);
INSERT INTO t_zip(zipcode) values(33);
INSERT INTO t_zip(zipcode) values(41);
COMMIT;

SELECT * FROM t_zip;

SELECT '0' || TO_CHAR(zipcode) , 
       CASE zipcode WHEN 2 THEN '����' 
                    WHEN 31 THEN '���' 
                    WHEN 32 THEN '����' 
                    WHEN 41 THEN '����'
                    ELSE '��Ÿ����'
       END "regionname"   
FROM t_zip;       

/* emp
������̺��� ����޿��� 1000�޷� ���ϸ� '4��'
1001�޷� 2000�޷� ���ϸ� '3��'
2001�޷� 3000�޷� ���ϸ� '2��'
3001�޷� 4000�޷� ���ϸ� '1��'
4001�޷� �̻��̸� 'Ư��' �̶�� �����͸� ����ϼ���

1. case �÷���  when ���  then ���    (= ����)
2. ������ 
   case when �÷���  ����  �񱳽� then ..
        when �÷���  ����  �񱳽� then ..
        when �÷���  ����  �񱳽� then ..
*/
select      case when sal <= 1000 then '4��'
                 when sal between 1001 and 2000 then '3��'
                 when sal between 2001 and 3000 then '2��'
                 when sal between 3001 and 4000 then '1��'
                 else 'Ư��'
        end "�޿����"
from emp;
-----------------------------------------------------------
--�����Լ� 
--�����Լ�
--��¥�Լ�
--��ȯ�Լ� (to_char ,to_date , to_number)
--�Ϲ��Լ� (nvl() , decode() , case())
------------------------------------------------------------
-- [�����Լ�] page 75
/*
1. count(*) > row �ټ�  , count(�÷���) >> ������ �Ǽ� (null �� �������� �ʴ´�)
2. sum()
3. avg()
4. max()
5. min()
��� ...

�����Լ�
1. �����Լ��� group by ���� ���� ���
2. ��� �����Լ��� null ���� ���� 
3. select ���� �����Լ� �̿� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ���
*/

SELECT count(*) FROM emp; --14��
SELECT count(comm) FROM emp; --6��  (null ���� ����)
SELECT count(empno) FROM emp;

 
SELECT count(nvl(comm,0)) FROM emp; -- null >> nvl()

--�޿��� ��
SELECT sum(sal) AS "�޿���" FROM emp; --29025

SELECT round(avg(sal),0) AS "��ձ޿�" FROM emp; --2073.214285714285714285714285714285714286

--������� ȸ�� �� ���� �󸶳� ���޵ǰ� �ֳ� (������ ���)
SELECT TRUNC(avg(comm),0) FROM emp; --721
SELECT trunc(sum(comm) / 6) FROM emp; -- ����� (6��)

--���� ..���� .. ������ ... ...

SELECT TRUNC(avg(nvl(comm,0)),0) FROM emp; --309
SELECT trunc(sum(comm) / 14) FROM emp; 

--ȸ���� ������ (��ü ������� ������  .... 309)
--ȸ���� ������ (�޴� ������� ������  .... 721)

--���� :�ڵ�
SELECT count(*) FROM emp WHERE comm IS NULL; -- 8

SELECT count(*) FROM emp WHERE empno IS NULL; -- 0

SELECT max(sal) FROM EMP;

SELECT min(sal) FROM emp;

--POINT
SELECT empno , count(empno) FROM emp; --empno 14�� , count() 1��
--not a single-group group function
SELECT sum(sal) , avg(sal) , max(sal) , min(sal) , count(sal)
,count(*) FROM emp;

--�μ��� ��� �޿��� ����ϼ���
--not a single-group group function
SELECT deptno , avg(sal) 
FROM emp
GROUP BY deptno;

--������ ��� �޿��� ���ϼ���
SELECT job , avg(sal)
FROM emp 
GROUP BY job;

--������  ��ձ޿� , �޿��� , �ִ�޿� , �ּұ޿� , �Ǽ��� ����ϼ���

SELECT job , avg(sal) , sum(sal) , max(sal) , min(sal), count(sal)
FROM emp
GROUP BY job;
/*
grouping  ����

distinct �÷���1 , �÷���2
order by �÷���1 , �÷���2
group by �÷���1 , �÷���2 , �÷���3

*/

--�μ��� , ������ �޿��� ���� ���ϼ���
SELECT deptno , job , sum(sal) , count(sal)
FROM emp
GROUP BY deptno , job
ORDER BY deptno;
/*
10	CLERK		1300	1
10	MANAGER		2450	1
10	PRESIDENT	5000	1
20	ANALYST		6000	2
20	CLERK		1900	2
20	MANAGER		2975	1
30	CLERK		950		1
30	MANAGER		2850	1
30	SALESMAN	5600	4
*/
/*                                
select                       4 
from                         1
where                        2
group by                     3 
order by                     5
*/
--������ ��� �޿��� 3000�޶� �̻��� ����� ������ ��ձ޿��� ����ϼ���
--** group by ������  >> having  ��
--WHERE avg(sal) >= 3000 ������ ...(x)
SELECT job, avg(sal) AS "��ձ޿�"
FROM emp 
GROUP BY job  --�� ������� ... ����  ... having
HAVING avg(sal) >= 3000;
--PRESIDENT	5000
--ANALYST	3000

--from ������ >> where
--group by ������ >> having 

/*          
�ϳ��� ���̺��� ������� ���� �ִ� ���� ...                       
select                 5                    
from                   1      
where                  2      
group by               3
having                 4      
order by               6      
*/



/* ������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻��� 
    ������� ����� ����ϼ��� �޿��� ���� ���� ������ ����ϼ��� */
SELECT empno , job , sum(sal) AS "sumsal"
FROM emp 
WHERE comm IS NOT NULL 
GROUP BY job , empno
HAVING sum(sal) >= 5000
ORDER BY "sumsal" asc;

/* ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,
 �ο��� , �޿��� ���� ����ϼ��� */
SELECT deptno , count(deptno) AS "�μ��� �ο���" , sum(sal) "�μ��� �޿��� ��"
FROM emp 
GROUP BY deptno
HAVING count(deptno) > 4;

/* ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ�����(salesman) �� �����ϰ� �޿������� �������� �����ϼ��� */
SELECT job , sum(sal) AS "sumsal" 
FROM emp 
WHERE job != 'SALESMAN'
GROUP BY job
HAVING sum(sal) > 5000 
ORDER BY "sumsal" desc;

-----------------------------------------------------------
-- [ JOIN ]  (pdf 85 page)
-- ������ ������ ���̽�  (RDBMS)  >> ORDB (x) >> Framework (��ü���� :JPA , Mybatis)  >> noSQL(mongoDB)
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

--����
--1.����� (equi join) >> [ INNER ] JOIN 
--�����̺�� ������� ���̺� �ִ� �÷��� �����͸�  1:1 ����
--JOIN ����
--1. SQL JOIN ���� (��ǰ ...)
--2. ANSI ���� (����)(ǥ��)

--SQL JOIN ����
SELECT *
FROM m , s 
WHERE m.m1 = s.s1;

SELECT m.m1 , m.m2 , s.s2
FROM m , s 
WHERE m.m1 = s.s1;


--ANSI ���� (����)
--where (from  ������)
--where join ���ǰ�  �Ϲ� ������ ȥ���ϸ�  ȥ�� ...
--JOIN ���� �и�  >>  ON �� 
SELECT *
FROM M INNER JOIN S 
ON M.M1 = S.S1;

SELECT M.M1 , M.M2 , S.S2
FROM M JOIN S  --INNER ����
ON M.M1 = S.S1;

--�����ȣ , ����̸� , ����μ���ȣ , ��� �μ����� �˰� �;��
SELECT EMP.EMPNO , EMP.ENAME , EMP.DEPTNO , DEPT.DNAME 
FROM EMP JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO;


--join ���̺� ����Ī �ο� >> �� �̸����� ����
SELECT E.EMPNO , E.ENAME , E.DEPTNO , D.DNAME 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;

--JOIN (2, 3 ....) ������ ���̺�

--SQL JOIN ����
SELECT m.m1 , m.m2 , s.s2 , x.x2
FROM m , s , x 
WHERE m.m1 = s.s1 AND s.s1 = x.x1;
--A == B , B == C , A == C

--ANSI ����
SELECT *
FROM m JOIN s  ON m.m1 = s.s1
       JOIN x  ON s.s1 = x.x1;
--     JOIN y  ON x.x1 = y.y1
-- [ HR �������� �̵� ]
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
--1. ��� , �̸�(last_name) , �μ���ȣ , �μ��̸� ����ϼ���
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID; 
--106��
--107���ε� why >> 106��
SELECT count(*) FROM EMPLOYEES; --107
--JOIN �� NULL �������� �ʾƿ�
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID  IS NULL;  
--178�� ����� �μ�id >> NULL
--��������� �ذ�Ұ� (outer join) ��� ...�ذ�

--2. ��� , �̸�(last_name), �μ���ȣ , �μ��� , �����ڵ� , ���ø�
--�� ����ϼ���
SELECT e.EMPLOYEE_ID , 
       e.LAST_NAME ,
       e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME ,
       d.LOCATION_ID ,
       l.CITY 
FROM EMPLOYEES e JOIN DEPARTMENTS d
				 ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
				 JOIN LOCATIONS l 
				 ON d.LOCATION_ID = l.LOCATION_ID; 
---------------------------------------------------------
--bit ����--				
--2. �� ���� (non-equi join) => �ǹ̸� ���� => ����� ����
--�����̺�� ������� ���̺� �ִ� �÷��� 1:1 ���ε��� �ʴ� ���
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT e.empno , e.ename , e.sal , s.GRADE 
FROM emp e JOIN salgrade s
ON e.sal BETWEEN s.LOSAL  AND s.HISAL; 
--------------------------------------------------------

----------------------------------------------------
--3. outer join (equi join + null)
--outer join (�� ������ �ľ�) >> �ְ� �Ǵ� ���̺� �ִ� ���� ������ ��������
--���� 3����
-- left outer join (���� ����)
-- right outer join (������ ����)
-- full outer join (���� ���� + ������ ���� >> union)

--left [ outer ] ��������  join
--left join
--right join


SELECT *
FROM m JOIN s 
ON m.m1 = s.s1;

SELECT *
FROM m LEFT OUTER JOIN s 
ON m.m1 = s.s1;
   		
SELECT *
FROM m RIGHT OUTER JOIN s 
ON m.m1 = s.s1;

--left , right outer union
SELECT *
FROM m FULL OUTER JOIN s 
ON m.m1 = s.s1;

--HR �������� --
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
ORDER BY e.EMPLOYEE_ID; 
--178�� ����� �μ�id >> NULL ��µǰ� �ϼ���
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID  IS NULL; 
-----------------------------------------------------
--self join (�ڱ�����) -> �ǹ�  -> ���� (�����)
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���
--���� (���̺� 1�� �̻�)
--���̺��� ����Ī �޸��ؼ� ������ ���̺� ó��
SELECT e.empno , e.ENAME  , m.EMPNO  , m.ENAME 
FROM emp e JOIN emp m
ON e.mgr = m.EMPNO; 
--���� : 14��    >> 13��
SELECT * FROM emp;

--king �� ����ϼ���
SELECT e.empno , e.ENAME  , m.EMPNO  , m.ENAME 
FROM emp e LEFT JOIN emp m
ON e.mgr = m.EMPNO; 

--JOIN TEST-- 3�� 10��  (emp, dept , salgrade)
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
--WHERE Regexp_like(E.ENAME,'^A'); 
-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
SELECT E.ENAME, D.DNAME, E.SAL ,D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO 
WHERE E.JOB='SALESMAN';
 
-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
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
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E   join DEPT D on E.DEPTNO=D.DEPTNO
             join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
-- inner �� ���� ����
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D              on E.DEPTNO=D.DEPTNO
            join SALGRADE S       on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;

 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
----------------------------------------------------
--subquery ����Ŭ.pdf (100page)
--sql �� ���̴�  >> sql �� ���� �ذ��
--�Լ� >> ���� >> subquery

--������̺��� ������� ��� ���޺��� �� ���� �޿��� �޴� �����
--��� , �̸� , �޿��� ����ϼ���
SELECT avg(sal) FROM emp; --2073

SELECT *
FROM emp 
WHERE sal > 2073;

SELECT *
FROM emp 
WHERE sal > (SELECT avg(sal) FROM emp);

SELECT sal FROM emp;

--subquery
/*
1. single row subquery : subquery ��� row 1��(�����÷� ���ϰ�) 
2. Multi  row subquery : subquery ��� row 1�� �̻�(�����÷� �������� ��)
�����ϴ� ������ : ���Ǵ� ������ ....
multi row : IN , NOT IN (ANY ,ALL)
ALL(and) : sal > 1000 and sal > 2000 and sal ...
ANY(or)  : sal > 1000 or sal > 2000 or sal...

����(subquery)
1. ��ȣ�ȿ� �־�� �Ѵ� >> (select sal from emp)
2. ���� �÷����� ���� >> (select sal , deptno from emp) (x)
3. �ܵ����� ���� ���� 

�������
1. ������ subquery ���� ����
2. subquery �� ������� ������ main query ����
*/
--������̺��� jones �޿����� �� ���� �޿��� �޴� ����� ���, �̸� , �޿�
--����ϼ���

SELECT sal FROM emp WHERE ename = 'JONES'; --2975

SELECT * 
FROM emp 
WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');

--subquery �޿��� 2000 �̻�
SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal IN (SELECT sal FROM emp WHERE sal > 2000);
--WHERE sal = 2975 or sal=2850 or sal=2450 or sal=3000 
--2975 2850 2450 3000 5000 3000
--single-row subquery returns more than one ROW


SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal NOT IN (SELECT sal FROM emp WHERE sal > 2000);
--NOT IN (������ and)
--2975 2850 2450 3000 5000 3000
--where sal != 2975 and sal != 2850 and sal != 2450 and ..

--���������� �ִ� ����� ����� �̸��� ����ϼ���
--(�� ����� mgr �÷���)
SELECT mgr FROM emp;
SELECT *
FROM emp WHERE empno IN (SELECT mgr FROM emp);
--empno=7788 or empno=7902 or empno=null

--���������� ���� ����� ����� �̸��� ����ϼ���
SELECT *
FROM emp WHERE empno NOT IN (SELECT mgr FROM emp);
--empno != 7902 and empno != 7788 and empno is not null
--and null ��� null

SELECT *
FROM emp WHERE empno NOT IN (SELECT nvl(mgr,0) FROM emp);


SELECT *
FROM emp WHERE empno 
NOT IN (SELECT mgr FROM emp WHERE mgr IS NOT null);

--king ���� �����ϴ� �� ���ӻ���� king �� ����� ��� , �̸� , ���� , ������ ���
--�� ����ϼ���
SELECT empno FROM emp WHERE ename='KING';

SELECT empno, ename , job , mgr
FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� 
--��� , �̸� , �޿� , �μ���ȣ�� ����ϼ���
SELECT max(sal) FROM emp WHERE deptno=20; --3000

SELECT empno , ename, sal , deptno
FROM emp 
WHERE sal > (SELECT max(sal) FROM emp WHERE deptno=20);

--POINT--
--subquery >> select ���� 
--         >> from
--         >> where 

SELECT *
FROM emp 
WHERE  deptno IN (SELECT deptno FROM emp WHERE job='SALESMAN')
       AND sal IN (SELECT sal FROM emp WHERE job='SALESMAN');
--QUIZ
--�ǹ����� Ȱ�� (���)
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� 
--����� ���, �̸� , �μ���ȣ , �μ��� ��� ������ ����ϼ���    
--1 �ܰ� : �μ���ȣ�� �μ��� ��տ����� ��� �ִ� ���̺��� �����Ѵٸ� 
--.... (�������� ���̺��� ����� ...)
SELECT deptno , round(avg(sal),0) FROM emp GROUP BY deptno;
--2 �ܰ� : from �� subquery ��밡�� ... (�������̺�) ...in line view
SELECT e.empno , e.ename , e.deptno , e.sal , s.avgsal
FROM emp e JOIN  (SELECT  deptno , round(avg(sal),0) AS avgsal 
       			  FROM emp GROUP BY deptno) s
ON e.DEPTNO  = s.deptno
WHERE e.sal > s.avgsal;

/*
�μ���ȣ     ��ձ޿�
30	     1567
20	     2175
10	     2917
*/
--subquery �������� Ǫ����  (�ð� : 10�� 10�б��� )
--ī�信 �־�� 
--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
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
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO    -- = �� �´µ�  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');
 
--8. SALES �μ����� ���ϴ� �������  ���� �μ���ȣ, �̸�, ������ ���� ��������� ����϶�.
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES')
 
SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES')
 
--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
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
 
--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);
 
--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.
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
-----------------------------------------------------------
/*
 select 
 from
 where
 group by
 having
 order by
 
 �⺻ �Լ� ~~~~ �����Լ�
join (�ϳ� �̻��� ���̺��� ������ �������� : ���� ���̺� : ����)   
subquery 
�ʱ� ������ �⺻ �Ҿ� ....  
 */
-----------------------------------------------------
--[INSERT] , [UPDATE] , [DELETE]  >> �ϱ� 
/*                        
����Ŭ ����
DDL(������ ���Ǿ�) : create , alter , drop , truncate (rename,modify)
DML(������ ���۾�) : insert , update , delete   (0) : 20%
DQL(������ ���Ǿ�) : select                     (0) : 70% 
DCL(������ �����) : ���� (grant , revoke)  >> DBA (������ : ����͸� : ��� ����)
TCL(Ʈ�����)     : commit , rollback , savepoint  (0)                       

������ : CRUD (Create > insert , Read > select , U > Update, D > Delete) 
*/                        

--DML (Ʈ����� : (Transaction) : �ϳ��� ������ �۾� ����) > LOCK 
--A��� ���࿡�� �� ����  B��� ���࿡ �Ա� 
--A : update ... 1000 > 500
--B : update ... 1000 > 1500                        
--�Ѵ� ���� : commit
--���߿� �ϳ��� ���� : rollback 

SELECT * FROM tab;   --������ ����ڰ� ���� ��� ���̺� ���  

SELECT * FROM tab WHERE tname ='BOARD';  --Board ���̺��� ����

SELECT * FROM  col;

SELECT * FROM col WHERE tname='EMP';

SELECT * FROM user_tables; --������ 
SELECT * FROM user_tables WHERE table_name ='DEPT';

-------------------------------------------------
--DML (����Ŭ.pdf  168page)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])] 
VALUES  (value1[, value2, . . . . . . ]);
*/
CREATE TABLE temp(
  id NUMBER PRIMARY KEY ,-- not null �ϰ� unique �����͸�
  name varchar2(20)  --default null �� ���
);
/*
   ���� Ÿ��
  char(20)    >> 20byte >> �ѱ�10��, ������20�� >>�������̹��ڿ�
  varchar2(20)>> 20byte >> �ѱ�10��, ������20�� >>�������̹��ڿ�
  
  char(20)    >> 'ȫ�浿' >> 6byte >> [ȫ�浿         ] >> 20byte
  varchar(20) >> 'ȫ�浿' >> 6byte >> [ȫ�浿] >> 6byte
  
  ex)
    �������� ������ : ��,�� : char(2)
    �������� ������ : �̸� ...  
  
   ���ɻ��� ����    : char() > varchar() �켱 ...
   �׷� ... �������� ������ char()  .... ���� , �ֹι�ȣ , �����ȣ 
   
   �ѱ۹���  (unicode : 2byte ) >> �ѱ�, ������ , Ư������ , ���� 
  
  nchar(20)  >> 20 >> ���ڼ�  >> �� byte >> 2 * 20 >> 40byte
  nvarchar(10) >> 10���� 
 
*/
SELECT * FROM temp;

--1. ���� �Ϲ����� INSERT
INSERT INTO temp(id,name)
VALUES(100,'ȫ�浿');

SELECT * FROM temp;
--�ǹݿ�
COMMIT;

--2 �÷� ��� ���� (�÷� ����Ʈ ����)
INSERT INTO temp 
VALUES(200,'������'); --������ �÷��� ���� , ���� ��ġ

SELECT * FROM temp;
COMMIT;

--1. ���� ��Ȳ
INSERT INTO temp(id , name) --id primary key
VALUES(100,'�ƹ���');
--unique constraint (BIT.SYS_C007005) violated

INSERT INTO temp(name) --not null , unique 
VALUES('�ƹ���');
--cannot insert NULL into ("BIT"."TEMP"."ID")
-------------------------------------------------------
--�Ϲ� SQL ���� ���α׷����� ��� (x)

--PL-SQL (���) ���α׷��� ���� ��� (��� , ���� )
--PL-SQL
CREATE TABLE temp2(id varchar2(20));

--������ �׽�Ʈ .. ������ 1000�� 1000�� ���� ...
/*
BEGIN
	FOR i IN 1..1000 LOOP
		INSERT INTO temp2(id) values('A' || to_char(i));
	END LOOP;
END;
*/
SELECT * FROM temp2;
SELECT * FROM temp2 ORDER BY id DESC;
COMMIT;

----------------------------------------------------
CREATE TABLE temp3(
   memberid number(3) NOT NULL ,
   name varchar2(10) , --null ���
   regdate DATE DEFAULT sysdate --�⺻�� �����ϱ� (��¥ insert ���� ������..	
 );

SELECT sysdate FROM dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO temp3(memberid, name, regdate)
values(100,'ȫ�浿','2020-04-03'); --100	ȫ�浿	2020-04-03 00:00:00

SELECT * FROM temp3;
COMMIT;

INSERT INTO temp3(memberid, name)
VALUES (200,'�ƹ���');

SELECT * FROM temp3; --200	�ƹ���	2020-04-03 12:14:00
COMMIT;

INSERT INTO temp3(memberid)
values(300);

SELECT * FROM temp3; 
--300	null	2020-04-03 12:15:34

INSERT INTO temp3(name)
VALUES ('�̸���');
--cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")

--insert (TIP)
--1. �뷮 ������  insert  �ϱ�
CREATE TABLE temp4(id number);
CREATE TABLE temp5(num number);

INSERT INTO temp4(id) values(1);
INSERT INTO temp4(id) values(2);
INSERT INTO temp4(id) values(3);
INSERT INTO temp4(id) values(4);
INSERT INTO temp4(id) values(5);
INSERT INTO temp4(id) values(6);
INSERT INTO temp4(id) values(7);
INSERT INTO temp4(id) values(8);
INSERT INTO temp4(id) values(9);
INSERT INTO temp4(id) values(10);
COMMIT;

SELECT * FROM temp4;

--�䱸���� : temp4�� �ִ� ��� �����͸� temp5 �ְ� �־��
--insert into ���̺��(�÷�����Ʈ) values(������Ʈ)
--insert into ���̺��(�÷�����Ʈ) select �� (�÷�����Ʈ�� ������ Ÿ�� ����) ����

INSERT INTO temp5(num)
SELECT id FROM temp4;

SELECT * FROM temp5;

--2. insert TIP
--���̺� ���� ��Ȳ���� [���̺� ����] + [�뷮 ������ ����]
--�� ���� ����(���� ������ ���� �ȵǿ� (PK , FK)
--������ ���̺� ���� (�÷��̸�, Ÿ�� ) ����

--create table copyemp(id number)
CREATE TABLE copyemp  --emp���� ������ ����� .... ������ ����
AS
	SELECT * FROM emp;

SELECT * FROM copyemp;

CREATE TABLE copyemp2
AS
  SELECT empno , ename , sal 
  FROM emp 
  WHERE deptno=30;
 
 SELECT * FROM copyemp2;
 SELECT * FROM col WHERE tname ='COPYEMP2';


--���� : ���� (Ʋ) �� �����ϰ� ������ �����ϰ� ���� �ʾƿ�
CREATE TABLE copyemp3
AS
   SELECT * FROM emp WHERE 1=2;
  
SELECT * FROM copyemp3;  

----------------------[INSERT END]--------------
--[UPDATE]
/*
update table_name
set column1 = value1 , column2 = value2 .....
where ����

update table_name
set column1 = (subquery)
where ����
*/
SELECT * FROM copyemp;

UPDATE COPYEMP 
SET sal = 0;

SELECT * FROM copyemp;
ROLLBACK;

UPDATE COPYEMP 
SET sal = 0
WHERE deptno=20;

SELECT * FROM copyemp ORDER BY deptno;
COMMIT;

UPDATE COPYEMP 
SET sal = (SELECT sum(sal) FROM emp)
WHERE deptno = 20;

SELECT * FROM copyemp WHERE deptno=20;
COMMIT;

--�������� �÷��� update
UPDATE COPYEMP 
SET ename='AAAA' , job = 'BBBB' , hiredate=sysdate , sal=1111
WHERE deptno=10;

SELECT * FROM copyemp WHERE deptno=10;
COMMIT;
----------------------[UPDATE END]--------------------------
--[DELETE]
--��Ģ >> delete -> commit , rollback -> ���� �Ұ� -> �� ��� ...

DELETE FROM copyemp;

SELECT * FROM copyemp;
ROLLBACK;

DELETE FROM copyemp WHERE deptno IN (10,20);--deptno = 10
                        
SELECT * FROM copyemp WHERE deptno IN (10,20);
COMMIT;
-------------------------[DELETE END]-------------------
/*
APP(JAVA)  -> JDBC API  ->  ORACLE(DB)

CRUD
create : insert
read   : select
update : update
delete : delete

(DML : insert, update, delete) Ʈ����� (commit , rollback)

JDBC -> Oracle -> Emp ���̺� �۾�
--��ü��ȸ(�Լ�) 
--������ȸ(�����) (�Լ�)
--����(�Լ�)
--����(�Լ�)
--����(�Լ�)
--JAVA
--public List<Emp> getEmpAllLIst() { String sql="select * from emp" }
--public Emp getEmpListByEmpno(){String sql="select... where empno=777"}
--public int insertEmpData(Emp emp) {String sql="insert into emp()..."}             
 
 ArrayList<Emp> list = new ....
 list.add(new Emp(rs.getString("ename"))); --> ������ �Ǽ� while
                                               
*/                        
-------------------------------------------------------------
--[DDL]
--create , alter , drop (���̺� ����)

SELECT * FROM tab;
SELECT * FROM tab WHERE tname ='BOARD';

DROP TABLE board;

CREATE TABLE board(
   boardid NUMBER,
   title nvarchar2(100),
   content nvarchar2(2000),
   regdate date
);

SELECT * FROM tab WHERE tname ='BOARD';
--�л� ���� ���̺�
--���� , ���� , ���� , �����÷�
--10    10   10    30
--����, ����, ���� ������ ����� �ڵ����� ���� ���Ǹ� ...
--oracle 11g ���� (�����÷� (�����÷�))
CREATE TABLE vtable(
  no1 NUMBER,
  no2 NUMBER,
  no3 NUMBER GENERATED ALWAYS AS (no1 + no2) virtual
 ); 

INSERT INTO vtable(no1,no2)
values(100,200);

SELECT * FROM vtable;
INSERT INTO vtable(no1,no2)
values(33,44);

SELECT * FROM vtable;

INSERT INTO vtable(no1, no2 , no3)
values(10,20,30);
--INSERT operation disallowed on virtual columns

--�÷��� ���� ����
SELECT COLUMN_NAME , DATA_TYPE , DATA_DEFAULT 
FROM USER_TAB_COLUMNS WHERE table_name='VTABLE';
--NO3	NUMBER	"NO1"+"NO2"

--�ǹ����� Ȱ��Ǵ� �ڵ�
--��ǰ���� (�԰���) .. �б⺰ (4�б�)
--�԰���: 2020-03-01 >> 1�б�
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

SELECT COLUMN_NAME , DATA_TYPE , DATA_DEFAULT 
FROM USER_TAB_COLUMNS WHERE table_name='VTABLE2';

INSERT INTO vtable2(p_date) values('20200101');
INSERT INTO vtable2(p_date) values('20200126');
INSERT INTO vtable2(p_date) values('20200301');
INSERT INTO vtable2(p_date) values('20200601');
INSERT INTO vtable2(p_date) values('20201201');

SELECT * FROM vtable2;

SELECT * FROM vtable2 WHERE p_bungi = 2;
COMMIT;

----------------------------------------------------------
--DDL ���̺� �ٷ�� (����Ŭ.pdf  138page)
--1. ���̺� �����ϱ�
CREATE TABLE temp6 ( id number );

--2. ���̺��� �����ߴµ� �÷� �߰��ϱ�
DESC temp6;

ALTER TABLE TEMP6 
ADD ename varchar2(20);

--3. ���� ���̺� �ִ� �÷��� �̸��� �߸� ǥ�� (ename -> username)
--���� ���̺� �ִ� �÷��� �̸� �ٲٱ� (rename)
ALTER TABLE TEMP6
RENAME COLUMN ename TO username;

--4. ���� ���̺� �ִ� ���� �÷��� Ÿ�� �����ϱ�
--(modify)
ALTER TABLE TEMP6 
modify(username varchar2(100));

--5. ���� ���̺� �ִ� ���� �÷� ����
ALTER TABLE TEMP6 
DROP COLUMN username;

--6. ���̺� ����
--6.1 ������ ���� : delete 
--���̺� ó�� ����� ó�� ũ��(20��) -> �����͸� ������ -> 20�� >> �÷��� >> 30��
--ex) ó�� 1M >> 10���� >> 100M >> delete 10���� ���� >> ũ��� 100M

--���̺� ������ ���� (������ ũ�⵵ ���� �� �ִ�)
--truncate (where ���� ��� ���ؿ�)
--ex) ó�� 1M >> 10���� >> 100M >> truncate 10���� ���� >> ũ��� 1M

--7. ���̺� ���� (drop)
DROP TABLE temp6;

SELECT * FROM temp6;

----------------------------------------------------------
--���̺� ���� �����ϱ� (����Ŭ.pdf 148page)
--������ [���Ἲ] Ȯ��
--select (������ ..(x))
--����(constraint : insert , update , delete(FK))
/*
PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL �� UNIQUE ������ ����) 
--���̺� �Ѱ��� �ɼ� �ִ� (���̺�� �Ѱ�(�������� ��� : ����Ű))
--���������� �˻��� ����� ���ؼ� (index) �ڵ� ���� (select ���)

FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�. 
--�������� [���̺�] �� [���̺�]���� ���� ����

UNIQUE key(UK) ���̺��� ��� ���� [�����ϰ� �ϴ� ��]�� ���� ��(NULL �� ���)
--null�� ���� �� �ִ� >> unique ��  not null ����  

NOT NULL(NN) ���� NULL ���� ������ �� �����ϴ�. 

CHECK(CK) ���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����) 
������ ������ ���� �ްڴ�   �÷��� gender in ('��','��') �ϸ� ...
ex) where gender in ('��','��')
*/ 

--������ ����� ����
--1. ���̺� ����鼭 �ٷ� ���� (create table ...)
--2. ���̺� ���� ���� �߰� (����) (alter table add constraint ...)
--   �ڵ�ȭ��  �� ���� ����ϴ� ���

--1. ���� ���� Ȯ���ϱ�
SELECT * FROM USER_CONSTRAINTS WHERE table_name='EMP';
-- SYS_C006997 ���������� ������ ���� �̸� 
--"EMPNO" IS NOT NULL

CREATE TABLE temp7(
   --id NUMBER PRIMARY KEY ����ǥ�� (�����̸� : SYS_C006997)
   id NUMBER CONSTRAINT pk_temp7_id PRIMARY KEY , --���� 
   name varchar2(20) NOT NULL ,
   addr varchar2(50)
);

SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP7';
--PK_TEMP7_ID  �ؼ��� ���� (���� ����, ����) ���

INSERT INTO temp7(name,addr) values('ȫ�浿','����� ������');
--ORA-01400: cannot insert NULL into ("BIT"."TEMP7"."ID")

INSERT INTO temp7(id,name,addr) values(10,'ȫ�浿','����� ������');
COMMIT;
SELECT * FROM temp7;

INSERT INTO temp7(id,name,addr) values(10,'�ƹ���','����� ������');
--�ߺ� ������
--ORA-00001: unique constraint (BIT.PK_TEMP7_ID) violated

--1. ���̺� primary key �� ����� �ɼ� ������� ? 1��
--(name , num) �������� �÷��� ��� 1�� .... >> ����Ű

CREATE TABLE temp8(
	id NUMBER CONSTRAINT pk_temp8_id PRIMARY KEY,
	name varchar2(20) NOT NULL,
	jumin char(6) CONSTRAINT uk_temp8_jumin UNIQUE, --null ���
	addr varchar2(20)
);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP8';

INSERT INTO temp8(id, name,jumin,addr)
values(10,'ȫ�浿','123456','��⵵ ������');
COMMIT;
SELECT * FROM temp8;

INSERT INTO temp8(id, name,jumin,addr)
values(20,'�ƹ���','123456','��⵵ ������');
--ORA-00001: unique constraint (BIT.UK_TEMP8_JUMIN) violated

--null ....unique ��� (null �� �ߺ�üũ�� �ұ�)
--result : null ��� (�ߺ� üũ ���� ���Ѵ�)
INSERT INTO temp8(id, name,addr)
values(30,'�达','��⵵ ������');
--30	�达	 null	��⵵ ������
SELECT * FROM temp8;

INSERT INTO temp8(id, name,addr)
values(40,'�ھ�','��⵵ ������');
SELECT * FROM temp8;

--CREATE TABLE temp8 ( jumin NOT NULL CONSTRAINT .. unique)
--unique ������ ���̺� � : �÷�������ŭ ...
-----------------------------------------------------------
CREATE TABLE temp9(id NUMBER);

--���� ���̺� ���� �߰��ϱ�
--����) ���� �����Ͱ� �ִ� ��� ������ �����ϴ� �����Ͱ� ������ ������ �߰����� �ʾƿ�
--���� �ɱ����� ������ �˻� �۾� ����

ALTER TABLE TEMP9 
ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id); 
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP9';

--������ �÷�(����Ű)
--ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id , name);
ALTER TABLE temp9
ADD ename varchar2(20);

DESC temp9;

--not null �߰��ϱ�
ALTER TABLE TEMP9 
modify(ename NOT NULL);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP9';

-----------------------------------------------------------
--[check ����]
--where ���ǰ� ������ ������ ���� >> where age > 19
--�÷��̸� age > 19
CREATE TABLE temp10(
	id NUMBER CONSTRAINT pk_temp10_id PRIMARY KEY,
	name varchar2(20) NOT NULL,
	jumin char(6) CONSTRAINT uk_temp10_jumin UNIQUE,
	addr varchar2(20),
	age NUMBER CONSTRAINT ck_temp10_age check(age >= 19)
);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP10';

INSERT INTO temp10(id,name,jumin,addr,age)
values(100,'ȫ�浿','123456','����� ������',20);

SELECT * FROM temp10;
COMMIT;

INSERT INTO temp10(id,name,jumin,addr,age)
values(200,'ȫ�浿','123456','����� ������',18);
--ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
-----------------------------------------------------------
--���� ���� : RDBMS : ���̺�� ���̺���� ���� ����
--emp ���̺� �ִ� detpno �÷��� dept ���̺� �ִ� detpno ���� �մϴ�
--�����ϴ� �ʿ� �Ŵ� ���� : FK
--������ ���ϴ� �ʿ� �Ŵ� ���� : PK

CREATE TABLE c_emp
AS
  SELECT empno , ename , deptno FROM emp WHERE 1=2;
 
CREATE TABLE c_dept
AS
  SELECT deptno , dname FROM dept WHERE 1=2;
 
SELECT * FROM c_emp;
SELECT * FROM c_dept;
--emp ���̺� �ִ� detpno �÷��� dept ���̺� �ִ� detpno ���� �մϴ�

ALTER TABLE C_EMP 
ADD CONSTRAINT fk_c_emp_empno FOREIGN KEY(deptno) 
                              REFERENCES c_dept(deptno);
--ORA-02270: no matching unique or primary key for this column-list
--c_emp (deptno) >> c_dept(deptno)  ���� ���ž� 
--c_dept(deptno) �ٸ� ������� �����ֱ� ���ؼ� �ſ��� Ȯ��(primary key)
--c_dept(deptno) primarky key
--1 �� ����
ALTER TABLE C_DEPT 
ADD CONSTRAINT pk_c_dept_deptno PRIMARY KEY(deptno);
          
--2�� 
ALTER TABLE C_EMP 
ADD CONSTRAINT fk_c_emp_empno FOREIGN KEY(deptno) 
                              REFERENCES c_dept(deptno);
--c_emp(deptno) --- c_dept(deptno) ���谡 ���� (1 : N)

INSERT INTO c_dept(deptno,dname) values(100,'�λ���');                             
INSERT INTO c_dept(deptno,dname) values(200,'������');  
INSERT INTO c_dept(deptno,dname) values(300,'ȸ����');
SELECT * FROM c_dept;

COMMIT;
--���Ի�� �Ի�
--����) not null �ɾ ���� ���� �´�(100~300) , �ƴϴ� (null���)(100~300)
--null ���� : ���Ի���� �ݵ�� �μ��� ������ �ϴ� ���� �ƴϴ� .
--not null ���� : �Ի��ϴ� ��� ����� �ݵ�� �μ��� ������ �Ѵ�.
INSERT INTO c_emp(empno,ename)
VALUES(100,'ȫ�浿');
SELECT * FROM c_emp;

UPDATE C_EMP
SET deptno = 500
WHERE empno=100;
--integrity constraint (BIT.FK_C_EMP_EMPNO) violated 
-- parent key not found

UPDATE C_EMP
SET deptno = 200
WHERE empno=100;

SELECT * FROM c_emp;
COMMIT;

INSERT INTO c_emp(empno, ename,deptno)
values(200,'�ƹ���',100);
SELECT * FROM c_emp;
COMMIT;
-----------------------------------------
--�� ���� ���̺�
--(�θ�� �ڽİ���)
--(master , detail)

--emp(deptno) �� dept(deptno) ���迡�� �����̺�(�θ�)
--�θ�(PK) > dept

SELECT * FROM c_dept;
SELECT * FROM c_emp;

DELETE FROM c_dept WHERE deptno=300; --�μ� ...
DELETE FROM c_dept WHERE deptno=100;
--integrity constraint (BIT.FK_C_EMP_EMPNO) violated 
-- child record found
--�� ����� �;�� ....
--child (100 �� �μ��� ���� , ����) ...
--�ڽ��� ���� �����ϰ� �θ� ���� .....
COMMIT;

/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
--TIP> MS-SQL >> ON UPDATE CASCADE , ON DELETE CASCADE
--TIP> MY-SQL >> ON UPDATE CASCADE , ON DELETE CASCADE
-- [ON DELETE CASCADE]  �θ����̺�� ������ ���� �ϰڴ�
-- 300 ���� �� �ֳ���?  �� 
-- delete from c_dept where detpno=300;
-- �����ϴ� �ڽ� ������ ���� ����
-- delete from c_emp where deptno=300; ���� ����
ALTER TABLE c_emp
DROP CONSTRAINT fk_c_emp_empno;

alter table c_emp
add constraint fk_c_emp_empno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;

SELECT * FROM c_emp;
SELECT * FROM c_dept;
DELETE FROM c_dept WHERE deptno=100;
COMMIT;



/*
--�л� ���� ���̺�
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--�� ���� �Է����� ������  default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ� (��� �Ҽ����� 2�ڸ� �ݿø�)
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�

--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�

--�а��ڵ� , �а���

--�׸��� select �����
--���� �����ʹ� 3�� �Է�
--�й� , �̸�  ����, ��� , �а��ڵ� , �а��� �� ����ϼ���
*/

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

--------------------- ���� �����ϱ� --------------------------
--view ��ü (���� ���̺�) ����Ŭ.pdf (192page)
/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY] 


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


--[42000]: ORA-01031: insufficient privileges
--����� view ���� ������ ����� .... �����ڿ��� ������ ��������
-- SYSTEM PRIVILEGES
-- SYSTEM , SYS �����ؼ� ....
GRANT CREATE VIEW TO "BIT" WITH ADMIN OPTION;

CREATE VIEW v_001
AS
   SELECT empno,ename FROM emp;
  
SELECT * FROM v_001;  
--view �� sql ������ ������ �ִ� ��ü 

--view ��ü (create ....)
--create view ���̸� as sql ���� (view ���ؼ� �� �� �ִ� ������ ���)
--view �� ���̺�ó�� ��밡�� (�������̺�) -> ���� ��� (emp, dept ) �����ϰ�
--view �޸𸮻󿡼��� �����ϴ� �������̺� (ex) in-line-view

--view ����
--�Ϲ� ���̺�� ���� ...(select,  where ...) 
--DML(insert , update , delete) -> View���ؼ� �� �� �ִ� ������ -> DML
--view �� �� �ִ� ������

--view ��� ����
--1. �������� ���� (Join, subquery) >> ���� ���̺��� �ִٸ� ...
--2. ����(���� ó��) -> �����ϰ� ���� �����͸� ��Ƽ� view ���� ...
--3. ���� (������ query ��Ƽ� ) view ���� .....�̸� ����� ����

--�λ� ���̺�
--Emp �ٷ� ���� ...Sal ����
CREATE VIEW v_emp
AS
  SELECT empno, ename,job,hiredate FROM emp;
 
 --v_emp ����Ͻø� �ǿ�
 SELECT * FROM v_emp;
 SELECT * FROM v_emp WHERE empno=7788;

--����  (������ ������ �ܼ�ȭ)
CREATE VIEW v_002
AS
  SELECT e.empno, e.ename, d.deptno , d.dname
  FROM emp e JOIN dept d
  ON e.deptno = d.deptno;
 
SELECT * FROM v_002; 
SELECT * FROM v_002 WHERE deptno=20;

--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� 
--����� ���, �̸� , �μ���ȣ , �μ��� ��� ������ ����ϼ���    
--�ڱ� �μ��� ��� ���޺��� �� ���� ���� ��� �ִ� ���̺��� �ִٸ� ...

CREATE VIEW v_003
AS
  SELECT deptno , avg(sal) AS avgsal
  FROM emp
  GROUP BY deptno;
 
 SELECT * FROM v_003;

SELECT *
FROM emp e JOIN v_003 s
ON e.deptno = s.deptno
WHERE e.sal > s.avgsal;

--���̺��� 1�� �̻�
--JOIN ... �ȵǿ� ...subquery ...�ȵǿ� view(�������̺�)

--view ����
DROP VIEW v_007;

CREATE OR REPLACE VIEW v_007
AS
    SELECT avg(sal) AS AVGSAL FROM emp;

SELECT * FROM v_007;

--VIEW ����  DML ���� (insert, update , delete)
--�� view ������ ������ ���̺� 1�� ���� 
--����  view �� DML �Ұ�(���̺��� 1�� �̻� ������ query)
--�ܼ� view (���̺� 1���� ���� view)

SELECT * FROM v_emp; --���� �ִ� ������(empno, ename, job , hiredate)

UPDATE v_emp  --v_emp �ʴ� sal �÷��� ���� ���� .... ���� �Ҽ� ����
SET sal = 0;


UPDATE v_emp
SET job ='IT';

SELECT * FROM v_emp;
SELECT * FROM emp;
/*
CREATE VIEW v_emp
AS
  SELECT empno, ename,job,hiredate FROM emp;
*/
ROLLBACK;

CREATE OR REPLACE VIEW v_emp2
AS
   SELECT * FROM emp WHERE deptno=20;
  
SELECT * FROM v_emp2;  

UPDATE v_emp2
SET sal = 0;

SELECT * FROM emp;
ROLLBACK;

SELECT * FROM emp;

--view ��Ϻ���
SELECT * FROM user_views;

--
--1. 30�� �μ� ������� ����, �̸�, ������ ��� VIEW�� ������.
CREATE OR REPLACE  VIEW VIEW100
AS
  SELECT JOB, ENAME, SAL
  FROM EMP
  WHERE DEPTNO=30
 
SELECT * FROM VIEW100
 
 
 
--2. 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.
 
CREATE OR REPLACE VIEW  VIEW101 ( ����, ����̸� ,���� )
AS
 SELECT JOB , ENAME , SAL
 FROM EMP
 WHERE DEPTNO=30 AND SAL > 300;
 
SELECT * FROM VIEW101
 
--3. �μ��� �ִ����, �ּҿ���, ��տ����� ��� VIEW�� ������.
CREATE OR REPLACE VIEW  VIEW102
AS
 SELECT DEPTNO, MAX(SAL) AS "�ִ����",
  MIN(SAL) AS "�ּҿ���",
  AVG(SAL) AS "��տ���"
 FROM EMP
 GROUP BY DEPTNO
 
 
SELECT * FROM VIEW102
       
--4. �μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
-- �μ��� ����ϵ��� �϶�.
--from ���� => where
--group by ���� => having
 
CREATE OR REPLACE VIEW VIEW103
AS
 SELECT DEPTNO, AVG(SAL) AS "��տ���"
 FROM EMP
 GROUP BY DEPTNO
 HAVING AVG(SAL) >=2000
 
----------------------------------------
SELECT v.deptno,v.��տ��� , d.dname
FROM view103 v JOIN dept d
ON v.deptno = d.deptno
-----------------------------------------
 
--5. ������ �ѿ����� ��� VIEW�� �����, ������ MANAGER��
-- ������� �����ϰ� �ѿ����� 3000�̻��� ������ ����ϵ��� �϶�.
 
CREATE OR REPLACE VIEW VIEW104
AS
 SELECT JOB, SUM(SAL) AS "�ѿ���"
 FROM EMP
 WHERE JOB!='MANAGER'
 GROUP BY JOB
 HAVING SUM(SAL)>=3000
 
SELECT * FROM VIEW104

-------------------------------------------------------------------
--������ 
--����Ŭ.pdf (page 185)

--���� �����ϱ�(��ȣ����)
--�ڵ����� ��ȣ�� �����ϴ� ��ü 
--�ߺ��� ���� ������ �ʴ´� (����)

/*
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE �� �̸��Դϴ�.
INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
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
--------------------------------------------------
--�ٸ� ���
DELETE FROM board;
COMMIT;
SELECT max(boardid) FROM board; --null

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'ó��');

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'�ι�');

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'����');

SELECT * FROM board ORDER BY boardid asc;

DELETE FROM board WHERE boardid=1;
COMMIT;

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'�׹�');

SELECT * FROM board;
COMMIT;
---------------------------------------------------------
--sequence ��ȣ ���� : �ߺ����� ���� �������� �� >> ������ü
CREATE SEQUENCE board_num;

SELECT * FROM SYS.USER_SEQUENCES;

/*
 NEXTVAL �� CURRVAL �ǻ翭 
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�. 
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�. 
3) CURRVAL �� ���� SEQUENCE ���� ��´�. 
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ� (���� ����)
*/
--���� ��ȣ ����
SELECT board_num.nextval FROM dual;

--������� ���� ... (�������� ä���� ���� Ȯ��)
SELECT board_num.currval FROM dual;

---------------------------------------------
CREATE SEQUENCE kboard_num;

CREATE TABLE kboard(
	num NUMBER CONSTRAINT pk_kboard_num PRIMARY KEY,
	title varchar2(100)
);

SELECT kboard_num.currval FROM dual;

INSERT INTO kboard(num, title)
values(kboard_num.nextval,'ó�� ��3');

SELECT * FROM kboard;

SELECT kboard_num.currval FROM dual;
-------------------------------------------------
--1. sequence ��ü (���̺� �����ڿ�) >> �������� ���̺��� �ϳ��� ä���� ���
--A ���̺� >> 1 , 2 , 8
--B ���̺� >> 3 , 4 , 5
--C ���̺� >> 6 , 7

--����Ʈ (�Խ���) 10��
--��ǰ�Խ��� , ������ �Խ��� , ȸ���Խ��� 
--1. �ϳ��� sequence ����
--2. �Խ��� �۹�ȣ ... sequence 3�� ���� ���

--ms-sql : create table board(boardnum int identity(1,1)...
--insert into board(title) values('�氡') ...
--ms-sql 2012 ���� ... sequence 

--my-sql :
--CREATE TABLE test(
--num int(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
--name varchar(10) NOR NULL
--);

--mariadb 
--https://mariadb.com/kb/en/create-sequence/
------------------------------------------------------
CREATE SEQUENCE seq_num
START WITH 10
INCREMENT BY 2;

SELECT seq_num.nextval FROM dual;

SELECT seq_num.currval FROM dual;

--�Խ��� ������ insert ...
--�Խ��� �ۺ��� (�ֽű� ������ ...�۹�ȣ ū��)
--select * from board order by boardnum desc
----------------------------------------------------
--������ �ʼ� 2
--rownum �ǻ��÷� : ���� ���������� �����ϴ� �÷��� �ƴϰ� ������ ����

--ROWNUM  : ���� ���̺� �÷����� �������� ������ ���������� ���ȣ �ο��Ҽ� �ִ� �ǻ��÷�
--ROWID   : �ּҰ� (���� ������ ����Ǵ� ���� �ּҰ�) -> �ε��� ���� ���
 
SELECT * FROM emp;

SELECT rownum AS ���� , empno, ename FROM emp;
--rownum select ����� ���� ....

--Top-n ����
--���̺��� ���ǿ� �´� ���� (top) ���ڵ� n �� ����

--MS-SQL
--select top 10, * from emp order by sal desc

--ORACLE
--rownum (�ǻ��÷� ) ������ ����

--rownum ���
--1. ������ ������ ���� (����)
--2. ���� �� ��Ȳ���� �տ� ���� ������ ���� ������ ����

--1�ܰ�
	SELECT *
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e;
--2�ܰ�
    SELECT rownum AS "num" , e.*
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e;

--3�ܰ� (�޿��� ���� �޴� ��� 5��)
    SELECT rownum AS "num" ,  e.*
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e
    WHERE ROWNUM <= 5;
--------------------------------------------------
--�Խ��� ����� ����¡ ó�� �ʼ� ������(rownum �����÷�)
SELECT n.*
FROM (
   		SELECT rownum AS "num" , e.*
   		FROM (SELECT * 
         	  FROM emp 
         	  ORDER BY sal DESC) e
      ) n
WHERE "num" >= 5;
-------------------------------------------------
--�Խ��� (����¡ ó��)
--100�� ������
--10�Ǿ� ����� �����ֱ�

--�� 100��
--pagesize = 10 (�� ȭ�鿡 ������(������) ������ �Ǽ� row ��)
--page count = 10��
--[1][2][3][4][5][6][7][8][9][10]
--[1] Ŭ���ϸ� >> 1~10��
--[2] Ŭ���ϸ� >> 11~20 ..
--[10] Ŭ���ϸ� >> 91~100
-----------------------------------------------
--HR �������� �̵�
SELECT num , EMPLOYEE_ID , LAST_NAME , EMAIL 
FROM  (
		SELECT rownum AS num , e.* 
		FROM (
				SELECT * 
				FROM EMPLOYEES 
				ORDER BY EMPLOYEE_ID ASC--����(����)
		      ) e
		WHERE rownum <=50     
	  )	s
WHERE num > 40;


SELECT num , EMPLOYEE_ID , LAST_NAME , EMAIL 
FROM  (
		SELECT rownum AS num , e.* 
		FROM (
				SELECT * 
				FROM EMPLOYEES 
				ORDER BY EMPLOYEE_ID ASC--����(����)
		      ) e
		WHERE rownum <=10     
	  )	s
WHERE num > 0;
------------------------------------------------------------
--�Ǵ� between A and B 
--where rownum between 10 and 20 ��밡��
-------------------------------------------------------------
--SQL �⺻ ���� END---------------------------------------------
--SQL ��ް��� (3�� ������Ʈ)
--PL-SQL (���� ,��� , Ŀ�� , �Լ� , ���ν��� , Ʈ���� , ������)
--1�� ���� TEST 50���� (Ȧ�� �Ǵ� ¦�� ) : 4�ñ��� ........
--
--1> �μ����̺��� ��� �����͸� ����϶�.
SELECT *
FROM EMP
 
--2> EMP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
SELECT JOB, EMPNO, ENAME, HIREDATE
FROM EMP
 
--3> EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ� ����϶�.
SELECT DISTINCT JOB
FROM EMP
 
--4> �޿��� 2850 �̻��� ����� �̸� �� �޿��� ǥ���ϴ� ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 2850
 
--5> �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ǥ���ϴ� ����϶�.
SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO=7566
 
--6> �޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸� �� �޿��� ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 1500 AND 2850
 
--7> 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� �Ի����� ����϶�. �Ի����� �������� �ؼ� ������������ �����϶�.
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY HIREDATE
 
--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ�� ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
 
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN(10,30)
ORDER BY ENAME
 
--9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ� ����� �̸� �� �޿��� ����϶�.
--(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)
SELECT ENAME AS 'Employee', SAL AS ' Monthly Salary'
FROM EMP
WHERE DEPTNO IN(10,30) AND SAL>1500
 
--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�.
SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL
 
 
--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, �޿��� �������� ������������ �����Ͽ� ����϶�.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC
 
--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%'
 
--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� ����϶�.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%L%L%' AND DEPTNO=30
 
--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
 
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL not IN(1000,3000,5000)
 
--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� �÷����� New Salary�� �����Ͽ� ����϶�.
SELECT EMPNO, ENAME, SAL,
           ROUND(SAL+(SAL*0.15),0) AS "New Salary"
FROM EMP
 
--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�).
SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15) ) AS "New Salary",
  (ROUND(SAL+(SAL*0.15)))-SAL AS "Increase"
FROM EMP
 
--18> ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ� ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
SELECT UPPER(SUBSTR(ENAME,1,1)) || LOWER(SUBSTR(ENAME,2,12)) AS "NAME",
LENGTH(ENAME) AS "LENENAME"
FROM EMP
 
 
--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� ����� Ŀ�̼��� 'no commission'���� ����϶�.
SELECT ENAME, NVL(TO_CHAR(COMM),'no commission')
FROM EMP
 
--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.(DECODE)
 
SELECT empno, deptno , DECODE(deptno,10,'ACCOUNTING' ,
                                                    20,'RESEARCH',
                                                    30,'SALES',
                                                    40,'OPERATIONS') AS "dname"
FROM EMP;
 
 
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
 
--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=30
 
--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
--(��, ���� ����� �ߺ����� �ʰ� �϶�.)
SELECT DISTINCT E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO=30
 
--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL
 
--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME LIKE '%A%'
 
--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� ����϶�.
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.LOC='Dallas'
 
--26> ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�, �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ����϶�.
SELECT E.ENAME AS "EMPPLOYEE", E.EMPNO AS "EMP#",
M.ENAME AS "MANAGER", M.EMPNO AS "MGR#"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO
 
--27> ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
 
--28> Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE>(SELECT HIREDATE
   FROM EMP
   WHERE ENAME='SMITH')
 
--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���, �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� ����϶�.
SELECT E.ENAME AS "Employee", E.HIREDATE AS "EmpHIredate",
M.ENAME AS "Manager",
 M.HIREDATE AS "MgrHiredate"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO AND E.HIREDATE<M.HIREDATE
 
--30> ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ����ϵ� �� �÷����� Maximum, Minimum, Sum, Average�� �����Ͽ� ����϶�.
SELECT MAX(SAL) AS "Maximum", MIN(SAL) AS "Minimum",
 SUM(SAL) AS "Sum", AVG(SAL) AS "Average"
FROM EMP
 
--31> �� �������� �޿� ������.�ְ��,�Ѿ� �� ��վ��� ����϶�.
SELECT JOB, MAX(SAL), MIN(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY JOB
 
--32> ������ ������ ��� ���� ������ ���� ����϶�.
SELECT JOB, COUNT(JOB)
FROM EMP
GROUP BY JOB
 
--33> �������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�. �׸���, �÷����� Number of Manager�� �����Ͽ� ����϶�.
SELECT COUNT(DISTINCT(MGR)) AS "Number of Manager"
FROM EMP
 
--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
SELECT MAX(SAL)-MIN(SAL) FROM EMP
 
--35> ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�. ��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� �޿��� �������� ��� ����� ������������ �����϶�.
SELECT MGR, MIN(SAL)
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL)>=1000
ORDER BY MIN(SAL)
 
--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�. �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
SELECT E.DEPTNO AS "�μ���", D.DNAME AS "�μ��̸�", D.LOC AS "��ġ",
 COUNT(E.EMPNO) AS "����� ��", AVG(E.SAL) AS "��ձ޿�"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME, D.LOC
 
--37> Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�. ��, Smith�� �����ϰ� ����Ͻÿ�
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
   FROM EMP
   WHERE ENAME='SMITH')
AND ENAME!='SMITH'
 
--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ �����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL)
  FROM EMP)
ORDER BY SAL DESC
 
--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ �� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
   FROM EMP
   WHERE ENAME LIKE '%T%')
 
--40> �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ����϶�.
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS'
 
--41> KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
  FROM EMP
  WHERE ENAME='KING')
 
--42> Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ����϶�.
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
 AND D.DNAME='SALES'
 
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E inner join DEPT D on E.DEPTNO=D.DEPTNO
where  D.DNAME='SALES'
 
--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� ����� ������ �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP 
WHERE SAL > (
                    SELECT AVG(SAL)
                    FROM EMP
                  )
AND DEPTNO IN(
                        SELECT DEPTNO
                        FROM EMP
                        WHERE ENAME LIKE '%T%'
                      )
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� ����϶�.
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL IN(SELECT SAL
  FROM EMP
  WHERE COMM IS NOT NULL)
 
--45> Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�, �� �޿��� ����Ͻÿ�
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB IN(SELECT E.JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO
  AND D.LOC='DALLAS')
 
--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� �� �޿��� ����Ͻÿ�
SELECT ENAME, HIREDATE, SAL
FROM EMP
WHERE SAL=(SELECT SAL
  FROM EMP
  WHERE ENAME='SCOTT')
AND NVL(COMM,0)=(SELECT NVL(COMM,0)
  FROM EMP
  WHERE ENAME='SCOTT')
 
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ, �̸�, �޿��� ����ϵ�, ����� �޿��� ���� ������ �����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
  FROM EMP
  WHERE JOB='CLERK') --�ᱹ �ִ밪�� �� any �ּҰ��� ��
ORDER BY SAL DESC
 
--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸��� ����, �μ���ȣ�� ����϶�.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE JOB IN(SELECT JOB
  FROM EMP
  WHERE ENAME LIKE '%A%')
 
--49> New  York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� ����̸��� �μ����� ����϶�.
select * from emp join dept 
on emp.deptno = dept.deptno
and dept.loc='NEW YORK';
 
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE
e.deptno= d.deptno
AND E.SAL IN(
          SELECT E.SAL
                FROM EMP E, DEPT D
                WHERE E.DEPTNO=D.DEPTNO AND LOC='NEW YORK'
                  )
AND NVL(COMM,0) IN(
               SELECT NVL(COMM,0)
               FROM EMP E, DEPT D
               WHERE E.DEPTNO=D.DEPTNO
                              AND LOC='NEW YORK');
 
--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�, ����,����,�μ���,Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� NoCommission���� ǥ���ϰ�, Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�. (��, �ְ���޺��� ��µǰ� �Ͻÿ�)
SELECT E.EMPNO, 
           E.ENAME, 
           E.JOB, 
           E.SAL, 
           D.DNAME,
           NVL((TO_CHAR(E.COMM)),'NoCommision') AS "COMM"
FROM EMP E JOIN DEPT D ON E.DEPTNO=D.DEPTNO
WHERE JOB IN( SELECT JOB
                     FROM EMP E JOIN DEPT D
                     ON E.DEPTNO=D.DEPTNO WHERE LOC='DALLAS')
AND MGR IN( SELECT MGR
                  FROM EMP E JOIN DEPT D
                  ON E.DEPTNO=D.DEPTNO WHERE LOC='DALLAS');
                  
-----------------------------------------------------------------------------
