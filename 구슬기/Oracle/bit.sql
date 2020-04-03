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
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^ 토드나 sqlgate 추천 해주심

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : bit

-- USER SQL
CREATE USER bituser IDENTIFIED BY 1004
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER bituser QUOTA UNLIMITED ON USERS;

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

select*from emp;
SELECT*FROM dept;
SELECT*FROM SALGRADE;

/*
SELECT [DISTINCT] {*,column [alias], . . .}
FROM table_name
[WHERE condition]
[ORDER BY {column, expression} [ASC | DESC]];
[] 안의 내용생략가능
{} 안의 내용을 꼭 써라. 
*/

--1. 사원 테이블에서 모든 데이터를 출력하세요.
select*from emp; -- 쿼리 문자는 대소문자 구별 안해요
--SELECT*FROM EMP;  

--2. 특정 컬럼 데이터 출력하기    //컬럼명 사이에는 , 로 구분
select empno, ename, sal from emp;
select ename from emp;

--3.컬럼에 가명칭(별칭)(alias)  부여하기    //출력되는 컬럼의 명을 사번, 이름으로 바꿀수 있다.  컬럼명 + 스페이스바+바꾸고싶은이름
select empno 사번 , ename 이름
from emp;
--alias 네임에 ""을 붙여서 하나의 문장으로 인식 시켜줄 수 있다.
/*
select empno "사    번" , ename "이     름"   
from emp;
*/
--정식(표준)(ansi 문법)    하나를 배우면 다른 DB 60%는 사용가능하다!~
select empno as "사    번" , ename  as "이     름"   
from emp;

select empno as "이렇게", comm as "바뀐다는 거지" from emp;



--Oracle 데이터 관리 (문자열 : 대소문자 구분)
--문자열 표기('문자열') 다 문자열임
--소문자 'a' 대문자 'A'는 다른 문자 열이다. 
--emp테이블에서 ename 컬럼에서 킹인사람 보여줘.
--소문자일땐 안나옴.



select empno, ename
from emp
where ename = 'KING';

--Oracle SQL 언어:  연산자 (결합 연산자(||), 산술연산자(+)) 구분해서 쓴다. 

--java + 는 (숫자+숫자 >> 연산)    자바는 + 하나로 다해먹음!!
--java + (문자열 + 문자열 >> 결합)
--Tip) ms-sql(+ 연산, 결합) 언어마다 차이가 있다.

select '사원의 이름은 ' || ename || '입니다' as "사원정보"
from emp;



--empno, ename >> 컬럼 >> 타입
--타입(자료형) :숫자, 문자(문자열) , 날짜...
desc emp;
/*
테이블의 기본 정보(컬럼명, null 여부, 타입정보
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) 문자열 저장가능 한글은 5자.. 영어는 10자..
JOB               VARCHAR2(9)  
MGR               NUMBER       숫자
HIREDATE          DATE         
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER   
*/

select empno || ename     --숫자||문자열 (내부적으로 숫자-> 문자열)   결합이니까 잘됨!!!!
from emp;
select empno + ename      --숫자랑 문자를 + 하면  산술 연산오류가 난다.   숫자랑 문자 산술은 오류임!!!!!
from emp;

--사장님 .. 우리 회사에 직종이 몇개나 있나??

select job from emp; 
--distinct : 는 중복 데이터 제거하고 하나만 보여준다
--distinct : grouping  그룹핑을해서 중복값을 제거한다. 

select distinct job from emp;    --5개만 딱 나온다. 

select * from emp;
select distinct job , deptno from emp;
select distinct job , deptno from emp order by job;  --데이터들을 그룹지어놓고 그안에 또 그룹을 만든다. 그후에 하나씩 뽑은것 이라는데..?
select distinct deptno,job from emp order by deptno; --deptno 10번 그룹안에 세개의 직종을 하나씩 뽑아온다.


--Oracle 언어
--java 언어
--Oracle 연산자가 Java 거의 동일 (+,*,- ...)
--% 자바(나머지를 구하는 연산자) , % 오라클에선 연산자가 아니라 (검색을 하는 패턴)에 쓰인다. 
--오라클(+, -, * ,/) 나머지 함수 >> Mod()

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요.
--desc emp; 하면 어떤 컬럼인지 알수 있음

select empno, sal, sal+100 as "인상급여" from emp;

--dual 임시 테이블을제공한다.
select 100 + 100 from dual; --dual이 가상공간을 만들고 그안에 집어넣는다.  200
select 100 || 100 from dual; --|| 내부적으로 형변환이 일어나서 100100 문자열로서 결합한다.
select '100' + 100 from dual; -- + 이건 무조건 산술이니까 형변환  200
--select '100A' +100 from dual; --이건 그냥 에러

--비교연산자
-- > < <=
--java 같다(==) 할당(=)
--Oracle 같다(=) 같지않다.(!=) 할당 없다.

--논리연산자
--AND , OR ,  NOT

--조건절 (원하는 row줄 만 가져오겠다)
select*
from emp
where sal >=3000;   --사원테이블에서 급여가 3000보다 크거나 같은 모든 사원을 출력하라

select empno, ename, sal
from emp
where sal > 3000;    

--이상, 이하 (=)
--초과, 미만      정확히 확인해야 한다. 


--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요.


--관리자, 개발자, 튜닝(돈을 짱잘번다)(연차가 꽤 많이 쌓여야한다..) , 설계자

--실행순서 : from 에서 들고와서 where 에서 거르고 select 에서 뽑아낸다.     
select empno, ename, job, hiredate  --처음에는 * 로 해본다음에 컬럼명을 가져오면 오류가 덜 난다. 
from emp
where empno =7788;

--사원의 이름이 king인 사원의 사번, 이름, 급여 정보를 출력하세요
select empno, ename, sal
from emp
where ename = 'KING';  --'' 싱글쿼테이션을 붙인다.

--논리 (AND , OR)
--급여가 2000달러 이상이면서 직종이 manager 인 사원의 모든 정보를 출력하세요.
--위에 있는 두가지 조건을 모두 만족하는 데이터(둘다 참인)   


select *
from emp
where sal >= 2000 and job = 'MANAGER';   --얘는 3건 나온다. 

--급여가 2000달러 이상이거나(또는) 직종이 manager 인 사원의 모든 정보를 출력하세요.
select *
from emp
where sal >= 2000 OR job = 'MANAGER';  --OR 를 쓰면 데이터의 범위가 넓어진다.     얘는 6건 나온다. 


--오라클 날짜(DB서버의 날짜)
--오라클 날짜 (sysdate) 현재 오라클이 갖고있는 날짜 정보를 얻어온다.

select sysdate from dual;    --20/03/31

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';  
--나는 현재접속한 사용자(세션)가 날짜 형식을 'YYYY-MM-DD HH24:MI:SS' 이렇게 보도록 수정하겠다.

select* from SYS.nls_session_parameters; --시스텝 설정을 가지고 있는 환경테이블
--NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS  --현재 접속한 사용자가 볼수있게한 형식 --껏다키면 사라진다. DB를 건든게 아니라서 
--NLS_DATE_LANGUAGE	KOREAN --한국어 지원
--NLS_TIME_FORMAT	HH24:MI:SSXFF 

select sysdate from dual;
--2020-03-31 14:37:32

select hiredate from emp;    --1980-12-17 00:00:00  이렇게 바뀌어 나온다.   내가 설정한 포맷에 따라서 시 : 분 : 초 까지 붙어 나온다.

--입사일이 1980-12-17 인 사원의 모든 정보를 출력하세요.
select *
from emp
where hiredate = '1980-12-17';  --날짜 를 담을 때도 싱글 쿼테이션 이다.  

select *
from emp
where hiredate = '1980/12/17';  --   -, /   되고  . 도 되지만   .은 웬만하면 쓰지 말자. 

select *
from emp
where hiredate = '1980.12.17';

select *
from emp
where hiredate = '80-12-17';  --이건 조회가 안된다. 형식을 : RR-MM-DD   >> YYYY-MM-DD 이렇게 바꾸었기 때문이다. 

--사원의 급여가 2000달러 이상이면서 4000이하인 모든 사원의 정보를 출력하세요
select *
from emp
where sal >=2000 AND sal<=4000;

--연산자 : between A and B (=  포함하고 있다.)
--미만, 초과에서는 사용금지 (= 을 포함하면 안되기때문이지!)

select *
from emp
where sal between 2000 and 4000; --동일한 결과가 나온다. 

--사원의 급여가 2000달러 이상이면서 4000이하인 모든 사원의 정보를 출력하세요 (얘는 중복이어도 그냥 써야함)

select *
from emp
where sal >2000 AND sal<4000;

--부서번호가 10 또는 20번 또는 30 번인 
--사원의 사번, 이름, 급여, 부서번호를 출력하세요.
select empno, ename, sal, deptno
from emp
where deptno =10 or deptno =20 or deptno =30;



