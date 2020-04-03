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
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bituser

-- USER SQL
CREATE USER bituser IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bituser QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO bituser WITH ADMIN OPTION;
GRANT "RESOURCE" TO bituser WITH ADMIN OPTION;
ALTER USER bituser DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES




--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

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
/*
SELECT [DISTINCT] {*, column [alias], . . .} []:대괄호 블럭.. 생략가능하다..{}:중괄호 반드시 써라.","컴마. 둘중하나 써라
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]]; ASC DESC생략해도 되는데 쓸라면 둘중하나 써라
*/
select * from emp;
select * from dept;
SELECT*from salgrade;

--1. 사원 테이블에서 모든 데이터를 출력하세요.
select * from emp;--쿼리문자는 대소문자 구별안함.

--2. 특정 컬럼의 데이터 출력하기.
select empno, ename, sal from emp;--emp테이블에서 사원 번호 이름 급여 본다.

--3. 컬럼에 별칭(alias)부여하기. 나중엔 컬럼이름이 길어짐.
--실제이름영어 출력은 한글로 하고싶다
select empno 사번, ename 이름 from emp;
select empno "사  번", ename "이                   름" from emp;

--4. 정식(표준) (ansi 문법)
select empno as "사  번", ename as "이  름" from emp;--as:이거의alias 네임 표시할거야 라는 문법 약속

--5. Oracle 데이터 관리(문자열 : 대소문자 구분)
--오라클의 문자열표기 문자(char) 없다.('문자열')  소문자'a'와 대문자'A'는 다른 문자열이다.
select empno, ename from emp
where ename = 'KING';-- where ename = 'king'은 출력 x 대소문자 구별 함

--6. 오라클 이라는 데이터베이스의 sql언어 : 연산자가 존재함.
--1)결합 연산자||, 산술연산자+, 

select '사원 이름은'||ename||'입니다.' as "사원 정보"from emp;

--empno,ename : 컬럼이라고 한다.. 컬럼은 타입을 갖고있다. 변수와 유사
--타입(자료형) : 숫자, 문자열, 날짜정보 등등...

desc emp;--desc : 테이블의 기본정보를 볼수있다.
--기본정보 = 컬럼명, null값 허용 여부, 타입정보


select empno || ename from emp;--empno컬럼이 갖고있는 데이터 ename컬럼이 갖고있는 데이터를 결합하겠다.
--앞은 숫자 뒤는 문자열..||은 내부적으로 문자열로 바꿈 내부적으로 형변환이 일어남 (숫자타입이->문자열)변환 후 결합함.

--select empno+ename from emp;--+는 오라클에서 산술연산자  empno는 숫자타입 ename컬럼은 문자타입.더할수없다.에러

--우리회사에 직종이 몇개나 있니?  직종컬럼 = JOB
SELECT JOB FROM emp;--모든 직종 목록..중복이 존재함.

select distinct job  from emp;--distinct 중복데이터 제거 키워드.

SELECT DISTINCT job, deptno FROM emp order by job;--order by 낮은 값이 위로올라감

--distinct 그룹짓기...job으로 그루핑한후 deptno로 또 한번 그루핑.그룹을 ~개 만들고 그 그룹안에서 또 그룹만듬.
--그루핑으로 중복을 제거함.

select DISTINCT deptno, job 
from emp 
order by deptno;

--오라클도 언어..연산자를 갖고있음.. JAVA 와 유사함.(+, -, *)
--%가 JAVA에서는 나머지를 구하는 연산자..오라클에서는 검색을하는 패턴에 쓰이는 연산자이다.
--오라클(+, -, *, /)다 동일한데 나머지를 구하는것만 함수로 구현되어있다. >> 나머지 구하는 함수 : Mod()

--사원테이블에서 사원의 급여를 100달러인상한 결과를 출력하세요
select empno as "사원 번호", sal as "급여", sal+100 as "인상 급여" from emp;

--오라클에서 dual이라는 임시 테이블을 제공.. 테이블에없는 데이터를 테스트 하고싶을때.
--에러))select 100+100;--select는 프린트가아니다. 테이블이 없으면 출력 불가함.

select 100+100 from dual;--dual이라는 임시테이블에 담아서 출려해야함.
select 100||100 from dual;--내부적으로 형변환
select '100'+100 from dual;-- +연산자는 문조건 산술.. 형변환
select '100A'+100 from dual;--문자열과 숫자는 연산불가 ...에러)


--비교 연산자. >, <, <=...자바에서 같다(==), 할당 (=) 오라클에선 할당이 없다.. 같다라는 표현이 (=)같지않다(!=)  

--논리 연산자. AND, OR, NOT

--조건절(원하는 row(행,줄)만 가져오겠다)
select *
from emp
where sal>=3000;--사원 테이블에서 급여가 3000보다 큰 모든 사원 출력해라.

select empno, ename, sal
from emp
where sal>3000;

--사번이 7788번인 사원의 사번 이름 직종 입사일을 출력
select  empno, ename, hiredate, job
from emp
where empno = 7788;

--사원의 이름이 KING인 사원의 사번 이름 급여출럭
select empno as "사번", sal as "급여", ename as "이름"
from emp
where ename = 'KING';

--논리 연산자(AND, OR) and모든조건이 참일대 참 or둘중 하나 참일때 참
--급여가 2000이상이면서 직종이 매니저인 사원의 모든정보 출력
select *
from emp
where sal>=2000 And job='MANAGER';--대문자 '' 주의

--급여가 2000이상이거나 직종이 MANAGER인 사원 정보 출력
select *
from emp
where sal>=2000 or job = 'MANAGE';

--오라클에서 날짜 다루기(오라클이 설치된 pc DB서버의 날짜)
--sysdate

select sysdate from dual;--보는 사람이 설정할수있음.

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
--나는 현재 접속한 사용자(세션)의 날짜형식을'YYYY-MM-DD HH24:MI:SS' 이렇게 보도록 수정하겠다.
alter session set nls_date_format='RR-MM-DD HH24:MI:SS';
--현재 데이터 포멧 출력
select * from SYS.nls_session_parameters;--오라클을 만든 사람들이 어떤정보를 관리하는 시스템 테이블
--시스템 설정을 갖고있는 환경 테이블

select sysdate from dual;--날짜 출력.

select hiredate from emp;--YYYY형태로 출력됨.

--1908 12 17일에 입사한 회원정보
select *
from emp
where hiredate = '1980-12-17'; --날짜도 ' '. '80-12-17'로는 조회 불가능 
--YYYY MM DD형태로 바꿨으면 조회할때도 형식을 맞춰서 조회해야함

--사원의 급여가 2000이상이고 4000이하인 사원 출력
select * 
from emp
where sal>=2000 and sal<=4000;

--between A and B연산자. (=을 포함한다... 미만,초과 에서는 사용 금지.)
select *
from emp
where sal between 2000 and 4000;
--sal칼럼이 1번들어있음...

--사원의 정보가 2000초과 4000미만인 사원 출력
--between못쓴다.

--부서번호가 10번 또는 20번 또는 30번인 사원출력.
select *
from emp
where deptno=10 or deptno=20 or deptno=30;

--IN 연산자. or을 연결한것... 풀어서 쓸줄알아야한다.
select *
from emp
where deptno in(10,20,30);--where deptno=10 or deptno=20 or deptno=30;

