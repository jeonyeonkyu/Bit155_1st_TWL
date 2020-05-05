/*
[1일차 수업]
1. 오라클 소프트웨어 다운로드
Oracle Database Express Edition 11g Release 2
https://www.oracle.com/database/technologies/xe-prior-releases.html

개발툴
https://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper)  ,
         https://dbeaver.io/download/
                 유료,무료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bit

-- USER SQL
CREATE USER bit IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bit QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bit WITH ADMIN OPTION;
GRANT "RESOURCE" TO bit WITH ADMIN OPTION;

실습 환경 구성하기

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
--1.사원 테이블에서 모든 테이터를 출력하세요
SELECT * FROM emp; --쿼리 문자는 대소문자 구별 안해요
--select * from emp;

--2. 특정 컬럼 데이터 출력하기
SELECT empno , ename , sal FROM emp;

SELECT ename FROM emp;

--3. 컬럼에 가명칭(별칭)(alias) 부여하기
SELECT empno 사번 , ename 이름
FROM emp;

SELECT empno "사    번" , ename "이    름"
FROM emp;

--정식(표준) (ansi 문법)
SELECT empno as "사    번" , ename as "이    름"
FROM emp;

--Oracle 데이터 관리 (문자열 : 대소문자 구분)
--문자열 표기 ('문자열')
--소문자 'a'   대문자 'A' 다른 문자열이다
SELECT empno , ename 
FROM emp 
WHERE ename = 'king';

SELECT empno , ename 
FROM emp 
WHERE ename = 'KING';

--Oracle SQL 언어 : 연산자 (결합 연산자 (||) , 산술연산자(+)) 구분
--java + (숫자 + 숫자 >> 연산)
--java + (문자열 + 문자열 >> 결합)
--TIP) ms-sql(+ 연산 ,결합)

SELECT '사원의 이름은 ' || ename || ' 입니다' AS "사원정보"
FROM emp;

--empno , ename >> 컬럼  >> 타입 
--타입(자료형) : 숫자 , 문자(문자열) , 날짜 ...
DESC emp;
/*
테이블의 기본 정보 (컬럼명 , null 여부 , 타입)
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 
JOB               VARCHAR2(9)  
MGR               NUMBER       
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER  
*/

SELECT empno || ename  --숫자  ||  문자열  (내부적으로 숫자 -> 문자열)
FROM emp;

SELECT empno + ename  --ORA-01722: invalid number (산술 오류)
FROM emp;

--사장님 ..우리 회사에 직종이 몇개나 있나
SELECT job FROM emp;
--distinct : 중복 데이터 제거
--distinct : grouping 논리 데이터 처리
SELECT DISTINCT job FROM emp;

SELECT DISTINCT job , deptno FROM emp ORDER BY job;

SELECT DISTINCT deptno , job FROM emp ORDER BY deptno;

--Oracle 언어
--Java 언어
--Oracle 연산자가 Java 거의 동일 (+ , * , - ...)
-- % 자바(나머지) , % 오라클에서 연산자 (검색 패턴)
--오라클 (+ , - , * , / ) 나머지  함수 >> Mod()
--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
--desc emp;
SELECT empno , sal , sal + 100 AS "인상급여" FROM emp;

--dual 임시 테이블
SELECT 100 + 100 FROM dual;
SELECT 100 || 100 FROM dual; --내부적으로 형변환 ... 100100
SELECT '100' + 100 FROM dual; -- + 연산자 산술 .. 형변환
SELECT '100A' + 100 FROM dual; -- ORA-01722: invalid number

--비교연산자
-- > < <=
--java 같다 (==) 할당(=)
--Oracle 같다(=) 같지 않다(!=)

--논리연산자
--AND , OR  , NOT

--조건절 (원하는 row 가지고 오겠다)
SELECT *
FROM emp
WHERE sal >= 3000;

SELECT empno, ename, sal
FROM emp
WHERE sal > 3000;

--이상 , 이하  (=)
--초과 , 미만 

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출려하세요
--관리자 , 개발자 , 튜닝 , 설계 
--실행순서 : 
SELECT empno, ename, job , hiredate     --3  
FROM emp                                --1 
WHERE empno = 7788;                     --2 

--사원의 이름이 king 인 사원의  사번 , 이름 , 급여 정보를 출력하세요
SELECT empno , ename , sal
FROM emp 
WHERE ename = 'KING';

--논리 (AND , OR)
--급여가 2000달러 이상이면서 직종이 manager 인 사원의 모든 정보를 출력하세요
--두가지 조건을 모두 만족하는 데이터 (둘다 참인)
SELECT *
FROM emp 
WHERE sal >= 2000 AND job='MANAGER';

--급여가 2000달러 이상이거나 직종이 manager 인 사원의 모든 정보를 출력하세요
SELECT *
FROM emp 
WHERE sal >= 2000 OR job='MANAGER';

--오라클 날짜(DB서버의 날짜)
--오라클 날짜 (sysdate)

SELECT sysdate FROM dual; --2020-03-31 14:28:36
select * from SYS.nls_session_parameters;

SELECT sysdate FROM dual;
--20/03/31

--현재 접속한 사용자가 날짜 형식을  YYYY-MM-DD HH24:MI:SS 보도록 수정하겠다

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select * from SYS.nls_session_parameters;  --시스템 설정을 가지고 있는 환경테이블
--NLS_DATE_FORMAT	RR/MM/DD
--NLS_DATE_LANGUAGE	   KOREAN
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select sysdate  from dual;  --2020-03-31 14:35:29

SELECT hiredate FROM emp;

--입사일 1980-12-17 인 사원의 모든 정보를 출력하세요
SELECT *
FROM emp 
WHERE hiredate = '1980-12-17';

SELECT *
FROM emp 
WHERE hiredate = '1980/12/17';

SELECT *
FROM emp 
WHERE hiredate = '80-12-17';
--형식 : RR-MM-DD  >> YYYY-MM-DD 

--사원의 급여가 2000이상이고 4000이하인 모든 사원의 정보를 출력하세요
 SELECT *
 FROM emp 
 WHERE sal >= 2000 AND sal <= 4000;
--연산자 : between A and B (= 포함)
--미만 초과 에서는 사용금지 (= 포함하지 않아요)
SELECT *
FROM emp 
WHERE sal BETWEEN 2000 AND 4000;

--사원의 급여가 2000초과이고 4000미만인 모든 사원의 정보를 출력하세요
 SELECT *
 FROM emp 
 WHERE sal > 2000 AND sal < 4000;

--부서번호가 10 또는 20번 또는 30번인 
--사원의 사번 , 이름, 급여 , 부서번호 출력하세요
SELECT empno , ename , sal , deptno
FROM  emp 
WHERE deptno =10 OR deptno=20 OR deptno=30;
--IN 연산자

SELECT empno , ename , sal , deptno
FROM emp 
WHERE deptno in(10,20,30);
--in 연사자를 풀어서 : WHERE deptno =10 OR deptno=20 OR deptno=30;

--부서번호가 10또는 20이 아닌 사원의 사번 , 이름, 급여 , 부서번호를 출력하세요
SELECT *
FROM emp 
WHERE deptno != 10 AND deptno!=20;

--IN 의 부정은 ,,,,,, NOT IN
SELECT *
FROM emp 
WHERE deptno NOT IN (10,20); -- deptno != 10 AND deptno!=20;
--부정값 and 부정값 and .......
--NOT IN 부정의 AND >>deptno != 10 AND deptno!=20;

--POINT : Oracle 값 표현 (데이터 없다) >> null
--null 필요악

CREATE TABLE MEMBER (
  userid varchar2(20) NOT NULL , -- 필수입력
  name varchar2(20) NOT NULL, --필수입력 
  hobby varchar2(50) -- default null (null 값을 허락) 데이터 안받아도 되
);

SELECT * FROM MEMBER;
--INSERT INTO MEMBER(userid,hobby) values('hong','농구');
--cannot insert NULL into ("BIT"."MEMBER"."NAME")
INSERT INTO MEMBER(userid,name) values('hong','홍길동');
--hobby 컬럼의 데이터는 null 자동 ...
INSERT INTO MEMBER(userid,name,hobby) 
values('kim','김씨','게임');
--실반영
COMMIT;

SELECT * FROM MEMBER;

--수당(comm)을 받지 않는 모든 사원의 정보를 출력하세요
--0도 데이터 취급 (받는 조건에 포함)
--comm 컬럼에 데이터가 null 인 것만
SELECT * FROM emp;
--SELECT * FROM emp WHERE comm = NULL; (x)

--null 의 비교는  (IS NULL , IS NOT NULL)
SELECT * FROM emp WHERE comm IS NULL;

--수당(comm) 을 받는 모든 사원의 정보를 출력하세요
SELECT * FROM emp WHERE comm IS NOT NULL;

--사원 테이블에서 사번, 이름 , 급여 , 수당 , 총급여를 출력하세요
--총급여(급여 + 수당)
SELECT empno , ename, sal , comm , sal + comm 
FROM emp;

SELECT empno , ename, sal , comm , sal + nvl(comm,0) AS "총급여"
FROM emp;

--POINT  >> null
--1. null 과의 모든 연산은  그 결과가 >> null
--2. 위 문제 해결 : nvl() , nvl2() >> null 값을  replace 치환 ...
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

SELECT NULL + 100 FROM dual;
SELECT 100 + nvl(NULL,0) FROM dual;
SELECT comm , nvl(comm,1111) FROM emp;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종 , 급여
-- ,수당을 출력하세요
SELECT empno , ename , job , sal , comm 
FROM emp WHERE sal >= 1000 AND comm IS NULL;
-----------------------------------------------------------
--DQL(data query language) : SELECT  (60%)
--DDL : create , alter , drop (객체 (테이블) 생성 , 수정 , 삭제)
--DML : insert , update , delete (데이터 조작) (10%)

--java  : class Board  { private boardno int }
--Oracle: create table Board (boardno number not null) 