--IN 연산자 
select empno, ename, sal, deptno
from emp
where deptno in(10,20,30); 
--in 연산자를 풀어서 쓰세요... where deptno =10 or deptno =20 or deptno =30; 

--부서번호가 10 또는 20이 아닌 사원의 사번, 이름, 급여, 부서번호를 출력하세요.
select *
from emp
where deptno != 10 and deptno !=20;

--In 의 부정은 .....,NOT IN     AND 로 풀어진다.
select *
from emp
where deptno NOT IN(10,20);   --10과 20 둘다 아닌거. 
--부정값 and 부정값 and ....  deptno != 10 and deptno !=20;    



--distnct  In  NOT IN   between A and B   이렇게 는 외워줠!!!!!!!!

--POINT : Oracle 에서는 값 표현을 할수있다.(데이터 없다) >> null
--null 필요악 이다.

create table member (
  userid varchar2(20) not null,   --userid라는 컬럼명은 필수 입력이다. 
  name varchar2(20) not null,  --필수입력
  hobby varchar2(50) --default 로 null 붙는다.  = null 값을 허락하겠다.  = 데이터 안받아도 돼.
  
);


select * from member;
--insert into member(userid,hobby) values('hong','농부');
--cannot insert Null into("bit"."Member"."NAME")
insert into member(userid,name) values('hong','홍길동'); --hobby 는 테이블이 만들어졌지만 넣은 값이 없으므로 null이 들어감
--hobby 컬럼의 데이터는 null 자동으로...
insert into member(userid,name,hobby)
values('kim','김씨','게임');

--실제로 반영을 하고 싶으면
commit; --을 해줘야 함.   강제로 삭제하지 않는한 영속적으로 남는 데이터가 된다. 
--오라클은 기본적으로 commit을 해줘야 한다.  auto commit 이 아닌 이상.  

--수당(comm)을 받지 않는 모든 사원의 정보를 출력하세요.
--0도 데이터 취급 (받는 조건에 포함)
--comm 컬럼에 데이터가 null인것만 !!

--select *from emp where comm = ; 없는 문법

--null의 비교는 (is null)
select * from emp where comm is null; --얘는 null인 애들만 뽑아내라는 문법이다. 

--수당 (comm)을 받는 모든 사원의 정보를 출력하세요.
select * from emp where comm is not null;   -- null이 아닌 모든 애들을 꺼내오는것. 

--사원 테이블에서 사번, 이름, 급여, 수당 , 총 급여를 출력하세요.
--총급여( 급여 +수당)
select * from emp;

select empno, ename, sal, comm, sal + nvl(comm,0) as "총급여"
from emp;

--isnull, is not null, nvl(),nvl2()  얘네를 알고 있어야함


--POINT >> null 
--1. null 과의 모든 연산은 그 결과가 null 이다.     뭘해도 걍 null 나옴. 
--2.위 문제 해결하는 방법 : nvl() , nvl2()   >> null 값을 replace 치환....
--Tip) ms-sql : convert()
--     my-sql : IFNULL()

select null + 100 from dual; --null
select '홍길동' || null from dual; --홍길동  결합이기 때문에 null의 의미가 없다.   연산이랑 다른얘기임
select 100 + nvl(null,0) from dual;  --null 값을 0으로 바꿔서 연산한다.  그래서 100 이 나온다.

select comm , nvl(comm,1111) from emp;

--쿼리는 질의응답하는 방법이 제일 좋은 공부법이다.

--사원의 급여가 1000이상 이고 수당을 받지 않는 사원의 사번, 이름, 직장, 급여, 수당을 출력하세요
select empno, ename, job, sal,comm
from emp
where sal >= 1000 and comm is null;


---------------------------------------------------------------------------------------------------

--DQL( data query language) : SELECT (60%) 지금 배우고 있는것. 데이터를 가지고 오는 방법
--DDL : create, alter, drop (객체(테이블) 생성, 수정, 삭제) (30%)
--DML : insert , update , delete (데이터 조작) (10%)    얘네만 커밋한다.
--새로운 데이터가 들어가거나 변경되거나 지우거나 하는것.

--java : class Board{ private boardno int}
--Oracle : create table Board(boardno number not null)    

create table board(
 boardid number not null , --숫자 형식의 데이터를 입력할수 있고, 필수 입력 해야한다.  not null  은 제약사항 이라고 한다.   ex)제약사항으로 주민번호는~ 입니다. 이런거
 title varchar2(20) not null , --한글 10자 , 영문자, 특수문자, 공백은 20자   그리고 필수입력
 content varchar2(2000) not null, --필수입력
 hp varchar2(20) --default null허용( 필수 입력이 아니다)     hp varchar2(20)  null    과 똑같다.
);

select * from board;
--desc board;

--DML(데이터 조작어) 실 반영 여부를 결정
--insert
--update(수정)
--delete 
--반드시 그 결과를 반영 할지, 취소 할지 의사 결정해야함
-- commit(실제반영 할거야)
-- rollback(실제반영 취소)

insert into board(boardid, title, content)
values(100,'오라클','오 할만한데');

commit;
select* from board;

insert into board(boardid, title, content)
values(200,'자바','그립다');

select * from board;
rollback; --범위는 직전의 커밋 or 롤백 .. 

insert into board(boardid, title, content)
values(200,'자바','그립다');

select * from board;
commit;

--실행순서... 작성하는 순서는 상관없음. 
-------------------------------------------------------------------------------------------------------20200401


select sysdate from dual;


insert into board(boardid, title, content,hp)
values(300,'오늘','수업중','010-0000-0000');

select* from board;
commit;

select boardid, nvl(hp,'EMPTY') as "hp"  from board;   --hp컬럼에서 널값을 만나면  엠프티로 바꿔라. 