--부서번호가 10또는 20번이 아닌 사원
select *
from emp
where deptno != 10 and deptno!=20;

--IN의 부정 연산자 NOT IN...and로 풀어짐
--부서번호가 10도아니고 20번도 아닌것.
select *
from emp
where deptno not in(10,20);--not in풀면..where deptno != 10 and deptno!=20;


--POINT : 오라클에서 값이 없다(데이터가 없다)는 표현.>>null..
--null 필요악.
--테이블 만들기=클래스 만들기와 유사.
create table member(
    userid varchar2(20) not null,--맴버필드 데이터 타입... 오라클에선 컬럼명
    --회원데이터 관리할건데 null값 못온다=필수입력.
    name varchar2(20) NOT NUll,--name이라는 컬럼...필수입력.
    hobby varchar2(50)--취미 컬럼 default로 null값이 저장. null값을 허락한다.입력안해도되
);

select * from member;--맴버 테이블에 유저아이디와 하비컬럼에 홍, 농구를 넣겠다
--insert into member(userid, hobby) values('hong', '농구');
--데이터 입력 불가능..id와 name은 필수입력.

--insert into member(userid, name) values('hong', 'hiro');
--hobby컬럼의 데이터는 null
insert into member(userid, name,hobby) values('hong', 'hiro','game');

--컴퓨터 끄면데이터 다 사라짐.
--오라클에서는 커밋(commit;)이라는 명령어 해줘야 실반영(저장)됨 삭제하기전까지 영원히 남음.
commit;

--수당comm을 받지 않는 모든 사원의 정보 출력.
select *
from emp
where comm=null;--틀린 문법..

--null인것 출력하기  is null
select *
from emp
where comm is null;

--수당을 받는 모든 사원의 정보 출력
select *
from emp
where comm is not null;

--사원 테이블에서 사번 이름 급여 수당 총급여
select empno, ename, sal, comm, sal+comm
from emp;
--sal:800  comm:null일때 둘을 더한게null이 된다...
--null과의 모든 연산은...그 결과가 null이 된다.
--null+100, null+홍길동...=null
--sol) nvl(),nvl2 함수 null값을 다른값으로 치환 ..바꿔줌.

select empno, ename, sal, comm, sal+nvl(comm,0) as "총급여"
from emp;


select null + 100
from dual;

select 100+null
from dual;

--null값을 0으로 치환 해서 연산.
select 100+nvl(null, 0)
from dual;

select comm, nvl(comm, 1111)--첫번째 는 null값인 커미션 두번째는 null이 나올때 바뀔값
from emp;

--결합이다 연산이아니다
select '홍길동' || null
from dual;

--사원 급여 1000이상 수당 받지않는 사원의 사번 이름 직종 급여 수당 출력
select empno, ename , job, comm, sal
from emp
where sal>=1000 and comm is null;

--DQL(data query language) :   select
--DDL : creat, alter, drop객체( = 테이블) 생성 수정 삭제할때
--DML : insert, update, delete 데이터 조작

--java : class Board { private boardno int}
--oracle :  creat table Board(boardnno number not null)

--DDL영역 테이블 생성..
create table board(
boardid number not null,--number자바에서 정수와 실수 포함..숫자입력 필수
title varchar2(20) not null,--한글 10자 영문 특수문자 공백 20자. 필수입력
content varchar2(2000) not null, 
hp varchar2(20)--not null없음 default로 null허용...필수입력 아님.
--insert update delete만 커밋함
);

select *
from board;

--DML( 데이터 조작어) 실반영 여부를 결정해야한다.
--insert  update수정 delete삭제 실제 DB에 반영되지않는다.
--이런 작업 이후엔 반드시 그 결과에 대해서 그 결과를 반영할지 취소할지 의사결정 해야한다.
--commit : 실제 반영한다.
--rollback : 실제 반영 취소.

insert into board(boardid, title, content)
values(100, '오라클', '할만');

select *
from board;--커밋안하면 외부 cmd에선 확인불가능.

commit;

insert into board(boardid, title, content)
values(200, '자바','복습');

select *
from board;

rollback;--실행 취소...commit 전까지 모두 취소.

insert into board(boardid, title, content)
values(200, '자바', '그립다');

select *
from board;

commit;

insert into board(boardid, title, content,hp)
values(300, '오늘', '수업중', '010-000-0000');

select *
from board;
commit;

------------------------------------------------------4월 1일--------------------------------------------------------------
--null대체는 문자열데이터로도 가능하다.
select boardid, nvl(hp, 'EMPTY')as "hp"
from board;

--문자열검색
--주소 검색 할때 "역"검색..역삼동,역동 ~~역 들어간거 다출력함..(like패턴 검색)
--like : 문자열 패턴검색 연산자
--like연산자를 도와주는 연산자 = 와일드카드 문자(% : 모든것,  _ : 한문자)를 결합해서 원하는 문자를 찾을수있다.

select ename
from emp
where ename like'%A%';--기본적으로 like는 문자열을 찾음 뒤에 '' 붙는다.
--ename컬럼 데이터 중에서 A앞에 모든것이와도 가능, A뒤에 모든(어떤)것이와도 가능.

select ename
from emp
where ename like '%a%';--문자열에서 대소문자 구분!


--이름의 첫글자가 A인사람찾기
select ename 
from emp
where ename like'A%';

--이름의 마지막 글자가 S인사람
select ename
from emp
where ename like'%S';

--수한무가 이름에 들어있는 사원
select ename
from emp
where ename like'%수한무%';

--이름에LL이 2개 있으면 되는 사원..L이 붙어도 떨어져도 가능
select ename
from emp
where ename like'%L%L%';

--첫글자는 어떤것이와도 상관없고 2번째 글자는 반드시 A가와라.
--2번째 글자가 A로 시작하는 모든것.
select ename
from emp
where ename like'_A%';

--정규표현식
select *
from emp
where regexp_like(ename,'[A-C]');
--과제 정규표현식 예제 5개 만들기 
---------------------------------------------------------------------------------

--데이터 정렬하기.
--order by + 컬럼명 : 문자열, 숫자, 날짜를 정렬할수있다
--오름차순 : asc = 낮은순 defaulat
--내림차순 : desc = 높은순

select *
from emp
order by sal asc;

--급여가 높은순으로 출력.
select *
from emp
order by sal desc;

--입사일이 가장 늦은 순으로 출력
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*절 간의 순서 유추=select한 결과를 정렬한다. DB에서 정렬을 힘들어해서 최대로 줄이고 정렬.
select 절       3
from 절        1
where 절      2
order by 절   4
실행 순서에 맞춰서 디버깅
*/
--emp에서 직종이 매니저인사람의 사번 이름 월급 직종 입사일을 입사일이 빠른순으로 출력하라.
select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;


--order by 심화.
--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc.
--그루핑의 원리 ...게시판 코드.
select job, deptno
from emp
order by job asc, deptno desc;
--job을 오름차순 

----------------------------------------------------------------------------
--합집합 연산자 union : A테이블이 B테이블로 이사
--테이블과 테이블간의 데이터를 합침.
--기본적으로 중복값은 배제시킨다.
--union all : 중복값을 허용해준다, 모든데이터를 표현한다.

create table uta(name varchar2(20));

insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;


select *
from uta;

create table ut(name varchar2(20));

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select *
from ut;

