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


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------20200406
--DDL 테이블 다루기 138p
--1.테이블 생성하기
create table temp6(id number);

--2. 테이블을 생성했는데  컬럼 추가하기
desc temp6;   

alter table temp6
add ename varchar2(20);

select * from temp6;

desc temp6;

--3. 기존 테이블에 있는 컬럼의 이름을 잘못 표기 (ename -> username)
--기존 테이블에 있는 컬럼의 이름 바꾸기 (rename)
alter table temp6
rename column ename to username;

desc temp6;

--4. 기존 테이블에 있는 기존 컬럼의 타입 수정하기
--(modify)
alter table temp6 
modify(username varchar2(100));   --수정을 당하는것.

desc temp6;    --USERNAME    VARCHAR2(100)   으로 변경 됨

--5. 기존 테이블에 있는 기존 컬럼 삭제
alter table temp6
drop column username;    --컬럼을 지우면 데이터는 당연히 사라진다.

desc temp6;     --username 컬럼 사라짐.

--6.테이블 삭제 : 이건 집 자체를 허무는거임

--DELETE
--6.1 데이터 삭제 :  delete : 데이터를 지우는 거임. 
--테이블을 처음 만들면 처음 크기(ex)20평이다-> 데이터를 넣으면 -> 20평에서 늘린다.(무한정 늘리진 않고, 오라클 서버가 깔린 os의 디스크만큼..) 30평이 될수도 있따. 
--ex) 처음 1M >> 10만건 >> 100M >> delete 10만건 삭제 >>    Q. 이때  집의 크기는 몇 평일까요?    A . 여전히 크기는 100M

--TRUNCATE
--테이블 데이터 삭제(공간의 크기도 줄일 수 있다.)
--truncate (where 절은 사용할수 없음 ..부분적인 데이터 축소는 없음..걍 다지운다)     원래 개발자가 사용할 일은 잘없지만,, 지금은 쓸수도 있음
--ex) 처음 1M >> 10만건 >> 100M >> truncate 10만건 삭제 >>    Q. 이때  집의 크기는 몇 평일까요?    A .  크기는 1M

--7. 테이블 삭제 (drop)
drop table temp6;
select* from temp6;  --"table or view does not exist"

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--테이블 제약 설정하기( 오라클.pdf 148page)
--데이터 [무결성] 확보 하기.
--select ( 연관성 ..(x))
-- 제약(constraint : insert , update , delete(FK))   얘네한테 의미가 있는 작업들이다.

/*  여러개를 걸 수 있다.

PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)   ,인덱스 생성           게시판의 PK 는 뭘까~? 글 번호.
     --테이블에 한개만 걸수 있다. (테이블당 한개(여러개를 묶어서 하나도 가능..:복합키))
     --내부적으로 검색의 향상을 위해서 (index) 를 자동 생성한다.  (select 의 향상).. 
                                                      장점은 많은 양의 데이터가 있을때 정리되어 있기 때문에 검색속도가 빨라진다.
                                                      단점은 

FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
     --참조제약 [테이블] 과 [테이블] 간의 관계  설정 

UNIQUE key(UK) 테이블의 모든 행을 [유일하게 하는 값]을 가진 열(NULL 을 허용)     >>맹점 null 값을 받는다..문제가생길수있고 해결할수있다.
     --null 을 가질 수 있다. >> unique 와 not null 을 걸면 null불가.

NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다. 

CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
     --설정한 범위의 값만 받겠다. 컬럼에 where gender in('남','여') 하면....
     --ex) where gender in('남','여')  
*/

--지켜보고 있다....... 집중해라.........

--제약을 만드는 시점
--1. 테이블 만들면서 바로 생성(create table...)
--2. 테이블 생성 이후 추가 (제약) (alter table add constraint...)   이거 추천!!!
--3. 테이블 생성 할때 제약을 아래에 묶어서 만들기. 
--      이건 자동화된 툴들이 사용하는 방법 

--1.  제약 정보 확인하기
select * from user_constraints;  --제약 정보들이 들어있다. 
select * from user_constraints where table_name =' EMP';  --제약 정보들이 들어있다.                            얘랑 아래랑 둘다 안보인다... 
select * from user_constraints where table_name =' DEPT'; 
--SYS_C006997 내부적으로 생성된 제약 이름
--"EMPNO" IS NOT NULL   

create table temp7(
  --id number primary key  줄임 표현 (제약 이름 : SYS_C006997)
  id number constraint pk_temp7_id primary key,  --제약 이름을 지정해준다. 프라이머리키고 템프 7에 걸려있구나 컬럼은 id 구나! 하고 알아야함.  권장사항
  name varchar2(20) not null,
  addr varchar2(50) 
);

select * from user_constraints where table_name =' TEMP7'; 
--PK_TEMP7_ID 해석이 가능( 제약수정, 삭제) 사용   

insert into temp7(name,addr) values ('홍길동','서울시 강남구');  --ORA-01400: cannot insert NULL into ("BIT"."TEMP7"."ID")       
                                                                                           --ID 에 프라이머리 키를 넣었기때문에 null이 들어갈 수 없다. 

insert into temp7(id,name,addr) values (10,'홍길동','서울시 강남구');    --문제 없이 잘들어감.
select* from temp7;
commit;

insert into temp7(id,name,addr) values (10,'아무개','서울시 강남구');  --ORA-00001: unique constraint (BIT.PK_TEMP7_ID) violated
--중복 데이터 라서 못 들어감.. 


-- Q 1. 테이블에 primary key 를 몇개까지 걸 수 있을까요? 1개
--(name , num) 여러개의 컬럼을 묶어서 1개....   >> 복합키  라고 한다. 