CREATE TABLE board (
  boardid NUMBER NOT NULL , --숫자 , 필수 입력
  title varchar2(20) NOT NULL , --한글10자 , 영문자,특수,공백 20자 필수입력
  content varchar2(2000) NOT NULL, --필수 입력
  hp varchar2(20) --default null 허용 (필수 입력이 아니다)
 );

SELECT * FROM board;
--desc board;

--DML(데이터 조작어) 실 반영 여부를 결정 
--insert
--update
--delete
--반드시 그 결과를 반영 할지 , 취소 할지 의사 결정
--commit(실제반영)
--rollback(실제반영 취소) 

INSERT INTO board(boardid, title, content)
values(100,'오라클','오 할만한데');

COMMIT;
SELECT * FROM board;

INSERT INTO board(boardid, title, content)
values(200,'자바','그립다');

SELECT * FROM board;
COMMIT;

INSERT INTO board(boardid, title, content,hp)
values(300,'오늘','수업중','010-000-0000');

SELECT * FROM board;
COMMIT;

SELECT boardid, nvl(hp,'EMPTY') AS "hp" FROM board;

--문자열 검색
--주소검색 : [역] 입력  >> 역삼동 , 역동 , .... (Like 패턴 검색)
--문자열 패턴 검색 연산자 : like
--like 연산자 도움 (와일드 카드 문자 (% : 모든 것 ,  _ : 한문자) 결합

SELECT ename 
FROM emp WHERE ename LIKE '%A%'; --ename 컬럼의 데이터 중에서 A가 들어있는 이름

SELECT ename 
FROM emp WHERE ename LIKE '%a%'; --문자열 데이터 대소문자 구별 (엄격)

SELECT ename
FROM emp WHERE ename LIKE 'A%'; --이름의 첫 글자가 A인 사람

SELECT ename
FROM emp WHERE ename LIKE '%S'; --이름의 마지막 글자가 S인 사람

--SELECT * FROM MEMBER WHERE name LIKE '%수한무%'

SELECT ename 
FROM emp WHERE ename LIKE '%LL%'; --LL 붙어 있어야

SELECT ename 
FROM emp WHERE ename LIKE '%L%L%'; -- L 2개 있으면

SELECT ename 
FROM emp WHERE ename LIKE '%A%A%'; --ADAMS

SELECT ename 
FROM emp WHERE ename LIKE '_A%'; --첫글자는 어떤것이 와도 상관없고 두번째 글자는 A
--WARD
--MARTIN
--JAMES

--정규 표현식 (java - DB - script)
--regexp_like
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'[A-C]'); 
--정규 표현 예제 5개 만들기 (추후 카페 )
----------------------------------------------------------
--데이터 정렬하기
--order by 컬럼명 : 문자열 , 숫자 , 날짜
--오름차순 : asc : 낮은순  (default)
--내림차순 : desc: 높은순

SELECT *
FROM EMP
ORDER BY sal;

SELECT *
FROM EMP
ORDER BY sal asc;

--급여를 많이 받는 순으로 정렬해서 출력하세요
SELECT * FROM emp ORDER BY sal DESC;

--입사일이 가장 늦은 순으로 정렬해서 사번 , 이름 , 급여 , 입사일 데이터를 출력하세요
--(가장 최근에 입사한 순으로)
SELECT empno, ename, sal , hiredate 
FROM emp 
ORDER BY hiredate DESC;
/*
SELECT              3    
FROM                1   
WHERE               2    
ORDER BY            4  ( select 결과를 정렬) >> DB 가장 힘든 작업  
*/

--해석 
SELECT empno , ename , sal , job , hiredate
FROM emp 
WHERE job = 'MANAGER'
ORDER BY hiredate DESC;

--order by 컬럼명 desc , 컬럼명 asc , 컬럼명 desc
SELECT job , deptno
FROM emp 
ORDER BY job ASC , deptno DESC; -- grouping 원리