--ut의 방에 uta가족이 놀러감.//기본적으로 union은 데이터 중복 제거
select *
from ut
union 
select*
from uta;

--union all 모든데이터 보여줌
select *
from ut
union all
select*
from uta;

--union의 규칙.
--1. '대응되는' 컬럼의 타입이 동일해야함.(먼저 쓴테이블이 나중에 쓴테이블 초대) 
select empno, ename from emp
union
select dname, deptno from dept;
--dept가 놀러감  dname이 empno방에 deptno가ename방에 놀러감
--동일 한 타입의 방에 만 놀러갈수있다.

--타입 맞춰줌
select empno, ename from emp
union
select  deptno, dname from dept;


--2. '대응되는'컬럼의 개수가 동일해야한다.
select empno, ename, job, sal from emp
union
select deptno, dname, loc  from dept;
--emp방 4개 dept방3개 개수가 동일해야함.

--대응되는 컬럼개수가 다를때 sol)null
--null이 빈방을 채워줌.
select empno, ename, job, sal from emp
union
select deptno, dname, loc, null  from dept;

------------------여기까지 초보 걸음마단계 : 단일테이블-------------------
/*
단일 행 함수의 종류 
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다. 
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다. 
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
    제외하고 모두 날짜 데이터형의 값을 RETURN 한다. 
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. 
5) 일반적인 함수 : NVL, DECODE 
*/
--한글문제 추후변경가능.
--select *
--from SYS.nls_database_parameters;

--1. 문자형 함수. select절 where절에도 쓸수있음.
--initcap = 단어의 첫글자를 대문자로 만들어줌.
select initcap('the super man') 
from dual;

--lower = 대문자를 소문자로
select lower('AAA')
from dual;
--upper = 소문자를 대문자로
select upper('aaa')
from dual;

select ename, lower(ename) as"ename" 
from emp;


--조회 할대 대소문자 때문에 불편했다...
select *
from emp 
where lower(ename) = 'king';

--문자열 개수 length
select length('abcd')
from dual;

select length('홍길동')
from dual;

select length(' 홍 a 길 동')
from dual;--공백도 인지한다.

--결합연산자|| 와 같은 함수 concat()
--2개의 문자를 합쳐주는 함수.
select 'a' || 'b' || 'c' as "data" 
from dual;
--concat()의 parameter의 개수가 제한적이다. 2개...
select concat('a', 'b') 
from dual;

select 'a'||'b'||'c' as "data"
from dual;

select concat('a', 'b') 
from dual;

select concat(ename, job) as "concat" 
from emp;


--부분 문자열 추출 함수.
--자바 substring
--오라클 substr
--자기 자신부터~n번째
select substr('ABCDE',2,3) 
from dual;--BDC 2번째부터 3개

select substr('ABCDE', 1, 1)
from dual;--1번째부터 1개

select substr('ABCDE', 3)
from dual;--3번째 부터 끝까지

select substr('ABCDE', -2, 1)
from dual;--끝에서 2번째부터 1개

select substr('ABCDE', -2, 2)
from dual;--DE 끝에서 2번째부터 2개

/*
사원테이블에서ename 컬럼데이터의 대해서 첫글자는 소문자
나머지는 대문자로 출력, 단 하나의 컬럼으로 출력
*/

select lower(substr(ename, 1, 1)) from emp;

select upper(substr(ename,2)) from emp;

select lower(substr(ename, 1, 1)) ||'  '|| upper(substr(ename,2)) as"fullname"
from emp;


--lpad, rpad(채우기)
select lpad('ABC', 10, '*') from dual;
10칸중 ABC를 넣고 남은곳 왼쪽을 *로 채운다 

select rpad('ABC',10, '*') from dual;
10칸중ABC넣고 남은곳 오른쪽을 *로 채운다

--퀴즈) 사용자 비밀번호 hong1004
--화면에 ho******으로 출력하고싶다...앞에 2개만 보여주고 나머지는 *로 표현하고싶다.
select rpad(substr('hong1004',1,2), length('hong1004'),'*') from dual;

select rpad(substr('1004',1,2), length('1004'),'*') from dual;

--실제 테이블에서 사용해보기.
--emp 테이블에서 ename컬럼의 데이터를 출력하는데 첫글자만 출력 나머지는 *로 출력

select rpad(substr(ename,1,1), length(ename),'*') as "ename" 
from emp;

--응용문제
 create table member2(
 id number,
 jumin varchar2(14)
 );
 
 insert into member2(id, jumin) values(100,'123456-1234567');
 insert into member2(id, jumin) values(200,'234567-1234567');
 commit;

 select *
 from member2;
--출력하시오. 컬럼명은"jumin number"
--100 : 123456-*******
--200 : 234567-*******

select id ||' : '|| rpad(substr(jumin,1,7), length(jumin),'*') as "jumin number"
from member2;


--rtrim함수, ltrim함수
--오른쪽, 왼쪽 문자를 지워라
--첫번째 파라미터에서 두번재 파라미터 찾아서 지워라
select rtrim('MILLER', 'ER')
from dual;

select ltrim('MILLLLER', 'MIL')
from dual;

--trim은 공백을 지울수있다.
--오른쪽에있는 공백을 지워라..
select '>' || rtrim('MILLER      ', ' ') || '<' 
from dual;

--문자형함수 치환함수 replace
--오른쪽문자를 왼쪽 문자로 치환해라
select ename, replace(ename,'A', '와우^^')
from emp;

----------------------문자형함수 end--------------------------

--2. 숫자형 함수
--round : 반올림함수
--trunc : 절삭 함수
--mod() : 나머지 구하는 함수

--1. round : 반올림함수
--2번파라자리에 0이오면 1번파라에 정수만 남겨라..반올림하고

select round(12.345, 0) as "r" --반올림 x =12
from dual;

select round(12.645, 0) as "r" --반올림 o =13
from dual;

--두번재 파라.을기준으로해서 하나 남긴다...소수이하 n(두번째 파라)까지 남겨라
select round(12.345, 1) as"r" --12.3 반올림x
from dual;

select round(12.365, 1) as"r" --12.4 반올림o
from dual;

select round(12.345, -1) as "r" --10 
from dual;

select round(16.345, -1) as "r" --20 반올림o
from dual; 
---------------------------------------------------------------------
--2. trunc : 절삭 함수
--반올림 사라진다.
select trunc(12.345, 0) as "r" --반올림 x =12
from dual;

select trunc(12.645, 0) as "r" --반올림 x =12
from dual;

--두번재 파라.을기준으로해서 하나 남긴다...소수이하 n(두번째 파라)까지 남겨라
select trunc(12.345, 1) as"r" --12.3 반올림x
from dual;

select trunc(12.365, 1) as"r" --12.3 반올림x
from dual;

select trunc(12.345, -1) as "r" --10 
from dual;

select trunc(16.345, -1) as "r" --10 반올림x
from dual; 
--------------------------------------------------------------------------
--3. mod() : 나머지 구하는 함수

select 12/10 
from dual;--몫을 구하는 연산자

select mod(12, 10) 
from dual;--나머지는 연산자가없다 함수로구한다.

select mod(0,0)
from dual;--java에선 0/0안됌..
-------------------------------숫자 함수 END-----------------------------------


--날짜함수
-- DB서버 날짜 가져오는 함수 : sysdate
select sysdate 
from dual;
--날짜 출력 변환 : alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