--문자열 검색
--주소검색 : [역] 입력 >> 역삼동 , 역동 , ....(Like 패턴 검색) 유사한 것들을 뽑아내는 검색
--문자열 패턴 검색 연산자 : like
--like 연산자를 도와주는 애가 있다. (와일드 카드 문자 ( % : 모든 것,  _ : 한문자) 결합

select ename
from emp
where ename like '%A%';   --%A% A라는 단어를 찾는데 앞이나 뒤에 어떤것이 와도 상관이 없다.   ename 컬럼의 데이터 중에서 A가 들어있는 모든 글자를 찾아주세여.   

select ename
from emp
where ename like '%a%';  --문자열 데이터 검색에서는 엄격하세 대소문자 구별한다.

select ename
from emp
where ename like 'A%'; --이름의 첫글자가 A인 사람을 찾아라.

select ename
from emp
where ename like'%S'; --이름의 마지막 글자가 S인 사람

--select * from member where name like '%수한무%';  한글도 됨

select ename
from emp
where ename like '%LL%';  --LL이 들어간 모든 글자를 가져와랏         LL이 붙어 있어야만함!

select ename
from emp
where ename like '%L%L%';   --    L이 2개 있기만 하면 됨.   검색범위가 얘가 더 넓어짐

select ename
from emp
where ename like '%A%A%';   --ADAMS  가 나옴

select ename
from emp
where ename like '_A%';   --첫글자는 어떤것이 와도 상관없고 두번째글자는 반드시 A가 와야만 함.     = 두번째 글자가 A로 시작하는 모든 것     - :한문자    로 해석한다.

--정규 표현식
--regexp_like

select * from emp where regexp_like(ename,'[A-C]');
--정규 표현 예제 5개 만들기 (추후 카페 과제에 올리심..)

------------------------------------------------------------------------------------------

--데이터 정렬하기 
--order by 컬럼명   :  문자열, 숫자, 날짜   정렬 가능함
--오름차순 : asc : 낮은순 (default)
--내림차순 : desc : 높은순

select * 
from emp
order by sal;    --default 오름차순 정렬 됨  

select *
from emp
order by sal asc;    --같은 결과 나옴

--급여를 많이 받는 순으로 정렬해서 출력하세요.

select *
from emp
order by sal desc;   --급여가 많은사람 맨위  차차 낮아진다.


--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일 데이터를 출력하세요.
--( 가장 최근에 입사한 순으로)

select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
select 절                              3
from 절                                1
where 절                              2
orderby 절  이라고 부른다.      4    (select 결과를 정렬)>> DB 가장 힘든 작업

불러오고, 걸러내고, 컬럼 정하고, 정렬한다.
1-2-3 먼저 해서 실행 없으면 4를 붙이는 방식으로 해도 좋다. 
*/

--순서를 알면 해석하기 편리하다.
select empno, ename , sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc; 

--order by 컬럼명 desc , 컬럼명 asc , 컬럼명 desc    이렇게 세개를 쓰기도 함    ********************************무진장 많이 쓴다. 게시판 코드다.
--where 절은 걸러낼거 없으면 생략가능하다

select job ,  deptno
from emp
order by job asc, deptno desc;     --grouping 원리
--얘도 그룹핑이다.  job은 알파벳순으로 정렬 한다음에 그 그룹안에서 deptno 는 높은 숫자먼저 내림차순으로 정렬한다. 

-------------------------------------------------------------------------------
--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것(기본: 중복값 배제) 
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것(중복값 허용) 
--테이블에 있는 데이터와 테이블에 있는 데이터 ... 한 테이블의 데이터 들에 다른 테이블 데이터들이 가서 뒤로 붙는다       

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
       
  --union   --ut 의 방에 uta가 놀러간다  --중복값을 제거하고 나와서 4개가 나옴
  select * from ut
  union
  select * from uta;
  
  --union all    --중복값까지 전부다 나온다.
 select * from ut
  union all
  select * from uta;
  
  --union------------------------------------------------------------------대응되는 컬럼의 타입과 개수만 맞으면 다 합칠수 있다.
  --1. 대응 되는 컬럼의 타입이 동일해야 한다.*****************************************************************
  select empno, ename from emp    --emp방에 dept가 놀러간다. 
  union
  select dname , deptno from dept;
--expression must have same datatype as corresponding expression  동일한 컬러타입이 아니라서 오류 난다. 


  select empno, ename from emp   
  union
  select deptno , dname from dept;
  --컬럼의 타입이 동일해서 된다.
  
  --2. 대응되는 컬럼의 개수가 동일해야 한다.    (null 이 도움된다.. 착한일)****************************************
  select empno, ename, job, sal from emp
  union
  select deptno, dname, loc from dept;
  --query block has incorrect number of result columns       emp 방이 4개인데 dept가 3개를 가지고 들어가서 그렇다.
 
  select empno, ename, job, sal from emp
  union
  select deptno, dname, loc, null from dept;    --null 을 넣어서 개수를 맞춰준다.
  
  --실무 >> subquery (in line view)   실무에서는 이런식으로 쓰인다.  유니온 된 결과를 가지고 놀때가 많다. 
  select empno , ename
  from (
            select empno, ename from emp   
            union
            select deptno , dname from dept
          ) order by empno desc;
          
  --여기까지 초보 걸음마......의무적으로.....테이블 한개...(단일테이블)
  
  ---------------------------------------------------------------------여기서 부터 오라클의 함수 배운다-------------------------------------------
  --오라클 함수(보조 교재 : 50 page)
  
  /*
 1.2.2 단일 행 함수의 종류 
 
 1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다. 
 2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다. 
 3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를 제외하고 모두 날짜 데이터형의 값을 RETURN 한다. 
 4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.  (to_char(), to_number(), to_date())
 5) 일반적인 함수 : NVL, DECODE 
 
  */
  /*
  한글 문제.......인지하고 있으면 된다.  추후변경 가능 
  
  select * from SYS.nls_database_parameters;
  --NLS_CHARACTERSET	AL32UTF8  한글 3byte 인식
  --KO16KSC5601 2Byte (현재 변환하면 한글 다깨짐) 그래서 그냥 사용가능한 바이트 수를 늘리고 쓰자!
  select * from SYS.nls_database_parameters where parameter like '%CHAR%';
  */
  
  --문자열 함수
  
  select initcap('the super man') from dual;     --The Super Man    
  
  select lower('AAA') , upper('aaa') from dual;    --aaa	AAA
  
  select ename, lower(ename) as "ename" from emp;    --컬럼내용들이 소문자로 나온다.
  
  select * from emp where lower(ename) = 'king';  --7839	KING	PRESIDENT		1981-11-17 00:00:00	5000	3500	10
  
  --문자열 개수
  
  select length('abcd') from dual; --4
  
  select length('홍길동') from dual; --3
  
  select length(' 홍 a길 동') from dual;  --7   공백과 알파벳 한글 다 인지한 값
  
  --결합 연산자 ||
  --concat()
  
  select 'a' || 'b' || 'c'  as "data" from dual;    --abc
  
  select concat('a','b','c') from dual;     --오류
    select concat('a','b') from dual;   --ab     
    --concat 은 두개의 문자를 합쳐주는 함수이다.
    
    select concat(ename,job) as "concat" from emp;  --SMITHCLERK ....    
     select ename || '      '  || job as "concat" from emp;  --SMITH      CLERK   ....       --얘는 유연하다.. 가운데에 공백도 넣을 수 있다.
     
--부분 문자열 추출
--언어마다 비슷한듯 다르다. 
--java(substring)
--oracle(substr)

select substr('ABCDE',2,3)  from dual;  --BCD              2번째 부터 3개뽑아라
select substr('ABCDE',1,1)  from dual;  --A   자기자신   1번째부터 1개.
select substr('ABCDE',3,1)  from dual;  --C                  3번째 부터 1개.
  
select substr('ABCDE',3) from dual;     --CDE               한개만 주어지면 주어진 값부터 쫙 가져온다. 
  
select substr('ABCDE',-2,1)  from dual;--D                   - 는 뒤에서 부터 센다.     자바에서는 뒤에서 부터 안되지만 얘는 된다.
select substr('ABCDE',-2,2)  from dual;--DE                 

/*
사원테이블에서 ename 컬럼 데이터에 대해서 첫 글자는 소문자로 나머지 문자는 대문자로 출력하세요.
단, 위 결과를 하나의 컬럼으로 출력하세요. 
컬럼의 이름은 fullname
첫 글자와 나머지 문자 사이에 공백하나를 넣어서 출력하세요.
*/

select lower(substr(ename,1,1)) || '  ' || substr(ename,2) as "fullname"
from emp;

--lpad , rpad (채우기)

select lpad('ABC' ,10, '*') from dual; --*******ABC
select rpad('ABC',10, '^') from dual; --ABC^^^^^^^

--Quiz   dual 로 연습
--사용자 비번: hong1006 
--화면 : ho****** 출력하고 싶어요. ( 비번이 네글자여도  : 1004 > 10**)
select  rpad(substr('hong1006',1,2),length('hong1006'),'*') 
from dual; 
--rpad 의 파라메터를 함수로 하나 씩 채워준거다. 

select  rpad(substr('1004',1,2),length('1004'),'*') 
from dual;
--rpad 의 파라메터를 함수로 하나 씩 채워준거다. 

--emp 테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지 *로 표시하세요.  table 로 연습
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

--하나의 컬럼으로 결과값을 출력
--100 : 123456-*******
--200 : 234567-*******
--컬럼명은 "juminnumber"

select id || ' : ' ||  rpad(substr(jumin,1,7),length(jumin),'*')  as "juminnumber"
from member2;
--100 : 123456-*******
--200 : 234567-*******

--rtrim 함수 
--[오른쪽 문자를 지워라]
select rtrim('MILLER','ER') from dual;          --MILL    --첫번째 파라메터에서 두번째파라메터를 오른쪽에서 찾아서 지워라.
select ltrim('MILLLLLLER','MIL') from dual;  --ER        

select '>' || rtrim('MILLER         ',' ') || '<' from dual;     -- >MILLER<           --오른쪽에 있는 공백을 지운다.

--치환함수(replace)
select ename, replace(ename, 'A', '와우')
from emp;
--SMITH	SMITH
--ALLEN	와우LLEN

----------문자열 함수(END)------------------------------------------------------------------------------------------------------------------------

--[숫자 함수] 
--round(반올림함수)
--trunc(절삭함수)
--mod()   나머지 구하는 함수 


--round
--        ...  -3 -2 -1  0  1  2  3 ...
select round(12.345,0) as "r" from dual;  --12       정수부분만 남겨라  !!!!
select round(12.567,0) as "r" from dual;  --13
select round(12.345,1) as "r" from dual;  --12.3    두번째 파라메터가 1이면   소수점이하 첫번째 자리 까지 남겨라!!
select round(12.567,1) as "r" from dual;  --12.6    하나 자르고 소수점 두번째자리가 반올림되어서 12.6 이 나온다.

select round(12.345,-1) as "r" from dual; --10      십의자리까지 남기고 일의 자리는 반올림 한다.
select round(15.345,0) as "r" from dual;   --20     그래서 얘는 20
select round(12.345,-2) as "r" from dual;  --0       반환자리 값이 없어서 0 이 나온다.



--trunc(절삭함수)
select trunc(12.345,0) as "r" from dual;  --12       
select trunc(12.567,0) as "r" from dual;  --12
select trunc(12.345,1) as "r" from dual;  --12.3    
select trunc(12.567,1) as "r" from dual;  --12.5    

select trunc(12.345,-1) as "r" from dual; --10     
select trunc(15.345,-1) as "r" from dual; --10    
select trunc(12.345,-2) as "r" from dual; --0       


--mod()  나머지구하는 함수
select 12/10 from dual;                          --1.2    몫은 1  나머지 2
select mod(12,10) from dual;                  --2      나머지만 구해진다.  

select mod(0,0) from dual;                      --0     여기선 구해지넹. 자바에서는 오류 나느데!

---------------------------------------------------숫자함수 [END]------------------------------------------------------------------
--[ 날짜 함수 ] 
select sysdate from dual;  --2020-04-01 12:16:15
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';    요정도 기억하면 좋다.

--날짜 연산 (POINT)
--Date + Number >>  Date
--Date - Number >>  Date 
--Date - Date >> Number   (일수가 나온다)      근속일수 같은거 구할때 쓴다....



select hiredate from emp;

select MONTHS_BETWEEN('2018-01-01','2010-01-01') from dual;      --96     96 개월 차이난다~!

select MONTHS_BETWEEN(sysdate,'2010-01-01') from dual;              --123      얘는 딱 떨어진다.
 
select MONTHS_BETWEEN(sysdate,'2010-01-15') from dual;      --  122.565055630227001194743130227001194743       이렇게 나오는데 잘라내거나  반올림하고 싶으면 위의 함수를쓰면됨

select round(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) from dual;    --122.6

select trunc(MONTHS_BETWEEN(sysdate,'2010-01-15'),1) from dual;      --122.5

--POINT
--날짜 형식의 문자열을 날짜로 바꾸는 함수(to_date()) 
select to_date('2020-04-01') + 100 from dual;   --2020-07-10 00:00:00
select to_date('2020-04-01') - 100 from dual;   --2019-12-23 00:00:00
select sysdate + 1000 from dual;   --2022-12-27 12:26:39 

--Quiz
--1.사원 테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단 근속월수는 정수부분만 출력하세요(반올림 하지 마세요)

select ename, hiredate,  trunc(MONTHS_BETWEEN(sysdate, hiredate),0) as "근속월수"
from emp;


--2. 한달이 31 일 이라는 기준에서 근속 일수를 구하세요 (반올림 하지 마세요)
--함수 사용하지 말고 >> (날짜 - 날짜 >> 150 일)


--이건 내가 한거
select trunc(trunc(sysdate - hiredate,0)/31) as "근속월수"
from emp;

--선생님 답안
select trunc((sysdate-hiredate) /31,0) as "근속월수"
from emp;

------------------날짜 함수[END]----------------------------

--[변환함수] : TODAY POINT
--오라클 : 문자, 숫자, 날짜
--to_char() : 숫자 -> 문자 (1000 -> $1000)   숫자를 문자 형태로...어떤 조합된 포메팅을 하기 위한 방법으로 쓰인다.    *************************************이거 제일 많이 쓴다. 
--                날짜 -> 문자 (2020-01-01 -> 2020년01월01일) format

--to_date() : 문자 -> 날짜 >>  select '2020-12-12' + 100
--                                        select to_date( '2020-12-12') + 100

--to_number() :문자 -> 숫자 (내부적으로 자동 현변환 지원됨)

select '100' + 100 from dual;   --200
select to_number('100') + 100 from dual;   --내부적으로 이렇게 해주고 있다. 

--to_number  (문자 ->숫자) 자동 형변환
select '1' + 100 from dual; --101
select to_number('1') + 100 from dual;

--to_char() : format >> 숫자, 날짜(형식문자)
select to_char(sysdate) || '일' from dual;  --2020-04-01 12:55:34일

--pdf 69page (형식문자 표)
select sysdate,
to_char(sysdate,'YYYY') || '년' as "YYYY",
to_char(sysdate,'YEAR'),
to_char(sysdate,'MM'),
to_char(sysdate,'DD'),
to_char(sysdate,'DY')
from dual;
--2020-04-01 12:58:03	2020년	TWENTY TWENTY	04	01	수   이렇게 나온다.

--입사 월이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요.
select empno as"사번", ename as"이름",
to_char(hiredate,'DD') as "입사일",
to_char(hiredate,'YYYY') as "입사년도",
to_char(hiredate,'MM') as "입사월"
from emp
where to_char(hiredate,'MM')  = '12';

select to_char(hiredate,'YYYY MM DD') from emp;   --1980 12 17 이건 문자열이다.

select to_char(hiredate,'YYYY"년" MM"월" DD"일"') from emp;    --1980년 12월 17일     특수한 표현으로  'YYYY"년" MM"월" DD"일"'     해주야 한다.

--to_char() 숫자 -> 문자로( 형식문자)
--pdf 파일 71 page 표
--100000 >> 출력 >> $1,000,000( 문자)

select '>' || to_char(12345,'999999999999') || '<' from dual;
-->        12345<

select '>' || to_char(12345,'0999999999999') || '<' from dual;
--> 0000000012345<

select '>' || to_char(12345,'$9,999,999,999') || '<' from dual;
-->        $12,345<

select sal , to_char(sal,'$999,999') from emp;
--800	     $800
--1600	   $1,600



----HR 계정으로 전환-------------------------------------------------------------------------------------------------------------------------------------오른쪽위
--이렇게 할 경우 HR 안의 스키마? 들을 볼 수 있다.
select * from employees;

/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서
fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 
연봉(급여 *12)을 구하고 
연봉의 10%(연봉 * 1.1)인상한 값을 출력하고 
그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select concat(first_name,last_name) as "full name",
to_char(hire_date,'YYYY MM DD') as"입사일자",
salary,
salary *12 as "연봉" ,
 to_char((salary *12)*1.1,'$9,999,999,999') as "인상분",
 hire_date
from employees
where  to_char(hire_date,'YYYY')  >= '2005' 
order by "연봉" desc;    --select 에 있는 alias를 사용할수 있다.


--bit 계정으로 전환---------------------------------------------------------------------------------------------------------------
----- 변환함수( to_char(), to_date() , to_number()) -----------------------------------------

--[일반함수(프로그래밍적인 성격)]
--nvl() ,  nvl2() >> null 처리 담당
--decode() 함수 >> java if문(switch)
--case() 함수 >>  java if문(switch)

select * from emp;

select comm, nvl(comm,0)
from emp;

create table t_emp(
  id number(6) , --6자리 정수값
  job varchar2(20)
);


insert into t_emp(id,job) values(100,'IT');
insert into t_emp(id,job) values(200,'SALES');
insert into t_emp(id,job) values(300,'MGR');
insert into t_emp(id,job) values(400);
insert into t_emp(id,job) values(500,'MGR');


select id, decode(id,100,'인사부'    --한줄로 쓰면 헷갈리니까 내려서 쓰는 습관을 들이면 좋다.
                                   ,200,'관리부'
                                   ,300,'회계부',
                                    '기타부서') as "부서"   
from t_emp;



select * from t_emp;
commit;


select deptno, decode(deptno,10,'인사부'
                                          ,20,'관리부'
                                          ,30,'회계부',
                                          '기타부서') as "부서"    --부서라는 컬럼을 만들고,    자바라면 if(10 == "인사부") 처럼 걸러지고 else 기타부서가 나오게 만들어 놓았다.    
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
t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin컬럼의 앞자리가 1이면
'남성' 출력 2이면 '여성' 3이면 '중성' 이라고 출력하면 된다.   그외에는 '기타'

*/
select id, decode(substr(jumin,1,1),1,'남성' , 
                                                 2,'여성',
                                                 3,'중성',
                                                  '기타') as "gender"   
from t_emp2;

---------------------------------------------------------------------커피퀴즈.
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
          case zipcode when 2 then '서울'
                              when 31 then '경기'
                               when 32 then '강원'
                                when 41 then '제주'
                                else '기타지역'
        end "regionname"
 from t_zip;       


/* emp
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요

1.case 컬럼명 when 결과 then 출력     (= 에대한 조건을 처리할때 쓰는것)
                    when 결과 then 출력
                     when 결과 then 출력
                     
2. 비교조건 일때는
  case when 컬럼명 조건 비교식 then 
         when 컬럼명 조건 비교식 then
         when 컬럼명 조건 비교식 then
*/

select sal ,
          case when sal<= 1000 then '4급'
                              when 31 then '3급'
                               when 32 then '2급'
                                when 41 then '1급'
                                else '특급'
        end "regionname"
 from emp;       
 
 
 -----------------------------------------------------------
--문자함수 
--숫자함수
--날짜함수
--변환함수 (to_char ,to_date , to_number)
--일반함수 (nvl() , decode() , case())
------------------------------------------------------------
 --[집계함수]  page 75
 /*
 1. count()    > row 줄수, count(컬럼명) >> 데이터 건수(null 을 포함하지 않는다.)
 2. sum()     
 3. avg()
 4. max()
 5. min()
 등등....
 
 집계함수
 1. 집계함수는 group by 절과 같이 사용
 
 2. 모든 집계 함수는 null 값을 무시합니다. 
 
 3.select 절에 집계함수 이외 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시 해야된다.
 
 */
 
 select count(*) from emp; --14건
 select count(comm) from emp; --6 건 ( null 값을 무시)
 select count(empno) from emp; --14
 
 select count(nvl(comm,0)) from emp; --null >> nvl()
 
 --급여의 합
 select sum(sal) as "급여합" from emp; --29025
 
 select avg(sal) as "평균급여" from emp; --2073.214285714285714285714285714285714286
 
 select round(avg(sal),0) as "평균급여" from emp;  --2073
 
 --사장님이 회사 총 수장 얼마나 지급 되고 있나? ( 수당의 평균이 얼마지?)
 select trunc(avg(comm),0) from emp;   --721   달러
 select trunc(sum(comm) /6) from emp; -- 사원수(6명)
 
 --노조 ..보고서...누구냐.......
 
  select trunc(avg(nvl(comm,0)),0) from emp;  --309달러
  select trunc(sum(comm) /14) from emp;    
  
  --회사의 규정이 (전체 사원수로 나눈다...309)
  --회사의 규정이 (받는 사람에 대해서만 책정한다면 721)
  
  
  --항상 데이터를 받는 컬럼에 null값이 있는지 확인해봐야한다.
  --검증: 코드
select count(*) from emp where comm is null;  --8
  
select count(*) from emp where empno is null;   --0

select max(sal) from emp;

select min(sal) from emp;

--POINT 
select empno , count(empno) from emp;  --empno는 14건, count() 는 1건 이라서 안된다.
--not a single-group group function
select sum(sal) , avg(sal) , max(sal), min(sal), count(sal), count(*) from emp; --row 하나에 만들어져서 문제 없다.


--부서별 평균 급여를 출력하세요
--not a single-group group function
select deptno , avg(sal) from emp;


select deptno , avg(sal)
from emp
group by deptno;

--직종별 평균 급여를 구하세요.
select job, avg(sal)   --앞에 job을 안붙이면 어떤 데이터의 평균인지 알수 없으니까 붙여야 한다.
from emp
group by job;

select * from emp;
--직종별 평균 급여, 급여합, 최대급여, 최소급여, 건수를 출력하세요.
select job, trunc(avg(sal)), sum(sal) , max(sal), min(sal), count(sal)
from emp
group by job;   --얘가 코드 오류 안나도록 뭔가를 도와주는데 좀따 공부하면 너가 알겠지..?


select job, avg(sal), sum(sal) , max(sal), min(sal), count(sal)
from emp;


/*
grouping 원리

distinct 컬럼명1 , 컬럼명2
order by 컬럼명1, 컬럼명2
group by 컬럼명1 , 컬럼명2, 컬럼명 3   

세개가 같은 논리이다.

*/
  
--부서별 ,직종별 급여의 합을 구하세요.
 select deptno, job, sum(sal) ,count(sal)
 from emp
 group by deptno, job
 order by deptno;
 
--부서 번호 가져오고, 그안에 직업들 그룹핑한담에 각 부서와 직업별로 합계를 구했다. 맞당.

/*   일단은 무조건 from where 그리고 group by 로 묶는다.  그리고 select 한담에 order by 로 정렬한다.    (having) 배우기 전에 쓴거

하나의 테이블을 대상으로 쓸수 있는 구문...


select             5
from              1
where             2
group by         3
having             4     (혼자못쓰고 group by 가 있어야함.   group by 의 조건절이라서!)
order by          6

*/
-----------------------------------------------------------------------------------------------------20200402
--Quiz    직종별 평균 급여가 3000 달러 이상인 사원의 직종과 평균급여를 출력하세요.

--group by 조건절 >>having 절 
--where avg(sal) >= 3000 순서상...(x)
select job, avg(sal) as "평균급여"
from emp
group by job   -- 이 결과에서  조건을 거는 것   그게바로 having!!!!!!
having avg(sal) >= 3000 ;  
--PRESIDENT	5000
--ANALYST	3000

--from 조건절 >>where           *******
--group by 조건절 >> having    *******

--from 절다음 순서인데 where절에서는 순서상 group by 가 안되니까 오류남.
--쿼리는 한번에 다만들지 말고 조금씩 실행해보면서 만드는게 더 좋다!!!!!!!!!!!!!!!!


/* 사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 사원들의 목록을 출력하세요
--급여의 합이 낮은 순으로 출력하세요 */

select  job, sum(sal) as "급여합"
from emp
where comm is not null
group by job  
having  sum(sal) >= 5000
order by sum(sal);

select  job, sum(sal) as "sumsal"
from emp
where comm is not null
group by job
having  sum(sal) >= 5000  --여기에는 alais 네임이 올수 없음
order by "sumsal";  --여기에는 alais 네임이 올수 있음

/* 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,인원수 , 급여의 합을 출력하세요 */

select * from emp;

/* 내가한 틀린거. 
select count(deptno), count(ename), sum(sal)
from emp
group by deptno
having count(deptno) > 4 ;
*/

select deptno, count(*), sum(sal)
from emp
group by deptno
having count(*) >4;



select deptno, count(*) as "부서별 인원수"  ,sum(sal) as "부서별 급여의 합"
from emp
group by deptno
having count(*) > 4;


/* 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */

select job, sum(sal) as "급여합"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000;

select job , sum(sal) as "sumsal"
from emp
where job != 'SALESMAN'
group by job
having sum(sal) > 5000    --having에서 salesman 을 걸러도 되지만,  여기까지 가져오지 않는게 성능적으로 좋다.
order by "sumsal" desc;

----------------------------------------------------------------------------------------------------------------------------------------JOIN
--  join    (pdf 85 page)    
-- 관계형 데이터 베이스 (RDBMS)    relations database management system   >> (ORDB)  어려워서 쓰지 않는다 >> Framework (객체매핑을 할 수 있다 : JPA, Mybatis ) >> noSQL : cassandra , MongoDB  
-- 관계형 데이터 베이스 (RDBMS)    relations database management system 이게 우리가 하고 있는거.

--서로 나눠진 테이블에서 정보를 뽑아오는 것~!!!!!!!!!
--하나의 테이블에 모든 정보를 다 넣어도 나쁠 건없지만..  정보를 수정할때 수정 횟수등에 차이가 난다.  
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

--JOIN 은 종류가 여러개있음. --입사시험 문제다.. 
--1.등가조인 (equi join)  >> [inner] join    inner는 생략가능함
--원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 로 매핑 하는것. 
--JOIN 문법
--1. SQL JOIN문법(제품...)
--2. ANSI 문법(권장)(표준)

--SQL JOIN 문법   
select *
from m, s
where m.m1 = s.s1;  -- 테이블끼리의  값은 가져와서 옆에 붙인다. null 값은 들고오지 않는다.

select m.m1, m.m2, s.s2    --m1과 s1은 이미 같은니까 s1컬럼은 빼고 가져온다.
from m, s
where m.m1 = s.s1;


--ANSI 문법  (권장)
--where (from절의 조건절) 
--where join 조건과 일반 조건을 혼재하면 혼란스럽다. 
--그럼 join 의 조건을 분리하자!    >>   on 절
select *
from m inner join s    
on m.m1 = s.s1;

select m.m1 , m.m2, s.s2
from m join s  -- inner 생략 가능    
on m.m1 = s.s1;

--사원번호, 사원이름, 사원부서번호, 사원부서명을 알고 싶어요    
--join 테이블에 가명칭 부여 >> 그 이름으로 접근
select e.empno , e.ename , e.deptno , d.dname
from emp e join dept d
on emp.deptno = dept.deptno;

-join (2, 3,......) 여러개 테이블 조인할수 있음 

--SQL JOIN 문법(추천하지 않는 문법)
select m.m1 , m.m2 , s.s2 , x.x2
from m , s, x
where m.m1 = s.s1 and s.s1 = x.x1;
-- a == b , b == c  , a == c 

--Ansi 문법
select m.m1 , m.m2 , s.s2 , x.x2
from m join s on m.m1 = s.s1
            join x on s.s1 = x.x1;
            
 ------HR 계정으로 이동-----------------------------------------------------------------------     

select * from employees;
select * from departments;    --department_id
select * from locations;     --location_id


--Quiz  1. 사번, 이름(last_name) , 부서번호, 부서이름 출력하세요.

select   e.employee_id , e.last_name , e.department_id, d.department_name
from employees e join departments d
on e.department_id = d.department_id;
--106 명 
--107명인데 why >> 106명이 나오나??   그것은 null 값을 출력 하지 않기 때문이다. 
select count(*) from employees;    --107
--join 은 null을 포함하지 않아요.

SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL;    --178   번 사원이 부서 id >> null
--178번 사원이 부서id >> NULL
--등가조인으로 해결 불가(outer join) 사용하면 해결가능...

--Quiz 2.사번, 이름(last_name), 부서번호, 부서명, 지역코드, 도시명 을 출력하세요.



select e.employee_id,
         e.last_name,
         e.department_id,
         d.department_name,
         l.location_id,
         l.city
from employees e join departments d on e.department_id = d.department_id
                           join locations l on d.location_id = l.location_id;

                       
                               
                               
----------------------------BIT로 이동-----------------------------------------------------                 
--bit 계정--

--2. 비등가 조인(non -equi join) => 의미만 존재 => 등가조인과 문법이 똑같음
--원테이블과 대응되는 테이블에 있는 컬럼이 1:1 매핑되지 않는 경우

select * from emp;
select * from salgrade;

select e.empno , e.ename , e.sal , s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal; 

----------------------------------------------------------------------------------------------
--3. outer join (equi join + null)  
--outer join ( 주 종관계 파악)  >> 주가 되는 테이블에 있는 남은 데이터 가져오기 


-- 문법 3가지
-- left outer join (왼쪽 주인)
-- right outer join (오른쪽 주인)
-- full outer join ( 왼쪽 주인 + 오른쪽 주인 >> union)

--left [outer] 생략 가능   join
--left join
--right join

select *
from m join s
on m.m1 = s.s1;

select *   --주인쪽의 남는 데이터를 가져와서 붙여준다.     
from m left outer join s
on m.m1 = s.s1;

select *   --얘도 마찬가지로..
from m right outer join s
on m.m1 = s.s1;

--left , right outer union  중복제거후 데이터를 다 가져온다. 왼쪽게 먼저 붙는듯..   
select *   
from m full outer join s
on m.m1 = s.s1;

--------------------------------------------------HR 계정으로 가기--------------------------------------------
--위에서 안나왔던 1명  null이라서....안나온 한명을 뽑아본다.
SELECT e.EMPLOYEE_ID , e.LAST_NAME ,e.DEPARTMENT_ID ,
       d.DEPARTMENT_NAME 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID  = d.DEPARTMENT_ID
ORDER BY e.EMPLOYEE_ID;

----------------------------------------------------Bit 계정으로 가기------------------------------------------------------------
--self join (자기참조) -> 의미 -> 문법(등가조인)
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우     ex)매니저 찾기 마냥.
--조인 (테이블 1개 이상 )
--테이블의 가명칭을 달리해서 사용할 수 있다. 