-----------------------------------------------------
--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것(기본 : 중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것(중복값  허용)

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
--1. 대응대는 [컬럼의 타입]이 동일
SELECT empno , ename FROM emp
UNION
SELECT dname , deptno FROM dept;
--expression must have same datatype as corresponding expression
SELECT empno , ename FROM emp
UNION
SELECT deptno , dname FROM dept;

--2. 대응대는 컬럼의 개수가 동일 ( null 착한일)
SELECT empno  , ename, job , sal FROM emp
UNION
SELECT deptno , dname, loc , null  FROM dept;
--query block has incorrect number of result columns

--실무 >> subquery (in line view)
SELECT empno , ename
FROM  (
		SELECT empno , ename FROM emp
		UNION
		SELECT deptno , dname FROM dept
	  ) ORDER BY empno DESC;

--여기까지 초보 걸음마 ..... 의무적으로 ... 테이블 한개 ...(단일테이블)
-----------------------------------------------------------
--오라클 함수 (보조 교재(pdf) : 50 page)
/*	 
단일 행 함수의 종류 
1)문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다. 
2)숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다. 
3)날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다. 
4)변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char() , to_number(), to_date())
5)일반적인 함수 : NVL, DECODE 	 
	 
*/	 
/ 
/*
한글 문제 .... 인지 ... 추후변경 가능
select * from SYS.nls_database_parameters;
--NLS_CHARACTERSET	AL32UTF8  한글 3byte 인식
--KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐)
select * from SYS.nls_database_parameters where parameter like '%CHAR%';	 
*/

--문자열 함수
SELECT INITCAP('the super man') FROM dual;  --The Super Man

SELECT lower('AAA') , upper('aaa') FROM dual;

SELECT ename , lower(ename) AS "ename" FROM emp;

SELECT * FROM emp WHERE lower(ename) = 'king';

--문자열 개수
SELECT LENGTH('abcd') FROM dual; --4개

SELECT LENGTH('홍길동') FROM dual; --3개

SELECT LENGTH(' 홍 a길 동') FROM dual; --7개

--결합 연산자 ||
--concat()

SELECT 'a' || 'b' || 'c' AS "data"  FROM dual; --abc
SELECT CONCAT('a','b')  FROM dual; --ab

SELECT concat(ename,job) AS "concat" FROM emp; --SMITHCLERK
SELECT ename || '    ' ||job AS "concat" FROM emp; --SMITH    CLERK

--부분 문자열 추출
--java(substring)
--oracle(substr)

SELECT substr('ABCDE',2,3) FROM dual; --BCD
SELECT substr('ABCDE',1,1) FROM dual; --자기자신 A
SELECT substr('ABCDE',3,1) FROM dual; --C

SELECT substr('ABCDE',3) FROM dual; --CDE

SELECT substr('ABCDE',-2,1) FROM dual; --D
SELECT substr('ABCDE',-2,2) FROM dual; --DE

/*
사원테이블에서 ename 컬럼 데이터에 대해서  첫글자는 소문자로 나머지 문자는 대문자로 
출력하세요
단) 위 결과를 하나의 컬럼으로 
(컬럼의 이름은 fullname)
(첫글자와 나머지 문자 사이에 공백하나 넣어서 출력)
SMITH -> [s MITH]

*/
SELECT lower(substr(ename,1,1)) FROM emp;

SELECT upper(substr(ename,2)) FROM emp;

SELECT lower(substr(ename,1,1)) || ' ' || upper(substr(ename,2)) AS "fullname"
FROM emp; 
--s MITH

--lpad , rpad (채우기)
SELECT lpad('ABC',10,'*') FROM dual; --*******ABC
SELECT rpad('ABC',10,'^') FROM dual; --ABC^^^^^^^ 

--Quiz
--사용자 비번: hong1006
--화면 : ho****** 출력하고 싶어요 (비번 : 1004 > 10**)
SELECT rpad(substr('hong1006',1,2),LENGTH('hong1006'),'*') 
FROM dual; --ho******

SELECT rpad(substr('1004',1,2),LENGTH('1004'),'*') 
FROM dual; --10**

--emp 테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지 * 로 표시하세요
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
--하나의 컬럼으로 결과값을 출력
--100 : 123456-*******
--200 : 234567-*******
--컬럼명은 "juminnumber"
SELECT id || ' : ' || rpad(substr(jumin,1,7),LENGTH(jumin),'*') AS "jumin"
FROM member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim 함수
--[오른쪽 문자를 지워라]
SELECT rtrim('MILLER','ER') FROM dual; --MILL
SELECT ltrim('MILLLLLLLLLER','MIL') FROM dual; --ER

SELECT '>' || rtrim('MILLER      ',' ') || '<' FROM dual;
-->MILLER<

--치환함수 (replace)
SELECT ename , replace(ename,'A','와우^^') FROM emp;
--SMITH	SMITH
--ALLEN	와우^^LLEN
----------문자열 함수 (END)------------------------------------
--[숫자 함수]
--round(반올림 함수)
--trunc(절삭함수)
--mod() 나머지 구하는 함수
--                  .
--   ...-3  -2  -1  0  1   2   3 ...  
SELECT round(12.345,0) AS  "r" FROM dual; -- 정수부만 남겨라  12
SELECT round(12.567,0) AS  "r" FROM dual; -- 13
SELECT round(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT round(12.567,1) AS  "r" FROM dual; -- 12.6 

SELECT round(12.345,-1) AS  "r" FROM dual; --10
SELECT round(15.345,-1) AS  "r" FROM dual; --20
SELECT round(15.345,-2) AS  "r" FROM dual; --0



--trunc(절삭함수)
SELECT trunc(12.345,0) AS  "r" FROM dual; -- 정수부만 남겨라  12
SELECT trunc(12.567,0) AS  "r" FROM dual; -- 12
SELECT trunc(12.345,1) AS  "r" FROM dual; -- 12.3
SELECT trunc(12.567,1) AS  "r" FROM dual; -- 12.5 

SELECT trunc(12.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-1) AS  "r" FROM dual; --10
SELECT trunc(15.345,-2) AS  "r" FROM dual; --0

--나머지
SELECT 12/10 FROM dual; --1.2
SELECT mod(12,10) FROM dual; --2 나머지 (함수)

SELECT mod(0,0) FROM dual; --0

----------------------[숫자 함수 END]-------------------------
--[ 날짜 함수 ]
SELECT sysdate FROM dual;  --2020-04-01 12:16:14
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--날짜 연산 (POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date   >> Number (일수)

SELECT hiredate FROM emp; --1981-02-20 00:00:00

SELECT MONTHS_BETWEEN('2018-01-01','2010-01-01') FROM dual; --96개월
 

SELECT round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.565016427718040621266427718040621266
--122.6
SELECT trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) FROM dual;
--122.5

--POINT
--날짜 형식의 문자열을 날짜로 바꾸는 함수 (to_date())
SELECT to_date('2020-04-01') + 100 FROM dual; --2020-07-10 00:00:00
SELECT to_date('2020-04-01') - 100 FROM dual; --2019-12-23 00:00:00
SELECT sysdate + 1000 FROM dual; --2022-12-27 12:26:30

--Quiz
--1. 사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단 근속월수는 정수부분만 출력하세요 (반올림 하지 마세요) MONTHS_BETWEEN
SELECT  ename ,
        hiredate , 
        trunc(months_between(sysdate,hiredate),0) as "근속월수" 
FROM  emp;
--2. 한달이 31 일 이라는 기준에서 근속월수를 구하세요 (반올림 하지 마세요) 
--함수 사용하지 말고 >> (날짜 - 날짜 >> 150일 )
SELECT ename , hiredate , trunc((SYSDATE - hiredate) / 31,0) AS "근속월수"
FROM emp;
--------------[날짜 함수 END]-------------------------------
--문자
--숫자
--날짜 함수 및 연산 
---------------------------------------------------------
--[변환함수] : TODAY POINT
--오라클 : 문자 , 숫자 , 날짜 
--to_char() : 숫자 -> 문자 (1000 -> $1000) ,
--            날짜 -> 문자 (2020-01-01 -> 2020년01월01일) format

--to_date() : 문자 -> 날짜 >> select '2020-12-12' + 100 
--                         select to_date('2020-12-12') + 100

--to_number() : 문자 -> 숫자 (내부 자동 형변환)
SELECT '100' + 100 FROM dual;
SELECT to_number('100') + 100 FROM dual;

--to_number  (문자 -> 숫자) 자동 형변환
SELECT '1' + 100 FROM dual; -- 
SELECT to_number('1') + 100 FROM dual;

--to_char() : format >> 숫자 , 날짜  (형식문자)
SELECT to_char(sysdate) || '일' FROM dual; --2020-04-01 12:55:23일
--pdf 69page (형식문자 표)
SELECT sysdate , 
to_char(sysdate,'YYYY') || '년' AS "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
FROM dual;
--2020-04-01 12:57:16	2020년	TWENTY TWENTY	04	01	수

--입사월이 12월인 사원들의 사번 , 이름 , 입사일, 입사년도 , 입사월을 출력하세요
SELECT empno,ename,hiredate ,
TO_CHAR(hiredate,'YYYY')  AS "YYYY",
TO_CHAR(hiredate,'MM') AS "MM"
FROM emp
WHERE TO_CHAR(hiredate,'MM') = '12';

SELECT to_char(hiredate,'YYYY MM DD')  FROM emp;
--1980 12 17
SELECT to_char(hiredate,'YYYY"년" MM"월" DD"일"')  FROM emp;
--1980년 12월 17일

--to_char() 숫자 -> 문자로 (형식문자)
--pdf 파일 71page 표
--100000 >> 출력 >> $1,000,000 (문자)

SELECT '>' || to_char(12345,'999999999999') || '<' FROM dual; 
-->        12345<
SELECT '>' || to_char(12345,'099999999999') || '<' FROM dual;
--> 000000012345<

SELECT '>' || to_char(12345,'$9,999,999,999') || '<' FROM dual;
-->        $12,345<

SELECT sal , to_char(sal,'$999,999') FROM emp;
--800	     $800
--1600	   $1,600
--HR 계정으로 전환 ------------------------------
--HR 계정 전환 작업
select * from employees;
desc employees;



/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select * from employees;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서
fullname 별칭 부여해서 출력하고 
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을 출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select     employee_id,
           first_name || last_name as "fullname",
           to_char(hire_date,'YYYY-MM-DD') as "hire_date",
           salary,
           salary * 12 as "연봉",
           to_char((salary * 12)*1.1,'$9,999,999,999') as "인상분",
           hire_date
from employees
where to_char(hire_date,'YYYY') >= '2005'
order by "연봉" desc;  -- order by 절에 별칭이 올수 있다 (order by 마지막 실행)

--bit 계정으로 
-------------변환함수 (to_char() , to_date() , to_number())----------

--[ 일반함수(프로그래밍적인 성격) ]
--nvl() , nvl2() >> null 처리 담당
--decode() 함수 >> java if문 (switch)
--case() 함수 >>java if문 (switch)

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
SELECT  id, decode(id,100,'인사부',
                      200,'관리부',
                      300,'회계부',
                      '기타부서') AS "부서"
FROM t_emp;


SELECT deptno, decode(deptno,10,'인사부',
                             20,'관리부',
                             30,'회계부',
                             '기타부서') AS "부서"
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
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin컬럼의 앞자리가 1이면
'남성' 출력  2이면 '여성' 3이면 '중성' 그 외는 '기타' 라고 출력하세요
*/
SELECT id, decode(substr(jumin,1,1), 1 , '남성',
                                     2 , '여성',
                                     3 , '중성',
                                     '기타') AS "gender"
FROM t_emp2;                                     
--1	남성
--2	여성
--3	중성
--4	기타
--5	기타
/*
2분 커피 (2명)
if 문안에 if 문 (중첩 ) >> decode
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/
select empno,ename, decode(deptno,20 ,
						   decode(ename,'SMITH','HELLO','WORLD') , 
						  'ETC')
from emp;

--CASE 문
--java switch
/*
  CASE 조건식 WHEN 결과1 THEN 출력1
            WHEN 결과2 THEN 출력2
            WHEN 결과3 THEN 출력3
            ELSE 출력4
  END "컬럼명"

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
       CASE zipcode WHEN 2 THEN '서울' 
                    WHEN 31 THEN '경기' 
                    WHEN 32 THEN '강원' 
                    WHEN 41 THEN '제주'
                    ELSE '기타지역'
       END "regionname"   
FROM t_zip;       

/* emp
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요

1. case 컬럼명  when 결과  then 출력    (= 조건)
2. 비교조건 
   case when 컬럼명  조건  비교식 then ..
        when 컬럼명  조건  비교식 then ..
        when 컬럼명  조건  비교식 then ..
*/
select      case when sal <= 1000 then '4급'
                 when sal between 1001 and 2000 then '3급'
                 when sal between 2001 and 3000 then '2급'
                 when sal between 3001 and 4000 then '1급'
                 else '특급'
        end "급여등급"
from emp;
-----------------------------------------------------------
--문자함수 
--숫자함수
--날짜함수
--변환함수 (to_char ,to_date , to_number)
--일반함수 (nvl() , decode() , case())
------------------------------------------------------------
-- [집계함수] page 75
/*
1. count(*) > row 줄수  , count(컬럼명) >> 데이터 건수 (null 을 포함하지 않는다)
2. sum()
3. avg()
4. max()
5. min()
등등 ...

집계함수
1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 값을 무시 
3. select 절에 집계함수 이외 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시
*/

SELECT count(*) FROM emp; --14건
SELECT count(comm) FROM emp; --6건  (null 값을 무시)
SELECT count(empno) FROM emp;

 
SELECT count(nvl(comm,0)) FROM emp; -- null >> nvl()

--급여의 합
SELECT sum(sal) AS "급여합" FROM emp; --29025

SELECT round(avg(sal),0) AS "평균급여" FROM emp; --2073.214285714285714285714285714285714286

--사장님이 회사 총 수당 얼마나 지급되고 있나 (수당의 평균)
SELECT TRUNC(avg(comm),0) FROM emp; --721
SELECT trunc(sum(comm) / 6) FROM emp; -- 사원수 (6명)

--노조 ..보고서 .. 누구냐 ... ...

SELECT TRUNC(avg(nvl(comm,0)),0) FROM emp; --309
SELECT trunc(sum(comm) / 14) FROM emp; 

--회사의 규정이 (전체 사원수로 나눈다  .... 309)
--회사의 규정이 (받는 사원수로 나눈다  .... 721)

--검증 :코드
SELECT count(*) FROM emp WHERE comm IS NULL; -- 8

SELECT count(*) FROM emp WHERE empno IS NULL; -- 0

SELECT max(sal) FROM EMP;

SELECT min(sal) FROM emp;

--POINT
SELECT empno , count(empno) FROM emp; --empno 14건 , count() 1건
--not a single-group group function
SELECT sum(sal) , avg(sal) , max(sal) , min(sal) , count(sal)
,count(*) FROM emp;

--부서별 평균 급여를 출력하세요
--not a single-group group function
SELECT deptno , avg(sal) 
FROM emp
GROUP BY deptno;

--직종별 평균 급여를 구하세요
SELECT job , avg(sal)
FROM emp 
GROUP BY job;

--직종별  평균급여 , 급여합 , 최대급여 , 최소급여 , 건수를 출력하세요

SELECT job , avg(sal) , sum(sal) , max(sal) , min(sal), count(sal)
FROM emp
GROUP BY job;
/*
grouping  원리

distinct 컬럼명1 , 컬럼명2
order by 컬럼명1 , 컬럼명2
group by 컬럼명1 , 컬럼명2 , 컬럼명3

*/

--부서별 , 직종별 급여의 합을 구하세요
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
--직종별 평균 급여가 3000달라 이상인 사원의 직종과 평균급여를 출력하세요
--** group by 조건절  >> having  절
--WHERE avg(sal) >= 3000 순서상 ...(x)
SELECT job, avg(sal) AS "평균급여"
FROM emp 
GROUP BY job  --이 결과에서 ... 조건  ... having
HAVING avg(sal) >= 3000;
--PRESIDENT	5000
--ANALYST	3000

--from 조건절 >> where
--group by 조건절 >> having 

/*          
하나의 테이블을 대상으로 쓸수 있는 구문 ...                       
select                 5                    
from                   1      
where                  2      
group by               3
having                 4      
order by               6      
*/



/* 사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 
    사원들의 목록을 출력하세요 급여의 합이 낮은 순으로 출력하세요 */
SELECT empno , job , sum(sal) AS "sumsal"
FROM emp 
WHERE comm IS NOT NULL 
GROUP BY job , empno
HAVING sum(sal) >= 5000
ORDER BY "sumsal" asc;

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,
 인원수 , 급여의 합을 출력하세요 */
SELECT deptno , count(deptno) AS "부서별 인원수" , sum(sal) "부서별 급여의 합"
FROM emp 
GROUP BY deptno
HAVING count(deptno) > 4;

/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */
SELECT job , sum(sal) AS "sumsal" 
FROM emp 
WHERE job != 'SALESMAN'
GROUP BY job
HAVING sum(sal) > 5000 
ORDER BY "sumsal" desc;

-----------------------------------------------------------
-- [ JOIN ]  (pdf 85 page)
-- 관계형 데이터 베이스  (RDBMS)  >> ORDB (x) >> Framework (객체매핑 :JPA , Mybatis)  >> noSQL(mongoDB)
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

--종류
--1.등가조인 (equi join) >> [ INNER ] JOIN 
--원테이블과 대응대는 테이블에 있는 컬럼의 데이터를  1:1 매핑
--JOIN 문법
--1. SQL JOIN 문법 (제품 ...)
--2. ANSI 문법 (권장)(표준)

--SQL JOIN 문법
SELECT *
FROM m , s 
WHERE m.m1 = s.s1;

SELECT m.m1 , m.m2 , s.s2
FROM m , s 
WHERE m.m1 = s.s1;


--ANSI 문법 (권장)
--where (from  조건절)
--where join 조건과  일반 조건을 혼재하면  혼란 ...
--JOIN 조건 분리  >>  ON 절 
SELECT *
FROM M INNER JOIN S 
ON M.M1 = S.S1;

SELECT M.M1 , M.M2 , S.S2
FROM M JOIN S  --INNER 생략
ON M.M1 = S.S1;

--사원번호 , 사원이름 , 사원부서번호 , 사원 부서명을 알고 싶어요
SELECT EMP.EMPNO , EMP.ENAME , EMP.DEPTNO , DEPT.DNAME 
FROM EMP JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO;


--join 테이블에 가명칭 부여 >> 그 이름으로 접근
SELECT E.EMPNO , E.ENAME , E.DEPTNO , D.DNAME 
FROM EMP E JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO;

--JOIN (2, 3 ....) 여러개 테이블

--SQL JOIN 문법
SELECT m.m1 , m.m2 , s.s2 , x.x2
FROM m , s , x 
WHERE m.m1 = s.s1 AND s.s1 = x.x1;
--A == B , B == C , A == C

--ANSI 문법
SELECT *
FROM m JOIN s  ON m.m1 = s.s1
       JOIN x  ON s.s1 = x.x1;
--     JOIN y  ON x.x1 = y.y1
-- [ HR 계정으로 이동 ]
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;
--1. 사번 , 이름(last_name) , 부서번호 , 부서이름 출력하세요
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID; 
--106명
--107명인데 why >> 106명
SELECT count(*) FROM EMPLOYEES; --107
--JOIN 은 NULL 포함하지 않아요
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID  IS NULL;  
--178번 사원이 부서id >> NULL
--등가조인으로 해결불가 (outer join) 사용 ...해결

--2. 사번 , 이름(last_name), 부서번호 , 부서명 , 지역코드 , 도시명
--을 출력하세요
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
--bit 계정--				
--2. 비등가 조인 (non-equi join) => 의미만 존재 => 등가조인 문법
--원테이블과 대응대는 테이블 있는 컬럼이 1:1 매핑되지 않는 경우
SELECT * FROM emp;
SELECT * FROM salgrade;

SELECT e.empno , e.ename , e.sal , s.GRADE 
FROM emp e JOIN salgrade s
ON e.sal BETWEEN s.LOSAL  AND s.HISAL; 
--------------------------------------------------------

----------------------------------------------------
--3. outer join (equi join + null)
--outer join (주 종관계 파악) >> 주가 되는 테이블에 있는 남은 데이터 가져오기
--문법 3가지
-- left outer join (왼쪽 주인)
-- right outer join (오른쪽 주인)
-- full outer join (왼쪽 주인 + 오른쪽 주인 >> union)

--left [ outer ] 생략가능  join
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

--HR 계정으로 --
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e LEFT OUTER JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
ORDER BY e.EMPLOYEE_ID; 
--178번 사원이 부서id >> NULL 출력되게 하세요
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID  IS NULL; 
-----------------------------------------------------
--self join (자기참조) -> 의미  -> 문법 (등가조인)
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우
--조인 (테이블 1개 이상)
--테이블의 가명칭 달리해서 여러개 테이블 처럼
SELECT e.empno , e.ENAME  , m.EMPNO  , m.ENAME 
FROM emp e JOIN emp m
ON e.mgr = m.EMPNO; 
--문제 : 14명    >> 13명
SELECT * FROM emp;

--king 도 출력하세요
SELECT e.empno , e.ENAME  , m.EMPNO  , m.ENAME 
FROM emp e LEFT JOIN emp m
ON e.mgr = m.EMPNO; 

--JOIN TEST-- 3시 10분  (emp, dept , salgrade)
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
SELECT E.ENAME, E.JOB, D.DEPTNO, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE  D.LOC='DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E  join DEPT D  on D.DEPTNO=E.DEPTNO
WHERE  E.ENAME LIKE '%A%';
--WHERE Regexp_like(E.ENAME,'^A'); 
-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
SELECT E.ENAME, D.DNAME, E.SAL ,D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO
WHERE E.SAL>=3000;
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
SELECT E.JOB, E.ENAME, D.DNAME
FROM EMP E  join DEPT D on E.DEPTNO=D.DEPTNO 
WHERE E.JOB='SALESMAN';
 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
SELECT E.EMPNO AS "사원번호",
               E.ENAME AS "사원이름",
               E.SAL*12 AS "연봉",
           --E.SAL*12+NVL(COMM,0) AS "실급여",
               E.SAL*12+COMM AS "실급여",
               S.GRADE AS "급여등급"
FROM EMP E inner join SALGRADE S 
           on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.Comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E   join DEPT D on E.DEPTNO=D.DEPTNO
             join SALGRADE S on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE E.DEPTNO=10;
 
SELECT * FROM SALGRADE;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
-- inner 는 생략 가능
SELECT E.DEPTNO, D.DNAME, E.ENAME, E.SAL, S.GRADE
FROM EMP E  join DEPT D              on E.DEPTNO=D.DEPTNO
            join SALGRADE S       on E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE  E.DEPTNO<=20 --WHERE E.DEPTNO IN (10,20)  -- e.deptno = 10 or 
ORDER BY E.DEPTNO ASC,  E.SAL DESC;

 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;
----------------------------------------------------
--subquery 오라클.pdf (100page)
--sql 의 꽃이다  >> sql 의 만든 해결사
--함수 >> 조인 >> subquery

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의
--사번 , 이름 , 급여를 출력하세요
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
1. single row subquery : subquery 결과 row 1개(단일컬럼 단일값) 
2. Multi  row subquery : subquery 결과 row 1개 이상(단일컬럼 여러개의 값)
구별하는 이유는 : 사용되는 연산자 ....
multi row : IN , NOT IN (ANY ,ALL)
ALL(and) : sal > 1000 and sal > 2000 and sal ...
ANY(or)  : sal > 1000 or sal > 2000 or sal...

정의(subquery)
1. 괄호안에 있어야 한다 >> (select sal from emp)
2. 단일 컬럼으로 구성 >> (select sal , deptno from emp) (x)
3. 단독으로 실행 가능 

실행순서
1. 무조건 subquery 먼저 실행
2. subquery 의 결과값을 가지고 main query 실행
*/
--사원테이블에서 jones 급여보다 더 많은 급여를 받는 사원의 사번, 이름 , 급여
--출력하세요

SELECT sal FROM emp WHERE ename = 'JONES'; --2975

SELECT * 
FROM emp 
WHERE sal > (SELECT sal FROM emp WHERE ename = 'JONES');

--subquery 급여가 2000 이상
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
--NOT IN (부정의 and)
--2975 2850 2450 3000 5000 3000
--where sal != 2975 and sal != 2850 and sal != 2450 and ..

--부하직원이 있는 사원의 사번과 이름을 출력하세요
--(내 사번이 mgr 컬럼에)
SELECT mgr FROM emp;
SELECT *
FROM emp WHERE empno IN (SELECT mgr FROM emp);
--empno=7788 or empno=7902 or empno=null

--부하직원이 없는 사원의 사번과 이름을 출력하세요
SELECT *
FROM emp WHERE empno NOT IN (SELECT mgr FROM emp);
--empno != 7902 and empno != 7788 and empno is not null
--and null 결과 null

SELECT *
FROM emp WHERE empno NOT IN (SELECT nvl(mgr,0) FROM emp);


SELECT *
FROM emp WHERE empno 
NOT IN (SELECT mgr FROM emp WHERE mgr IS NOT null);

--king 에게 보고하는 즉 직속상관이 king 인 사원의 사번 , 이름 , 직종 , 관리자 사번
--을 출력하세요
SELECT empno FROM emp WHERE ename='KING';

SELECT empno, ename , job , mgr
FROM emp WHERE mgr = (SELECT empno FROM emp WHERE ename='KING');

--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 
--사번 , 이름 , 급여 , 부서번호를 출력하세요
SELECT max(sal) FROM emp WHERE deptno=20; --3000

SELECT empno , ename, sal , deptno
FROM emp 
WHERE sal > (SELECT max(sal) FROM emp WHERE deptno=20);

--POINT--
--subquery >> select 절에 
--         >> from
--         >> where 

SELECT *
FROM emp 
WHERE  deptno IN (SELECT deptno FROM emp WHERE job='SALESMAN')
       AND sal IN (SELECT sal FROM emp WHERE job='SALESMAN');
--QUIZ
--실무에서 활용 (고급)
--자기 부서의 평균 월급보다 더 많은 월급을 받는 
--사원의 사번, 이름 , 부서번호 , 부서별 평균 월급을 출력하세요    
--1 단계 : 부서번호와 부서의 평균월급을 담고 있는 테이블이 존재한다면 
--.... (물리적인 테이블은 없어요 ...)
SELECT deptno , round(avg(sal),0) FROM emp GROUP BY deptno;
--2 단계 : from 절 subquery 사용가능 ... (가상테이블) ...in line view
SELECT e.empno , e.ename , e.deptno , e.sal , s.avgsal
FROM emp e JOIN  (SELECT  deptno , round(avg(sal),0) AS avgsal 
       			  FROM emp GROUP BY deptno) s
ON e.DEPTNO  = s.deptno
WHERE e.sal > s.avgsal;

/*
부서번호     평균급여
30	     1567
20	     2175
10	     2917
*/
--subquery 연습문제 푸세요  (시간 : 10시 10분까지 )
--카페에 있어요 
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';
 
--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30


--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
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
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO    -- = 이 맞는데  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');
 
--8. SALES 부서에서 일하는 사원들의  같은 부서번호, 이름, 직업을 갖는 사원정보를 출력하라.
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
 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
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
 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM EMP
                      WHERE COMM IS NOT NULL)
AND SAL IN( SELECT SAL
               FROM EMP
               WHERE COMM IS NOT NULL);
 
--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.
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
 
 기본 함수 ~~~~ 집계함수
join (하나 이상의 테이블에서 데이터 가져오기 : 다중 테이블 : 관계)   
subquery 
초급 개발자 기본 소양 ....  
 */
-----------------------------------------------------
--[INSERT] , [UPDATE] , [DELETE]  >> 암기 
/*                        
오라클 기준
DDL(데이터 정의어) : create , alter , drop , truncate (rename,modify)
DML(데이터 조작어) : insert , update , delete   (0) : 20%
DQL(데이터 질의어) : select                     (0) : 70% 
DCL(데이터 제어어) : 권한 (grant , revoke)  >> DBA (관리자 : 모니터링 : 백업 복원)
TCL(트랜재션)     : commit , rollback , savepoint  (0)                       

개발자 : CRUD (Create > insert , Read > select , U > Update, D > Delete) 
*/                        

--DML (트랜잭션 : (Transaction) : 하나의 논리적인 작업 단위) > LOCK 
--A라는 은행에서 돈 인출  B라는 은행에 입금 
--A : update ... 1000 > 500
--B : update ... 1000 > 1500                        
--둘다 성공 : commit
--둘중에 하나만 실패 : rollback 

SELECT * FROM tab;   --접속한 사용자가 만든 모든 테이블 목록  

SELECT * FROM tab WHERE tname ='BOARD';  --Board 테이블이 존재

SELECT * FROM  col;

SELECT * FROM col WHERE tname='EMP';

SELECT * FROM user_tables; --관리자 
SELECT * FROM user_tables WHERE table_name ='DEPT';

-------------------------------------------------
--DML (오라클.pdf  168page)
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])] 
VALUES  (value1[, value2, . . . . . . ]);
*/
CREATE TABLE temp(
  id NUMBER PRIMARY KEY ,-- not null 하고 unique 데이터만
  name varchar2(20)  --default null 값 허용
);
/*
   문자 타입
  char(20)    >> 20byte >> 한글10자, 영문자20자 >>고정길이문자열
  varchar2(20)>> 20byte >> 한글10자, 영문자20자 >>가변길이문자열
  
  char(20)    >> '홍길동' >> 6byte >> [홍길동         ] >> 20byte
  varchar(20) >> '홍길동' >> 6byte >> [홍길동] >> 6byte
  
  ex)
    고정길이 데이터 : 남,여 : char(2)
    가변길이 데이터 : 이름 ...  
  
   성능상의 문제    : char() > varchar() 우선 ...
   그럼 ... 고정길이 데이터 char()  .... 남여 , 주민번호 , 우편번호 
   
   한글문제  (unicode : 2byte ) >> 한글, 영문자 , 특수문자 , 공백 
  
  nchar(20)  >> 20 >> 글자수  >> 총 byte >> 2 * 20 >> 40byte
  nvarchar(10) >> 10글자 
 
*/
SELECT * FROM temp;