--POINT 날짜 연산
--Date + Number >>Date로 나온다.
--Date - Number >>Date로 나온다.
--Date - Date >>Number(일수)로 나온다. ex) 근무 일수

select hiredate from emp;

select MONTHS_BETWEEN('2018-1-1','2010-1-1') from dual;--두 날짜의 개월차이 출력

--현재날짜 출력 sysdate

select MONTHS_BETWEEN(sysdate,'2010-1-15') from dual;--현재 날짜~ 개월차이 출력
select round( MONTHS_BETWEEN(sysdate,'2010-1-15'),1 )from dual;--round로 소수 1번째자리까지만 출력.

--POINT
--날짜 형식의 문자열을 날짜로 바꿔주는 함수 : to_date()   ...문자입력받고 데이터 넣을수있다
select '2020-4-1' + 100 from dual;--이때  '2020-4-1'를 문자로 인지한다.
select to_date('2020-4-1') + 100 from dual;
select sysdate + 1000 from dual;--지금시간부터 1000일 이후 날짜

--quiz
--1.사원 테이블에서 사원드의 입사일에서 현재날짜까지 근속월수 구하기(정수부분만 출력)
--2. 근속 일수 구하기 날짜-날짜형식으로
select trunc( MONTHS_BETWEEN(sysdate,hiredate),0 ) as "근속월수"
from emp;

select ename, hiredate, trunc((sysdate - hiredate) / 31,0) as "근속월수"
from emp;
----------------------------------날짜 함수 END-------------------------------------------------

--★Today POINT★
--변환 함수 
--오라클에서 숫자를 문자 문자를 날짜...로 변환할수있다. to가 붙은 함수.
--to_char() : 숫자를 문자형태로 조합된형태 1000(숫자) -> $1000(숫자x)...★활용도가 높음★
--              날짜를 문자형태로 2020-01-01(숫자o) -> 2020년 01월 01일(숫자x)

--to_date() : 문자를 날짜 형태로 변환
--select '2020-12-12' + 100....불가능 -> select to_date('2020-01-01') +100... 쓸곳이 이것뿐

--to_number() : 문자를 숫자로 변환...내부적으로 자동 형변환이 지원된다.
select '100'+100
from dual;
--위에 자동형변환은 사실 내부적으로 형변환이 이루어진다
select to_number('100')+100 from dual;

--1. to_number : 문자를 숫자로. 자동 형변환
select '1'+100 from dual; --자동 형변환
select to_numer('1')+100 from dual;--내부

--2. to_char() : format이라고 생각하자.. 숫자, 날짜 형식문자를 바꿀때 쓰인다
select to_char(sysdate) from dual;--sysdate날짜를 문자로 바꾼것.. 다른것과 조합가능하다//날짜는 불가능
select to_char(sysdate) || '일' from dual;

select sysdate, 
to_char(sysdate, 'YYYY') || '년' as "YYYY",
to_char(sysdate, 'YEAR'),
to_char(sysdate, 'MM'),  
to_char(sysdate, 'DD') || '일'|| 
to_char(sysdate, 'DY') || '요일' 
from dual;

--입사일이 12월인 사원들의 사번, 이름 입사 년, 월, 일 을 출력

select  ename, empno, hiredate

from emp
where to_char(hiredate,'MM')=12;

select to_char(hiredate,'YYYY MM dd') from emp;

select to_char(hiredate,'YYYY"년" MM"월" dd"일"') from emp;


--to_char() 는 숫자를 (특정한 형식의)문자로..포메팅
--pdf 71페이지 표 참고
--1000000 -> $1,000,000(문자형식)

select '>'|| to_char(12345, '9999999999999') || '<' from dual;--공간을 9 개수만큼 만듬
select '>' || to_char(12345, '09999999999999') || '<' from dual;

select '>' || to_char(12345, '$9,999,999,999,999') || '<' from dual;

select '>' || to_char(sal, '$999,999') || '<' from emp;

---------------------------HR계정--------------------------
select *
from employees;
/*
사원 테이블 employees에서 사원이름은 last_name full_name합쳐서 fullname이라는 별칭으로 출력하고
입사일은 YYYY-MM-DD형식으로 출력하고 연봉(급여*12)을 구하고
연봉의 10%(연봉*1.1)인상한 값을 출력하고 그 결과는 1000단위 콤마 처리해서 출력하고
단 2005 이후 입사자들만 출력 & 연봉이 높은 순으로 출력하세요
*/

select (last_name || first_name) as fullname, to_char(hire_date,'YYYY MM dd'), to_char(salary*12, '$9,999,999,999,999')as "연봉",
to_char((salary*12)*1.1,'$9,999,999,999,999')as "연봉인상"
from employees
where to_char(hire_date,'YYYY')>2004
order by "연봉" desc;
--★order by절에 별칭이 올수있다.

---------------------변환 함수 : to_char(), to_date(), to_number()  END-----------------

------------------------------bit계정--------------------------------
select *
from emp;

--일반함수 : 프로그래밍적인 성격
--nvl, nvl2 ---> null처리 담당
--decode( ) 함수 >> if문, switch문 유사
--case( ) 함수 >> if문, switch문 유사

select comm, nvl(comm, 0) from emp;
--------------일반함수 연습..
create table t_emp(
id number(6),
job varchar2(20)
);
insert into t_emp(id, job) values(100,'IT');
insert into t_emp(id, job) values(200,'SALES');
insert into t_emp(id, job) values(300,'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500,'MGR');

select * from t_emp;
commit;

--1.decode( )함수...if 10번이라면 인사부...20번이라면 관리부...30분이라면 회계부...

select deptno, decode(deptno,10,'인사부',--deptno : 부서번호
                                      20,'관리부',
                                      30,'회계부',
                                      '기타부서')as "부서"
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

--t_emp2 테이블에서 id와 jumin 출력하되 jumin컬럼앞자리가 1이면 남성
--2면 여상 3이면 중성이라고 출력하라
 
select id, decode(substr(jumin,1 ,1 ), 1,'남성',
                                            2,'여성',
                                            3,'중성',
                                            '기타') as "gender"
from t_emp2;
 
 
 select *
 from emp;
 
select decode(deptno,20,
                   decode(ename,'SMITH','HELLO','WORLD'),
                 'ETC')
 
--2. CASE문 //java의 switch문과 유사함.
/*
CASE 조건식 when 결과1 then 출력1
=조건이 결과1에 해당하면 출력1을 출력한다.
CASE 조건식 when 결과1 then 출력1
               when 결과2 then 출력2
               when 결과3 then 출력3
               else 출력4
               END "컬럼명"
*/
create table t_zip(
zipcode number(10)--컬럼명 정수값 10자리
);

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(33);
insert into t_zip(zipcode) values(41);


select * from t_zip;

select '0' || to_char(zipcode),
        case zipcode when 2 then '서울'
                          when 31 then '경기'
                          when 32  then '강원'
                          when 41 then '제주'
                          else '기타지역'
                          end "regionname"
from t_zip;

select*
from emp;
/*emp
사원테이블에서 급여가 1000 이하면 4급
1001~2000이면 3급
2001~3000이면 2급
3001~4000이면 1급
4001~이상이면 특급

1. case컬럼명 when 결과 then 출력 ( ~는 에대한 조건)
2.case when 컬럼명 조건 비교식 then~(비교에 대한 조건)
*/
select   case when  sal<1000 then '4급'
             when  sal between 1001 and 2000 then '3급'
             when  sal between 2001 and 3000 then '2급'
             when  sal between 3001 and 4000 then '1급'
             else '특급'
           end "급여등급"
from emp;



--집계함수 페이지 75
/*
1. count( )....count(*)>>row 줄수(행),  count(컬럼명)>>데이터 건수(데이터 건수는 null포함하지않는다.)
2. sum( )
3. avg( )
4. max( )
5. min( )

집계함수의 특징.
1. 집계함수는 group by절과 같이 사용한다.. 그룸마다의 평균,합을 구함.ex)부서번호가 10번인 사람들의 급여의 평균,합
2. 집계함수는 null을 무시한다. null이 있는 데이터는 출력하지않는다.
3. select절에 집계함수 이외의 다른 컬럼이 오면 반드시 그 컬름은 group by절에 명시되어야 한다.

*/
--1. count( ), sum( ), avg( )
select count(*) from emp;--14건 출력
select count(comm) from emp;--6건 출력 null은 출력안함.
--★null나오면? -> nvl★
select count (nvl(comm,0)) from emp;

--급여의 합 구하기 sum함수  // 자바 for문..
select sum(sal) as "급여합"
from emp;

--평균 급여 구하기
select round(avg(sal),0) as "평균 급여"
from emp;

--Quiz)우리회사 수당의 평균이 얼마인가
select trunc(avg(comm),0) as "수당의 평균"
from emp;