--관리자를 따로 테이블 만들 필요가있을까? 이중으로 데이터 관리할 필요가 없다..   셀프조인의 전형적인 유형이다. 

select e.empno , e.ename ,m.empno, m.ename
from emp e join emp m 
on e.mgr = m.empno;

--문제 : 14명의 사원이 있지만  >> 13명이 나옴.   
select * from emp;

select e.empno , e.ename ,m.empno, m.ename
from emp e left join emp m 
on e.mgr = m.empno;
--이건 14명 다나온다.  




----------------------------------------------------------------------------JOIN test----------
select * from emp;
select * from dept;
select * from salgrade;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ename, e.deptno, d.dname  
from emp e inner join dept d    
on e.deptno = d.deptno;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.


select e.ename, e.job, e.deptno, d.dname 
from emp e inner join dept d   
on e.deptno = d.deptno 
where d.loc = 'DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.

SELECT e.ename, d.dname 
FROM emp e join dept d 
on e.deptno = d.deptno and ename LIKE '%A%';

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.

select e.ename, d.dname  , e.sal
from emp e inner join dept d    
on e.deptno = d.deptno 
where e.sal >=3000;
 
 
-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.

select e.ename, d.dname  , e.job
from emp e inner join dept d    
on e.deptno = d.deptno and e.job = 'SALESMAN';

 
-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,   ***********
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
select * from emp;
select * from dept;
select * from salgrade;