--1. 가장 일반적인 INSERT
INSERT INTO temp(id,name)
VALUES(100,'홍길동');

SELECT * FROM temp;
--실반영
COMMIT;

--2 컬럼 목록 생략 (컬럼 리스트 생략)
INSERT INTO temp 
VALUES(200,'김유신'); --데이터 컬럼의 개수 , 순서 일치

SELECT * FROM temp;
COMMIT;

--1. 문제 상황
INSERT INTO temp(id , name) --id primary key
VALUES(100,'아무개');
--unique constraint (BIT.SYS_C007005) violated

INSERT INTO temp(name) --not null , unique 
VALUES('아무개');
--cannot insert NULL into ("BIT"."TEMP"."ID")
-------------------------------------------------------
--일반 SQL 문은 프로그램적이 요소 (x)

--PL-SQL (고급) 프로그래밍 적인 요소 (제어문 , 변수 )
--PL-SQL
CREATE TABLE temp2(id varchar2(20));

--데이터 테스트 .. 일일이 1000건 1000번 실행 ...
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
   name varchar2(10) , --null 허용
   regdate DATE DEFAULT sysdate --기본값 설정하기 (날짜 insert 하지 않으면..	
 );

SELECT sysdate FROM dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO temp3(memberid, name, regdate)
values(100,'홍길동','2020-04-03'); --100	홍길동	2020-04-03 00:00:00