--노조에서 보고서 올린놈 누구야!
--노조에서 만든 보고서..
select trunc(avg(nvl(comm,0)),0) as "수당의 평균"
from emp;
--위에 보고서는 수당을 받는 null값을 무시하기때문에 받지않는사람은 포함되지않는다.


--null값이 있는지 없는지 ... 검증해보자
select count(*)
from emp
where comm is null;--8건

select count(*)
from emp
where empno is null;--0건


select comm
from emp;

--2. max( ), min( )
select max(sal)
from emp;

select empno, count(empno)--empno와 count의 행 개수가 달라서 에러.
from emp;

--부서별 평균 급여를 출력하세요
select deptno, avg(sal)
from emp;--행의 개수가 달라서 에러


--sol ) group by절 -->그룹별로 묶고 평균을 구하자.
select deptno, avg(sal)
from emp
group by deptno;

--직종별 평균 급여를 출력하세요
select job, avg(sal)
from emp
group by job;
--group by절에 있는 컬럼이 select 에 없다면 어떤 결과인지 알수없기때문에 
--반드시 적어둔다.

--직종별 평균 급여, 급여합, 최대 급여, 최소급여, 건수
select job, avg(sal), sum(sal), max(sal), min(sal), count(sal)
from emp
group by job;

/*
grouping의 원리 
1. distinct 컬럼명1, 컬럼명2
2. order by 컬럼명1, 컬럼명2
3. group by 컬럼명1, 컬럼명2, 컬럼명3
*/
--Quiz부서별 직종별 급여의 합을 구하시오
select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job--diptno(사번)을 먼저 묶고 그 안에서job으로 묶는다.
order by deptno;


/*  
select          4
from            1
where          2  from의 조건절이 where절 .. 무조건from 다음은 where
group by      3
order by       5
*/

--직종별 평균 급여가 3000이상인 사원의 직종과 평균 급여를 출력하세요.
--직종별 평균 급여가 3000이상인 사원 : 조건절..where...group by이전에 실행
--where avg(sal)..불가능 group by안함
--avg(sal)이 from where groupby 이후에 작동해야한다..
--group by의 조건절 : having


select job, avg(sal) as "평균급여"
from emp
group by job
--이 상태에서 조건걸기 = having
having avg(sal)>=3000;


--★순서 : 5.select / 1.from /  2.where / 3.group by / 4.having / 6.order by★


------------------------------------------4월 2일------------------------------------------------------------------
/* 사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요 */

select job, sum(sal) as "급여합"
from emp
where comm is not null
group by job
having sum(sal)>=5000
order by "급여합" asc;

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 */

select deptno as "부서번호",  count(deptno) as "부서 인원", sum(sal) as "급여 합"
from emp
group by deptno
having count(deptno)>4;



/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */

select job as "직종", sum(sal) as "급여 합"
from emp
where job!='SALESMAN'--initcap사용
group by job
having sum(sal)>5000
order by sum(sal) desc;

select *
from emp;

----------------------------하나의 테이블을 대상으로 쓸수있는 모든 구문 END--------------------------------------