select e.deptno, e.ename, e.sal*12  , nvl(e.sal*12 + e.comm,0) as"실급여" , s.grade
from emp e inner join salgrade s    
on e.sal BETWEEN s.LOSAL  AND s.HISAL 
where e.comm is not null;

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

 select e.ename, d.dname  , e.deptno, e.sal, s.grade
from emp e  join dept d  on e.deptno = d.deptno  and d.deptno = 10
                   join salgrade s on e.sal BETWEEN s.LOSAL  AND s.HISAL; 

                
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름, ********
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.

select e.ename, d.dname  , e.deptno, e.sal, s.grade
from emp e  join dept d  on e.deptno = d.deptno  
                   join salgrade s on e.sal BETWEEN s.LOSAL  AND s.HISAL
where e.deptno in(10,20)                   
order by  d.deptno asc, e.sal desc;                  
 


 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
 
 select e.empno, e.ename, p.empno , p.ename
 from emp e join emp p
 on e.empno = p.mgr;
 
 
SELECT E.EMPNO, E.ENAME , M.EMPNO, M.ENAME
FROM EMP E  left outer join EMP M
on e.MGR = m.EMPNO;

-----------------------------------------------------------------------------------------------------------------------------------------------------subquery

--subquery 오라클.pdf (100page)
--sql 의 꽃이다. >>sql 의 만능 해결사  
--함수 를 써도 안나오고>> 조인 을 써도 안나오면...>> subquery  

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의 
--사번, 이름, 급여를 출력하세요.