create table temp8(
   id number constraint pk_temp8_id primary key,   --제약의 이름을 보고 해석이 가능하면 된다.
   name varchar2(20) not null,
   jumin char(6) constraint uk_temp8_jumin unique,  --unique 제약은 null 을 허용한다~!
   addr varchar2(20)  
);

select * from user_constraints where table_name = 'TEMP8';

insert into temp8(id, name, jumin, addr)
values(10, '홍길동', '123456','경기도 성남시');
select*from temp8;
commit;

insert into temp8(id, name, jumin, addr)
values(20, '아무개', '123456','경기도 성남시');
--ORA-00001: unique constraint (BIT>UK_TEMP*_JUMIN) violated

--null.....unique 허용 (null도 중복체크를 할까)  *unique   는 null 을 허용한다.
insert into temp8(id, name, addr)
values(30,'김씨','경기도 성남시');  --30	김씨	(null)	경기도 성남시

select * from temp8;         --null 값 들어가짐!

insert into temp8(id, name, addr)
values(40,'박씨','경기도 성남시');
select * from temp8;                 --40	박씨	(null)	경기도 성남시

--create table temp8 (jumin NOT NULL CONSTRAINT ..unique)   이렇게 두개를 건다... 
--unique 제약은 테이블에 몇개 :  컬럼개수만큼... 다 걸수 있따. 제약이 없음!!!!

------------------------------------------------------------------------------------------------------------------------------------------------------------이미 만들어놓은 테이블에 제약 추가하기.(실무에서는 이걸 더 많이 씀)

create table temp9(id number);

--기존 테이블에 제약 추가하기 .  제약이라는건 내필요에 따라 넣고 뺄수 있다. 
-- 단, 기존 데이터가 있는 경우 제약을 위반하는 데이터가 있으면 제약 추가 불가능!!!!!!!!!!!
--제약 걸기전에 데이터 검사 작업 선행

alter table temp9
add constraint pk_temp9_id primary key(id);
select * from user_constraints where table_name = 'TEMP9';     --PK_TEMP9_ID

--여러개 컬럼( 복합키)
--ADD CONSTRAINT pk_temp9_id PRIMARY KEY(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--not null 추가하기

alter table temp9
modify(ename not null);    --요거 잘안쓰는 방법인데 not null 추가하는 방법이 있긴 하다.
select * from user_constraints where table_name = 'TEMP9';


--------------------------------------------------------------------------------------------------------------------------------------------------------check 제약
--[check 제약]
--where 조건과 동일한 형태의 제약 >> where age > 19 
--컬럼이름 age > 19      데이터를 받을때 19보다 큰 값만 받겠다고 제약을 거는 것이다.

create table temp10(
  id number constraint pk_temp10_id primary key,
  name varchar2(20) not null,
  jumin char(6) constraint uk_temp10_jumin unique,
  addr varchar2(20),
  age number constraint ck_temp10_age check(age >= 19)  
);

select * from user_constraints where table_name = 'TEMP10';    --제약 사항 체크

insert into temp10(id,name, jumin, addr, age) 
values(100,'홍길동','123456','서울시 강남구',20);
select * from temp10;

commit;    --정상적이라면 커밋!

insert into temp10(id,name, jumin, addr, age) 
values(200,'홍길동','123456','서울시 강남구',18);  --ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
-------------------------------------------------------------------------------------------------------------------------------check 제약 끝!---------------------------

--참조 제약 : RDBMS : 테이블과 테이블과의 관계 설정 
--EMP 의 deptno 컬럼은 DEPT 의 deptno 컬럼을 참조 합니다.
--참조 하는 쪽에 거는 제약 : FK
--참조 당하는 쪽에 거는 제약 : PK

create table c_emp
as 
    select empno, ename , deptno from emp where 1=2 ;  --거짓 조건으로 껍데기만 복사!


create table c_dept
as 
   select deptno , dname from dept where 1=2;
   
   select * from c_emp;
   select * from c_dept;
   
   
------------------------------------------------------------------------------------------------- --EMP 테이블의 deptno 컬럼은 DEPT 테이블의 deptno 컬럼을 참조 합니다.   이거 해보기 시작!
 
 alter table c_emp
 add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);   --"no matching [unique] or [primary key] for this column-list"  에러 난다!!!!
--c_emp (deptno)  가  c_dept(deptno)를  빌려쓸거야~! 라고 한거임
--c_dept(deptno) 다른 사람에게 빌려주기 위해서 신용을 확보(primary key)   
--c_dept(deptno) primary key 를 가지고 있어야 함


select * from c_emp;
select * from c_dept;

--1번 선행 되어야함.
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);      --이렇게 primary key 를 준상태여야 에러가 나지 않는다.

--2번으로 실행 되어야함
 alter table c_emp
 add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);     --  이젠 실행 된다.
 --c_emp(deptno)     --------   c_dept(deptno) 관계가 설정... (1:N) 관계 : ex) 부서 테이블과 사원 테이블.... 
 -- (1:1) 관계 ex)  회원 아이디 와 아이디 테이블의 관계.....
 -- (N:N) 관계 ex) 책테이블과 저자 테이블 관계    논리로는 존재하지만 실제로 존재하지 않는다. 
 
 insert into c_dept(deptno, dname) values (100,'인사팀');
 insert into c_dept(deptno, dname) values (200,'관리팀');
 insert into c_dept(deptno, dname) values (300,'회계팀');
 
 select * from c_dept;
 commit;
 
 --신입사원 입사
 --질문 )  not null 걸어서 쓰는 것이 맞다(100~300) ..  아니다  null 허용 하는 것이 맞다!!!!  (100~300)
 --not null 이유 : 입사하는 모든 신입사원은 반드시 부서를 가져야만 한다. 
 --null : 신입사원이 반드시 부서를 가질 필요가 없다.
 
 --설계 할때는 이유만 명확하다면 답이 될 수 있다. 
 
 insert into c_emp(empno,ename)
 values(100,'홍길동');   --100	  홍길동	( null)    이 회사는 신입사원이 부서를 반드시 갖지 않아도 되는 회사이다.
 
 select * from c_emp;
 
 update c_emp
 set deptno = 500
 where empno =100;
 -- integrity constraint (BIT.FK_C_EMP_EMPNO) violated - parent key not found   부모 키가 발견되지 않았다.. : 저쪽에 500 없엉
 