SELECT * FROM temp3;
COMMIT;

INSERT INTO temp3(memberid, name)
VALUES (200,'아무개');

SELECT * FROM temp3; --200	아무개	2020-04-03 12:14:00
COMMIT;

INSERT INTO temp3(memberid)
values(300);

SELECT * FROM temp3; 
--300	null	2020-04-03 12:15:34

INSERT INTO temp3(name)
VALUES ('이름만');
--cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")

--insert (TIP)
--1. 대량 데이터  insert  하기
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

--요구사항 : temp4에 있는 모든 데이터를 temp5 넣고 있어요
--insert into 테이블명(컬럼리스트) values(값리스트)
--insert into 테이블명(컬럼리스트) select 절 (컬럼리스트의 개수와 타입 동일) 조건

INSERT INTO temp5(num)
SELECT id FROM temp4;

SELECT * FROM temp5;

--2. insert TIP
--테이블에 없는 상황에서 [테이블 생성] + [대량 데이터 삽입]
--단 복사 개념(제약 정보는 복사 안되요 (PK , FK)
--순수한 테이블 구조 (컬럼이름, 타입 ) 복사

--create table copyemp(id number)
CREATE TABLE copyemp  --emp같은 구조를 만들고 .... 데이터 삽입
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


--질문 : 구조 (틀) 만 복사하고 데이터 복사하고 싶지 않아요
CREATE TABLE copyemp3
AS
   SELECT * FROM emp WHERE 1=2;
  
SELECT * FROM copyemp3;  

----------------------[INSERT END]--------------
--[UPDATE]
/*
update table_name
set column1 = value1 , column2 = value2 .....
where 조건

update table_name
set column1 = (subquery)
where 조건
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

--여러개의 컬럼을 update
UPDATE COPYEMP 
SET ename='AAAA' , job = 'BBBB' , hiredate=sysdate , sal=1111
WHERE deptno=10;

SELECT * FROM copyemp WHERE deptno=10;
COMMIT;
----------------------[UPDATE END]--------------------------
--[DELETE]
--원칙 >> delete -> commit , rollback -> 복원 불가 -> 단 백업 ...

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

(DML : insert, update, delete) 트랜잭션 (commit , rollback)

JDBC -> Oracle -> Emp 테이블 작업
--전체조회(함수) 
--조건조회(사번이) (함수)
--삭제(함수)
--수정(함수)
--삽입(함수)
--JAVA
--public List<Emp> getEmpAllLIst() { String sql="select * from emp" }
--public Emp getEmpListByEmpno(){String sql="select... where empno=777"}
--public int insertEmpData(Emp emp) {String sql="insert into emp()..."}             
 
 ArrayList<Emp> list = new ....
 list.add(new Emp(rs.getString("ename"))); --> 데이터 건수 while
                                               
*/                        
-------------------------------------------------------------
--[DDL]
--create , alter , drop (테이블 기준)

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
--학생 성적 테이블
--국어 , 영어 , 수학 , 총점컬럼
--10    10   10    30
--국어, 영어, 수학 점수가 들어어면 자동으로 총점 계산되면 ...
--oracle 11g 버전 (가상컬럼 (조합컬럼))
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

--컬럼의 정보 보기
SELECT COLUMN_NAME , DATA_TYPE , DATA_DEFAULT 
FROM USER_TAB_COLUMNS WHERE table_name='VTABLE';
--NO3	NUMBER	"NO1"+"NO2"

--실무에서 활용되는 코드
--제품정보 (입고일) .. 분기별 (4분기)
--입고일: 2020-03-01 >> 1분기
CREATE TABLE vtable2
(
    NO NUMBER, --순번
    p_code char(4), --제품코드(A001 , A002)
    p_date char(8), --입고일(20200101)
    p_qty NUMBER, --수량
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
--DDL 테이블 다루기 (오라클.pdf  138page)
--1. 테이블 생성하기
CREATE TABLE temp6 ( id number );

--2. 테이블을 생성했는데 컬럼 추가하기
DESC temp6;

ALTER TABLE TEMP6 
ADD ename varchar2(20);

--3. 기존 테이블에 있는 컬럼의 이름을 잘못 표기 (ename -> username)
--기존 테이블에 있는 컬럼의 이름 바꾸기 (rename)
ALTER TABLE TEMP6
RENAME COLUMN ename TO username;

--4. 기존 테이블에 있는 기존 컬럼의 타입 수정하기
--(modify)
ALTER TABLE TEMP6 
modify(username varchar2(100));

--5. 기존 테이블에 있는 기존 컬럼 삭제
ALTER TABLE TEMP6 
DROP COLUMN username;

--6. 테이블 삭제
--6.1 데이터 삭제 : delete 
--테이블 처음 만들면 처음 크기(20평) -> 데이터를 넣으면 -> 20평 >> 늘려요 >> 30평
--ex) 처음 1M >> 10만건 >> 100M >> delete 10만건 삭제 >> 크기는 100M

--테이블 데이터 삭제 (공간의 크기도 줄일 수 있다)
--truncate (where 절은 사용 못해요)
--ex) 처음 1M >> 10만건 >> 100M >> truncate 10만건 삭제 >> 크기는 1M