select avg(sal) from emp;
--일단 구해놓고
select*
from emp
where sal > 2073;  --이렇게 한다. 

select *
from emp
where sal > (select avg(sal) from emp);  --이게 subquery (쿼리 안에 들어가는 쿼리)를 subquery 라고 한다.

--규칙이 있따.   유일값이어야 한다. 괄호안에 넣아야만 한다.
--subquery
/*

1. single row subquery : subquery 결과 row 1개 ( 단일컬럼의 단일값)
2. Multi row subquery :  subquery 결과 row 1개 이상( 단일 컬럼 여러개의 값)
구별하는 이유는  :사용되는 연산자....

multi row : IN, NOT IN(ANY, ALL)
ALL : sal > 1000 and sal > 2000 and sal.......     데이터를 and 로 풀어낸다.
ANY:  sal > 1000 or  sal > 2000 or  sal...           데이터를 or 로 풀어낸다.

정의(subquery)
1. 괄호 안에 있어야 한다. >>  (select sal from emp)
2. 단일 컬럼으로 구성 되어야함 >>  (select sal , deptno from emp) (x)     두개의 컬럼 중에서 어떤 컬럼을 판단할지 알수가 없어서 안쓴다.
3. 단독으로 실행 가능 해야함... 위에서 평균 구한것처럼..

실행순서
1. 무조건 subquery  먼저 실행 
2. subquery 의 결과값을 가지고 main query 실행 한다. 

*/

--사원테이블에서 jones 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요.

-jones  얼마 받는지 안다음에  뽑아야함.

select sal from emp where ename = 'JONES';  --2975

select empno, ename, sal
from emp
where sal >(select sal from emp where ename = 'JONES'); 


-- 2000 이상인급여를 가진 직원을 뽑아내라   ........  으로 그냥 문제를 내봄.
--subquery 가 리턴하는 데이터가 여러개다. 

select * from emp;
SELECT sal FROM emp WHERE sal > 2000;  --이렇게 하면 한개의 컬럼에 여러개의 데이터가 나온다.

SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal IN (SELECT sal FROM emp WHERE sal > 2000);
--WHERE sal = 2975 or sal=2850 or sal=2450 or sal=3000   이랑 같은 건데 In()으로 줄였다.
--2975 2850 2450 3000 5000 3000
--single-row subquery returns more than one ROW

SELECT * 
FROM emp 
--WHERE sal > (SELECT sal FROM emp WHERE sal > 2000);
WHERE sal NOT IN (SELECT sal FROM emp WHERE sal > 2000);
--NOT IN (부정의 and)
--2975 2850 2450 3000 5000 3000  가 아닌애들을 뽑아낸다.
--where sal != 2975 and sal != 2850 and sal != 2450 and ..



--Quiz  부하 직원이 있는 사원의 사번과 이름을 출력하세요.   ********************
--사번이 mgr 컬럼에
select mgr from emp;

select * from emp;

select *
from emp where empno in(select mgr from emp);    --여기서 출력되는 사람들은 최소한 한명 또는 그 이상의 부하직원을 가지고 있는 사람
--empno=7788 or empno=7902 or empno =null              ****** or 라서 null 의 영향을 안받는다. *****



--Quiz  부하 직원이 없는 사원의 사번과 이름을 출력하세요.   ********************

select *
    from emp where empno not in(select mgr from emp);  --값이 안나옴...
--empno != 7902 and empno != 7788 and empno is not null         ***** and 는 null 이 있으면 결과는 그냥 null 이다. *****

select *
from emp where empno not in(select nvl(mgr,0) from emp);  --이건 값이 나옴


select *
from emp where empno not in(select mgr from emp where mgr is not null); --suquery 문에서 null 을 빼버리기





--QUIZ      
--king 에게 보고하는 즉 직속상관이 king 인 사원의 사번, 이름, 직종, 관리자 사번 을 출력하세요.
select * from emp;

select empno from emp where ename='KING';

select empno, ename, job, mgr
from emp where mgr = (select empno from emp where ename='KING');


--Quiz    20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 
--사원의 사번, 이름, 급여, 부서번호를 출력하세요.


select max(sal) from emp where deptno =20;

select empno, ename, sal, deptno
from emp
where sal> (select max(sal) from emp where deptno =20);

--POINT--
--subquery >> select 절에 
--              >> from  절에
--              >> where 절에    도 쓸수 잇다.


select *
from emp 
where deptno in(select deptno from emp where job='SALESMAN')
          and sal in(select sal from emp where job = 'SALESMAN');


--QUIZ   (고급쿼리에 속하는 문제다)       ******************************************************
--실무에서 활용
--자기부서의 평균 월급보다 더 많은 월급을 받는 
--사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요.