update c_emp
 set deptno = 200
 where empno =100;
 
 select  * from c_emp;  --100	홍길동	200
 commit;
 
 insert into c_emp(empno,ename, deptno)
 values(200,'아무개',100);
 
 select * from c_emp;  --200	아무개	100
 commit;
 
 --------------------------------------------------
 --두 개의 테이블 이 있을 때..
 --(부모와 자식관계)
 --(master , detail)  
 
 --EMP(deptno) 과 DEPT(deptno)  의 관계에서  주 테이블(부모) 는 누굴까~?
 --부모(PK) 키를 가진 쪽  : DEPT 
 --자식(FK) 키를 가진 쪽  : EMP
 
 --둘의 관계에서 --
 select * from c_dept;  -- Master 부모
 select * from c_emp;  -- detail   자식  
 
delete from c_dept where deptno = 300;   -- 부서에서 300 번 을 지울 수 있다? 없다?    있다!!!! 현시점에서 부서번호 300은 없기때문에!!!

delete from c_dept where deptno = 100;   -- 너 이거 지우려고 버니까 자식 에서 데이터가 발견 된다. 오류
-- integrity constraint (BIT.FK_C_EMP_EMPNO) violated - child record found

-- 그럼에도 불구하고 지우고 싶다면 ???       
-- child 쪽에서  (100번 부서를 삭제, 수정)....  빌려쓰지 않도록 만든 후 삭제 해야함..
-- 자식을 먼저 삭제하고 부모 삭제...   *******************************************************************************************************   이거 중요하다~!  ***********************

commit;

/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
-- [ON DELETE CASCADE]  부모테이블과 생명을 같이 하겠다
-- 300 삭제 할 있나요?  네 
-- delete from c_dept where detpno=300;
-- 참조하는 자식 데이터 같이 삭제
-- delete from c_emp where deptno=300; 같이 실행

alter table c_emp
drop constraint fk_c_emp_empno;    --제약을 지울때 제약의 이름으로 지운다. 

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;

select * from c_emp;
select * from c_dept;
delete from c_dept where deptno=100;
commit;