--------------------------------------------챕터_JOIN 85page-------------------------------------------------
--관계형 데이터 베이스
/*create table M (M1 char(6) , M2 char(10));
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
--1. 등가 조인(equi join) : 원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑

--join문법
--1. ANSI 문법 (권장) : 표준문법
--2. SQL JOIN문법 : 제품마다있는 문법

--sql join문법 되도록 쓰지말자...
select * 
from m, s
where m.m1 = s.s1;--m테이블의 m1과 s테이블의 s1은 같다

select m.m1, m.m2, s.s2--같다고했으니까 다른거만 뽑자..
from m, s
where m.m1 = s.s1;

--ANSI 문법(권장)
--where절은 from절의 조건절...나름대로의 일이 있다.
--where절에 join의조건과 일반조건을 다 섞어버리면 혼란...
--join의 조건을 분리하자..!  --> join의 조건절 : ON절 생성
select *
from m inner join s --m테이블 s테이블을 조인하겠다
on m.m1 = s.s1;--m테이블의 m1과 s테이블의 s1을 같은조건에서




select *
from emp, dept;

select *
from emp;

--테이블 쪼갤수있는 만큼 쪼개라

--사원 번호, 사원이름, 사원부서번호, 사원 부서명이 알고싶다...
--사번 사명 ..사원테이블///부서번호 부서명...부서테이블 = join

select emp.empno, emp.ename, emp.deptno, dept.dname
from emp join dept
on emp.deptno=dept.deptno;

--별칭 달기 join할땐 테이블에 별칭(얼리언스)부여하고 그 이름으로 접근한다!
select e.empno, e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

--join여러개하기.
--3개 테이블 조인하기
select m.m1, m.m2, s.s2, x.x2
from m,s ,x
where m.m1 = s.s1 and s.s1 = x.x1;


--ANSI문법
select *
from m join s on m.m1 = s.s1--1번째 조인 들어가고 필요한테이블ㅆ고
          join x on s.s1 = x.x1;-- 2번째 조인 필요한테이블..

-----------------------HR계정-------------------------
select *
from employees;


select *
from departments;


select *
from locations;


--employ테이블의 employee_id는 departments의 employee_id를 참조한다.
--부서테이블의 지역아이디는 로케이션의 지역아이디를 참조한다

--quiz)사번, 이름(lastname), employee_id, 부서 이름, 출력
select e.last_name as "이름", e.employee_id as "사번", e.department_id as "부서번호", d.department_name
from employees e join departments d
on e.department_id = d.department_id;


select d.department_id, d.location_id
from employees e join departments d 
                        on e.department_id = d.department_id
                        join locations l
                        on d.location_id = l.location_id;
                        
 


--107명인데 왜 106명이지..?

--join은 null을 포함하지않는다.
select count(*)
from employees;--107명

select *
from employees
where department_id is null;
--178번 사원이 부서id가 null값이다...등가조인으로 해결불가능..outer join으로 해결


--quiz)사번, 이름 , 부서번호, 부서명, 지역코드, 도시명

select *
from employees e join departments d 
                        on e.department_id = d.department_id
                        join locations l 
                        on d.location_id = l.location_id;
       

-----------------------------------------bit 계정-----------------------------------------------------

--2. 비등가 조인 : 원테이블과 대응되는 테이블에 있는 컬럼이 1 대1로 매핑되는것이 없는경우
--1 대1 매핑만 안되는것이지 문법으로는 등가조인이랑 같다..
select *
from emp;

select*
from salgrade;

select *
from emp e join salgrade s
on e.sal between s.losal and s.hisal;--최저 sal ~ 최고sal사이 : 1대1대응 안댐..

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;


--3. outer join (equi join + null)
--아우터조인은 내부적으로 이큐조인을 실행하고 남는걸 가져온다
--주종관계 파악 2개의 테이블중 누가 주인지 파악... 주가되는 테이블에 남은 데이터를 가져오는방법이다.

--아우터 조인은 문법적으로 3가지로 나뉨
--1. 왼쪽이 주인 left outer join
--2. 오른쪽이 주인 right outer join
--3. 둘다 주인 full outer join...(왼쪽이 조인일대와 오른쪽이 조인일때 두개를 union한것이다)

select *
from m join s
on m.m1 = s.s1;--우리가 했던 조인..


select * from m;
select * from s;
select * from x;


--left outer join
select *
from m left outer join s
on m.m1 = s.s1;
--left나 right나 eq조인을 먼저 실행한다 그다음 남은거 갖다 붙임.
--m이 주인 남은 데이터를 다 가져와서 붙이고 남은 쪽은 null로 채운다.



--right outer join
select *
from m right outer join s
on m.m1 = s.s1;
--s가 주인



--full outer join  left rignt유니온 한것이다... 유니온은 중복값 삭제
select *
from m full outer join s
on m.m1 = s.s1;
--m이 주인일때 붙이고 밑에s가 주인일때 밑에 붙임

-----------------------------------------------HR 계정---------------------------------------



--quiz)사번, 이름(lastname), 부서번호, 부서 이름, 출력
select e.last_name as "이름", e.employee_id as "사번", e.department_id as "부서번호", d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by e.employee_id;



--self join(자기 참조) : 등가조인의 문법..
--자기자신의 컬럼 참조.
--하나의 테이블에서 특정컬럼이 자기 자신의 컬럼을 참조하는경우....사수찾기

--지금까지의 조인은 테이블이 1개 이상이여야했다. 
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m--하나의 테이블을 2개처럼 쓰려면 테이블의 ★별칭★을 달리한다.
                 on e.mgr = m.empno;

--문제 사원은 14명..출력 사원은 13명...KING은 사수가없다.  king도 출력해라
--sol)
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m--하나의 테이블을 2개처럼 쓰려면 테이블의 ★별칭★을 달리한다.
                 on e.mgr = m.empno;




select *
from emp;
select*
from dept;
select*
from salgrade;

-------------------------------------초급 개발은 JOIN까지---------------------------------
--subquery서브쿼리 (pdf 100페이지)...서브 쿼리는 sql의 꽃, 만능해결사...
--함수써도 안돼 조인써도 안돼... 서브쿼리 : 무조건 서브쿼리는 안댐 1.함수   2. 조인  3.서브쿼리

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의 사번 이름 급여 출력

select avg(sal)
from emp;--2073

select ename, empno
from emp;
where sal>=2073
--2개의 쿼리를 한개의 쿼리로 합쳐보자..

select *
from emp
where sal>(select avg(sal) from emp);--서브쿼리
/*
--Subquery
1. Single row subquery : 서브쿼리의 결과 로우가 1개라면(하나의 컬럼, 하나의 값을 갖는다면) --> 싱글로우
2. Multi ruo subquery : 서브쿼리의 결과 로우가 1개 이상(하나의 컬럼, 여러개의 값을 갖는다면) --> 멀티 로우
 둘을 구별하는이유 :  사용되는 연산자가 다르다!
 싱글 로우 = 배운대로..
 멀티 로우 = IN, NOT IN, ANY, ALL
 ALL --> sal > 1000 and sal > 2000 and sal...
 ANY --> sal > 1000 or sal > 2000 or sal....
올 애니는 데이터를 이렇게 푼다
서브쿼리의 결과에 따라서 싱글로우 멀티로우 달리 해야함..!

★서브쿼리는 괄호 안에 있어야 한다..! >>(select sal from emp)
★서브쿼리는 단일컬럼으로 구성된다 >> (select sal, deptno from emp)...이런거 금지 두개의 컬럼중 어떤컬럼을 비교할지 알수없다.
★서브쿼리는 단독으로 실행 가능 해야한다.

실행순서에서 무조건 서브쿼리가 선행!
메인쿼리가 서브쿼리의 결과값을 갖고 메인쿼리가 실행된다.
*/

--사원테이블에서 jones급여보다 더 많은 급여를 받는 사원의 사번 이름 급여 출력
select sal
from emp
where enaem='JONES';

select *
from emp;

select *
from emp
where sal > (select sal from emp where ename='JONES');

select *
from emp
where sal > (select sal from emp where sal > 2000);--멀티로우

select *
from emp
where sal in (select sal from emp where sal > 2000);
--sal 2975 3450 3000 5000 3000
--in으로 풀면or 로 다 받는다.

select *
from emp
where sal not in (select sal from emp where sal > 2000);
--not in 부정의 and in이 아닌 나머지것들
--where sal != 2975 and sal!=2850 and sal!=2450 and....부정의 and
--2000이상 sal안됌!

--부하직원이 있는 사원의 사번과 이름 출력
select mgr
from emp
where mgr is not null;--사수가 존재하는 사람의 사수번호...사수번호가empno와 같다

select empno, ename
from emp
where empno in(select mgr
from emp
where mgr is not null);

--부하직원이 없는 사원의 사번과 이름 출력...mgr에 내 사번이 없다..1. 내사번이 없음 2. 
select  *
from emp
where empno not in (select mgr from emp);
empno != 7903 and != 7788...and에 널이있으면 모든 조건은 널이다 결과는 널이다.

--null때문에 안된다면 nvl로 null제거
select *
from emp where empno not in (select nvl(mgr,0) from emp);
--null대체
select *
from emp where empno
not in (select mgr from emp where mgr is not null);


--직속 사수가 king 인 사원의 사번이름
select *
from emp
where mgr = 7839;

select *
from emp
where mgr=7839;

select *
from emp
where mgr = (select empno from emp where ename ='KING');

--20번 부서의 사원 중에서 가장많은 급여를 받는 사원보다 더많은 급여를 받는 사원 출력

select max(sal)
from emp 
where deptno=20;--3000

select empno, ename, sal, deptno
from emp
where sal > (select max(sal)
from emp 
where deptno=20);


-------------------★POINT★-----------------
--서브쿼리는 select, from, where절에서 쓸수있따
--서브쿼리를 and로 여러개 묶기

select *
from deptno in (select deptno from emp where job = 'SALESMAN')
                and sal in (select sal from emp where job = 'SALESMAN');
                