select * from emp;

select deptno,  round(avg(sal)) 
from emp
group by deptno ;

--1번 힌트 부서번호와 부서의 평균월급을 담고 있는 테이블이 존재한다면
--2번 힌트 from 절 subquery 사용가능 ...(가상 테이블)

/*
부서번호  평균급여
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

--from 절에 subquery 를 가상테이블로 쓸수 있음  그상태로 join 을 해서 참조당한다?


------------------------------------------------------------------------------------------------------------------------20200403
--subquery 연습문제 푸세요. 
--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.

 select empno, ename, sal
from emp
where sal >(select sal from emp where ename = 'SMITH'); 

SELECT ENAME, SAL
FROM EMP
WHERE SAL>(SELECT SAL
               FROM EMP
               WHERE ENAME='SMITH');

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,  ****************  (멀티 로우 문제 라서 in , not in, any , all 을 써야한다)********************
-- 부서번호를 출력하라.

select ename, sal, deptno
from emp
where sal in(select sal from emp where deptno = 10);

SELECT ENAME, SAL, DEPTNO
FROM EMP
WHERE SAL IN(SELECT SAL
                 FROM EMP
                 WHERE DEPTNO=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename not in('BLAKE');

SELECT ENAME, HIREDATE
FROM EMP
WHERE DEPTNO=(SELECT DEPTNO
                     FROM EMP
                     WHERE ENAME='BLAKE')
AND ENAME!='BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을     ********************가장 많은 유형이다.****************어떤 집계된 결과와 데이터를 비교하는 방식..   
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
select * from emp;

select empno, ename, sal 
from emp
where sal > (select avg(sal) from emp)
order by sal desc;

SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.

select empno, ename
from emp
where deptno in(select deptno from emp where ename like '%T%');

SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                       FROM EMP
                       WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다     *********all  은 데이터를 and로 푼다.  연산자 all을 붙이면 모든 조건을 만족해야한다.  
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.             *********where sal > 1600 and sal > 1250 and sal > 2850 and > .........이 조건들을 만족해야 하기때문에 max(sal) 을 쓰지 않아도 된다.     
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)                              ********* 이 모든 조건을 만족하는 거은 max함수 쓴 값이 나오는 2850 보다 크다. 
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
 
 
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.

select ename, deptno, job
from emp
where deptno = all(select e.deptno from emp e join dept d on e.deptno = d.deptno and d.loc = 'DALLAS');

SELECT ENAME, DEPTNO, JOB
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO    -- = 이 맞는데  IN
                      FROM DEPT
                      WHERE LOC='DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.

select e.ename, d.deptno  , e.job
from emp e inner join dept d    
on e.deptno = d.deptno and d.dname = 'SALES';

SELECT DEPTNO, ENAME, JOB
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                      FROM DEPT
                      WHERE DNAME='SALES');
 

 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)

select  ename, sal
from emp where mgr = (select empno from emp where ename='KING');

SELECT ENAME, SAL
FROM EMP
WHERE MGR=(SELECT EMPNO
                FROM EMP
                WHERE ENAME='KING');
 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는       *************!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.


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


--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의      ***********************다시 해보셈.
-- 이름, 월급, 부서번호를 출력하라.

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

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은           *******************다시해보셈
-- 사원들의 이름, 월급, 커미션을 출력하라.
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

------------------------------------------------------------------------------------------------------ 초급 개발자의 기본소양... 요정도까지...
/*
select 
from
where 
group by
having
order by

함수들  -문자, 날짜, 숫자, 변환, 일반, 집계

join - 하나 이상의 테이블에서 데이터 가져오기... 다중 테이블 : 관계

subquery

초급 개발자의 기본소양... 요정도까지...

*/

----------------------------------------------------------------------------------------------------------------------------                                                         DML
--[INSERT] , [UPDATE] , [DELETE]    >>  암기..
/*

                **오라클 기준**
                
DDL (데이터 정의어)  : create , alter ,drop , truncate (rename,modify)
DML (데이터 조작어)  :  insert (넣고), update(변경하고) ,delete (지우고)     20%
DQL (데이터 질의어)  : select                                                               70%
DCL (데이터 제어어) : 권한 (grant , revoke)  >>DBA (관리자: 모니터링: 백업 복원)
TCL (트랜잭션)중요  : commit, rollback, savepoint   

개발자 : CRUD    (Create > insert ,  Read  > selcet , U> update , D >Delete)    넣고, 읽고, 수정할수 있고, 지울수 있으면 된다. 개발자가 해야할거... 
*/

-- 무진장 중요하다~~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--DML  (트랜잭션: (Transaction):  하나의 논리적인 작업 단위)    >LOCK                                                                                                         트랜잭션의 정의에 대해 물어보는 문제가 꼭 나온다. 
--A라는 은행에서 돈을 인출해서 B라는 은행에 입금
--A : update .....1000 을  500으로    
--B : update .....1000 이  1500 이 된다. 
--둘다 성공 : commit 
--둘중에 하나만 실패...rollback                 과정중에 넘어지면 처음으로 다시가서 목표까지 간다. 그게 트랜잭션...    세이브 포인트는  중간 저장..


--ex) 대학교 수강신청 같은거...   작업도중에는 다른사람이 건드리지 못하게 lock 을 동반한다!~!~!~~!~!~!~!~!~!
--면접때 트랜잭션 적용 했는지 어디 적용했는지 물어본다...  안썻다고 하면? 수많은 오류를 동반할수 있음을 의미한다. 
--많이 적용하면? 답답해진다.....

select * from tab;    -- 접속한 사용자가 만든 모든 table 을 볼 수 있다.                                                  주로 creat table 할때 같은 이름이 있는지 확인할때때 쓴다.~
select * from tab where tname = 'BOARD';      --이런식으로 확인한다.... 보드가 이미 존재하네!

select * from col;    --컬럼들이 쭉 나온다.......     

select * from col where tname = 'EMP';    --특정테이블의 컬럼들을 보여주는데 좀더 상세하게 나온다...    나중에 관리자 목록 만들때 유용하게 쓰인다. 


--이전에 잘했던 팀이 웹 툴을 만들었다. 

select * from user_tables;   --주로 관리자들이 많이 본다... 테이블 용량.. 남아있는거.. 요런거 보여준다.
select * from user_tables where table_name = 'DEPT';    

--지금은 tab    col 정도만 활용해도 좋다.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--DML  오라클 PDF  page 168
/*
INSERT INTO table_name [(column1[, column2, . . . . . ])] VALUES  (value1[, value2, . . . . . . ]); 
*/

create table temp(
  id number primary key,  --not null 하고 unique 한 데이터만 들어갈 수 있다.     널이랑 중복데이터 못온다는 뜻. 
  name varchar2(20)         --default null 값 허용 
 ); 
 
 
 /*
 
 문자 타입                                                                                                                                                                                                                                                                문자타입  
 
 char(20)       >> 20byte >> 한글 10자,  영문자 20자  >> 고정길이 문자열
 varchar2(20) >> 20byte >> 한글 10자,  영문자 20자  >> 가변길이 문자열
 
 char(20)  >>  '홍길동' >> 6byte >>  [홍길동      ] >>   20byte    남는공간 상관없이 20byte 를 잡고 있음. 
 varchar2(20)  >>  '홍길동' >> 6byte >>  [홍길동] >>   6byte      얘는 6byte 만
 
 ex) 
 고정길이 데이터 : 남, 여  : char(2)
 가변길이 데이터 : 이름.... 
 
 성능적인 문제    ... char ()   을  varchar() 보다 우선한다.
 그럼.... 고정길이 데이터 char() 를 쓰는것이 이점이다. ...      쓰는 곳 예시... 남,여,  주민번호 , 우편번호 등...
 
 한글문제 (unicode : 2byte ) >> 한글, 영문자, 특수문자, 공백
 
 nchar(20)        n 은 유니코드의 약자.   >> 20 은 글자수를 의미 함 .. byte가 아니라 글자수!!!!!   그래서  총 40byte 를 내부적으로 갖고 있다. 
 nvarchar(10)  >> 10 글자 
 
 */

select * from temp;

-- 1. 가장 일반적인 INSERT
insert into temp(id,name)
values(100,'홍길동');

select  * from temp;

--확인하고 맘에들면 커밋~~!
commit;   

-- 2. 컬럼 목록 생략 ( 컬럼 리스트 생략)  --가독성이 떨어지니 되도록 하지 말아라.
insert into temp
values(200,'김유신');  --데이터 컬럼의 개수, 순서일치

select * from temp;

commit;    --auto commit 하면 실수한거 실반영되니까 비추!

-- 문제 상황
insert into temp(id, name) -- id primary key
values(100,'아무개');
--unique constraint (BIT.SYS_C007006) violated   중복값 제약에 걸려서 오류 남

insert into temp(name)   ----not null, unique
values('아무개');  
--cannot insert NULL into ("BIT"."TEMP"."ID")     

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--일반 SQL 문은 프로그램적인 요소 가 없다.