/*
--학생 성적 테이블   
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다  primary key
--이름 NULL 값을 허용하지 않는다  not null
--국어 ,영어 ,수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다

--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 .. 평균 : 소수점이하 두자리 반올림.
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드


--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다


--학과코드 , 학과명

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
--sample 데이터는 세건정도 넣으면 된다. 


내가 한거 난리 법석..누더기...
****************************************************************************************************다시 해봐야함 ******************************************************************* 
안쪽에 넣기
바깥으로 빼기
안쪽에 넣되, 제약을 모아 놓기   --장점 복합키쓰기 편하다.  

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
-------------------------------round 추가 오류 수정 
alter table sgrade
modify(avgg number generated always as (round(((korean + english + math)/3),2)) virtual);  --괄호... 때문에 답이 틀린 거였음. 

select * from user_constraints where table_name = 'SGRADE';
select * from user_constraints where table_name = 'SS';

select * from sgrade;

---------------------------------------  참조코드 오류 수정
--1번으로 실행되어야 하는 데 이미 PK 되어있어서 2번으로 가셈. 
alter table ss
add constraint  pk_s_scode primary key(scode);      

--2번으로 실행 되어야함
 alter table sgrade
 add constraint PK_SGRADE_IDD foreign key(scode) references ss(scode);

---------------------------------------

insert into sgrade(id, name, korean, english, math, scode)
values(2020,'아무개',70,80,90,10);
insert into sgrade(id, name, korean, english, math, scode)
values(2021,'홍길동',36,89,80,20);
insert into sgrade(id, name, korean, english, math, scode)
values(2022,'혁거세',88,90,60,30);

insert into sgrade(id, name, korean, english, math, scode)
values(2023,'혁거세',88,90,60,20);

delete from sgrade where name='혁거세';


select * from sgrade;


insert into ss(scode, sname)
values(10,'수학과');
insert into ss(scode, sname)
values(20,'과학과');
insert into ss(scode, sname)
values(30,'영어과');

select * from ss;

select korean + english + math as "sum"
from sgrade
where id = 2020;

select * from user_constraints where table_name = 'SGRADE';

--------------------------------------------------------------------------------------------------------제약 설정하기---------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------선생님 답

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

----------------------------------------------------------------------------------------------------------------내가 한번 더 따라 해보는거.
--학생 성적 테이블   
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다  primary key
--이름 NULL 값을 허용하지 않는다  not null
--국어 ,영어 ,수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다

--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 .. 평균 : 소수점이하 두자리 반올림.
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드


--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다


--학과코드 , 학과명

--그리고 select 결과는
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
--sample 데이터는 세건정도 넣으면 된다. 


create table majorrr(
  m_code NUMBER constraint pk_major_mcode primary key ,
  m_name varchar2(20) not null
);

create table gradeee(
  s_number number ,
  s_name varchar2(20) not null,
  k_score number default 0,
  e_score number default 0,
  m_score number default 0,
  m_code number ,
  avg_score number GENERATED always as (round((k_score + e_score + m_score)/3,2)) VIRTUAL,
  sum_score number GENERATED always as (k_score + e_score + m_score) VIRTUAL
  
);
 

 alter table gradeee
 add constraint pk_gradeee_snum primary key(s_number);
 
 alter table gradeee
 add constraint fk_gradeee_mcode foreign key(m_code) references majorrr(m_code);

insert into gradeee(s_number, s_name, k_score, e_score, m_score,m_code)
values(2020,'아무개',70,80,90,10);

select * from gradeee;
select * from majorrr;

insert into majorrr(m_code, m_name)
values(10,'수학과');
insert into majorrr(m_code, m_name)
values(20,'과학과');
insert into majorrr(m_code, m_name)
values(30,'영어과');

--------------------- 제약 설정하기 (END)---------------------------------------------------------------------------------------------------------------------------------------------------------------------

--view 객체  ( 가상테이블)   Oracle.pdf (192 page)
--내가 원하는 것만 볼수 있게 만든 가상의 테이블 : view 


/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] [WITH  READ  ONLY] 

*여기서부터는 설명*

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

create view v_001
as 
    select empno, ename from emp;   --emp 에서 empno, ename 만 보이는 종이를 만들거야!     라는 뜻 
    
    -- An attempt was made to perform a database operation without
    --       the necessary privileges.     당신은  view 생성 권한이 없습니다.   관리자에게 권한을 받으세요.   권한바꿔 준후에는 생성이 된다.
    
select * from v_001;  --조회가 된다 신기방기......      --view 는 sql 문장을 가지고 있는 객체다   
                               --..얘를 실행하면 내부적으로는 윗 줄의 select empno, ename from emp 를 실행시킨다.


-------------------------------------------------------------------------------------------------------------------------view 설명----------------------------------------------------------
--view 객체 (create....)
--create view 뷰이름 as sql 문장( view 통해서 볼 수 있는 데이터 목록)
--view 는 테이블 처럼 사용 가능( 가상 테이블) -> 쓰는 방법은 (emp, dept) 와 동일하게... 테이블쓰듯...사용하면 된다.
--view 메모리상에서만 존재하는 가상테이블 (ex)  in-line-view  <<--검색하면 나옴.

--view 사용법!!!!
--일반 테이블과 동일하게.. select...where 등 하면 됨.
--단, 뷰가 갖고 있는 쿼리 문장이 실행되었을때 문장을 볼수있따...
--DML(insert, update, delete)  -> view 통해서 볼 수 있는 데이터에 한해서는 -> DML 가능 하다. 
--view 볼 수 있는 데이터

--view 사용 목적!!!!
--1. 개발자의 편리성 ( join, subquery) >> 실제 테이블이 있다면 ....
--2. 보안적인 측면...(권한 처리)   -> 노출하고 싶은 데이터만 모아서 view 생성 할수 있음. 
--3. 편리성 (복잡한 query 모아서 ) view 생성...... 미리 만들어 보기




------------------------------------------------------------------------------인사 테이블
--                                                                                                                           <<<< 보안 측면의 목적   >>>>>
--Emp 바로 노출시키면  (사원의 급여 등 예민한 부분들이 노출된다.)  

create view v_emp
as
  select empno, ename, job, hiredate from emp;

  
-- 사원들에게 v_emp 를 사용하시면 되요~

select * from v_emp;        --해도 보이는 건 위에서 정한 네가지 컬럼 뿐이다.  
select * from v_emp where empno=7788;   --7788	SCOTT	ANALYST	82/10/09    잘 나온다.


--                                                                                                                                  <<<<<편리성 >>>>>
--복잡한 쿼리를 단순화 해서 사용 할 수 있다.

create view v_002
as
  select e.empno, e.ename, d.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;    --이렇게 미리 join해서 만들어 두면 할때마다 join 할 필요없이 v_002 로 보면 된다. 
  
select * from v_002;  
select * from v_002 where deptno =20;   



--Q
--자기부서의 평균 월급보다 더 많은 월급을 받는 
--사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요.
--자기 부서의 평균 월급보다 더 많은 월급 담고 있는 테이블이 있다면...

create view v_003
as
  select deptno , avg(sal) as avgsal
  from emp
  group by deptno;
  
select * from v_003;    --부서별 평균 월급을 담고 있는 테이블이다. 
                                 --얘는 등록된 코드고, in-line-view 는 그때그때 만드는 일회성 코드(쓰면 버리는~)이다.

select * 
from emp e join v_003 s
on e.deptno = s.deptno
where e.sal > s.avgsal;


--테이블이 1개 이상
--join ....... 안되넹....? 그럼 subquery .......  또 안되넹???  그때 쓰는게 바로~~~~~~ view(가상테이블)
--프로젝트 때 view 는 필수 사항이 아니지만, 알고있으면 편할거같아서 알려주심. 

/*

CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS 
Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] [WITH  READ  ONLY] 

*/

--create 로 만든건 drop 으로 지운다. 
--View 삭제
drop view v_007;

--OR  REPLACE  이미 존재한다면 다시 생성한다. 


create or replace view v_007    --replace 있으면 바꾸고 없으면 만들어라.
as
   select avg(sal) as avgsal from emp;  --alias 가 있어야 만들어짐     

select * from v_007;  --2073.214285714285714285714285714285714286


--View 를 통한 DML    (view가 볼수 있는 데이터에 대해서는 insert, update , delete)      가능하지만..... select 목적으로만 사용하는게 가장 좋다.
--단 view 가 가지는 구문은 테이블 1개만 가능
--복합 view 는 DML 불가.    복합 view : 테이블이 1개이상으로 구성된 query
--단순 view  만 가능 하다.    단순 view :  테이블 1개로 마든 view