--7. 테이블 삭제 (drop)
DROP TABLE temp6;

SELECT * FROM temp6;

----------------------------------------------------------
--테이블 제약 설정하기 (오라클.pdf 148page)
--데이터 [무결성] 확보
--select (연관성 ..(x))
--제약(constraint : insert , update , delete(FK))
/*
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족) 
--테이블에 한개만 걸수 있다 (테이블당 한개(여러개를 묶어서 : 복합키))
--내부적으로 검색의 향상을 위해서 (index) 자동 생성 (select 향상)

FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
--참조제약 [테이블] 과 [테이블]간의 관계 설정

UNIQUE key(UK) 테이블의 모든 행을 [유일하게 하는 값]을 가진 열(NULL 을 허용)
--null을 가질 수 있다 >> unique 와  not null 병행  

NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다. 

CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정) 
설정한 범위의 값만 받겠다   컬럼에 gender in ('남','여') 하면 ...
ex) where gender in ('남','여')
*/ 

--제약을 만드는 시점
--1. 테이블 만들면서 바로 생성 (create table ...)
--2. 테이블 생성 이후 추가 (제약) (alter table add constraint ...)
--   자동화된  툴 들이 사용하는 방법

--1. 제약 정보 확인하기
SELECT * FROM USER_CONSTRAINTS WHERE table_name='EMP';
-- SYS_C006997 내부적으로 생성된 제약 이름 
--"EMPNO" IS NOT NULL

CREATE TABLE temp7(
   --id NUMBER PRIMARY KEY 줄임표현 (제약이름 : SYS_C006997)
   id NUMBER CONSTRAINT pk_temp7_id PRIMARY KEY , --권장 
   name varchar2(20) NOT NULL ,
   addr varchar2(50)
);

SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP7';
--PK_TEMP7_ID  해석이 가능 (제약 수정, 삭제) 사용

INSERT INTO temp7(name,addr) values('홍길동','서울시 강남구');
--ORA-01400: cannot insert NULL into ("BIT"."TEMP7"."ID")

INSERT INTO temp7(id,name,addr) values(10,'홍길동','서울시 강남구');
COMMIT;
SELECT * FROM temp7;

INSERT INTO temp7(id,name,addr) values(10,'아무개','서울시 강남구');
--중복 데이터
--ORA-00001: unique constraint (BIT.PK_TEMP7_ID) violated

--1. 테이블에 primary key 를 몇개까지 걸수 있을까요 ? 1개
--(name , num) 여러개의 컬럼을 묶어서 1개 .... >> 복합키

CREATE TABLE temp8(
	id NUMBER CONSTRAINT pk_temp8_id PRIMARY KEY,
	name varchar2(20) NOT NULL,
	jumin char(6) CONSTRAINT uk_temp8_jumin UNIQUE, --null 허용
	addr varchar2(20)
);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP8';

INSERT INTO temp8(id, name,jumin,addr)
values(10,'홍길동','123456','경기도 성남시');
COMMIT;
SELECT * FROM temp8;

INSERT INTO temp8(id, name,jumin,addr)
values(20,'아무개','123456','경기도 성남시');
--ORA-00001: unique constraint (BIT.UK_TEMP8_JUMIN) violated

--null ....unique 허용 (null 도 중복체크를 할까)
--result : null 허용 (중복 체크 하지 못한다)
INSERT INTO temp8(id, name,addr)
values(30,'김씨','경기도 성남시');
--30	김씨	 null	경기도 성남시
SELECT * FROM temp8;

INSERT INTO temp8(id, name,addr)
values(40,'박씨','경기도 성남시');
SELECT * FROM temp8;

--CREATE TABLE temp8 ( jumin NOT NULL CONSTRAINT .. unique)
--unique 제약은 테이블에 몇개 : 컬럼개수만큼 ...
-----------------------------------------------------------
CREATE TABLE temp9(id NUMBER);

--기존 테이블에 제약 추가하기
--주의) 기존 데이터가 있는 경우 제약을 위반하는 데이터가 있으면 제약은 추가되지 않아요
--제약 걸기전에 데이터 검사 작업 선행

ALTER TABLE TEMP9 
ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id); 
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP9';

--여러개 컬럼(복합키)
--ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id , name);
ALTER TABLE temp9
ADD ename varchar2(20);

DESC temp9;

--not null 추가하기
ALTER TABLE TEMP9 
modify(ename NOT NULL);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP9';

-----------------------------------------------------------
--[check 제약]
--where 조건과 동일한 형태의 제약 >> where age > 19
--컬럼이름 age > 19
CREATE TABLE temp10(
	id NUMBER CONSTRAINT pk_temp10_id PRIMARY KEY,
	name varchar2(20) NOT NULL,
	jumin char(6) CONSTRAINT uk_temp10_jumin UNIQUE,
	addr varchar2(20),
	age NUMBER CONSTRAINT ck_temp10_age check(age >= 19)
);
SELECT * FROM USER_CONSTRAINTS WHERE table_name='TEMP10';

INSERT INTO temp10(id,name,jumin,addr,age)
values(100,'홍길동','123456','서울시 강남구',20);

SELECT * FROM temp10;
COMMIT;

INSERT INTO temp10(id,name,jumin,addr,age)
values(200,'홍길동','123456','서울시 강남구',18);
--ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
-----------------------------------------------------------
--참조 제약 : RDBMS : 테이블과 테이블과의 관계 설정
--emp 테이블에 있는 detpno 컬럼은 dept 테이블에 있는 detpno 참조 합니다
--참조하는 쪽에 거는 제약 : FK
--참조를 당하는 쪽에 거는 제약 : PK

CREATE TABLE c_emp
AS
  SELECT empno , ename , deptno FROM emp WHERE 1=2;
 
CREATE TABLE c_dept
AS
  SELECT deptno , dname FROM dept WHERE 1=2;
 
SELECT * FROM c_emp;
SELECT * FROM c_dept;
--emp 테이블에 있는 detpno 컬럼은 dept 테이블에 있는 detpno 참조 합니다

ALTER TABLE C_EMP 
ADD CONSTRAINT fk_c_emp_empno FOREIGN KEY(deptno) 
                              REFERENCES c_dept(deptno);
--ORA-02270: no matching unique or primary key for this column-list
--c_emp (deptno) >> c_dept(deptno)  빌려 쓸거야 
--c_dept(deptno) 다른 사람에게 빌려주기 위해서 신용을 확보(primary key)
--c_dept(deptno) primarky key
--1 번 선행
ALTER TABLE C_DEPT 
ADD CONSTRAINT pk_c_dept_deptno PRIMARY KEY(deptno);
          
--2번 
ALTER TABLE C_EMP 
ADD CONSTRAINT fk_c_emp_empno FOREIGN KEY(deptno) 
                              REFERENCES c_dept(deptno);
--c_emp(deptno) --- c_dept(deptno) 관계가 설정 (1 : N)

INSERT INTO c_dept(deptno,dname) values(100,'인사팀');                             
INSERT INTO c_dept(deptno,dname) values(200,'관리팀');  
INSERT INTO c_dept(deptno,dname) values(300,'회계팀');
SELECT * FROM c_dept;

COMMIT;
--신입사원 입사
--질문) not null 걸어서 쓰는 것이 맞다(100~300) , 아니다 (null허용)(100~300)
--null 이유 : 신입사원이 반드시 부서를 가져야 하는 것은 아니다 .
--not null 이유 : 입사하는 모든 사원은 반드시 부서를 가져야 한다.
INSERT INTO c_emp(empno,ename)
VALUES(100,'홍길동');
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
values(200,'아무개',100);
SELECT * FROM c_emp;
COMMIT;
-----------------------------------------
--두 개의 테이블
--(부모와 자식관계)
--(master , detail)

--emp(deptno) 과 dept(deptno) 관계에서 주테이블(부모)
--부모(PK) > dept

SELECT * FROM c_dept;
SELECT * FROM c_emp;

DELETE FROM c_dept WHERE deptno=300; --부서 ...
DELETE FROM c_dept WHERE deptno=100;
--integrity constraint (BIT.FK_C_EMP_EMPNO) violated 
-- child record found
--저 지우고 싶어요 ....
--child (100 번 부서를 삭제 , 수정) ...
--자식을 먼저 삭제하고 부모 삭제 .....
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
-- [ON DELETE CASCADE]  부모테이블과 생명을 같이 하겠다
-- 300 삭제 할 있나요?  네 
-- delete from c_dept where detpno=300;
-- 참조하는 자식 데이터 같이 삭제
-- delete from c_emp where deptno=300; 같이 실행
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
--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 (평균 소수이하 2자리 반올림)
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--샘플 데이터는 3건 입력
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
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
  
  --복합키 constraint pk_grade_snum primary key(s_number,name),
  constraint pk_grade_snum primary key(s_number),
  constraint fk_grade_mcode foreign key(m_code) references major(m_code) 
  --나중에 걸거나 (테이블 생성 후에)
);
 


/* 사원 */
CREATE TABLE EMP (
	empno NUMBER NOT NULL, /* 사번 */
	ename VARCHAR2(20), /* 이름 */
	sal NUMBER, /* 급여 */
	deptno NUMBER /* 부서번호 */
);
ALTER TABLE EMP
ADD	CONSTRAINT PK_EMP_DEPTNO PRIMARY KEY (empno);
/* 부서 */
CREATE TABLE DEPT (
	deptno NUMBER NOT NULL, /* 부서번호 */
	dname VARCHAR2(20) /* 부서명 */
);