--PL-SQL  (고급) 프로그래밍 적인 요소 (제어문, 변수)      PL   = Program Language
--PL-SQL
create table temp2(id varchar2(20));

--데이터 테스트...일일이 1000 건 1000번 실행..

/*
begin 
       for i in 1..1000 loop    --i는 1부터 1000까지 돌면서 아래 구문을 실행한다.
             insert into temp2(id) values('A' || to_char(i));
       end loop;
end;
*/

select * from temp2;     --데이터 1000개 들어감
--커밋까지 해야한다.
commit;

select * from temp2 order by id desc;
commit;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table temp3(
    memberid number(3) not null,
    name varchar2(10) , --null 허용
    regdate date default sysdate --기본 값 설정하기 (  날짜를 강제로 insert하지 않으면 sysdate 값이 디폴트로 들어간다. 주로...게시판에 글쓸때사용..)
);

select sysdate from dual;
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';


insert into temp3(memberid, name, regdate)
values(100,'홍길동','2020-04-03');

select * from temp3;
commit;

insert into temp3(memberid, name)
values (200, '아무개');  

select * from temp3;  --200	아무개	2020-04-03 12:14:11    defalut sysdate 반영됨.
commit;

insert into temp3(memberid)
values(300);   

select * from temp3;   --300		2020-04-03 12:15:32      이름은 null 값 허용이라 들어감.
commit;

insert into temp3(name)
values ('이름만');        --ORA-01400: cannot insert NULL into ("BIT"."TEMP3"."MEMBERID")   

--insert (TIP)                                                                                                                       *****************insert   TIP**************

--1. 대량 데이터 insert 하기

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

--요구사항 : temp4 에 있는 모든 데이터를 temp5 에 넣고 싶어요.
--insert into 테이블명(컬럼리스트) values(값리스트)    *기존에 하던거*
--insert into 테이블명(컬럼리스트) select 절 (컬럼리스트의 개수와 타입 동일) 조건

insert into temp5(num)
select id from temp4;    --이렇게 옮긴다.   (개발자들이 데이터 지우기전에 temp 폴더에 옮기는 것도 이런 방식으로 한다.)

select * from temp5;    
select * from temp4;


--2. insert TIP
--테이블에 없는 상황에서 [테이블 생성] + [대량 데이터 삽입]
--단 복사 개념( 제약 정보는 복사 되지 않음  (PK, FK) 같은 애들)
--순수한 테이블 구조(컬럼이름, 타입) 복사

--create table copyemp(id number)   원래 테이블 만드는 방식.

create table copyemp
as 
      select * from emp;    --emp 와 똑같은 구조의 집을 만들고 emp 가 가진 데이터 까지 넣어준다. 



select * from copyemp;   --신기방기 다 복사 되었따.   실습할대 이렇게 본사본 만들고 연습하면 얘만 망가뜨릴수있다.



create table copyemp2     --골라골라 넣기.
as
    select empno, ename ,sal
    from emp
    where deptno = 30;
    
    
select  * from copyemp2;
select * from col where tname = 'COPYEMP2';


--질문 :구조(틀) 만 복사하고 데이터를 넣고 싶지 않아요....  

create table copyemp3
as
   select * from emp where 1=2;    --거짓조건이라서 구조(껍데기)만 만들어지고 내용은 들어가지 않는다. 
   
select * from copyemp3;      

---------------------------------------------------------------------[INSERT END]-----------------------------------------------------------------------------------------

--[UPDATE]

/*
update table_name
set column1 = value1 , column2  = value2 .......
where 조건

update table_name
set column1 = (subquery)
where 조건

*/


select * from copyemp;    --복사한 emp로 논다....... 

update copyemp
set sal = 0;      --sal이 다 0이 되어버림


select * from copyemp;
rollback; --sal 값들이 돌아왔다. 

update copyemp
set sal =0
where deptno = 20;   --부서번호가 20인 애들만 급여를 0으로 바꾸겟음.

select * from copyemp order by deptno;  --부서번호 20 인 애들  sal 값이 0 으로 바뀜
commit;

update copyemp
set sal = (select sum(sal) from emp)   --set 절에 서브쿼리가 올수 있다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
where deptno = 20;


select * from copyemp where deptno = 20 ;
commit;

--여러개의 컬럼을 update   하기..

update copyemp
set ename = 'AAAA', job = 'BBBB' , hiredate = sysdate ,sal = 1111
where deptno = 10;

select * from copyemp where deptno = 10 ; 
commit;

---------------------------------------------------------------------------------------------------------------------------[UPDATE END]--------------------------------
--[DELETE]
--원칙 >> delete -> commit , rollback -> 복원 불가 -> 단 백업을해놨다면 가능.... 원칙적으로는 불가하다.

delete from copyemp;    --이러면 그냥 다 지워짐
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

(DML : insert , update , delete)  트랜잭션을 동반하는 작업이다.  (commit , rollback)을 강제해야한다.

JDBC -> Oracle -> Emp   테이블 작업
--전체조회  (함수)
--조건조회(사번이  누구~찾아라 이런거)   (함수)
--삭제    (함수)
--수정    (함수)
--삽입    (함수)
--JAVA
--public List<Emp> getEmpAllList() {String sql="select * from emp"}    추후에 자바에서 이런식으로 활용한다.
--public Emp getEmpListByEmpno(){String sql = "select... where empno=777"}
--public int insertEmpData(Emp emp){String sql="insert into emp()....}
*/
------------------------------------------------------------------------------------------------------------------------------------------------------------
--[DDR]
--create , alter , drop (테이블 기준)       테이블 만들고 , 수정하고, 지우고

select * from tab;
select * from tab where tname = 'BOARD';   

DROP TABLE board;  --drop  으로 테이블을 아예 삭제해 버릴 수 있다.

select * from tab where tname = 'BOARD';   -- 없어짐

create table board(
   boardid number,
   title nvarchar2(100),
   content nvarchar2(2000),
   regdate date
   
);

select * from tab where tname = 'BOARD';   --생김

----------------------------------------------------------------------------------------oracle 11g 버전(가상컬럼 (조합컬럼))   부터 지원하는 기능이다.
--학생 성적 테이블
--국어 , 영어, 수학, 총점컬럼
--10       10     10    을 알면 30 을 만들수 있는데...  
--만약에 국어, 영어, 수학 점수가 들어오면 자동으로 총점 계산되면  어떨까? 하면서 만들어짐. 


-----------------------------------------------------------------------------------------oracle 11g 버전(가상컬럼 (조합컬럼))

--이게 뭐냐면..어떤 것에 의해 만들어진 값을 받는 컬럼..

create table vtable(
  no1 number,
  no2 number,
  no3 number generated always as (no1 + no2) virtual   --no1과 no2 에 데이터가 들어오면 자동으로 합계값을 만들어냄.   
                                                                               --(  * - /  다 가능)
);

insert into vtable(no1,no2)
values(100,200);

select * from vtable;   --100	  200	300            이런식으로   no1  no2    no1+no2    가 나옴..

insert into vtable(no1,no2)
values(33,44);

select * from vtable;   --33	44	77                   요렇게~

insert into vtable(no1, no2, no3)
values (10,20,30);        
--INSERT operation disallowed on virtual columns"          내가 직접 값을 입력하지 못한다.


--컬럼의 정보 보기 
select column_name , data_type , data_default
from user_tab_columns where table_name='VTABLE';    
--NO1	NUMBER	
--NO2	NUMBER	
--NO3	NUMBER	"NO1"+"NO2"      값이 이렇게 나온다.

--실무에서 활용되는 코드
--제품정보 (입고일)  ..분기별 (4분기) 
--입고일 : 2020-03-01  >> 1분기  


create table vtable2
(
   no number,  --순번
   p_code char(4),  --제품코드(A001 , A002)
   p_date char(8),   --입고일(20200101)
   p_qty number,   --수량
   p_bungi number Generated always as ( -- ex)   입고일   20200101   의 5번째부터 2개 가져오면 몇월인지 나타내는데 그거 따라 1,2,3,4가 나옴. 
                                                            case when substr(p_date,5,2) in ('01','02','03') then 1         
                                                                    when substr(p_date,5,2) in ('04','05','06') then 2
                                                                     when substr(p_date,5,2) in ('07','08','09') then 3
                                                                     else 4
                                                             end        
                                                           ) virtual
);

select column_name , data_type , data_default
from user_tab_columns where table_name='VTABLE2';    --하면 위에서 처럼 보인다.

insert into vtable2(p_date) values('20200101');
insert into vtable2(p_date) values('20200101');
insert into vtable2(p_date) values('20200301');
insert into vtable2(p_date) values('20200601');
insert into vtable2(p_date) values('20201201');

select * from vtable2;   --   짜놓은 코드대로  p_bungi 에는 분기 수가 표시된다. 

select * from vtable2 where p_bungi = 2 ; --		20200601		2
commit;