select * from v_emp;  --볼 수 있는 데이터(empno, ename ,  job, hiredate

update v_emp       --v_emp 너는 sal 컬럼을 볼 수 없어... 그래서 변경 할 수 없어
set sal = 0;           --이건 불가능.. 


update v_emp
set job = 'IT';  --view가 바라보는 원본 테이블을 건드린다!!!!!!!!!!!!!

select * from v_emp;      
select * from emp;

rollback;


create or replace view v_emp2
as
   select * from emp where deptno=20;
   
 select * from v_emp2;
 
 update v_emp2
 set sal = 0;   --view 가 볼 수 있는 데이터만 ,,,,deptno=20만 sal =0으로 바뀐다. 
 
 select * from emp;
 rollback;
 
 select * from emp;
 
 --view 목록 
 select * from user_views;  --view 가 갖고 있는 소스들이 노출된다. 
 
 
 -----------------------------------------------------------------------------------------------------------------------------------------연습문제....
 
 --1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
create view q_emp
as
  select job, ename, sal
  from emp
  where deptno = 30;

select * from q_emp; 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  

create or replace view q_emp
as
  select job as "직위", ename as "사원이름" , sal as "월급"
  from emp
  where deptno = 30 and sal > 300;

select * from q_emp; 

 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.

create view q_emp2
as
  select deptno, max(sal) as "최대월급" , min(sal) as "최소월급", avg(sal) as "평균월급"
  from emp
  group by deptno;

select * from q_emp2; 


       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.


 create view q_emp4
as
  select deptno, avg(sal) as "평균월급"
  from emp
  group by deptno
  having avg(sal) >=2000;

select * from q_emp4;



 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.

--이건  두개로 나눈거....
create view q_emp3
as
  select job, sum(sal) as "총월급"
  from emp
  group by job;

select * from q_emp3;

select job
from q_emp3
where job !='MANAGER' and "총월급" >=3000;


--이건 having 으로 합친거
create view q_emp5
as
  select job, sum(sal) as "총월급"
  from emp
  group by job
  having  job !='MANAGER' and sum(sal) >=3000;
  
 select * from q_emp5; 
 
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------20200407  시퀀스
 
--시퀀스 
--오라클.pdf (page 185)

--순번 추출하기(번호생성)
--자동으로 번호를 생성하는 객체
--중복된 값은 나오지 않는다 (조건)

/*
CREATE  SEQUENCE  sequence_name     --여기까지가 문법   이 아래는 옵션
[INCREMENT  BY  n] 
[START  WITH  n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 

설명

sequence_name  SEQUENCE 의 이름입니다. 
INCREMENT  BY  n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정. 
    이 절이 생략되면 SEQUENCE 는 1 씩 증가. 
START  WITH  n  생성하기 위해 첫번째 SEQUENCE 를 지정. 
    이 절이 생략되면 SEQUENCE 는 1 로 시작. 
MAXVALUE n  SEQUENCE 를 생성할 수 있는 최대 값을 지정. 
NOMAXVALUE   오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정. 
MINVALUE n  최소 SEQUENCE 값을 지정. 
NOMINVALUE  오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정. 
CYCLE | NOCYCLE  최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를 
    지정. NOCYCLE 이 디폴트. 
CACHE | NOCACHE  얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지 
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
----------------------------------------------------------------------------------------------------------------------------------------------------------
--다른 방법

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '새글');

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '두번째글');

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '세번째글');


select * from board order by boardid asc;

delete from board where boardid =1;
commit;

insert into board(boardid, title)
values ((select nvl(max(boardid),0) +1 from board), '네번째');

select * from board;

-------------------------------------------------------------------------------------------------------------------------------------------------------
--sequence 번호 추출 : 중복값이 없고 순차적인 값 >> 공유객체
--create 로 만든건 객체로 보고 객체로 만든건 drop 하지 않는한 영속적으로 남는다. 접속 창에서 볼수 있음.

create sequence board_num;

select * from SYS.USER_SEQUENCES;  
--(이름)BOARD_NUM 	(최소값)1	(최대값)9999999999999999999999999999	   (증가값)1 	N	N	20	1   


/*

 NEXTVAL 과 CURRVAL 의사열 

 1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다. 
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다. 
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다. 
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다. (주의사항)
 
*/
--실제 번호 추출
select board_num.nextval from dual;    --할때마다 1부터 순서대로 나오는데 한번뽑은건 또 나오지 않음

-- 근데 내가 몇번까지 뽑았떠라...? 하면 쓰는 것.     (마지막에 채번한 값이 나온다..) 그래서 nextval 없이 currval 이 생기지 않음 
select board_num.currval from dual;

-----------------------------------------------------------------------------------------------------------------------------------------------------------

create sequence kboard_num;


create table kboard(
   num number constraint pk_kboard_num primary key,
   title varchar2(100)
);
select * from kboard;
select kboard_num.currval from dual;   --현시점에서 값 안나옴... nextval하지 않았기때문에

insert into kboard(num, title)
values(kboard_num.nextval,'처음 글');

select * from kboard;

select kboard_num.currval from dual;   --1 나옴
-----------------------------------------------------------------------------------------------------------------------------------------------------------

--1. sequence 객체 (테이블간 공유자원) >> 여러개의 테이블이 하나의 채번기 사용  (우리 네이버 카페에서 그렇게 하고있음)
--A 테이블 >>1 ,2 ,8
--B 테이블 >> 3, 4, 5
--C 테이블 >> 6, 7

--사이트(게시판) 10개
--상품게시판, 관리자 게시판, 회원게시판
--1. 하나의 sequence 공유   
--2. 게시판 글번호 각각 쓰고 싶으면  sequence 3개 만들어서 A,B,C 테이블 각각 쓰면 된다. 


--   ms-sql 
--create table board(boardnum int identity(1,1)...)  1로 시작해서 1씩 증가한다.   -- 테이블에 종속족인 것이다. 
--insert into board(title) values ('방가')...
--ms-sql 2012 버전 부터 sequence 가 생김.


--   my-sql
--create table text(
--num int(10) not null auto_increment primary key,
--name varchar(10) nor null
--);


--   MaridDB    (my-sql 사람들이 나와서 만든 오픈소스 기반)
--얘는 시퀀스를 갖고 있다. 


--중간은 Oracle... 파이널은 my-sql, maridDB ,mongoDB ? 로 한다... 많이 써볼수록 좋으니까... 
--구문이 크게 다르지않고 대략 70% 비슷하기 때문에  세개를 쓰면 경쟁력이 더 높아진다. 


------------------------------------------------------------------------------------------------------------------------------
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;   --10 번 부터 2씩 늘어난 값이 나온다.

select seq_num.currval from dual;  --마찬가지로 마지막에 채번한 값이 나온다.  12

--게시판 데이터 insert ...
--게시판 글보기 (최신글 순으로 ... 글번호 큰것)
--select * from board order by boardnum desc

-----------------------------------------------------------------------------------------------------------SEQUENCE  [END]-------------------------------

--개발자 필수 2
-- rownum 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적인 존재


--ROWNUM  : 실제 테이블에 컬럼으로 존재하지 않지만 내부적으로 행번호 부여할수 있는 의사컬럼  
--ROWID     : 주소값 ( 행이 실제로 저장되는 내부주소값) -> 인덱스 생성할때 사용

select * from emp;  --여기서 나오는 번호는 그냥 툴이 붙인거임

select rownum as 순번 , empno, ename from emp;   --이건 rownum 이 만들어준 숫자...  
--rownum select 결과에 순번....

--Top-n 쿼리 
--테이블에서 조건에 맞는 상위 (top) 레코드 n 개 추출

--MS-SQL 
--select top 10, * from emp order by sal desc   --급여가 높은 순으로 정렬한 다음에 위에서 10개 잘라내겠다.   

--Oracle
--오라클은 없음...오라클은 rownum 사용    (페이징 처리에 쓰인다)
--rownum(의사컬럼)  기준을 정의한다.

--rownum 사용
--1. 정렬의 기준을 정의(선행)   ex...   급여가 많은사람을 뽑겠다. 키가 큰 사람을 뽑겠다
--2. 정렬 된 상황에서 앞에 순번 조건을 제시 데이터 추출


--1 단계 ~ 정렬의 기준을 정의(선행)

select * 
from ( select * 
          from emp 
          order by sal desc) e;
          

--2 단계  ~ 정렬 된 상황에서 앞에 순번 조건을 제시 데이터 추출

select rownum as "num" , e.*
from ( select * 
          from emp 
          order by sal desc) e;


--3단계 ~  (급여를 많이 받는 사원5명)

select rownum as "num" , e.*      --보기 편하게 alias 해줌. 
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

--게시판 만들기 페이징 처리 필수 쿼리문 (rownum 가상컬럼)

----------------------------------------------------------------------------------

select * from emp order by sal desc;   --기준점 정하기

----------------------------------------------------------------------------------

select *      --서브쿼리로 만듦 
from (select * 
         from emp 
         order by sal desc) ;  

----------------------------------------------------------------------------------

select rownum as "num" , e.*      -- rownum 추가 
from (select * 
         from emp 
         order by sal desc) e; 
         
----------------------------------------------------------------------------------
--1. 서브쿼리안에 서브쿼리안에 서브쿼리 넣기

select n.*      --subquery 안에 subquery 넣기
from(

select rownum as "num" , e.*      
from (select * 
         from emp 
         order by sal desc) e
       ) n
where "num" <= 5;

--2. rownum 으로 순서 자르기 

select rownum as "num" , e.*      --보기 편하게 alias 해줌. 
from ( select * 
          from emp 
          order by sal desc) e
where rownum <=5; 

--위에랑 똑같은 결과다.  위에는 rownum , 아래는 rownum 테이블을 가진 서브쿼리를 만든거다. 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------페이징 처리 연습해보기 
--게시판 (페이징 처리)
--100건 데이터 가 있다고 해서 한번에 보여주지 않는다 성능이 떨어지니까!
--10건씩 나눠서 보여주기


--총 100건의 데이터가 있고
--pagesize =10 ( 한 화면(페이지)에 보여줄 데이터 건수  row의 수 )
--page count = 10개 
--[1][2][3][4][5][6][7][8][9][10]   이렇게 페이지를 만든 거와 똑같다.
--내가 [1] 을 클릭했을때  >> 1~10 번까지 글을 보여주고 싶다. 
--       [2]                      >> 11~20 번까지..... 
-- ....
--       [10]                     >> 91~100 번까지..

--------------------------------------------------------------------------------------------------------------------------------------------------------------------HR계정으로 이동

select * from employees;     --107건의 데이터가 있따.    
-------------------------------------------------------------------------------------------------------------------
select * from employees order by employee_id asc;      --기준(정렬 ) 사번 낮은 순부터 쭉해서  206 번까지 정렬되어 있음.
-------------------------------------------------------------------------------------------------------------------
select *     --subquery 해줌.
from(
        select * 
        from employees 
        order by employee_id asc
        ) e;
-------------------------------------------------------------------------------------------------------------------         
select rownum as num , e.*     -- rownum 으로  조건을 붙여줌. 
from(
        select * 
        from employees 
        order by employee_id asc
        ) e
where rownum <=50;        


-------------------------------------------------------------------------------------------------------------------    --50 보다 작고 40 보다 큰 데이터를 뽑은거다.
select num, employee_id, last_name ,email            --서브쿼리안에 또 넣어서 조건을 넣어줌.
from(

select rownum as num , e.*     
from(
        select * 
        from employees 
        order by employee_id asc
        ) e
where rownum <=50  
) s
where num>40;      --50 보다 작고 40 보다 큰 데이터를 뽑은거다.  

-------------------------------------------------------------------------------------------------------------------     --10 보다 작고 0 보다 큰 데이터를 뽑은거다.
select num, employee_id, last_name ,email            --서브쿼리안에 또 넣어서 조건을 넣어줌.
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
-------------------------------------------------------------------------------------------------------------------    --between A and B 를 활용하기 도 가능하다. 
--또는 between A and B 활용

--where rownum between 10 and 20 사용가능 





------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------SQL 기본과정 END
------------------------------------------------------------------------------------------------------------------------------------------------------------------------SQL 고급과정 (3차 프로젝트)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------PL-SQL (변수, 제어문, 커서, 함수, 프로시져, 트리거, 스케줄)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                                                                                        --   종합 문제    --
                                                                                                        

--1> 부서테이블의 모든 데이터를 출력하라.
 
 select * from dept;
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
 
 select job, empno,ename, hiredate
 from emp;
 
--3> EMP테이블에서 직업을 출력하되, 각 항목(ROW)가 중복되지 않게
-- 출력하라.

select distinct job
from emp;
 
--4> 급여가 2850 이상인 사원의 이름 및 급여를 출력하라.
 
 select ename, sal
 from emp
 where sal >= 2850;
 
--5> 사원번호가 7566인 사원의 이름 및 부서번호를 출력하라.
 
 select ename, deptno
 from emp
 where empno = 7566;
 
--6> 급여가 1500이상 ~ 2850이하의 범위에 속하지 않는 모든 사원의 이름
-- 및 급여를 출력하라.

select ename ,sal
from emp
where sal not between 1500 and 2850;
 
 
--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 
--입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
 select* from emp;
 
 select ename, job, hiredate
 from emp
 where hiredate between '81/02/20' and '81/05/01'
 order by hiredate;
 
--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를
-- 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.

select  ename, deptno
from emp
where deptno in(10,30)
order by ename;
 
--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는
-- 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)