ALTER TABLE DEPT
ADD	CONSTRAINT PK_DEPT_DEPTNO	PRIMARY KEY(deptno);

ALTER TABLE EMP
ADD	CONSTRAINT FK_DEPT_TO_EMP 	FOREIGN KEY(deptno)
REFERENCES DEPT(deptno);

--------------------- 제약 설정하기 --------------------------
--view 객체 (가상 테이블) 오라클.pdf (192page)
/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY] 


OR  REPLACE  이미 존재한다면 다시 생성한다. 
FORCE   Base Table 유무에 관계없이 VIEW 을 만든다. 
NOFORCE  기본 테이블이 존재할 경우에만 VIEW 를 생성한다. 
view_name  VIEW 의 이름 
Alias   Subquery 를 통해 선택된 값에 대한 Column 명이 된다. 
Subquery  SELECT 문장을 기술한다. 
WITH CHECK OPTION VIEW 에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다.  
Constraint  CHECK OPTON 제약 조건에 대해 지정된 이름이다. 
WITH READ ONLY  이 VIEW 에서 DML 이 수행될 수 없게 한다. 
*/


--[42000]: ORA-01031: insufficient privileges
--당신은 view 생성 권한이 없어요 .... 관리자에게 권한을 받으세요
-- SYSTEM PRIVILEGES
-- SYSTEM , SYS 접속해서 ....
GRANT CREATE VIEW TO "BIT" WITH ADMIN OPTION;

CREATE VIEW v_001
AS
   SELECT empno,ename FROM emp;
  
SELECT * FROM v_001;  
--view 는 sql 문장을 가지고 있는 객체 

--view 객체 (create ....)
--create view 뷰이름 as sql 문장 (view 통해서 볼 수 있는 데이터 목록)
--view 는 테이블처럼 사용가능 (가상테이블) -> 쓰는 방법 (emp, dept ) 동일하게
--view 메모리상에서만 존재하는 가상테이블 (ex) in-line-view

--view 사용법
--일반 테이블과 동일 ...(select,  where ...) 
--DML(insert , update , delete) -> View통해서 볼 수 있는 데이터 -> DML
--view 볼 수 있는 데이터

--view 사용 목적
--1. 개발자의 편리성 (Join, subquery) >> 실제 테이블이 있다면 ...
--2. 보안(권한 처리) -> 노출하고 싶은 데이터만 모아서 view 생성 ...
--3. 편리성 (복잡한 query 모아서 ) view 생성 .....미리 만들어 보기

--인사 테이블
--Emp 바로 노출 ...Sal 정보
CREATE VIEW v_emp
AS
  SELECT empno, ename,job,hiredate FROM emp;
 
 --v_emp 사용하시면 되요
 SELECT * FROM v_emp;
 SELECT * FROM v_emp WHERE empno=7788;

--편리성  (복잡한 쿼리를 단순화)
CREATE VIEW v_002
AS
  SELECT e.empno, e.ename, d.deptno , d.dname
  FROM emp e JOIN dept d
  ON e.deptno = d.deptno;
 
SELECT * FROM v_002; 
SELECT * FROM v_002 WHERE deptno=20;

--자기 부서의 평균 월급보다 더 많은 월급을 받는 
--사원의 사번, 이름 , 부서번호 , 부서별 평균 월급을 출력하세요    
--자기 부서의 평균 월급보다 더 많은 월급 담고 있는 테이블이 있다면 ...

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

--테이블이 1개 이상
--JOIN ... 안되요 ...subquery ...안되요 view(가상테이블)

--view 삭제
DROP VIEW v_007;

CREATE OR REPLACE VIEW v_007
AS
    SELECT avg(sal) AS AVGSAL FROM emp;

SELECT * FROM v_007;

--VIEW 통한  DML 가능 (insert, update , delete)
--단 view 가지는 구문이 테이블 1개 가능 
--복합  view 는 DML 불가(테이블이 1개 이상 구성된 query)
--단순 view (테이블 1개로 만든 view)

SELECT * FROM v_emp; --볼수 있는 데이터(empno, ename, job , hiredate)

UPDATE v_emp  --v_emp 너는 sal 컬럼을 볼수 없어 .... 변경 할수 없어
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

--view 목록보기
SELECT * FROM user_views;

--
--1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
CREATE OR REPLACE  VIEW VIEW100
AS
  SELECT JOB, ENAME, SAL
  FROM EMP
  WHERE DEPTNO=30
 
SELECT * FROM VIEW100
 
 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
 
CREATE OR REPLACE VIEW  VIEW101 ( 직위, 사원이름 ,월급 )
AS
 SELECT JOB , ENAME , SAL
 FROM EMP
 WHERE DEPTNO=30 AND SAL > 300;
 
SELECT * FROM VIEW101
 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
CREATE OR REPLACE VIEW  VIEW102
AS
 SELECT DEPTNO, MAX(SAL) AS "최대월급",
  MIN(SAL) AS "최소월급",
  AVG(SAL) AS "평균월급"
 FROM EMP
 GROUP BY DEPTNO
 
 
SELECT * FROM VIEW102
       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.
--from 조건 => where
--group by 조건 => having
 
CREATE OR REPLACE VIEW VIEW103
AS
 SELECT DEPTNO, AVG(SAL) AS "평균월급"
 FROM EMP
 GROUP BY DEPTNO
 HAVING AVG(SAL) >=2000
 
----------------------------------------
SELECT v.deptno,v.평균월급 , d.dname
FROM view103 v JOIN dept d
ON v.deptno = d.deptno
-----------------------------------------
 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.
 
CREATE OR REPLACE VIEW VIEW104
AS
 SELECT JOB, SUM(SAL) AS "총월급"
 FROM EMP
 WHERE JOB!='MANAGER'
 GROUP BY JOB
 HAVING SUM(SAL)>=3000
 
SELECT * FROM VIEW104

-------------------------------------------------------------------
--시퀀스 
--오라클.pdf (page 185)

--순번 추출하기(번호생성)
--자동으로 번호를 생성하는 객체 
--중복된 값은 나오지 않는다 (조건)

/*
CREATE SEQUENCE sequence_name
[INCREMENT BY n]
[START WITH n]
[{MAXVALUE n | NOMAXVALUE}]
[{MINVALUE n | NOMINVALUE}]
[{CYCLE | NOCYCLE}]
[{CACHE | NOCACHE}];

sequence_name SEQUENCE 의 이름입니다.
INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE.
*/

SELECT * FROM tab WHERE tname ='BOARD';

DROP TABLE board;

CREATE TABLE board(
	boardid NUMBER CONSTRAINT pk_board_id PRIMARY KEY,
	title nvarchar2(100)
);

SELECT * FROM board;
--boardid 컬럼(not null , unique , index 구성)
--개발자 : boardid >> where boardid=? >> 무조건 1건 return

--insert , update
--INSERT INTO board(boardid, title) values()
--넣는 데이터가 중복값이 아니고 null 아니다 ..... 

--조건 : 처음 글을 쓰면 1 이라는 값을 Insert .... 그 다음부터의 글은 2,3,4 
--순차적인 값들을 insert 하고 싶어요
--?? insert 문을 구성 ...
--subquery >> values 안에 사용가능 ...
INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'안녕');

INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'방가방가');
SELECT * FROM board;
COMMIT;
--문제점 : (DML)
DELETE FROM board WHERE boardid=1;
COMMIT;

INSERT INTO board(boardid, title)
VALUES ((SELECT count(boardid) + 1 FROM board),'새글');
--unique constraint (BIT.PK_BOARD_ID) violated
--PK 위반 ...
--------------------------------------------------
--다른 방법
DELETE FROM board;
COMMIT;
SELECT max(boardid) FROM board; --null

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'처음');

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'두번');

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'세번');

SELECT * FROM board ORDER BY boardid asc;

DELETE FROM board WHERE boardid=1;
COMMIT;

INSERT INTO board(boardid, title)
VALUES ((SELECT nvl(max(boardid),0) +1 FROM board),'네번');

SELECT * FROM board;
COMMIT;
---------------------------------------------------------
--sequence 번호 추출 : 중복값이 없고 순차적인 값 >> 공유객체
CREATE SEQUENCE board_num;

SELECT * FROM SYS.USER_SEQUENCES;

/*
 NEXTVAL 과 CURRVAL 의사열 
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다. 
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다. 
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다. 
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다 (주의 사항)
*/
--실제 번호 추출
SELECT board_num.nextval FROM dual;

--몇번까지 추출 ... (마지막에 채번한 값을 확인)
SELECT board_num.currval FROM dual;

---------------------------------------------
CREATE SEQUENCE kboard_num;

CREATE TABLE kboard(
	num NUMBER CONSTRAINT pk_kboard_num PRIMARY KEY,
	title varchar2(100)
);

SELECT kboard_num.currval FROM dual;

INSERT INTO kboard(num, title)
values(kboard_num.nextval,'처음 글3');

SELECT * FROM kboard;

SELECT kboard_num.currval FROM dual;
-------------------------------------------------
--1. sequence 객체 (테이블간 공유자원) >> 여러개의 테이블이 하나의 채번기 사용
--A 테이블 >> 1 , 2 , 8
--B 테이블 >> 3 , 4 , 5
--C 테이블 >> 6 , 7

--사이트 (게시판) 10개
--상품게시판 , 관리자 게시판 , 회원게시판 
--1. 하나의 sequence 공유
--2. 게시판 글번호 ... sequence 3개 각각 사용