--quiz)실무
--자기부서의 평균 월급 보다 더 많은 월급을 받는 사원의 이름 부서번호 부서별 평균 월급 출력.
--from절에 서브쿼리 사용가능 가상테이블 in line view
select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno, round(avg(sal),0) as avgsal 
                from emp group by deptno) s
                on e.deptno = s.deptno
                where e.sal > s.avgsal;


------------------------------------------------------4월 3일----------------------------------------------------------
select*
from emp;
select *
from dept;


---------------------------------------------------------MY 서브쿼리 연습문제--------------------------------------------------------

--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.    1. 스미스월급
select sal from emp where ename = 'SMITH';
 
select*
from emp
where sal>(select sal from emp where ename = 'SMITH');
 
--2.???????? 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.//
--1.10번 부서의 사원의 월급 컬럼과 같은월급   2450, 5000, 1300월급을 받는 사원
--emp의 e와 d(10번 부서 사원의 월급)에서  사원 번호가 같다.

select e.sal from emp e join dept d on e.deptno=d.deptno where e.deptno = 10;

select sal from dept where deptno ='10';

select *
from emp k join (select e.sal from emp e join dept d on e.deptno=d.deptno where e.deptno = 10) s
                on k.deptno = s.deptno
                where k.sal = d.sal;
                
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.

--3-1.BLAKE의 부서번호
select d.deptno
from emp e join dept d
                on e.deptno = d.deptno
where e.ename = 'BLAKE';

--3-2. 30번부서의 사원이름,고용일 출력
select *
from emp e join (select d.deptno from emp e join dept d on e.deptno = d.deptno where e.ename = 'BLAKE') s
                on e.deptno = s.deptno
where e.deptno = s.deptno
         and e.ename != 'BLAKE'; 

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.  직계함수의 결과는 싱글로우일수밖에 없다.
select *
from salgrade;
--4-1.평균 급여
select round(avg(sal))
from emp;--2073
--4-2  2073보다 많은 급여를 받는사람m *
select sal, ename
from emp
where sal>(select round(avg(sal)) from emp)
order by sal desc;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고??????????
-- 있는 사원의 사원번호와 이름을 출력하라. sol) 멀티로우..in연산자 사용 in 연산자는 데이터를 or로 푼다
--5-1 이름에 T를 포함한 사원
(select * from emp where ename like '%T%');

--5-2같은부서에서 근무
select e.ename
from emp e join (select * from emp where ename like '%T%') d
                on e.deptno = d.deptno
                where e.deptno = d.deptno;

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)

--6-1 30번부서의 사원중 가장많은 월급
select max(sal)
from emp
where deptno = 30;
--6-2 가장 많은 월급보다 많은 월급
select *
from emp e join (select max(sal) from emp where deptno = 30) d
                on e.deptno = d.deptno
                where e.sal>d.sal;
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라. =도 맞는데 in쓴이유 방어책..둘다 맞다.

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.

 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)

 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.

 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라.

------------------------------------------------------SOL = 카페-------------------------------------------------------
/*
select  from   where group by having order by
기본함수 문자형 숫자형  날짜형  변환형  일반  집계함수
join / inner join/ outter join/  하나이상의 테이블에서 데이터 가져오기 --다중테이블 -- 관계
subquery--
초급 개발자의 기본소양..
*/
---------------------------------------------------DML---------------------------------------------------------
-------------------------------------★INSERT    UPDATE   DELETE★--암기---------------------------------------

/*
DDL(데이터 정의어) : create, alter, drop, truncate (rename, modify)
DML(데이터 조작어) : insert, update, delete = 오늘은 이거배울거야아아아아아아아
DQL(데이터 질의어) : select
DCL(데이터 제어어) : 권한(grant, revoke)
TCL(트랜젝션) : commit, rollback, savepoint

개발자 CRUD (Create = insert, Read = select, U =update, D=delete)
*/


--DML 데이터 조작어 (트랜젝션 Transaction : 하나의 논리적인 작업단위)
/*ex) A은행에서 돈 500 인출해서 B은행에 입금 하려고 한다.
A은행 업데이트 1000에서 500으로..
B은행 업데이트 1000에서 1500으로
둘다 성공하면 커밋
둘중 하나만 실패하면 롤백
트랜젝션을 일으키는 작업들 insert delete update데이터 변경이 주어진다면 트랜젝션을 동반한다
트랜젝션은 락(LOCK)을 동반한다.

일상생활에서 : 결제, 물건구입...장바구니..결제..구매목록 모든것이 성공해야 커밋해야한다

끝점에 도달하지 못하면 다시 원점으로 돌아가는것이야
깃발 꽂은 지점(세이브 포인트)으로 돌아가는것이 아니야
*/

--테이블 tab : 접속한 사용자가 만든 모든 테이블 목록
--create table할때 중복이름 피할수있다.
select *
from tab
where tname = 'BOARD';

--테이블 col : 컬럼들의 목록을 볼수있다.
select *
from col;
--주로 ~테이블의 컬럼목록을 보고싶기때문에
select *
from col
where tname = 'EMP';

--테이블 user_tables : 용량 디스크 할당량, 주로 관리자들이 봄
select*
from user_tables;

select *
from user_tables
where table_name = 'DEPT';
-----------------------------------------DML 스타트----------------------------------------
--DML pdf 168페이지 문법 암기
create table temp( 
    id number primary key,--  -> primary key의 의미  id컬럼에는 not null하고 unique한 데이터만 들어갈수있다.
    name varchar2(20)
    );
    
    select * from temp;
/*
문자 타입
char(20) -> 20byte 한글 10자, 영문, 특수, 공백 20자 : 고정길이 문자열
varchar2(20) ->20byte 한글10자, 영문, 특수, 공백 20자 : 가변길이 문자열

둘의 차이.. 고정이나 가변이냐
char(20)  -> '홍길동' -> 6byte를써도 [홍길동    ] : 20byte를 쓴다
varchar(20)  -> '홍길동' -> 6byte쓰면 [홍길동] : 쓴만큼만 쓴다

char는 왜쓰는거야..?
고정길이 데이터 ex)남자, 여자 / 주민번호
가변길이 데이터 ex)이름 2,3,4글자..

성능적인 부분에서
검색을 할때 varchar보다 char을 우선시 한다.
고정길이 데이터는 가능하면 char을 쓰자!

고민거리 : 한글 -> unicode : 2byte>>한글 영어 공백 특수 모두 동일
nchar(20) : n은 unicode의 약자, 20은 글자수의미 총 byte 는 2*20 = 40byte
nvarchar(10) : 10글자 의미.
*/
------------------------------------------DML 암기
--1. 가장 일반적인 insert
insert into temp(id, name)
values(100, '홍길동');

select * from temp;
--맘에들면 실반영 commit or rollback
commit;

--2. 컬럼 목록 생략(컬럼 리스트 생략)
insert into temp
values(200, '김유신');

select * from temp;

--문제 상황
insert into temp(id, name)
values(100, '아무개');--아이디가 이미 지정되어있는 아이디 에러