select ename as "Employee", sal as "Monthly Salary"
from(
select *
from emp
where deptno in(10,30)) e
where sal > 1500;

--선생님 답.
select ename , sal
from emp
where deptno in(10,30) and sal >1500;
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라.

select ename, job
from emp
where mgr is null;
 
 
--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 
-- 급여를 기준으로 내림차순으로 정렬하여 출력하라.
 
 select ename, sal, comm
 from emp
 where comm is not null
 order by sal desc;
 
--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.

select ename
from emp
where ename like'__A%';
 
--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 
--출력하라.
 
 select ename
 from emp
 where  ename like '%L%L%' and deptno =30;
 
 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 
-- 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.

select ename, job, sal
from emp
where job in('CLERK','ANLYST') and sal not in(1000,3000,5000);

 
--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 
--컬럼명을 New Salary로 지정하여 출력하라.
 
 select empno, ename ,sal, round(sal+(sal*0.15)) as "New Salary"
 from emp;
 
 select empno,ename, sal, round(sal+(sal*0.15))as "NEW SALARY"
 from emp;
 
--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라). 
 
  select empno, ename ,sal, round(sal+(sal*0.15)) as "New Salary",
           round(sal+(sal*0.15))-sal as "INCREASE"
 from emp;
 
 
--18> 모든 사원의 이름(첫 글자는 
-- 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는
-- 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.

select length(ename) as "이름길이",
          (substr(ename,1,1))||  lower(substr(ename,2)) as "이름"
from emp;
 
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은    
-- 사원의 커미션은 'no commission'으로 출력하라.
 
 select ename, nvl(to_char(comm),'NO COMMISSION') as "comm"
 from emp;
 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.
 
 select e.ename,e.deptno,d.dname
 from emp e join dept d on e.deptno = d.deptno;
 
--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
 
 select e.ename, e.deptno, d.dname
 from emp e join dept d
 on e.deptno = d.deptno
 where d.deptno = 30;
 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)

