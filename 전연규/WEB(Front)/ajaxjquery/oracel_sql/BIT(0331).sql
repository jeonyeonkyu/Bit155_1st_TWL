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
--1.사원 테이블에서 모든 데이터를 출력하세요
select * from emp; --쿼리 문자는 대소문자 구별을 하지 않는다.

--2.특정 컬럼의 데이터를 출력하세요.
select empno, ename
from emp;

--3.컬럼의 가명칭(별칭,alias) 부여하기
select empno 가나
from emp;

--4.띄어쓰기
select empno "가  나"
from emp;

--정식(표준) (ANSI 문법)
select empno as "사  번", ename as "이  름"
from emp;

--Oracle 데이터 관리(문자열 : 대소문자 구분)
--문자열 표기(문자열 표기는 다 싱글쿼테이션(')으로 함)
--소문자 'a' != 'A' : 서로 다름
select empno, ename
from emp
where ename = 'king';
--대문자 KING으로 되어있어서 조회가 안됨

--Oracle SQL 언어 : 연산자 (결합 연산자(||), 산술 연산자(+)) 구분
--java + (숫자 + 숫자 >> 연산)
--java + (문자열 + 문자열 >> 결합) 
--TIP) ms-sql(+ 연산,결합)

select '사원의 이름은 ' || ename || ' 입니다' as "사원정보"
from emp;

--empno, ename >> 컬럼 >> 타입
--타입(자료형) : 숫자, 문자(문자열), 날짜...
DESC emp;
/*
테이블의 정보를 볼 수 있음
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10)
*/

select empno || ename --숫자 || 문자열 (내부적으로 숫자 -> 문자열)
from emp;

select empno + ename
from emp;

--사장님..우리 회사에 직종이 몇개나 있나
select distinct job from emp;
--distinct : 중복 데이터 제거
--distinct 원리 : grouping 논리로 데이터를 처리(같은 값을 묶은 다음 하나만 출력)

select DISTINCT job, deptno from emp;
select DISTINCT deptno, job from emp;
select job, deptno from emp;
--처음에 job으로 그룹핑 -> 그안에서 deptno를 그룹핑

--Oracle 언어
--Java 언어
--Oracle 연산자가 Java 거의 동일(+, *, - ...)
-- % 자바에선 나머지 구하는 기능 , % 오라클에서 연산자(검색패턴)
--오라클 (+, -, *, /) 나머지 함수 >> Mod()

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요.
--desc emp;
select empno, sal, sal + 100 as "인상급여"
from emp;

--dual 임시 테이블
select 100 + 100 from  dual;
select 100 || 100 from dual;
select '100'+100 from dual; -- +는 무조껀 산술이므로 문자열을 숫자형태로 바꿔서 연산
select '100A'+100 from dual;

--비교연산자
-- > < <=
-- java에서 같다(==) 할당(=)
-- Oracle 같다(=) : 오라클은 할당이 없음
-- Oracel 같지않다(!=)

--논리연산자
--AND, OR, NOT

--조건절(원하는 row 가지고 오겠다)
select *
from emp
where sal >= 3000;

select empno, ename, sal
from emp
where sal > 3000;

--이상, 이하 (=)
--초과, 미만 

--사번이 7788번인 사원의 사번,이름,직종,입사일을 출력하세요.
select * from emp;
select empno, ename, job, hiredate
from emp
where empno=7788;

--사원의 이름이 'KING'인 사원의 사번, 이름, 급여 정보를 출력하세요.
select * from emp;
select empno, ename, sal
from emp
where ename='KING';

--논리(AND, OR)
--급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal >= 2000 and job='MANAGER';

--급여가 2000달러 이상이거나 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal >= 2000 or job='MANAGER';

--오라클 날짜(DB서버의 날짜)
--오라클 날짜(sysdate)

--현재 접속한 사용자가 날짜 형식을 YYYY-MM-DD HH24:MI:SS게 보도록 수정하겠다.
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual;

select * from SYS.nls_session_parameters; --재미로 하는거, 시스템 설정을 가지고 있는 환경 테이블

select hiredate from emp;

--입사일 1980-12-17인 사원의 모든 정보를 출력하세요.
select *
from emp
where hiredate = '1980/12/17'; --'/'나'-'나'.'도 됨
-- 80-12-17은 안됨

--사원의 급여가 2000이상이면서 4000이하인 모든 사원의 정보를 출력
select *
from emp
where sal >= 2000 and sal <= 4000;

select *
from emp
where sal between 2000 and 4000;
--연산자 : between A and B (=포함)
--미만,초과에서는 사용 금지(=포함하지 않아서..)

--부서번호가 10 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select empno, ename, sal, deptno
from emp
--where deptno = 10 or deptno = 20 or deptno = 30; --무식
where deptno in(10,20,30); --★
--in 연산자를 풀어쓴 것이 --where deptno = 10 or deptno = 20 or deptno = 30; 이 방법

--부서번호가 10또는 20이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요.
select empno, ename, sal, deptno
from emp
--where deptno = 10 or deptno = 20 or deptno = 30; --무식
where not deptno in(10,20); --★

--IN 의 부정은 NOT IN

--POINT : Oracle 값 표현(데이터 없다) >> null
--null은 필요악 같은 존재

create table member (
    userID varchar2(20) not null, --필수입력
    name varchar2(20) not null, --필수입력
    hobby varchar2(50) -- default로 null이 들어감(null값을 허용 / 데이터 안받아도 됨)  
);

--insert into member(userID, hobby) values('wlsgmdchemd', '야구'); //안들어감
insert into member(userID, name) values('wlsgmdchemd', '우철'); 
--hobby 컬럼의 데이터는 null로 자동으로 넣어짐
insert into member(userID, name,hobby) values('wlsgmdchemd', '우철','게임'); 

insert into member values('wlsgmdchemd', '게임', 'ss'); --컬럼명 생략시 values에 생략 불가

--실반영
commit;

--수당을 받지 않는 모든 사원의 정보를 출력하세요.
select * from emp;
select *
from emp
where comm is null;

--수당을 받는 모든 사원의 정보를 출력하세요
select * from emp where comm is not null;

--사원 테이블에서 사번, 이름, 급여, 수당, 총급여를 출력하시오.
--총급여(급여 + 수당)
select * from emp;
select empno, ename, sal, nvl(comm,0), nvl(sal+comm,0) as 수당
from emp;

--POINT >> null
--1. null 과의 모든 연산은 그 결과가 >> null
--2. 위 문제의 해결 방식 : nvl(), nvl2() >> null값을 replace 치환..
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

select null + 100 from dual;
select '홍길동' || null from dual;
select 100 + nvl(NULL, 0) FROM dual;
select comm, nvl(comm, 0) from emp;

--사원의 급여가 1000이상이고 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력하시오.
select * from emp;
select empno, ename, job, sal, nvl(comm, 0)
from emp
where sal >= 1000 and comm is null;
--------------------------------------------------------------------------------------------

--DQL(Data query Language) : SELECT(60%)
--DDL(Data Definition Language) : CREATE, ALTER, DROP(객체(테이블) 생성, 수정, 삭제) (30%)
--DML(Daa Manipulation Language) : INSERT, UPDATE, DELETE(데이터 조작) (10%)

--java : class Board { private boardNo int}
--Oracle : create table Board (boardNo number not null)

create table board(
    boardID number NOT NULL, --숫자, 필수 입력
    boardTitle varchar2(20) NOT NULL, --한글10자, 영문자,특수문자,공백은 20자, 필수 입력
    boardContent varchar2(2000)NOT NULL, --필수입력
    hp varchar2(20) --default null 허용(필수 입력이 아니다)
);

select * from board;
desc board;

--DML(데이터 조작어) 실 반영 여뷰를 결정
--insert
--update
--delete
--반드시 그 결과를 반영할지, 취소할지를 의사결정 해야한다
--commit(실제반영)
--rollback(실제 반영을 취소)

insert into board(boardID, boardTitle, boardContent)
values(100, '오라클', '오 할만한데');

insert into board(boardID, boardTitle, boardContent)
values(200, '자바', '복습하자');

insert into board(boardID, boardTitle, boardContent)
values(300, '그립다', '그립다');

select * from board;
commit;
rollback;