insert into temp(name)
values('아무개');--아이디에 null을 입력 하고싶지만 데이블 만들때 not null로 생성
-------------------------------------------------------------------------
--지금하는 일반sql은 프로그램적인 요소가 없다
--pl sql(고급 sql)은 프로그래밍적인 요소가 있다.. 변수, 제어문
--pl sql 재미삼아..
--데이터 테스트 하고싶은데 1000번의 insert언제하지..? for문 돌리고싶네..
--create table temp2(id, varchar(20));
--
--begin
--    for i in 1..1000 loop
--    insert into temp2(id) values('A' || to_char(i));
--    end loop;
--end;
--
--select * from temp2;
-----------------------------------------------------------------------------------
create table temp3(
    memberid number(3) not null,
    name varchar2(10),--null허용
    regdate DATE default sysdate--기본값 설정하기...날짜 강제 인서트 하지않으면 sysdate값이 디폴트로 들어간다.
    );
    
select sysdate from dual;

alter session set nls_date_format = 'YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate)
values (100,'홍길동', '2020-04-03');

select * from temp3;

commit;

insert into temp3(memberid, name)--regdate는 디폴트 값(시스템 갖고있는)으로 들어간ㄷ다
values(200, '아무개');

commit;

insert into temp3(memberid)--name은 null값 허용
values(300);

select* from temp3;
--not null한건 데이터 넣어주고 아닌건 알아서 잡힘

insert into (name)
values('이름만');--테이블 만들때 memberid는 null값을 허용하지 않기때문에 에러 발생한다.

----------★insert의 TIP
--1. 대량 데이터 insert하기... 밸류안하고 셀렉트로 데이터 삽입하기.
create table temp4(id numbner);
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

--요구사항 : temp4에 있는 모든 데이터를  temp5에 넣고싶어요
--insert into 테이블명(컬럼리스트) values(값리스트)
--insert into 테이블명(컬럼리스트) select 절(컬럼 리스트의 개수와 타입동일하다는 조건에서)

insert into temp5(num)
select id from temp4;
----------★insert의 TIP
--2. 테이블이 없는 상황에서 테이블 생성과 대량 데이터삽입을 동시에
--단, 복사의 개념이기때문에 제약정보는 복사가 안된다.
--원래 쓰던방식create table copyemp(컬럼명 타입)
create table copyemp --emp와 같은 구조를 만들고 데이터 삽입까지 하는 코드
as 
    select * from emp;

select*
from copyemp;--구조 복사 + 데이터까지 삽입...실습용만들때 원본건드리지 않는방법.

create table copyemp2--3개컬럼만 만들고 데이터 삽입까지
as 
    select empno, ename, sal
    from emp
    where deptno = 30;

select* from copyemp2;

--구조만 복사하고 데이터는 복사하고싶지않을때는 ...
create table copyemp3
as
    select* from emp where 1=2;--거짓 조건 만들면.. 데이터 입력 안함.

select* from copyemp3;
---------------------------------------------insert END-----------------------------------------------
--update
/*
update table_name
set column1 = value1, column2 = value2....
where조건

update table_name
set column1 = (subquery)
where 조건
*/
select * from copyemp;

update copyemp
set sal =0;--copyemp테이블에 있는 모든 sal 의 값이 0으로 

select * from copyemp;--맞다생각하면 커밋, 아니다 싶으면 롤백

rollback;--sal값 원래대로..
--2. 조건이 있는 update문
update copyemp
set sal=0
where deptno=20;--부서번호가 20번인애들만 sal을 0으로 바꾼다

select* from copyemp order by deptno;
commit;

update copyemp
set sal = (select sum(sal) from emp)
where deptno=20;--부서번호20번인 애들 급여를 급여합한걸로 바꾼다.

select* from copyemp where deptno=20;
commit;
--여러개의 컬럼 update하기
update copyemp
set ename='AAA', job = 'BBBB', hiredate = sysdate, sal=1111
where deptno =10;

select* from copyemp where deptno=10;
commit;
------------------------------------------UPDATE END----------------------------------------------
--DELETE
--원칙적으로는 delete한 데이터를 커밋, 롤백하면 복원이 불가능하다.(단, 백업을했다면 복원가능)

delete from copyemp;--전체를 전부 지움

select * from copyemp;
rollback;
select* from copyemp;

delete from copyemp where deptno in (10,20)--부분삭제 :카피 이엠피에서 부서번호가 10or20번 삭제
select* from copyemp deptno in (10,20);
commit;
------------------------------------------DELETE END-----------------------------------------------------
/*
APP(JAVA)  -> JDBC API  ->  ORACLE(DB)

CRUD작업
create - insert
read - select
update - update
delete - delete
주의 할점 데이터 조작어 DML은 트랜잭션을 동반하는 작업이다.. 커밋이나 롤백을 강제 해야한다.

JDBC를 통해서 오라클에있는 emp테이블에서 작업한다.
주로하는 작업 
1. emp테이블에서 전체 조회하기
2. emp테이블에서 조건조회 ~사번이 ~인애 찾아라
3. emp테이블에서 삭제
4. emp테이블에서 수정
5. emp테이블에서 삽입

자바라면 1~5번을 다 함수를통해서 이루어짐
1. 자바
public list<Emp> getEmpAllList(){ String sql="select"* from emp}
추후에 지금 배운걸 자바코드에 적는다
public Emp getEmpListByEmpno(String  sql = "select....where empno=777")
자바에서 조회하기 유용하다


*/
---------------------------------------------------DML END----------------------------------------------
--DDL : create, alter, drop(테이블 기준)

select * from tab;
select * from tab where tname = 'MEMBER';
select * from tab where tname = 'BOARD';

--delete는 데이터를 지움 drop은 집을 날려버림
drop table board;
select * from tab where tname = 'BOARD';--조회 불가능

create table board(
    boardid number,
    title nvarchar2(100),--nvarcahr 한글 영문 상관없이 100자 
    content nvarchar2(2000),
    regdate date
    );
    
select * from tab where tname = 'BOARD';--생성했다 조회가능

--oracle 11g버전 부터 지원되는 기능 = 가상컬럼,조화컬럼
create table vtable(
    no1 number,
    no2 number,
    no3 number generated always as (no1 + no2) virtual
);
--no3의 의미 어떤것에 의해서 만들어진것을 받는 컬럼.

--학생 성적을 담는 테이블을 
--국어컬럼, 영어컬럼, 수학컬럼, 총점컬럼...총점이라는 컬럼을 따로 만들어야하냐 굳이 필요없잔아
--만약에 국어와 영어 수학점수가 들어오면 자동으로 총점이 계산되면 어떨까..? 그래서 만든게 가상컬럼이다.
--no3은 no1과 no2에 데이터가 들어가면 그 합의 값이 no3에 저장된다.no1과 no2만 넣어보자

insert into vtable(no1, no2)
values(100,200);

select *
from vtable;--no3는 넣지도 않았는데 no1과 no2를 합한 데이터 채워짐..!//더하기뿐아닌 연산다 가능!

insert into vtable(no1, no2)
values(33,44);

select*
from vtable;

--안되는것 : 가상컬럼을 만들어놓고 그곳에 데이터를 삽입하면 오류가 난다.
insert into vtable(no1, no2, no3)
values(10, 20, 30);

--내가 작업한 컬럼에 가상컬럼이있는걸 어찌압니까
--컬럼 정보 보기
select *
from user_tab_columns where table_name = 'VTABLE';
--보면 유용한 컬럼
select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE';

--실무에서 활용되는 코드
--제품정보(입고일)...분기별 
--입고일 : 2020-03-01 >> 1 분기





























