--ms-sql : create table board(boardnum int identity(1,1)...
--insert into board(title) values('방가') ...
--ms-sql 2012 버전 ... sequence 

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

--게시판 데이터 insert ...
--게시판 글보기 (최신글 순으로 ...글번호 큰것)
--select * from board order by boardnum desc
----------------------------------------------------
--개발자 필수 2
--rownum 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적인 존재

--ROWNUM  : 실제 테이블에 컬럼으로 존재하지 않지만 내부적으로 행번호 부여할수 있는 의사컬럼
--ROWID   : 주소값 (행이 실제로 저장되는 내부 주소값) -> 인덱스 생성 사용
 
SELECT * FROM emp;

SELECT rownum AS 순번 , empno, ename FROM emp;
--rownum select 결과에 순번 ....

--Top-n 쿼리
--테이블에서 조건에 맞는 상위 (top) 레코드 n 개 추출

--MS-SQL
--select top 10, * from emp order by sal desc

--ORACLE
--rownum (의사컬럼 ) 기준을 정의

--rownum 사용
--1. 정렬의 기준을 정의 (선행)
--2. 정렬 된 상황에서 앞에 순번 조건을 제시 데이터 추출

--1단계
	SELECT *
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e;
--2단계
    SELECT rownum AS "num" , e.*
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e;

--3단계 (급여를 많이 받는 사원 5명)
    SELECT rownum AS "num" ,  e.*
	FROM (SELECT * 
          FROM emp 
          ORDER BY sal DESC) e
    WHERE ROWNUM <= 5;
--------------------------------------------------
--게시판 만들기 페이징 처리 필수 쿼리문(rownum 가상컬럼)
SELECT n.*
FROM (
   		SELECT rownum AS "num" , e.*
   		FROM (SELECT * 
         	  FROM emp 
         	  ORDER BY sal DESC) e
      ) n
WHERE "num" >= 5;
-------------------------------------------------
--게시판 (페이징 처리)
--100건 데이터
--10건씩 나누어서 보여주기

--총 100건
--pagesize = 10 (한 화면에 보여줄(페이지) 데이터 건수 row 수)
--page count = 10개
--[1][2][3][4][5][6][7][8][9][10]
--[1] 클릭하면 >> 1~10번
--[2] 클릭하면 >> 11~20 ..
--[10] 클릭하면 >> 91~100
-----------------------------------------------
--HR 계정으로 이동
SELECT num , EMPLOYEE_ID , LAST_NAME , EMAIL 
FROM  (
		SELECT rownum AS num , e.* 
		FROM (
				SELECT * 
				FROM EMPLOYEES 
				ORDER BY EMPLOYEE_ID ASC--기준(정렬)
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
				ORDER BY EMPLOYEE_ID ASC--기준(정렬)
		      ) e
		WHERE rownum <=10     
	  )	s
WHERE num > 0;
------------------------------------------------------------
--또는 between A and B 
--where rownum between 10 and 20 사용가능
-------------------------------------------------------------
--SQL 기본 과정 END---------------------------------------------
--SQL 고급과정 (3차 프로젝트)
--PL-SQL (변수 ,제어문 , 커서 , 함수 , 프로시져 , 트리거 , 스케줄)
--1차 종합 TEST 50문제 (홀수 또는 짝수 ) : 4시까지 ........
--
--1> 부서테이블의 모든 데이터를 출력하라.
SELECT *
FROM EMP
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
SELECT JOB, EMPNO, ENAME, HIREDATE
FROM EMP
 
--3> EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게 출력하라.
SELECT DISTINCT JOB
FROM EMP
 
--4> 급여가 2850 이상인 사원의 이름 및 급여를 표시하는 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL >= 2850
 
--5> 사원번호가 7566인 사원의 이름 및 부서번호를 표시하는 출력하라.
SELECT ENAME, DEPTNO
FROM EMP
WHERE EMPNO=7566
 
--6> 급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름 및 급여를 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE SAL NOT BETWEEN 1500 AND 2850
 
--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
SELECT ENAME, JOB, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1981-02-20' AND '1981-05-01'
ORDER BY HIREDATE
 
--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
 
SELECT ENAME, DEPTNO
FROM EMP
WHERE DEPTNO IN(10,30)
ORDER BY ENAME
 
--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)
SELECT ENAME AS 'Employee', SAL AS ' Monthly Salary'
FROM EMP
WHERE DEPTNO IN(10,30) AND SAL>1500
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.
SELECT ENAME, JOB
FROM EMP
WHERE MGR IS NULL
 
 
--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 급여를 기준으로 내림차순으로 정렬하여 출력하라.
SELECT ENAME, SAL, COMM
FROM EMP
WHERE COMM IS NOT NULL
ORDER BY SAL DESC
 
--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '__A%'
 
--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 출력하라.
SELECT ENAME
FROM EMP
WHERE ENAME LIKE '%L%L%' AND DEPTNO=30
 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
 
SELECT ENAME, JOB, SAL
FROM EMP
WHERE JOB IN('CLERK','ANALYST') AND SAL not IN(1000,3000,5000)
 
--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 컬럼명을 New Salary로 지정하여 출력하라.
SELECT EMPNO, ENAME, SAL,
           ROUND(SAL+(SAL*0.15),0) AS "New Salary"
FROM EMP
 
--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라).
SELECT EMPNO, ENAME, SAL, ROUND(SAL+(SAL*0.15) ) AS "New Salary",
  (ROUND(SAL+(SAL*0.15)))-SAL AS "Increase"
FROM EMP
 
--18> 모든 사원의 이름(첫 글자는 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
SELECT UPPER(SUBSTR(ENAME,1,1)) || LOWER(SUBSTR(ENAME,2,12)) AS "NAME",
LENGTH(ENAME) AS "LENENAME"
FROM EMP
 
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 사원의 커미션은 'no commission'으로 출력하라.
SELECT ENAME, NVL(TO_CHAR(COMM),'no commission')
FROM EMP
 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.(DECODE)
 
SELECT empno, deptno , DECODE(deptno,10,'ACCOUNTING' ,
                                                    20,'RESEARCH',
                                                    30,'SALES',
                                                    40,'OPERATIONS') AS "dname"
FROM EMP;
 
 
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
 
--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.DEPTNO=30
 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)
SELECT DISTINCT E.JOB, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.DEPTNO=30
 
--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
SELECT E.ENAME, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND COMM IS NOT NULL
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
SELECT E.ENAME, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND E.ENAME LIKE '%A%'
 
--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 출력하라.
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO AND D.LOC='Dallas'
 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되, 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
SELECT E.ENAME AS "EMPPLOYEE", E.EMPNO AS "EMP#",
M.ENAME AS "MANAGER", M.EMPNO AS "MGR#"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO
 
--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
SELECT E.ENAME, E.JOB, D.DNAME, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO=D.DEPTNO
AND E.SAL BETWEEN S.LOSAL AND S.HISAL
 
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE>(SELECT HIREDATE
   FROM EMP
   WHERE ENAME='SMITH')
 
--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 출력하라.
SELECT E.ENAME AS "Employee", E.HIREDATE AS "EmpHIredate",
M.ENAME AS "Manager",
 M.HIREDATE AS "MgrHiredate"
FROM EMP E, EMP M
WHERE E.MGR=M.EMPNO AND E.HIREDATE<M.HIREDATE
 
--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 각 컬럼명을 Maximum, Minimum, Sum, Average로 지정하여 출력하라.
SELECT MAX(SAL) AS "Maximum", MIN(SAL) AS "Minimum",
 SUM(SAL) AS "Sum", AVG(SAL) AS "Average"
FROM EMP
 
--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
SELECT JOB, MAX(SAL), MIN(SAL), SUM(SAL), AVG(SAL)
FROM EMP
GROUP BY JOB
 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
SELECT JOB, COUNT(JOB)
FROM EMP
GROUP BY JOB
 
--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라. 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
SELECT COUNT(DISTINCT(MGR)) AS "Number of Manager"
FROM EMP
 
--34> 최고 급여와 최저 급여의 차액을 출력하라.
SELECT MAX(SAL)-MIN(SAL) FROM EMP
 
--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라. 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.
SELECT MGR, MIN(SAL)
FROM EMP
WHERE MGR IS NOT NULL
GROUP BY MGR
HAVING MIN(SAL)>=1000
ORDER BY MIN(SAL)
 
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라. 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
SELECT E.DEPTNO AS "부서명", D.DNAME AS "부서이름", D.LOC AS "위치",
 COUNT(E.EMPNO) AS "사원의 수", AVG(E.SAL) AS "평균급여"
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
GROUP BY E.DEPTNO, D.DNAME, D.LOC
 
--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라. 단, Smith는 제외하고 출력하시오
SELECT ENAME, TO_CHAR(HIREDATE,'YYYY-MM-DD')
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
   FROM EMP
   WHERE ENAME='SMITH')
AND ENAME!='SMITH'
 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT AVG(SAL)
  FROM EMP)
ORDER BY SAL DESC
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호 및 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
   FROM EMP
   WHERE ENAME LIKE '%T%')
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.
SELECT E.ENAME, E.DEPTNO, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND D.LOC='DALLAS'
 
--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
  FROM EMP
  WHERE ENAME='KING')
 
--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
 AND D.DNAME='SALES'
 
SELECT E.DEPTNO, E.ENAME, E.JOB
FROM EMP E inner join DEPT D on E.DEPTNO=D.DEPTNO
where  D.DNAME='SALES'
 
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
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
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 출력하라.
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL IN(SELECT SAL
  FROM EMP
  WHERE COMM IS NOT NULL)
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름, 및 급여를 출력하시오
SELECT E.ENAME, D.DNAME, E.SAL
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO
AND E.JOB IN(SELECT E.JOB
  FROM EMP E, DEPT D
  WHERE E.DEPTNO=D.DEPTNO
  AND D.LOC='DALLAS')
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및 급여를 출력하시오
SELECT ENAME, HIREDATE, SAL
FROM EMP
WHERE SAL=(SELECT SAL
  FROM EMP
  WHERE ENAME='SCOTT')
AND NVL(COMM,0)=(SELECT NVL(COMM,0)
  FROM EMP
  WHERE ENAME='SCOTT')
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호, 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>ALL(SELECT SAL
  FROM EMP
  WHERE JOB='CLERK') --결국 최대값과 비교 any 최소값과 비교
ORDER BY SAL DESC
 
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과 월급, 부서번호를 출력하라.
SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE JOB IN(SELECT JOB
  FROM EMP
  WHERE ENAME LIKE '%A%')
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 사원이름과 부서명을 출력하라.
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
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름, 직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오. (단, 최고월급부터 출력되게 하시오)
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