select distinct e.job, d.loc
from emp e join dept d on e.deptno = d.deptno and d.deptno =30;

select distinct e.job, d.loc
from emp e, dept d
where e.deptno=d.deptno and d.deptno=30;
 
 
--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.

 
 select e.ename, d.dname, d. loc
 from emp e join dept d 
 on e.deptno = d.deptno
 where comm is not null;
                   
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.

 select e.ename, d.dname
 from emp e join dept d on e.deptno = d.deptno 
 where e.ename like '%A%';
 
--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 
-- 출력하라.
 
  select e.ename, e.job, e.deptno,d.dname
 from emp e join dept d 
 on e.deptno = d.deptno
 where d.loc = 'DALLAS';
 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되,
-- 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.

select e.ename as "EMPPLOYEE", e.empno as "EMP#", m.ename as "MANAGER", m.empno as "MGR#"
from emp e, emp m
where e.mgr = m.empno;
 
--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
 select e.empno , e.ename , e.sal , s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal; 

select e.ename, e.job, d.dname,  s.grade
from emp e join dept d on e.deptno = d.deptno
                  join salgrade s on e.sal between s.losal and s.hisal;
                  
                  
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.

select ename, hiredate
from emp
where hiredate > (select hiredate from emp where ename = 'SMITH');
 
--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일,          *************************************
-- 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을              *************************************
-- Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 
-- 출력하라.

select e.ename as "EMPLOYEE", e.hiredate as "EMPHIREDATE", 
          m.ename as "MANAGER", m.hiredate as "MGRHIREDATE"
from emp e join emp m on e.mgr = m.mgr and e.hiredate <m.hiredate;

 
 
--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 
-- 각 컬럼명을 Maximum,Minimum,Sum,Average로 지정하여 출력하라.

select max(sal) as "MAXIMUM", min(sal) as "MINIMUM", sum(sal) as "SUM", avg(sal) as " AVERAGE"
from emp;
 
--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
 
 select job, min(sal), max(sal), sum(sal), trunc(avg(sal),0)
 from emp
 group by job;
 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.

select job, count(job)
from emp
group by job;
 
--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라.
-- 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
 
 select distinct count(mgr) as "Number of Manager"
 from emp;
 
 
--34> 최고 급여와 최저 급여의 차액을 출력하라.

select max(sal)-min(sal)
from emp;
 
 
--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라.   **********************************
-- 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 
-- 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.



select mgr,min(sal)
from emp
where mgr is not null
group by mgr
having min(sal)>=1000
order by min(sal);
 
 
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.    ***********************************
-- 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.

select d.deptno,d.dname,d.loc, count(e.ename),avg(e.sal)
from emp e join dept d on e.deptno=d.deptno 
group by d.deptno,d.dname,d.loc;
 
 
--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
-- 단, Smith는 제외하고 출력하시오
 
 select ename, hiredate
 from emp
 where deptno = (select deptno from emp where ename ='SMITH') and ename != 'SMITH';
 
 select ename,to_char(hiredate,'YYYY-MM-DD')
 from emp
 where deptno in(select deptno from emp where ename='SMITH') and ename !='SMITH';
 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 
--    표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.

select empno, ename, sal
from emp
where sal> (select avg(sal) from emp)
order by sal desc;
 
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호
-- 및 이름을 출력하라.
 select empno, ename
 from emp
 where deptno in(
 select deptno
 from emp
 where ename like '%T%');
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.

select e.ename, e.deptno,e.job
from emp e join dept d on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
 
--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
 
 select ename, sal
 from emp
 where mgr =(
 select empno from emp where ename = 'KING');
 
--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
 
 select d.deptno, e.ename, e.job
 from emp e join dept d on e.deptno = d.deptno
 where d.dname = 'SALES';
 
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한
-- 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
 
 select empno, ename, sal
 from emp
 where sal >(select avg(sal) from emp)
 and  deptno in(select deptno from emp where ename like '%T%') ;
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 
-- 출력하라.

select ename, deptno, sal
from emp
where sal  in(select sal from emp where comm is not null);


 
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름,   
--     및 급여를 출력하시오

select ename, deptno, sal
from emp
where job in(select job from emp e join dept d on e.deptno=d.deptno where d.loc = 'DALLAS');

select e.ename, d.dname, e.sal
from emp e join dept d on e.deptno=d.deptno 
where e.job in(select e.job from emp e join dept d on e.deptno=d.deptno where d.loc= 'DALLAS');
 
 
--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및     ***************
-- 급여를 출력하시오

select ename, hiredate, sal
from emp
where sal =(select sal from emp where ename = 'SCOTT')
or comm = (select comm from emp where ename = 'SCOTT');

select ename, hiredate, sal
from emp
where sal=(select sal from emp where ename ='SCOTT') 
and nvl(comm,0)=(select nvl(comm,0) from emp where ename ='SCOTT');
 
 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호,
-- 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.

 select empno, ename, sal
 from emp
 where sal > all(
 select sal from emp where job = 'CLERK')
 order by sal desc;
  
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과
-- 월급, 부서번호를 출력하라.

select ename, sal, deptno
from emp
where job in(select job from emp where ename like '%A%');

 
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 
-- 사원이름과 부서명을 출력하라.
 select e.ename, d.dname , e.comm
 from(
          select e.sal , e.comm
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK')  n join emp e on n.empno = e.empno
                                                     join dept d on e.deptno = d.deptno
 where n.sal = e.sal and n.comm = e.comm;                                                    
 
  
  select e.sal , e.comm
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK';
  

 select ename , nvl(comm,0)
 from emp
 where sal in(
          select e.sal 
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK') 
 and
          nvl(comm,0) in(
          select nvl(e.comm,0)
          from emp e join dept d 
          on e.deptno = d.deptno
          where d.loc = 'NEW YORK');        
 
  
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
--    직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission
--    으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오.
--    단, 최고월급부터 출력되게 하시오

select e.empno, e.ename, e.job
from emp e join 
(select e.job, e.mgr ,d.dname from emp e join dept d on e.deptno = d.deptno where d.loc = 'DALLAS') n
on e.kgfd;





                                                                                                        
--------------------------------------------------------------------------------------------------------------------------------------------20200408    (자바에서 연습할 실습용 테이블 만들기)
create table dmlemp     --emp 테이블 복사 
as 
   select * from emp;
   
select * from dmlemp;

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);

select * from sys.user_constraints where table_name='DMLEMP';

select* from dmlemp;

select * from dmlemp where deptno =10;

select * from dmlemp;    -- 부서번호 20인사람들 사라짐.

select * from dmlemp where job = 'IT'; --9999	홍길동	IT			5000		20       Ex05)로 한거.


--Ex06_Oracle_transcaction
create table trans_A(
    num number,
    name varchar2(20)
);

create table trans_B(
    num number constraint pk_trans_B_num primary key,
    name varchar2(20) 
);
    
    
select * from trans_A;
select * from trans_B;

select * from dept;

--------------------------------------------------------------------------------------------------------------------------------------------------------20200409
create table Department
(
    deptno number,
    dname varchar2(50)
); 


select * from Department;

create table texttable(
 boardid number not null 
 
);

select* from koreamember;

select * from memo;

 create table memo(
	id varchar2(15) not null,
	email varchar2(20) not null,
	content varchar2(100)
); 
]


select * from jspboard;