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


--1. 사원 테이블에서 모든 데이터를 출력하세요.
select *FROM emp; --쿼리 문자는 대소문자 구별X

--2. 특정 컬럼 데이터 출력하기 --select ~ from ~ 테이블이름
select  ename, empno, sal from emp;
select ename from emp; 


--3. 컬럼에 가명칭(별칭) (alias) 부여하기 출력되는 컬럼의 이름 바꾸기 한칸 띄우고 별명 추가
select empno 사번, ename 이름
from emp;

--쌍따옴표 붙여서 글자 사이의 빈 공간까지도 인식 될 수 있도록 이러면 띄어쓰기도 할 수 있음
select empno "사    번", ename "이    름"
from emp;

--정식(표준 ( ansi 문법 ) ) 공통으로 사용하는 문법 (as = alias name을 표기할거야 의 준말)
select empno as "사    번", ename as "이    름"
from emp;

--Oracle은 데이터를 관리하는데 (문자열 "데이터"(A~a) : 대소문자를 엄격하게 구분한다)
--문자열의 표기 ( ' 문자열 ' )
--소문자 'a' <-> 대문자 'A' 다르다! king으로 하면 데이터 출력이 안됨.

select empno, ename
from emp
where ename = 'KING'; 

--Oracle SQL언어를 배우고 있는 중입니다... 구조화된 쿼리(질의를 할 수 있는) 랭귀지 : 즉 연산자가 존재한다 ! (결합연산자 = (||) , 산술연산자 = (+)) 구분
--java  + (문자열 + 문자열 >> 결합)
--java  + (숫자 + 숫자 >> 연산) 
--tip ) ms-sql은 + 하나로 연산, 결합

select '사원의 이름은 ' || ename ||  ' 입니다' as "사원정보"
from emp;

--empno, ename 을 컬럼이라고 한다. 컬럼은 기본적으로 타입을 가지고 있다.
--Oracle은 타입(자료형) : 숫자 , 문자열 , 날짜정보.... 
desc emp;
/*
테이블의 기본정보를 볼 수 있다. 'desc' (컬럼명, null값 허용여부, 타입)
이름       널?       유형           
-------- -------- ------------ 
EMPNO    NOT NULL NUMBER       
ENAME             VARCHAR2(10) --문자열타입 10byte저장가능(한글 5자, 영문자 특수문자 공백 10자) VARCAHR
JOB               VARCHAR2(9)  
MGR               NUMBER            --숫자타입 NUMBER
HIREDATE          DATE             --날짜저장타입
SAL               NUMBER       
COMM              NUMBER       
DEPTNO            NUMBER     



*/

select empno || ename -- 숫자  ||  문자열 결합이 가능하다? (붙어서 출력이 됨 숫자를 문자열로 바꿔버림. 내부적으로 숫자타입->문자열로 형변환됨)
from emp;

select empno + ename
from emp; --숫자 + 문자의 산술연산은 불가능하다. 당연하지;;;      --'ORA-01722: invalid number(산술오류)'

--사장님이 오셨다 우리 회사에 직종이 몇개가 있니?
select job from emp; --이러면 전부 나와버리므로 직종이 몇개인지? 라면 중복을 제거해서 보여줘야 한다.
--distinct ( 중복 데이터 제거 ) >> 그룹핑을 해서 중복값을 제거한다.
select job, deptno from emp;
select distinct job from emp;

select distinct job , deptno from emp order by job; --order by 오름차순 정렬 job으로 한번 묶고, 그 안에서 deptno(부서번호)가 동일한 것을 묶음 job 그룹 안의 deptno가 같은 그룹

select distinct deptno, job from emp order by deptno; --같은 부서넘버인 사람 묶고, 그 안에서 job이 같은 사람끼리 또 묶음



--Oracle 언어
--Java 언어
--Oracle 연산자가 Java와 거의 동일하다( + ,* , - ...)
-- '%' 만 다르다! java에서는 나머지를 구하는 연산자이지만, Oracle에서는 사용을 못한다. (검색 패턴용으로 이미 사용중)
--그러므로 나머지는 함수를 통해서 사용해야 한다. Mod()

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하기
select empno as"사원번호", sal as "인상 전 급여", sal + 100 as "인상 후 급여" from emp;

--dual 이라는 임시 테이블 기능이 있다. 100+100 결과를 출력하기 위해 dual이라는 가상공간을 만들어서 그 테이블에 집어넣고 출력 select가 출력기능이 없어서
select 100 + 100 from dual; --연산이라서 200이 출력
select 100 || 100 as "100과 100" from dual; --결합이라서 100100이 출력 (내부적으로 형변환이 일어나서 숫자를 문자로 바꾼 후에 결합)
select '100' + 100 from dual; -- '+'는 무조건 산술식이라 결합하지 않고 내부적으로 숫자로 바꾸어서 산술을 함 = 200출력
select '100A' + 100 from dual; --에러납니다. 문자열과 숫자 연산이 안되므로

--비교연산자
-- > < <=
--java는 같다(==) , 할당(=)
--Oracle( 같다라는 표현은 = 으로 사용한다) 할당이 없음! (같지 않다는 !=)

--논리연산자
--AND, OR , NOT

--조건절 (원하는 row(줄)만 가져오도록) --emp에서 sal이 3000이상인 사람 모두(*)를 출력
select  *
from emp
where sal >= 3000;

select empno, ename, sal
from emp
where sal > 3000;

--이상, 이하 (= 포함)
--초과, 미만 (= 포함X)

--사번이 7788번인 사원의 사번, 이름, 직종, 입사일을 출력하세요.
--실행순서 : 2 -> 1-> 3으로 실행 emp 테이블에서 7788을 필터링하고, 마지막에 select empno... 가지고 와서 출력
select empno, ename, job, hiredate
from emp
where empno = 7788;

--사원의 이름이 KING인 사원의 사번, 이름, 급여정보를 출력하기
select empno, ename, sal
from emp
where ename = 'KING';

--논리~ (AND , OR)
--급여가 2000달러 이상이면서 직종이 manager인 사원의 모든 정보를 출력

select *
from emp
where sal >= 2000 and job = 'MANAGER';


--급여가 2000달러 이상이거나 직종이 manager인 사원의 모든 정보를 출력
select *
from emp
where sal >= 2000 OR job = 'MANAGER';


--오라클도 날짜(DB서버의 날짜)
--오라클 날짜(sysdate)



--현재 접속한 사용자가 날짜 형식을 YYYY-MM-DD 이렇게 보도록 하겠다라는 의미

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS'; 

select * from SYS.nls_session_parameters; --오라클 만들 때 부터 이미 만들어진 것 (시스템 테이블, 환경 테이블)
--NLS_DATE_FORMAT	RR/MM/DD --현재 접속한 사용자가 볼 수 있는 날짜형식
--NLS_DATE_LANGUAGE	KOREAN --한국어 지원
--NLS_TIME_FORMAT	HH24:MI:SSXFF

select hiredate from emp;

--입사일 1980-12-17인 사원의 모든 정보를 출력하기
select *
from emp
where hiredate = '1980-12-17';

select *
from emp
where hiredate = '1980/12/17'; -- ' / ' 로 해도 인지가능


select *
from emp
where hiredate = '80/12/17'; --형식을 원래 RR-MM-DD인 상태에서 YYYY-MM-DD로 바꿔놔서 조회가 안됨 오라클 껐다가 키면 원래 설정으로 돌아가서 그때는 조회가 될 것임.

--사원의 급여가 2000달러 이상이고, 4000달러 이하인 모든 사원의 정보를 출력

select *
from emp
where sal >= 2000 and sal <= 4000; --쓰기가 불편해서 연산자 추가 between A and B

--between A and B(= 포함)
--초과, 미만에서는 사용하면 안됨!(=이 기본적으로 포함되어있기 때문에 이상, 이하 에서만)

select *
from emp
where sal between 2000 and 4000;

--사원의 급여가 2000달러 초과이고, 4000달러 미만인 모든 사원의 정보를 출력
select *
from emp
where sal > 2000 and sal < 4000;

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호 출력

select empno, ename, sal, deptno
from emp
where deptno =10 OR deptno = 20 OR  deptno= 30;

--IN 연산자
select empno, ename, sal, deptno
from emp
where deptno in(10,20,30); --OR을 연결

--in 연산자를 풀어라. where deptno =10 OR deptno = 20 OR  deptno= 30;

--부서번호가 10번 또는 20번이 '아닌' 사원의 사번, 이름, 급여, 부서번호 출력

select *
from emp
where deptno != 10 and deptno != 20;

--IN의 부정도 있다. (NOT IN) 즉 부정 AND

select *
from emp
where deptno NOT IN(10,20); --deptno != 10 and deptno != 20; 이거랑 같음 //부정값의 and 부정값의 and..... 선생님 같은얘기 반복하심ㅎㅎㅎㅎ


--POINT : Oracle 값 표현(데이터가 없다 null) >> null : 필요악

create table member (
userid varchar2(20) not null, --필수입력
name varchar2(20) not null,
hobby varchar2(50) --아무것도 안쓰면 default로 null이 붙음. 즉 null값 허락 필수입력요소가 아님.
);

select * from member;
--insert into member(userid, hobby) values('hong' , '농부');
insert into member(userid, name) values('hong' , '홍길동'); --hobby는 테이블이 만들어졌지만 넣은 값이 없으므로 null이 들어감
insert into member(userid, name,hobby) values('kim' , '김씨','게임');
--실제로 데이터를 반영하기 위해서는 커밋이라는 명령어를 해줘야 한다. 지금 위까지는 commit을 하지 않아서 오라클 껐다 키면 disc에 남아있지 않음
commit;

--수당을 받지 않는 모든 사원의 정보 출력하기
--0도 데이터로 취급 (받고있는걸로)
--select * from emp where comm = null; 출력이 되지 않는다.
select * from emp where comm is null; -- null은 이렇게 써야 나온다. 중요중요 ! ! ! !

--수당(comm)을 받는 모든 사원의 정보를 출력
select * from emp where comm is not null; --not null ! ! !

--사원 테이블에서 사번, 이름, 급여, 수당, 총 급여를 출력
--총 급여의 정의는 급여 + 수당

select empno, ename, sal, comm, sal +  nvl(comm, 0) as "총급여"--(컬럼의 null값을 0으로 바꾸겠다는 의미)
from emp;

--Point >> null
--1. null 과의 모든 연산은 그 결과가 null로 나온다. null + 100 = null; null + 홍길동 = null;
--2. 위 문제를 해결하기 위해 함수를 만들었다.      'nvl()'     'nvl2()' >> null값을 replace 하는 함수
--tip. ) ms-sql 에서는 convert()        my-sql 에서는 if null()


select null + 100 from dual; --null 출력
select '홍길동' || null from dual; --결합이라서 null이어도 괜츈 연산일때만 null이 특별
select 100 + nvl(null, 0) from dual; --null값을 0으로 바꾸어서 연산.

select comm, nvl(null, 1111) from emp;

--사원의 급여가 1000달러 이상이고, 수당을 받지 않는 사원의 사번, 이름, 직종, 급여, 수당을 출력

select empno, ename, job, sal, comm
from emp
where sal >= 1000 and comm is null;
---------------------------------------------------------------------
--DQL(data query language) : select 구문 (데이터 가져오는 법)
--DDL(create, alter, drop(객체(테이블) 생성, 수정, 삭제 할 때 쓰는 명령어))
--DML(insert, update, delete) (데이터 조작)

--java에서는 클래스를 만들 때 class Board{private boardno int}
--Oracle에서는 create table Board (boardno number not null)

create table board (
    boardid number not null, --숫자형식의 데이터를 입력 할 수 있고, 필수로 입력해야 한다.
    title varchar2(20) not null, --한글 10자, 영문자 특수문자 공백 20자 필수입력
    contents varchar2(2000) not null, --필수입력 
    hp varchar2(20) --default로 null 허용 ( 필수입력은 아님)
);
select * from board;
--혹은 
desc board; 

--DML(데이터 조작어) 실 반영 여부를 결정
--insert
--update
--delete 를 해도 실제 DB에 반영이 되진 않음. 그러므로 반드시 그 결과를 반영할지, 취소할지에 대한 의사결정을 해줘야 함 
--즉 commit(실제반영) 과 rollback(취소) 해줘야 함.
--무조건 insert, update, delete 작업에 대해서는

insert into board(boardid, title, contents)
values(200, '자바', '그립다');

select * from board;
commit; --commit과 rollback 사이의 정보를 rollback 
--insert -> commit or rollback 

insert into board(boardid, title, contents,hp)
values(300, '오늘', '점심은 뭐먹지','010-1234-4690');

select * from board;
commit;

select boardid, nvl(hp,'EMPTY') as "hp" from board; --출력 할 때 null 을 empty로 출력해라

--문자열 검색
--주소검색 : 역 입력 >> 역삼동, 역동, 역... 다나옴 (Like 패턴검색)
--문자열 패턴을 검색하는 연산자가 있다. --> like
--like연산자를 도와주는 것들이 있다. (와일드카드 문자) ( % : 모든 것으로 해석,  _ : 한문자) 이것들을 결합해서 원하는 형태의 데이터를 찾자.

select ename from emp where ename like '%A%'; --%는 모든 것이므로, A라는 단어를 찾음에 있어서 앞뒤로 어떤 것이 와도 상관이 없다.
                                                                               --ename컬럼의 데이터 중에서 A라는 글자가 들어있는 모든 사원 검색

select ename from emp where ename like '%a%'; --문자열 데이터 관련해서는 엄격하게 대소문자 구분

select ename from emp where ename like 'A%'; --이름의 첫글자가 A인사람 다 찾기

select ename from emp where ename like '%S'; --이름의 마지막 글자가 S인 사람

--ex)select * from member where name like '%수한무%' --이름에 수한무가 연속적으로 이어져있는 사람 찾기

select ename from emp where ename like '%LL%'; --LL이 '연속'으로 이어져있는 사람 (앞 뒤로아무거나 와도 상관없음)

select ename from emp where ename like '%L%L%'; --위와 달리 이건 붙어있어도 되고 띄어져있어도 됨 L이 2개만 들어가있으면 됨

select ename from emp where ename like '%A%A%'; --ADAMS 가 출력

select ename from emp where ename like '_A%'; --첫 글자는 어떤 것이 와도 상관 없음. 두번째글자는 반드시 A가 와야한다. = 두번째에 A가 오는 모든 문자 = _는 자릿수 지정

--정규 표현식을 사용 할 수 있다. (과제ㅠ.ㅠ)
--regexp_like
select * from emp where regexp_like(ename, '[A-C]'); --정교한 검색이 가능해진다.

--정규표현 예제 5개 만들기 ( 추후에~)
--------------------------------------------------------------------------------------------------------------------

--데이터 정렬하기
--order by 컬럼명 구문을 사용해서 정렬을 시킬 수 있다. : 문자열, 숫자, 날짜
--오름차순 : asc : 낮은순으로 정렬(default설정)
--내림차순 : desc : 높은순으로 정렬

select * from emp order by sal; --오름차순으로 정렬되어서 출력 
                                             --+asc (디폴트라 생략가능)
                                             
--급여를 많이 받는 순으로 정렬해서 출력

select * from emp order by sal desc;

--입사일이 가장 '늦은 순'으로 정렬해서 사번, 이름, 급여, 입사일 데이터를 출력

select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*
select절        3
from절           1
where절        2
order by절    4 --select 한 결과를 정렬하는 것이 효율적이므로 내부적으로 이런 순서로 진행이 된다. 정렬하는게 DB입장에서 가장 힘들다고 함... 귀찮아~
*/

select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;

--order by 심화편
--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc

select job, deptno
from emp
order by job asc, deptno desc; --job을 알파벳 순서대로 정렬하고,그 안에서 (그리고) deptno를 내림차순으로 정렬해라. '그룹핑' --게시판코드 게시판에서 사용할듯?

----------------------------------------------------------------------------------------------------------------

--연산자
--합집합(union) : 테이블 + 테이블 각 테이블의 데이터를 union하는 것 한쪽 테이블의 데이터들이 다른쪽 테이블의 데이터가 뒤로 붙는 것 무조건 붙을 수 없으므로 규칙이 있다.
--(기본적으로 중복값 배제시킴)
--합집합(union all) 은 중복값 허용

--테이블 만들기
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
select * from uta; --ut에 uta 데이터를 합치겠다. 자동으로 중복제거가 되어서 출력

select * from ut
union all
select * from uta; --중복제거 안하고 다 출력

-------------------------------------------------------------------
/*           union은
              1. 대응되는 컬럼의 타입이 동일해야 한다.
              
                select empno, ename from emp
                union
                select dname, deptno from dept; --empno에 dname을, ename에 deptno를 붙이려고 하는데 타입이 다르므로 에러가 난다. 문자열, 숫자 일치시켜야함
              
                select empno, ename from emp
                union
                select deptno, dname from dept; 로 맞춰주면 출력이 된다. 
              
              2.  대응되는 컬럼의 개수가 동일해야 한다. (합칠 컬럼과 합쳐질 컬럼의 개수가 맞아야 한다)
              
              select empno, ename, job, sal from emp
              union
              select deptno, dname, loc from emp; --컬럼의 수가 맞지 않아서 에러
              
             --- null을 사용하면 sal컬럼에 null이 들어감--- 개수 맞출 수 있어짐
             
              select empno, ename, job, sal from emp
              union
              select deptno, dname, loc, null from emp;  --null로 채워짐
             
*/

select empno, ename from emp
union
select deptno, dname from dept; --empno에 dname을, ename에 deptno를 붙이려고 하는데 타입이 다르므로 에러가 난다.

--실무에서는 union을 subquery(in line view)로 사용한다. union된 결과를 가지고 무언가를 함...
select empno, ename
from (
            select empno, ename from emp
            union
            select deptno, dname from dept     
) order by empno desc; --물리적인 테이블이 아닌 가상테이블을 생성해서 정렬해보기

--여기까지가 초보 걸음마 ㅋㄷㅋㄷ 의무적으로 해야하는 것 ㅋㄷㅋㄷ 여태까지 테이블이 1개였음
---------------------------------------------------------------------
--Oracle의 함수를 공부해보자 (pdf : 50page를 참고)

/*

1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
    제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다. (to_char(), to_number(), to_date())
5) 일반적인 함수 : NVL, DECODE

*/

--문자열 함수
select INITCAP('the super man') from dual; --첫글자 대문자로 만들기

select lower('AAA'), upper('aaa')from dual; 
--대문자 소문자로 바꾸기, --소문자 대문자로 바꾸기

select ename, lower(ename) as "ename" from emp;

select * from emp where lower(ename)  = 'king'; --함수가 먼저 돈다. 연산보다 select, where절 둘 다 사용 가능

--문자열 개수
select length('abcd') from dual; --문자열의 개수 출력 --문자열을 배열로 저장하고있다.

select length('홍길동') from dual; --length 3 출력 공백 다 인지함

select length(' 홍 a길 동') from dual; --7 출력

--결합연산자 ||
--concat()

select 'a' || 'b' || 'c' as "data" from dual; --abc출력

-- select concat('a','b','c') from dual; --파라미터의 개수가 제한적이라서 2개까지만 합칠 수 있다. 결합연산자쪽이 더 유연함

select concat(ename, job) as "ename+job" from emp;
select ename || '     '  || job as "ename+job" from emp; --하나의 컬럼에 데이터 두개를 합쳐서 출력 할 수 있음. 연산자를 이용하면 공백도 넣을 수 있음.

--부분 문자열 추출
--java(substring)
--Oracle(substr)

select substr('ABCDE' ,2,3) from dual; --BCD출력
select substr('ABCDE',1,1) from dual; --A 출력
select substr('ABCDE',1,2) from dual; --첫번째 인덱스값 기준으로 이후로 숫자만큼 출력 
select substr('ABCDE',3,1) from dual; --C출력
select substr('ABCDE',3) from dual; --CDE출력 3 이후로 전부 다 출력


select substr('ABCDE' ,-2,1) from dual; -- -를 붙이면 뒤에서부터 시작 

/*
사원테이블에서 ename 컬럼 데이터에 대해서 첫글자는 소문자로한다. 나머지 문자는 대문자로 출력한다.
단, 위의 컬럼을 하나의 컬럼으로 출력 컬럼의 이름은 fullname으로, 첫글자와 나머지 문자 사이에 공백 하나를 넣기
*/

select lower(substr(ename, 1,1)) from emp;
select upper(substr(ename, 2)) from emp;

select  lower(substr(ename, 1,1)) ||  upper(substr(ename, 2)) as "fullname"
from emp;


--lpad, rpad(채우기)
select rpad('ABC', 10, '*') from dual; --10칸 중 왼쪽부터 *로 채우고, 나머지는 ABC를 넣겠다.

select rpad('ABC',10,'^') from dual; --10칸 중 ABC를 먼저 넣고 나머지를 ^로 채우겠다.

--quiz
--사용자의 비밀번호를 입력 : hong1006
--화면에 비밀번호를 다 보여주면 안되니 ho******으로 출력하고 싶다.(만약에 비밀번호가 1004인 사람은 > 10**으로 나와야 한다) 앞 두글자만 화면에 보이고 나머지는 *로 출력되도록

select lpad(substr('hong1006',1,2),length('hong1006'), '*') from dual;
select rpad(substr('1004',1,2),length('1004'),'*') from dual;

--emp테이블에서 ename컬럼의 데이터를 출력하는데 첫 글자만 출력하고 나머지는 *로

select rpad(substr(ename,1,1),length(ename),'*') as "ename" from emp; --length 전체 길이dp *를 넣겠다?


create table member2(
 id number,
 jumin varchar2(14)
);

insert into member2(id, jumin) values(100, '123456-1234567');
insert into member2(id, jumin) values(200, '234567-1234567');
commit;

select * from member2;

--하나의 컬럼으로 결과값을 출력
--100 : 123456 -*******
--200 :234567 -******* 
--출력결과의 컬럼명을 "juminnumber"

select id || ' : ' || rpad(substr(jumin, 1,7), length(jumin),'*') as "juminnumber" from member2;

--rtrim 함수
--[오른쪽 문자를 지워라]
select rtrim('MILLER', 'ER') from dual; --첫번째 파라미터에서 두번째 파라미터를 오른쪽부터 찾아서 지워라
select ltrim('MILLLLLLLLER', 'MIL') from dual; --출력값 : ER         'MIL'을 지우고 ER만 남게 (중복값 제거함)

select '>'|| rtrim('MILLER           ', ' ') || '<' from dual; -->MILLER< 오른쪽 공백 제거 가능 rtrim, ltrim 같이 사용하면 양쪽 공백 제거 가능

--치환함수(replace)
select ename, replace(ename, 'A', '바꿔라') from emp;

------------------여기까지가 문자형 함수----------------------

------------------숫자형 함수--------------------
--round(반올림)
--trunc(절삭함수)
--mod() 나머지 구하는 함수


--round(반올림)
--   ... -3,  -2 ,  -1,  0,  1,  2,  3 ... 두번째 파라미터의 인자값으로 들어 갈 수 있는 숫자들...
select round(12.345, 0) as "r" from dual; --첫번째 파라미터는 자원, 두번째 파라미터가 인자값인데 0은 정수부분만 남기라는 의미 뒤의자리가 반올림이 가능하다면 하고 버리기 =12출력
select round(12.567, 0) as "r" from dual; -- 13출력 

select round(12.345, 1) as "r" from dual; --첫번째자리까지 남기고 반올림 후 버리기 12.3 출력 
select round(12.567, 1) as "r" from dual; --첫번째자리까지 남기고 반올림 후 버리기 12.6 출력

select round(12.345, -1) as "r" from dual; -- -1은 10의자리까지 남기기 2가 버려짐
select round(15.345, -1) as "r" from dual; --20
select round(15.345, -2) as "r" from dual; --0 100의자리가 없으므로

--trunc(절삭함수) -반올림 하지 않고 버려버림
select trunc(12.345, 0) as "r" from dual;  --12출력
select trunc(12.567, 0) as "r" from dual; --12출력
select trunc(12.345, 1) as "r" from dual;  --12.3
select trunc(12.567, 1) as "r" from dual; --12.5

select trunc(12.345, -1) as "r" from dual; --10
select trunc(15.345, -1) as "r" from dual; --10
select trunc(15.345, -2) as "r" from dual; --0


--mod() 나머지 구하는 함수

select 12/10 from dual; --1.2 몫 1, 나머지 2 나머지만 보고싶을때는 연산자가 아닌 mod함수 사용
select mod(12,10) from dual; --나머지만 출력

select mod(0,0) from dual; --java에서는 0/0이 안됐지만 Oracle에서는 되네용~


--------------------여기까지가 숫자형 함수--------------------------

------------------날짜형 함수--------------------
select sysdate from dual;                       --2020-04-01 12:16:11

--날짜 함수... 문자가 아님... 형식 바꾸기가 애매함... 연산으로 해야함... 중요중요중요

--Date + Numb >> Date
--Date - Numb >> Date
--Date - Date >> Number 2019-10-10 - 2019-10-1 의 일수 (근무일수? 같은거)


select hiredate from emp;

select months_between('2018-01-01', '2010-01-01') from dual; --몇개월 차이나는지
select months_between(sysdate, '2010-01-23') from dual; --현재날짜~ 2010년 01-01까지의 개월 수  122.306949298088410991636798088410991637 
select round(months_between(sysdate, '2010-01-23'),1) from dual;      --122.3
select trunc(months_between(sysdate, '2010-01-23'),1) from dual;      --반올림 하지 않고 버림


----중요중요
--날짜형식의 문자열을 날짜로 바꾸는 방법 함수 ? (to_date) 형식 맞춰줘야 함~!
--select '2020-04-01' + 100 from dual;  이렇게 쓰면 안됨
select to_date('2020-04-01') + 100 from dual; --2020-4-1까지 + 100일 한 결과값이 출력 "내 생일 100일전 ^^ 2020-07-10 00:00:00"
select to_date('2020-04-01') - 100 from dual; --2019-12-23 00:00:00
select sysdate + 1000 from dual; --지금시간 기준으로 1000일 이후 2022-12-27 12:26:43

--quiz
--사원 테이블에서 사원들의 입사일에서 현재 날짜까지 근속월수를 구하세요
--단, 근속월수는 정수부분만 출력(반올림X)

--한달이 31일이라는 기준에서 근속월수를 구하세요(반올림X)
--함수 사용X 연산이용해서(날짜 - 날짜 >> 150일)

select ename, trunc(months_between(sysdate, hiredate)) as "근속월수" from emp;

select ename, trunc((sysdate - hiredate)/31,0) as "근속월수" from emp;

--------------------여기까지가 날짜형 함수--------------------------

------------------변환형 함수--------------------
--변환함수 가장 중요합니다.
--Oracle : 문자, 숫자, 날짜 간의 변환이 가능하다. to_ 가 붙은 함수들

--to_char() : 숫자를 문자로 바꾸는 경우 (1000 -> $1000)과 같은 표현을 위해 포맷팅용
            --   : 날짜를 문자로 바꾸는 경우 (2020-01-01 -> 2020년 01월 01일)과 같은 표현을 위해 포맷팅용
            
--to_date() : 문자 -> 날짜 >> select '2020-12-12' + 100 은 문자열과 숫자의 조합이기 때문에 원래는 불가능하나, 
--                                       select to_date('2020-12-12') + 100             로 하면 가능하다      

--to_number() : 문자-> 숫자(내부적으로 자동형변환이 지원된다)
select '100' + 100 from dual; -- 내부적으로는 select to_number('100') + 100 from dual; 이다.

--to_number(문자 -> 숫자로 자동형변환)

select '1' + 100 from dual; --내부적으로 자동변환됨
select to_number( '1')  + 100 from dual;

--to_char(): format >> 숫자 or 날짜를 형식문자로 바꿀 때 사용

select to_char(sysdate) from dual; --문자데이터로 변환되어서 출력된다.  그러므로 다른 문자열과 결합이 가능해진다.
select to_char(sysdate) || '일' from dual; 

select sysdate, --형식은 pdf파일 69page 참고
to_char(sysdate,'YYYY')||'년' as "YYYY",
to_char(sysdate, 'YEAR'),
to_char(sysdate, 'MM'),
to_char(sysdate, 'DD'),
to_char(sysdate, 'DY')
from dual;

--입사일이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력

select empno as "사번" ,  ename as "이름",
TO_char(hiredate, 'YYYY') as "YYYY",
TO_char(hiredate, 'MM') as "MM"
from emp
where to_char(hiredate, 'MM') ='12';

select to_char(hiredate, 'YYYY MM DD') from emp; --1980 12 17

select to_char(hiredate, 'YYYY"년" MM"월" DD"일"') from emp; 
--글자를 붙이려면 글자를 " " 안에 넣어야 한다.

--select to_char() 숫자->문자로 변경
--pdf 71page 표 참고
--100000 >> 출력 >> $100,000 >> 문자열이기 때문에 문자열로 인식시켜야 한다.

select '>' || to_char(12345, '9999999999') || '<' from dual; --결과 >      12345<

select '>' || to_char(12345, '09999999999') || '<' from dual;  --결과 > 00000012345<

select '>' || to_char(12345, '$99,999,999,999') || '<' from dual;  --결과  >         $12,345<

select sal, to_char(sal, '$9,999') from emp;
 --  $800
 --  $1,600 출력

--HR계정 전환작업(오른쪽 위)
select * from employees;

/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/

select employee_id, 
LAST_NAME || FIRST_NAME as "fullname",
to_char (hire_date, 'YYYY-MM-DD') as "hire_date",
salary, salary*12 as "연봉",
to_char((salary * 12) * 1.1, '$9,999,999,999') as "인상분",
hire_date
from employees 
where to_char(hire_Date, 'YYYY') >= '2005'
order by "연봉" desc;

/*
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

*/

--bit계정으로 이동

-------변환함수 ( to_char(), to_date(), to_number())----------

--[일반함수(프로그래밍적인 성격이 강하다)]
--nvl(), nvl2() >> null처리 담당
--decode() 함수 >> java if문(switch)
--case() 함수 >>java의 if문(switch)

select comm, nvl(comm, 0) from emp;

create table t_emp(
id number(6), --6자리 정수값
job varchar2(20)
);

insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MGR');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500, 'MGR');

select * from t_emp;
commit;

select id, decode(id, 100, '인사부',
                                  200, '관리부',
                                  300, '회계부',
                                            '기타부서')as"부서";
from t_emp;
                                            


select deptno, decode(deptno, 10, '인사부', 
                                                 20, '관리부', 
                                                 30, '회계부', 
                                                 '기타부서') as "부서"
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

/* t_emp2 테이블에서 id, jumin 데이터를 출력하되 jumin컬럼의 앞자리가 1이면 '남성'출력, 2이면 '여성'이라고 출력 3이면 '중성'이라고 출력
그 외에는 기타라고 출력
*/

select id, decode(substr(jumin,1,1), 1, '남성', 
                                                         2, '여성',  
                                                         3, '중성', 
                                                             '기타') as "성별"
from t_emp2;


/*

2분 커피
if 문안에 if 문 (중첩 ) >> decode
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
*/


select empno, ename, decode(deptno, 20,
                                                decode(ename, 'SMITH', 'HELLO', 'WORLD'),
                                                
                                                'ETC')
from emp;

--case문
--java switch
/*
case 조건식 when 결과1 then 출력1
                  when 결과2 then 출력2
                  when 결과3 then 출력3
                  ELSE 출력4
END "컬럼명"

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

select '0' || to_char(zipcode) as "지역번호", 
                case zipcode when 2 then '서울'
                                      when 31 then '경기'
                                      when 32 then '강원'
                                      when 41 then '충청'
                                      else '기타지역'
                                      END "regionname"
    from t_zip;

/*
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요

1. case 컬럼명 when 결과 then 출력 ( = 조건처리)
2. 비교조건 일때에는 
    case when 컬럼명 조건 비교식 then 출력
*/

select sal as "급여", --between사용해도 됨
                case when sal <= 1000 then '4급'
                         when sal between 1001 and 2000 then '3급'
                         when sal between 2001 and 3000 then '2급'
                         when sal between 3001 and 4000 then '1급'
                                      else '특급'
                                      END "급여등급"
    from emp;

--------------------------------------------------------------------------------------------
--문자함수
--숫자함수
--날짜함수
--변환함수 ( to_char, to_date, to_number)
--일반함수 (nvl(), decode(), case())

--------------------------------------------------------------------------------------------

--집계함수 pdf page 75
/*
1. count(*) > row 줄수를 보고싶다면, count(컬럼명) 그러나 데이터 건수라서 (null을 포함하지 않은 건수가 나온다.)
2. sum()
3. avg()
4. max()
5. min()
등등...
*/
/*

집계함수

1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null을 개무시한다.
3. select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시되어야 한다.

*/

select count(*) from emp; --14건이 있다는 말 노쥄노쥄노쥄

select count(comm) from emp; --6건이 있다는 말 (null 빼고 세서)

select count(empno) from emp;

select count(nvl(comm, 0)) from emp; --null값도 포함해서 출력하고 싶다면 nvl 함수를 이용해서 0으로 만들어준 다음 count함수를 써라

--급여의 합을 구하기 sum()
select sum(sal)as "급여의 합" from emp; 

--급여의 평균을 구하기 average()
select round(avg(sal),0) as "평균급여" from emp;

--사장님이 회사 총 수당의 평균이 얼마지?

select trunc(avg(comm),0) as"평균수당" from emp; --721달러

select trunc(sum(comm) / count(comm)) from emp; --null이 포함되지 않아서 총 사원수에 대한 값이 아님
--누구야~~!!! 노조에서 노발대발 왜?

select trunc(avg(nvl(comm, 0)),0) as"평균수당" from emp; --309달러 (가 맞음)
select trunc(sum(comm) / 14) from emp; 

--회사의 규정이 전체사원수로 나눠야 한다고 하면 309달러가 맞고,
--회사의 규정이 수당을 받는 사람에 대해서만 평균수당을 책정하는거라면 721달러가 맞음

--검증 : 코드

select count(*) from emp where comm is null; --comm컬럼에서 null값인 것을 카운트 --8개가 있음

--max()
select max(sal) from emp; --최대값 구하기

--min()
select min(sal) from emp; --최소값 구하기

--중요중요중요중요중요중요웆ㅇ요중용중용중용중요

select empno, count(empno) from emp;
-->select empno는 14건이 나와야하는데, count(empno)는 출력되는 데이터값이 1개라서 안됨 1줄로 표현이 안돼서 안됨!

select sum(sal) , avg(sal), max(sal), min(sal), count(sal), count(*) from emp; -->1개짜리 출력값의 나열이라서 상관없음

--부서별 평균 급여를 출력하세요
select deptno, avg(sal) --집계함수 이외에 나머지 컬럼이 들어간 경우 group by 를 써줘야 한다.
from emp
group by deptno;

--직종별 평균 급여를 출력하세요
select job, trunc(avg(sal)) --job을 생략하면 결과값이 나오긴 하지만 뭐에 대한 평균인지를 알 수가 없으므로 job을 써서 뭐에대한 평균인지 알려준다..        3
from emp                                                                                                                                                                                                -- 1
group by job;                                                                                                                                                                                       --  2 순서로 처리됨

--직종별 평균급여, 급여합, 최대급여, 최소급여, 건수 출력

select job, trunc(avg(sal)) as "평균급여", sum(sal) as"급여의 합", max(sal) as"최대급여", min(sal)as"최소급여", count(*)as"건수"
from emp
group by job;


/*
 grouping 원리
 
distinct 컬럼명1, 컬럼명2
order by 컬럼명1,컬럼명2
group by 컬럼명
*/

--부서별, 직종별, 급여의 합

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


from where group by는 셋트
group한 결과를 selecting 해서 order by로 정렬

*/

--직종별 평균 급여가 3000달러 이상인 사원의 직종과 평균급여를 출력

select job, avg(sal)
from emp
--where  avg(sal) >= 3000 --where절은 group by 이전에 동작하기 때문에 where에 그룹핑 조건절이 들어 갈 수 없다. 
                                           -- 처리 순서상 select 이후로 들어가야 하기 때문에 group by에 having절이라는 조건문을 사용해야 한다.
group by job;

--group by의 조건절 >>having 절

select job, trunc(avg(sal)) as "평균급여"
from emp
group by job                               --이렇게 까지 쓴 결과에서 조건을 걸어야 한다. 어떤 순서로 처리가 되는지를 잘 알고 있어야 할듯...ㅠㅠ
having avg(sal) >= 3000;           --group by ~ having이기 때문에 select보다 먼저 having이 처리된다. from ~where from절의 조건절은 where/ group by의 조건절은 having 셋트임!

--PRESIDENT	5000
--ANALYST	3000

/*
하나의 테이블을 대상으로 쓸 수 있는 모든 구문
select             5 -결과출력
from                1
where             2-단독사용 불가(from이 선행되어야 where을 쓸 수 있음)
group by        3
having           4 -단독사용 불가(group by가 선행되어야 having을 쓸 수 있음)
order by         6 -정렬

*/

select job as "직종" ,sum(sal) as "급여의 합" --1. empno, job
from emp
where comm is not null
group by job -- 2. group by job, empno 로 쓸수 있긴 하지만 job으로 묶은 상태에서 다시 empno로 묶는 것이므로 의미가 없어짐 (전체 사원 수만큼 출력됨)
having sum(sal) >=5000
order by "급여의 합";

select deptno as "부서번호", count(deptno) as "인원 수", sum(sal) as"급여의 합" --count(*) null이 있으나 없으나 상관없이 카운팅
from emp
group by deptno
having count(deptno) > 4
order by deptno;


select job as "직종" , sum(sal) as"급여의 합"
where job != 'SALESMAN'
from emp
group by job
having sum(sal) > 5000
order by "급여의 합" desc

------------------------------------------------------------------------------------------------------
-------JOIN--------(pdf 85 page)
--관계형 데이터 베이스 (RDBMS) >> 발전한 형태가 ORDB(object relation) 객체DB인데 사용하지 않음 >>대신에 만든 것이 Framework (객체매핑 = 객체화시키는 툴, java와 db 사이에서 역할) JPA, MYBATIS
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

--조인의 종류
--1. 등가조인 (같을 등) (equi join)
--원 테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1로 매핑
--JOIN의 문법
--1. SQL JOIN 문법 제품마다 가지는 문법(오라클에서만 동작)
--2. ANSI 문법(권장) 표준문법이므로

--SQL JOIN 문법
select *
from m, s
where m.m1 = s.s1; --null이 있을 경우 비교대상에 포함되지 않는다. 결과값에서 제외됨 --옆으로 테이블을 붙임 union은 테이블이 아래로 붙음

select m.m1, m.m2, s.s2 -- 출력 결과에 M1, S1에 A,B가 같이 들어가있기 때문에 중복되는건 사용 안함.
from m, s
where m.m1 = s.s1; 
----------------위의 문법은 되도록이면 사용하지 말자-----------------

--ANSI 문법
--where절은 from절의 조건절의 역할인데 join에서는 join 할 때의 조건절로 쓰이고 있어서
--where절에 join의 조건과 일반 조건을 다 섞어서 써버리면 구별이 안되어서 혼란스러우니
--join의 조건을 따로 분리하기로 결정 >> ON절을 만들었음 그리고 , 도 없애고 'from M INNER JOIN S' 로 사용(INNER JOIN = 등가JOIN의 문법인데 생략 가능하다. 그러므로 JOIN만 써도 가능)

SELECT *
FROM M INNER JOIN S
ON M.M1 = S.S1;

SELECT M.M1 , M.M2, S,S2 --처음에 *로 설정하고 테이블을 확인 한 뒤 필요한 데이터만 추출하는 순서가 편할듯 SELECT조건을 구체화를 제일 나중에
FROM M JOIN S --INNER 생략 가능 
ON M.M1 = S.S1;

--사원번호,  사원의 이름, 사원 부서번호, 사원의 부서명을 알고 싶다면
SELECT e.empno as"부서번호", e.ename as "사원이름", d.deptno as "부서번호", d.dname as "부서명"
from emp E join dept D --emp E 별칭 붙이기 테이블명이 길어서, dept도 d로 가명칭을 부여해서 그 이름으로 접근한다.
on e.deptno = d.deptno;

--join을 (2개, 3개... 4개... 여러개의 테이블 조합 가능)
--SQL JOIN문법
SELECT M.M1, M.M2, S.S2, X.X2
FROM M, S, X
WHERE M.M1 = S.S1 AND S.S1 = X.X1;
-- 위의 조건은 A == B == C , A==C 와 같은 뜻

--ANSI문법
SELECT M.M1, M.M2, S.S2, X.X2
FROM M JOIN S ON M.M1 = S.S1
               JOIN X ON S.S1 = X.X1;
--          JOIN Y ON X.X1 = Y.Y1 --이어서 붙일 때

--HR계정으로 이동
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

--1. 사번, 이름(LAST NAME), 부서번호, 부서이름 출력
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID;
--106명 -107명이어야 하는데 JOIN은 NULL을 포함하지 않아서 NULL값 하나가 출력이 안된 상태 

SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NULL; --부서 ID가 NULL값 가진 사람이 있음
--등가 JOIN으로는 해결 불가
--(OUTER JOIN)을 사용해야 함

--2. 사번, 이름(LAST NAME), 부서번호, 부서명, 지역코드, 도시명 출력

SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM LOCATIONS;

select e.employee_id, e.last_name, e.department_id, d.department_name, d.location_id, l.city
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;



-----bit 계정----
--2. 비등가 조인(non-equi join) >>의미만 존재한다 >>등가조인문법
--원 테이블과 대응되는 테이블의 컬럼이 1:1로 매핑되지 않는 경우

select * from emp;
select * from salgrade;

select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.LOSAL and s.HISAL;

------------------------------------------------------------------------
--3. OUTER JOIN(equ join + null) 내부적으로 equi join이 먼저 실행된다.
--outer join ( 주, 종 관계를 파악해야 한다. left는 왼쪽, right는 오른쪽, 두 개의 테이블에서 누가 주 테이블이고 누가 보조테이블인지 확인하는 것 . 파악해서 주가 되는 테이블의 있는 남은 데이터를 가져오는 것)
--문법 3가지가 있다.
--left outer join ( 왼쪽이 주인인 경우 )
--right outer join (오른쪽 주인)
--full outer join (왼쪽이 주인일 때와 오른쪽이 주인일 때를 union 한 것)
--left [ outer ] 생략 가능 join
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
on m.m1 = s.s1; --즉 left outer join 과 right outer join 의 값을 합치고 중복이 제거된채로 나온다. union 은 중복제거 디폴트라서. union all이 중복제거 안하는거
--order by 하지 않아서 내부적인 규칙에 따라 자동으로 정렬되어서 출력된다.


--HR계정으로 이동--
--1. 사번, 이름(LAST NAME), 부서번호, 부서이름 출력
SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E left outer JOIN DEPARTMENTS D
ON E.DEPARTMENT_ID  = D.DEPARTMENT_ID
order by E.EMPLOYEE_ID;
--107명 전부 출력이 된다.
------------------------------------------------------------------------------------------------------
--self join (자기참조) -> 의미는 다르지만 문법 자체는 (등가조인)을 이용한다 = 내 테이블 안에서 다른 값을 찾는 것
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우

--join은 테이블이 하나 이상이어야 하는데(테이블 간의 데이터를 뽑아야 하니까)
--테이블의 가명칭을 다르게 해서 여러개처럼 사용

select e.empno, e.ename, m.empno, m.ename
from emp e join emp m --하나의 테이블을 별명을 붙여서 두개처럼 사용
on e.mgr = m.empno;
--문제발생 사원은 전체 14명인데 나온 값은 13명이다.

select * from emp; --prejident가 null이라

select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m --left join을 이용해서 null값까지 추출
on e.mgr = m.empno

--셀프join으로 하는 이유는 관리자도 회사 내의 사람이기 때문에 ( 같은 테이블 내의 사람 정보를 이용하는거기 때문에 )


--------------------JOIN 테스트----------------------------다시 해보기

select * from emp;
select * from dept;
select * from salgrade;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;


-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
select e.ename as "이름" , e.job as "직위", e.deptno as"부서번호", d.dname as"부서이름"
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select e.ename as "이름", d.dname as "부서이름"
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';


-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라
---------------------------다시
select e.ename, d.dname, e.sal, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.

select e.job, e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다

select e.empno as "사원번호", 
            e.ename as "사원이름", 
            e.sal*12 as "연봉",
            e.sal*12+comm as "실급여", 
            s.grade as "급여등급"
from emp e inner join salgrade s 
on e.sal between s.losal and s.hisal
where e.comm is not null;
 
-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
 on e.deptno = d.deptno
 join salgrade s
on e.sal between s.losal and s.hisal
 where e. deptno = '10';
 
 
 select * from emp;
select * from dept;
select * from salgrade;
 
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.

 select e.deptno, d.dname, e.ename, e.sal, s.grade
 from emp e join dept d
 on e.deptno = d.deptno
 join salgrade s
on e.sal between s.losal and s.hisal
where e.deptno in(10,20)
 order by deptno , sal desc;
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)

select e.empno as "사원번호" , e.ename as "사원이름", m.empno as" 관리자번호", m.ename as "관리자이름"
from emp e left outer join emp m
on e. mgr = m.empno;



--------------------------------------------------------------------------------
--subquery pdf (100page)
--subquery는 sql의 꽃이라고 합니다 ㅎ0ㅎ
--함수, join 둘 다 사용해도 안나오는 결과가 있으면 subquery

--사원테이블에서 사원들의 평균 월급보다 더 많은 월급을 급여를 받는 사원의 사번, 이름, 급여를 출력

select avg(sal)
from emp;  --2073.214285714285714285714285714285714286

select *
from emp
where sal > 2073; --위 아래 하나로 합치기

select *
from emp
where sal > (select avg(sal)from emp); --쿼리문 안에 들어가는 쿼리문

--subquery
/*
컬럼의 값 = 결과가 하나인지 여러개인지에 따라서 달라짐.
1. single row subquery :  subquery 의 결과 row가 1개라면(단일컬럼의 단일값) 줄이 하나만 나오는 것 컬럼 하나에 값이 하나
2. multi row subquery :   단일컬럼의 결과값이 두개이상부터는 multi row subquery

구별하는 이유는 : 사용되는 "연산자"가 다르기 때문
-multi row의 경우 : (in, not in)      (any = or , all = and)
>>ALL(and) >> sal > 1000 and  sal > 2000 and sal...
>>ANY(or) >> sal > 1000 or sal > 2000 or sal...

*subquery의 정의
1. 괄호 안에 존재해야 한다. (무조건) (select sal from emp)
2. 단일컬럼으로 구성되어야 한다. (select sal , deptno from emp) ... 이렇게 안씀!!!!!!!!!
3. 단독 실행이 가능해야 한다. 서브쿼리도 하나의 쿼리이기 때문에 단독으로 실행 가능한 쿼리문이어야 한다.

실행순서는
1. 실행문에 서브쿼리가 존재하면 무조건 선행된다.
2. 메인쿼리가 서브쿼리의 결과값을 가지고 실행된다.

*/

----사원 테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력

select sal from emp where ename = 'JONES'; --2975 (싱글로우)

select empno, ename, sal
from emp
where sal > (select sal from emp where ename = 'JONES'); --쿼리면 먼저 실행, 그 다음에 from, where , select 순으로 실행  (싱글로우)


--서브쿼리의 조건을 급여가 2000달러 이상
select sal from emp where sal > 2000; --값이 여러개가 나오므로 멀티 로우

select empno, ename, sal
from emp
where sal in (select sal from emp where sal > 2000); 
--sal의 값이 2975 2850 2450 3000 3000 5000 이다. 여러개
--where sal = 2975 or sal = 2850 or sal =2450 or... 와 같음)
--where sal > (select sal from emp where sal > 2000); 데이터가 여러 건이라서 싱글로우가 아님 값이 여러개가 들어있어서 > 연산자를 쓸 수 없음.

--not in의 경우(부정의 and)
--급여가 2000달러 이상이 아닌경우
select empno, ename, sal
from emp
where sal not in (select sal from emp where sal > 2000); 
--where sal != 2975 and sal != 2850 sal != 2450 sal != 3000 sal != 3000 sal != 5000  의 의미  이 데이터가 들어있으면 안된다는 의미


--부하직원이 있는 사원의 사번과 이름을 출력하세요.

select mgr from emp; --멀티

select *
from emp
where empno in (select mgr from emp);
--empno = 7788 or empno = 7902  or empno = null

--부하직원이 없는 사원의 사번과 이름

select *
from emp
where empno not in (select mgr from emp);
--empno != 7788 and empno != 7902  and empno != null = is not null
--and에 null값이 포함되면 결과는 null이다.

select *
from emp
where empno not in (select nvl(mgr,0) from emp); -- 서브쿼리 문에서 null값을 0으로 대체해버리는게 안전

select *
from emp
where empno not in (select mgr from emp where mgr is not null); --서브쿼리 문에서 null값을 빼버리기

--KING에게 보고하는 즉, 직속상관이 KING인 사원의 사번, 이름, 직종, 관리자 사번을 출력
select empno from emp where ename = 'KING'; --king의 사번을 먼저 뽑아내고

select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING'); --mgr 사번이 king과 같은 것을 찾아서 도출

--20번 부서의 사원 중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름, 급여, 부서번호 출력

select max(sal)
from emp
where deptno = 20;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal) from emp where deptno = 20); 

--POINT--
--subquery는 select 절에 사용 가능하다.
--                  from절에도 사용 가능하다.
--                  where절에도 사용 가능하다.



--이런식으로 and로 연결해서 사용가능하다.
select *
from emp
where deptno in (select deptno from emp where job = 'SALESMAN')
                        and sal in(select  sal from emp where job = 'SALESMAN');

--quiz
--실무에서 사용하는 !
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요

select deptno, avg(sal) 
from emp 
group by deptno;

select e.empno, e.ename, e.deptno, e.sal, s.평균급여
from emp e join (select deptno, round(avg(sal),0) as 평균급여 from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.평균급여;

------------서브쿼리 문제 풀기--------------
--1. sumith보다 월급을 많이 받는 사원들의 이름과 월급 출력(OK)

select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');

--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.(OK)
select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라. (OK)

select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE')
                            and ename not in ('BLAKE');
--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라. (OK) 이런 유형이 가장 많음

select empno, ename, sal
from emp
where sal > (select round(avg(sal),0) as "평균급여" from emp)
order by sal desc;
 
--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.(OK)

select empno, ename
from emp
where deptno in (select deptno from emp where ename like '%T%');

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것) (OK)

 select ename, deptno, sal
 from emp
 where sal > (select max(sal) from emp where deptno = 30);


--혹은 select enmae, deptno, sal from emp
        --where sal > all(select sal from emp where deptno = 30)

 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라. 서브쿼리문 안에 다른 테이블 값이 들어 갈 수 있다는 것을 알게 되었따.

select * from emp;
select * from dept;
select * from salgrade;

select ename, deptno, job
from emp
where deptno in (select deptno from dept where loc = 'DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라. (다시)
select * from emp;


select ename, deptno, job
from emp
where deptno in (select deptno from dept where dname = 'SALES');

 
--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번) = 사수가 KING인 사람

select empno from emp where ename = 'KING';

select empno, ename, job, mgr
from emp
where mgr = (select empno from emp where ename = 'KING');

 
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라. (다시해보기)

select empno, ename, sal
from emp
where sal > (select round(avg(sal),0) from emp)
                    and deptno in(select deptno from emp
                                    where ename like '%S%');

 
--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라. (다시다시)

--부서번호 출력
select deptno from emp where comm is not null;

--월급 출력
select sal from emp where comm is not null;

select ename, sal, deptno
from emp
where deptno in(select deptno from emp where comm is not null)
and sal in(select sal from emp where comm is not null);
                    

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
-- 사원들의 이름, 월급, 커미션을 출력하라. (다시)
--30번 부서 사원의 월급
--30번 부서 사원의 커미션

select sal from emp where deptno = 30;
select comm from emp where deptno = 30 and comm is not null;


select ename, sal, comm
from emp
where sal not in (select sal from emp where deptno = 30)
                    and comm not in(select comm from emp where deptno = 30 and comm is not null);
                              
----------------------~여기까지가 개발자 기본과정~----------------------
/*
select
from
where
group by
having
order by

기본 함수
문자, 날짜, 숫자, 변환, 일반, 집계함수 !

<join>
하나 이상의 테이블에서 데이터 가져오기(다중테이블 활용 : 관계가 있는)

join으로 해결이 안되는 문제 subquery !
--------------여기까지가 초급개발자가 가지는 기본소양----------------

*/
-------------------DML----------------------
--[INSERT], [UPDATE], [DELETE] 를 이제부터 할 것 (암기)
/*

<Oracle기준>
DDL(데이터 정의어) : 없는 것을 새롭게 만들고, 그 만든 것을 수정하고 지우는 작업 : create, alter, drop, truncate(메모리 공간까지 지워버리는 것, rename, modify) 
DML(데이터 조작어) : insert , update, delete
DQL(데이터 질의어) : select -->여태까지 한 것
DCL(데이터 제어어) : 권한처리(developer - crate user 해서 bit만든 것 grant, revoke) >> DBA라는 직종이 하는 일(관리자 : 모니터링 : 데이터 백업, 복원)
TCL(트랜잭션)        : commit, rollback, savepoint

개발자 : CRUD DB기준으로 생각 (Create = insert, read = select, U = Update, D = Delete) 

*/

--DML ( 트랜잭션을 동반한다. ) 정처기-> 트랜잭션의 정의 ?  하나의 논리적인 작업 단위 ----!!!!매우중요!!!!---- LOCK을 동반한다. 누군가 트랜잭션 중이라면 다른 사람이 건드리지 못한다. 그러므로 최대한 짧게 설정해야 한다. 필수요소만
--A라는 은행에서 돈을 인출해서 B라는 은행에 입금을 하려고 한다.
--A : A은행에서 돈 500만원 인출 -> update ... 1000만원을 500만원으로
--B : B은행에도 update가 된다. 기존 1000만원인 상태에서 A은행에서 인출 한 500만원이 입금되면 총 1500만원이라는 금액으로 update가 되어야 한다.
--그런데 A은행에서 인출되던 도중에 프로그램이 꺼져버리면? ( B은행으로 입금이 되지 못한 채)

--A와 B의 작업은 별개가 아닌 연속(하나로 묶여야)되어야 하는데 A에서 돈을 인출하던 도중에 프로그램이 꺼지면 B에 입금을 하는 과정이 되지 못했으므로 처음으로 rollback 되는 것
-- = 연결된 과정이 끝까지 다 성공하면 commit, 과정 중 하나만 실패하더라도 rollback 
--중간에 savepoint라는 것을 만들어서 중간까지의 작업 과정을 저장 할 수도 있지만 일단은 이 개념은 무시

select * from tab; --tab는 접속한 사용자가 만든 모든 테이블 (지금까지 실습했던 테이블들이 보임) bit계정에 만든 테이블 목록 create테이블 할 때 같은 이름 없는지 확인 할 때

select * from tab where tname = 'BOARD'; -- 테이블명으로 검색해서 중복 확인, 대문자로 해야함. 이미 존재하므로 다른 이름으로 해야 함

select * from col; --컬럼명 검색 가능

select * from col where tname = 'EMP'; --구체적으로 어떤 테이블의 컬럼정보를 보고싶은지 지정

select * from user_tables; --테이블들의 정보(용량, 디스크 사용 정도)들을 볼 수 있음 (관리자들이 자주 사용)

select * from user_tables where table_name = 'DEPT'; --dept테이블의 하드웨어적인 정보 등을 볼 수 있음

--------------------------------------------------------------------------------------------------------------
/*
--DML (pdf교재 : 10장 168page)

INSERT INTO table_name [(column1[, column2, . . . . . ])] VALUES  (value1[, value2, . . . . . . ]); 
 
 */

create table temp(
id number primary key, --ID컬럼에는 not null 하고 unique한 데이터만 들어 갈 수 있다. = null값 안되고 중복데이터 안됨
name varchar2(20) --아무것도 안쓰면 default로 null값 허용
); --temp테이블 생성


/*

[문자 타입] ( )숫자는byte를 의미
char(20) >>한글 10글자 >>"고정길이" 문자열타입
varchar2(20) >>영문자, 특수문자 공백은 20자 >>"가변길이" 문자열 타입

char(20) >> '홍길동' 을 넣었을 때 6byte이므로 char의 경우는 [홍길동                ] >> 20byte로 저장 실제 사이즈보다 작은 값을 넣더라도 총 길이의 변화는 없음 
varchar2(20) >> '홍길동' 을 넣었을 때 [홍길동] 이면 남은 byte는 잘라버리고 6byte만큼만 잡아서 저장한다.


ex)회원가입 시에
고정길이 데이터 : 남, 여 : char(2) 로 해놓으면 바뀔 일이 없기 때문 혹은 주민번호 누구나 같은 길이를 가지는 값...
가변길이 데이터 : 이름(길이가 바뀔 수 있음)

고정길이 데이터와 가변길이 데이터를 나눠놓은 이유는 "성능적인 이유"로 검색 시에 varchar보다 char를 우선한다. varchar는 길이가 왔다갔다 하기 때문에 가장 나중에 처리됨
고정길이 데이터 값이 될 예정이라면 왠만하면 char로 쓰자.

우리는 항상 한글로인해 고민거리가 생긴다. 그래서 만든 것이 (java의 unicode : 모든 한 글자를 2byte로 통일) >>한글, 영문자, 특수문자, 공백 다 공평하게 2byte로 설정
유니코드 처럼 nchar 를 만들었다. 

nchar(20) >> 20 "글자 수로 책정" >>내부적으로 총 byte 수는 2 * 20 = 40byte를 가지고 있다.

nvarchar로도 사용가능
nvarchar(10) -- 10글자 사용 가능
*/

select * from temp;

--1. 가장 일반적인 INSERT
insert into temp(id, name)
values(100, '홍길동'); --commit과 rollback을 반복하면서 데이터를 넣기

select * from temp;
--실반영

commit;

--2. 컬럼에 대한 목록을 생략 가능 (가독성 떨어지므로 되도록이면 하지 말것)
insert into temp
values(200, '김유신'); --데이터가 컬럼의 개수, 순서와 일치해야함. ( 나중에 무슨컬럼인지를 몰라서 좋지않음 )

select * from temp;

commit; --auto commit은 하지 말것 실수하면 되돌릴 수 없기 때문

--1. 문제상황
insert into temp(id, name)
values(100, '아무개'); --unique constraint (BIT.SYS_C007004) violated 중복데이터라서 오류 table 생성 시에 id number primary key,  넣어놔서

insert into temp(name)
values('아무개'); --cannot insert NULL into  // not null, unique 여야 하는데, id컬럼을 입력하지 않아서 null값이 들어갈 예정이기 때문에 에러가 남.  null은 넣을 수 없기 때문에
------------------------------------------------------------------------------------------------
--일반 SQL문은 프로그램적인 요소가 없다. 지금까지 했던 것들은 일반 SQL
--제어문같은...?
--그래서 PL-SQL이라는 것을 만들었다. (고급 SQL) program language --프로그램적인 요소를 이용 할 수 있다.(제어문, 변수)
--예를 들어 데이터를 테스트 하고 싶은데 1000건의 데이터가 있다면 insert를 1000번을 해야 하는지? java라면 for문 돌렸을 것을...
--이럴 때 사용 하는 것이 PL-SQL

create table temp2(id varchar2(20));
/*
begin
for i in 1..1000 loop
        insert into temp2(id) values('A' || to_char(i));
end loop;
end;

select * from temp2; --commit해야 반영됨

commit;

select * from temp2
order by id desc;
*/

create table temp3(
memberid number(3) not null, --3자리 정수
name varchar2(10), --null 허용
regdate date default sysdate --기본값 설정하기 --날짜를 insert를 했을 때 regdate를 넣지 않으면 알아서 sysdate가 입력되는 것 --게시판에 글 쓸 때 올린 시간을 입력하지 않아도 자동으로 시간이 들어감
);


select sysdate from dual;
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

insert into temp3(memberid, name, regdate)
values(100, '홍길동','2020-04-03'); --직접 날짜 넣어도 상관 없음

select * from temp3; --100	홍길동 2020-04-03 00:00:00

commit;

insert into temp3(memberid, name)
values(200, '아무개'); --200	아무개	2020-04-03 12:13:59 reg가 default로 들어감 --회원가입 날짜, 게시판 글쓴 날짜를 default로 먹여서 시스템의 값으로 셋팅

insert into temp3(memberid) --name컬럼에 null을 허용했으므로 가능,  300	(null) 2020-04-03 12:15:33 이렇게 들어감
values(300);

insert into temp3(name)
values('이름만 넣기'); --memberid는 not null이라서 무조건 들어가야 하는데 안들어가있어서

--insert 팁
--1. 대량 데이터 insert 하기
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

--------------대량 insert-------------------
--요구사항 : temp4에 있는 모든 데이터를 temp5에 넣고싶다.
--insert into 테이블명 (컬럼리스트) values( 값 리스트 ) -값을 하나만 선택 가능했는데
--insert into 테이블명 (컬럼리스트) select 절(컬럼리스트의 개수와 타입이 동일하다는 조건 하에)

insert into temp5(num)
select id from temp4; --temp4에 있는 id를 temp5의 num컬럼에 입력 num타입과 id타입이 맞아야 하고, 컬럼 개수가 맞아야 한다.

select * from temp5;

--2. insert TIP
--테이블이 없는 상황에서 테이블을 만들면서 데이터를 insert 하는 방법
--단, 복사의 개념이기 때문에 (복사하는 테이블의 제약 정보는 복사가 안된다.) primary, 와 같은 제약사항
--순수한 테이블 구조(컬럼이름, 타입이 복사가 된다 =  스키마)

--원래는 create table copyemp(id number)
create table copyemp
as 
    select * from emp; --emp와 똑같은 구조의 copyemp라는 이름의 테이블을 만들고 emp의 데이터를 넣어줌

select * from copyemp; --확인해보면 구조, 데이터까지 복사가능 --원본테이블을 건드리지 않고 복사한 테이블을 이용해서 실습

--특정 컬럼만 복사하기
create table copyemp2
as
select empno, ename, sal from emp
where deptno = 30; --select 구문의 3개의 컬럼을 사원번호가 30번인 사람들의 데이터를 insert

select * from copyemp2;

select * from col where tname = 'COPYEMP2'; -- copyemp2의 컬럼명 찾기

--질문 : 구조(틀만 복사하고 데이터는 넣고싶지 않을 때)

create table copyemp3
as 
select * from emp where 1 =2 ; --> 1=2는 조건이 항상 false이므로 내용 없이 구조만 가져옴

select * from copyemp3;


-----[INSERT END]-----

----[UPDATE]----
/*

update table_name
set column1 = value1, column2 = value2 ....
where 조건


update table_name
set column1 = (서브쿼리)
where 조건

*/

select * from copyemp;

update copyemp
set sal = 0; --sal컬럼의 모든 데이터가 0으로 바뀜 ㅇ0ㅇ;;;;;;;;

rollback;

update copyemp
set sal = 0
where deptno = 20; --부서번호가 20번인 사람만 급여를 0으로 바꾸겠다.


commit;

update copyemp 
set sal = (select sum(sal) from emp) --서브쿼리문이 들어올 때에는 싱글쿼리만 가능함 = 값이 하나인것
where deptno = 20; -- 29025달러로 변경

commit;

--여러개의 컬럼을 동시에 update (, )로 구분 ,
update copyemp
set ename = 'AAAA', job = 'BBB', hiredate = sysdate, sal = 1111
where deptno = 10; 

commit;

-----------
--[DELETE]
--원칙적으로는 delete를 하고 commit, rollback을 하면 복원이 불가능하다. 단, 백업을 해뒀던가 하면 가능하다.

delete from copyemp; --데이터를 삭제하고
select * from copyemp; --확인해보면 데이터가 삭제되어있는데
rollback; --rollback을 다시 하고 다시 확인해보면 데이터가 복원이 되어있다.

--조건을 추가해보자
delete from copyemp where deptno in(10,20); --copyemp테이블에서 deptno가 10,20인 것들을 삭제

select * from copyemp where deptno in (10,20);
commit;


--------------[DELETE END]-------------
/*
APP(JAVA)     ->         JDBC API     ->      ORACLE(DB)

위와 같은 과정으로 CRUD를 작업을 하게 된다.
create : insert
read : select
update : update
delete : delete

(DML : insert, update, delete) 트랜잭션을 동반하는 작업이다. 작업을 한 후에 commit이나 rollback이 강제된다.

JDBC -> Oracle을 통해서 Emp 테이블에서 작업을 한다면
--emp 테이블 전체조회(java였다면 함수)
--emp 테이블 조건조회(사번이 ~인 사람~ 등과 같은 조건이 있는 조회)(java였다면 함수)
--emp 테이블 삭제(java였다면 함수)
--emp 테이블 데이터 수정(java였다면 함수)
--emp 테이블에 삽입(java였다면 함수)

java에서 사용하는 방법은 함수를 일단 만든 다음 그 함수 내용에 sql 내용을 적어서 사용
-전체조회 : public list<Emp> getEmpAllList(){String sql = "select * from emp"}
ㅎ
-조건조회 : public Emp getEmpListByEmpno(){String sql= "select...where empno=777"}

-삽입 : public int insertEmpData(Emp emp){String sql = "insert into emp().....}

*/
-----------------자꾸 여기까지가 초급개발자가 할 수 있는거 다하는거라고 하시면서 내용을 추가하신다.....----------------

--[DDL]
--create, alter, drop(테이블 기준)

select * from tab; --create하기 위해 미리 테이블명을 확인 하고 없는 것으로 만들기
select * from tab where tname = 'BOARD'; --create하기 위해 미리 테이블명을 확인 하고 없는 것으로 만들기

--delete는 안의 내용을 지우는 것이지만 drop은 테이블 자체를 날려버림 (데이터도 같이)

drop table board;

--아까 있던 테이블을 drop시켰기 때문에(테이블 자체를 삭제했기 때문에 다시 같은 이름으로 만들 수 있게 된다)
create table board(
    boardid number,
    title nvarchar2(100),
    content nvarchar2(2000), --최대 2000자
    regdate date
);

--Oracle 11g 버전부터 지원되는 기능( 가상컬럼(조합컬럼))
--학생 성적 테이블을 만든다고 가정했을 때
--국어점수컬럼, 영어점수컬럼, 수학점수컬럼이 있다면 설계 할 때 총점컬럼을 만들 것인가 아닌가? 를 고민하게 되는데, 총점 컬럼을 따로 만들 필요는 없다. 굳이? 국어, 영어, 수학점수가 있으면 총 점수를 알 수 있기 때문에
--국어,영어,수학 점수가 들어오면 자동으로 총점이 계산되면 편할 것 같은데
create table vtable(
no1 number,
no2 number,
no3 number generated always as (no1 + no2) virtual
); --no3이란 가상컬럼 조합컬럼인데 어떤 것의 만들어진 값을 받는 컬럼 = no1,no2컬럼에 데이터가 들어가면 그 둘의 합계값이 no3에 들어간다.


INSERT into vtable(no1,no2)
values (100,200);

select * from vtable; --데이터를 출력해보면 no3에 no1과 no2의 데이터를 합친 값이 no3에 들어가있다.

insert into vtable(no1,no2)
values (33,44); --똑같이 no3에도 더한 값이 들어간다.

--no3에는 no1,no2를 직접 계산한 값은 넣을 수 없다.  자동으로 계산해주는 가상컬럼을 만든 의미가 없어지기 때문
insert into vtable(no1,no2,no3)
values (100,200,300);

--가상 컬럼이 있는지 없는지 정보를 보기
select column_name, data_type, data_default
from user_tab_columns where table_name = 'VTABLE';
--NO3	NUMBER	"NO1"+"NO2"


--실무에서 어떻게 활용되는지?
--재고관리 프로그램에서 제품정보 입력되면 (입고일) 분기별 관리를 하게 된다. 1년을 4분기로 나누면 1,2,3은 1분기 4,5,6은 2분기... 로 나눠서 4분기 데이터의 총액을 구해라? 등의...

--입고일 기준으로 2020-03-01 ->1분기 데이터이므로, 이 날짜가 들어오면 알아서 데이터로 뽑아내고 싶다면

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

select * from vtable2;


Insert into vtable2(p_date) values('20200101');
Insert into vtable2(p_date) values('20200126');
Insert into vtable2(p_date) values('20200304');
Insert into vtable2(p_date) values('20200901');
commit;

------------------------------------------------------------------------------
--DDL 테이블 다루기 pdf교재 138p

--1. 테이블 생성하기
create table temp6( id number);

--2. 테이블을 만들다가 컬럼 하나를 빼먹었다면...?
desc temp6; --컬럼 확인해보고

--'alter' 라는 명령어를 쓰면 테이블 입장에서의 추가, 컬럼 입장에서는 add당함
alter table temp6
add ename varchar2(20); --여기까지 입력하고 확인해보면 컬럼이 추가되어있음

--3. 기존 테이블에 있는 컬럼의 이름을 잘못 표기했다면?(ename->username)
--기존 테이블에 있는 컬럼의 이름 바꾸기(rename 명령어 사용) 테이블 입장에서는 alter당하는 것, 컬럼 입장에서는 rename당하는 것

alter table temp6
rename column ename to username; --username으로 변경되어 있음


--4. 기존테이블에 있는 기존 컬럼의 타입을 수정하기(이름이 4자가 최대인 줄 알았는데 20자인 사람도 있었다면... 타입 수정해야함)
--modify 명령어 (테이블 alter당함, 컬럼은 modify당함) 크기 늘리기 줄이기 다 가능하나, 줄일 때 이미 들어있는 데이터가 줄일만큼보다
--더 크면 안됨.

alter table temp6
modify (username varchar2(100));


desc temp6; --20byte에서 100byte로 커져있음

--5.username을 만들고보니 실제로 사용을 하지 않는다... 기존 테이블에 있는 컬럼을 삭제하기 (별로 쓸 일 없긴 함)
--컬럼 지우면 데이터도 같이 삭제된다.

alter table temp6
drop column username; --username컬럼 삭제됨


--6. 테이블삭제 : drop
--6-1 데이터 삭제 : "delete" 다른 개념임

--테이블을 처음 만들면 처음 크기가 생성-> 데이터를 넣으면 -> 처음 만들었던 크기보다 더 큰 데이터가 들어와도 알아서 크기를 변경 
-->오라클 서버가 깔린 OS가 가진 DISC만큼이 최대용량 >>처음 만들었던 용량보다 충분히 커질 수 있다.
--ex) 처음 1MB >> 10만건의 데이터가 들어가서 기존 1MB가 모자라서 테이블 크기가 100M로 늘어났다. 
--그 이후 데이터 10만건을 다시 삭제("delete")해도 늘어난 공간은 줄어들지 않고 그대로 남아있다.

--테이블의 데이터를 삭제하면서 공간의 크기도 줄이는 방법
--"truncate 명령어" (delete는 데이터만 삭제, truncate는 처음 만들었던 공간의 크기로 줄임) 대신에 where절에는 사용불가
--한번에 크기를 줄이기 때문에 조건을 입력하는 where절에서는 쓰지 못함
--ex) 처음 1MB >> 10만건의 데이터가 들어가서 기존 1MB가 모자라서 테이블 크기가 100M로 늘어났다. 
--그 이후 데이터 10만건을 다시 삭제(truncate)하면 삭제 후에 공간도 원래 크기로 돌아온다.

--7. 테이블 삭제(drop) 공간 자체를 삭제
drop table temp6;

select * from temp6; --"table or view does not exist"

--------------------------------------------------------------------------------
--테이블에 제약 설정하기 pdf교재 144p
--제약의 이유 : 데이터 [무결성] 확보 --데이터를 믿고 쓰겠다 라는 의미에서 (원하는 값만 들어있게)
--'select' 는 제약과 연관성이 없다. 데이터를 가져오는거기 때문에
--제약(constraint)은 insert , update와 같은 경우에 필요하다.
--제약사항 delete : FK와 연관

/*
1. PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
--테이블에 한 개만 걸 수 있다(테이블 당 하나... 여러개를 묶어서도 가능하긴 함 = 복합키도 가능)
--한 테이블에서 이름 컬럼에 primary key를 걸어버리면 다른 컬럼(전화번호)에서는 PK를 사용 못함.
--묶어서 사용하거나 해야 함 이럴 때 전화번호컬럼에 UK를 사용
--내부적으로 검색의 향상을 위해서 (index) 자동 생성 -> [select기능의 향상]
--한 페이지 크기가 8kb인데 하나하나 읽어서 넘기는 것을 scan작업이라고 한다.


2. FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
--참조제약이라고도 한다. java로따지면 클래스와 클래스간의 관계로하자면 association과 같은 관계
--테이블과 테이블간의 관계

3. UNIQUE key(UK) 테이블의 모든 행을 "유일"하게 하는 값을 가진 열("NULL 을 허용") 
--null을 가질 수 있다 -> unique와 not null을 동시에 병행하면 null값 불허용도 가능하다.
--primary key와 다른점은 null을 가질 수 있다. 문제가 생길 수 있고 해결 할 수 있다.

4. NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다. 

5. CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정) 
--설정한 범위의 값만 받겠다.
--where조건 쓰는 것과 같음 ex) where gender in('남','여') -gender 컬럼에 이러한 조건들을 설정해서 이러한 데이터만 받도록
--다른 데이터가 들어가면 제약오류가 뜸
*/

--제약을 만드는 시점
--1. 테이블을 만들면서 바로 생성 (create table ~)
--2. create로 테이블을 만든 다음에 제약을 추가하는 것(이 방법이 더 많이 쓰임)
--alter table add constraint ...
--자동화된 툴들이 주로 사용하는 방법

--1. 제약정보 확인하기
select * from user_constraints where table_name = 'EMP'; --구체적인 테이블 명을 제시하고 그 테이블의 제약정보를 확인
--SYS_C006997 내부적으로 생성된 제약의 이름
--"EMPNO" IS NOT NULL 이런 제약이 걸려있음

create table temp7(
    --권장하지 않음 id number primary key 줄임표현 (제약의 이름이 내부적으로 임의로 설정되기 때문에 " SYS_C006997" 나중에 불편
    --아래처럼 제약의 이름을 직접 정해서 제약하기 (제약의 이름을 통해 어디에 어떻게 걸려있는지 알아 볼 수 있도록)
    id number constraint pk_temp7_id primary key , --권장사항
    name varchar2(20) not null, --not null은 constraint 쓰지 않아도 됨
    addr varchar2(50) --뒤에 아무것도 안쓰면 null 허용
);

select * from user_constraints where table_name = 'TEMP7';
--pk_temp7_id 해석이 가능 제약 수정, 삭제시에 사용

insert into temp7(name, addr) values ('홍길동', '서울시 강남구'); --name컬럼이 없어서 제약오류가 뜸
--cannot insert NULL into ("BIT"."TEMP7"."ID")

insert into temp7(id, name, addr) values(10, '홍길동', '서울시 강남구');

commit;

insert into temp7(id, name, addr) values(10, '아무개', '서울시 강남구');
--unique constraint (BIT.PK_TEMP7_ID) violated = ID값은 중복값 허용 불가인데 10으로 "중복"되어서

--1. 테이블에 primary key를 몇개까지 걸 수 있을까요? '1개' but 묶어서 1개도 가능
--(name , num) 여러개의 컬럼을 묶어서 1개로 가능 >> 복합 키


create table temp8(
id number constraint pk_temp8_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp8_jumin unique, --주민컬럼에는 중복되는 값을 받지 않겠다. 그러나 null값은 허용한다.
addr varchar2(20) 
);

select * from user_constraints where table_name = 'TEMP8'; --제약 있는지 확인

insert into temp8(id, name, jumin, addr)
values (10, '이정아', '123456', '경기도 안산시');

select * from temp8;

commit;


insert into temp8(id, name, jumin, addr)
values (20, '아무개', '123456', '경기도 안산시'); 
--unique constraint (BIT.UK_TEMP8_JUMIN) violated 제약오류

--unique제약에 null값을 넣어보자.그런데 null값도 중복체크를 할까?


insert into temp8(id, name, addr)
values (30, '김씨', '경기도 안산시'); --jumin 값을 넣지 않아도 unique는 null값을 허용하기때문에 들어감


insert into temp8(id, name, addr)
values (40, '박씨', '경기도 안산시'); --null값 중복체크를 '안'한다.


select * from temp8;

--result : null허용하나 중복체크 대상은 아니다. 

--테이블을 만들 때
--이렇게 직접적으로 제약을 걸면 된다. not null + unique 조건을 동시에 걸기
--create table temp8(jumin not null constraint ..unique)
--unique제약은 테이블에 몇개까지 걸 수 있을까? primary key의 경우 하나였지만, unique는 컬럼 개수만큼 가능하다. 

-----------------------------------------------------------------------
--만들어진 테이블에 제약 추가하기(일반적인 방법)
--주의 : 데이터가 있는 경우 제약을 위반하는 데이터가 있다면 제약은 추가되지 않는다. primary key 제약을 걸려고 하는데, 만약
--이미 만들어진 테이블에 중복데이터가 있다면 primary key 제약은 걸리지 않는다.
--제약을 걸기 전에 데이터 검사 작업을 선행해야 한다.

create table temp9(id number);

alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where table_name = 'TEMP9';

--여러개의 컬럼(복합키)에 제약을 걸고 싶다면
--add constraint pk_temp9_id primary key(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--ename컬럼에 not null 제약걸기(잘 안쓰긴 함)

alter table temp9
modify(ename not null);

-------------------------------------------------------------------
--[check 제약]
--where 조건과 동일한 형태의 제약 >> where age > 19
--컬럼이름 age > 19 형태로 제약을 건다. 해당 컬럼에는 19보다 큰 데이터만 들어가게 되어있음.


create table temp10(
id number constraint pk_temp10_id primary key,
name varchar2(20) not null,
jumin char(6) constraint uk_temp10_jumin unique,
addr varchar2(20),
age number constraint ck_temp10_age check(age >= 19) --age컬럼에 check 제약걸기
);

select * from user_constraints where table_name = 'TEMP10';

insert into temp10(id, name, jumin, addr, age)
values (100, '이정아', '123456', '서울시 강남구', 20);

select * from temp10;

commit;

insert into temp10(id, name, jumin, addr, age)
values (200, '이정아', '123456', '서울시 강남구', 10); --체크제약 확인해보기 check constraint (BIT.CK_TEMP10_AGE) violated
------------------------------------------------------------------------------
--[참조제약 : RDBMS(관계형 데이베이스)이기 때문에 참조제약이 있어야 테이블과 테이블 간의 관계를 설정 할 수 있다.]

--EMP 테이블의 deptno 컬럼이 DEPT테이블의 deptno 컬럼을 참조하려고 할 때(FK를 걸려고 할 때)
--deptno컬럼이 무결하지 않으면(PK키가 걸려있지 않다면) 참조 할 수 없다.
--그리고 FK가 걸리게 되면 EMP컬럼의 deptno에는 DEPT테이블의 deptno 컬럼의 내용만 쓸 수 있다.
--java의 has a, is a 개념과 같다.

--EMP 테이블에 있는 deptno 컬럼은 DPET 테이블에 있는 deptno컬럼을 참조한다. 참조하는 쪽(EMP-deptno컬럼)에 거는 키가
--FK,
--참조를 당하는 쪽에 거는 제약이 PK

create table c_emp
as
select empno, ename, deptno from emp where 1=2; --테이블 틀만 복사

create table c_dept
as 
select deptno, dname from dept where 1=2;


select * from c_emp;
select * from c_dept;


--테이블을 만들고 제약을 걸어보자

drop table c_emp;
drop table c_dept;




alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno)
references c_dept(deptno); --no matching unique or primary key for this column-list 에러 dept컬럼에 PK, unique가 없어서
--c_emp(deptno) >> c_dept의 deptno를 참조하려고 했는데, PK로 지정되지 않아서(무결성이 보장되지 않아서) 에러
--c_dept(deptno) >> 다른 사람에게 빌려주기 위해서 무결성 입증해야 함(PK)
--FK보다 PK를 선행해서 걸어야 함.

--1. PK선행
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

--2. FK걸기
alter table c_emp
add constraint fk_c_dept_deptno foreign key(deptno)
references c_dept(deptno);

--c_emp(deptno) <---> c_dept(deptno) 관계가 설정됨. (1 : N(다)) 관계

insert into c_dept(deptno, dname) values (100, '인사팀');
insert into c_dept(deptno, dname) values (200, '관리팀');
insert into c_dept(deptno, dname) values (300, '총무팀');

select * from c_dept;

commit;

--신입사원 입사
--질문 not null을 걸어서 쓰는 것이 맞다? 설계시에는 답이 없음. 의도가 어떤지에 따라 달라짐
--null 허용 : (null을 허용하는 이유는 신입사원이 들어왔을 경우 부서가 정해지지 않았을 수도 있기 때문에)
--not null 설정: 입사하는 모든 사원은 부서를 가져야한다고 생각했기 때문

insert into c_emp(empno, ename) --이 경우에는 deptno를 null값으로 준 것
values(100, '홍길동');

select * from c_emp;

update c_emp
set deptno = 500
where empno = 100;

update c_emp
set deptno = 200
where empno = 100;

insert into c_emp(empno, ename, deptno)
values(200, '아무개', 100);

select * from c_emp;


--두 개의 테이블
--(부모와 자식관계)
--(master , detail) 마스터와 상세의 관계
--emp(deptno)과 dept(deptno) 관계에서 주 테이블(부모)

--PK를 가지고 있는 쪽이 부모이다. 즉 dept테이블이 master
--그리고 master 테이블을 먼저 출력하고, master 테이블의 deptno의 부서번호들을 클릭하면 그 아래의 상세화면
--ex 부서번호가 10번인 사람들이 출력된다. (emp가 보조테이블)
--물론 emp가 정보내용상 주 테이블이지만, 두 테이블의 관계에 의해 따지면 주 테이블은 dept테이블이 된다.


delete from c_dept where deptno = 300; --dept테이블에서 300번 부서를 지울 수 있ㄷㅏ!
--아직 emp테이블에서 300 데이터를 쓰고있지 않기 때문

delete from c_dept where deptno = 100; --emp 테이블에서 100번을 사용하고 있기 때문에 지울 수 없다.
--ntegrity constraint (BIT.FK_C_EMP_DEPTNO) violated - child record found

--굳이 지우고 싶다면
--먼저 child(emp)에서 사용하고 있는 데이터를 업데이트하거나 삭제해야함. 참조되는 데이터가 없도록

commit;

/*
(column datatype [CONSTRAINT constraint_name]       
REFERENCES table_ name (column1[,column2,..] [ON DELETE CASCADE]) 

column datatype, . . . . . . . , 
[CONSTRAINT constraint_name] FOREIGN KEY (column1[,column2,..])        
REFERENCES table_name  (column1[,column2,..] [ON DELETE CASCADE]) 
*/
--TIP > MS-SQL >> ON UPDATE CASCADE //DELETE, UPDATE
-- [ON DELETE CASCADE]  부모테이블과 생명을 같이 하겠다
-- 300 삭제 할 있나요?  네 
-- delete from c_dept where detpno=300;
-- 참조하는 자식 데이터 같이 삭제
-- delete from c_emp where deptno=300; 같이 실행

--제약삭제
alter table c_emp
drop constraint fk_c_emp_empno; 


alter table c_emp
add constraint fk_c_emp_empno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;


select * from c_emp;
select * from c_dept;
delete from c_Dept where deptno=100;
/*
--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 (소수 이하 2자리까지 남기고 반올림(세자리에서))
--학과코드는 학과 테이블에 학과코드를 '참조'한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드(영어로쓰기)

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--샘플데이터 3건정도 입력
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요

*/

--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어,영어,수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 (소수 이하 2자리까지 남기고 반올림(세자리에서))
--학과코드는 학과 테이블에 학과코드를 '참조'한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드(영어로쓰기)azzX


create table student_table(
s_number number,
s_name varchar2(20) not null,
kor number default 0,
eng number default 0,
math number default 0,
code number,
alljumsu number generated always as (kor + eng + math) virtual,
average number generated always as (round((kor + eng + math / 3),2)) virtual,

constraint s_number primary key(s_number, s_name), --복합키
constraint fk_grade_mcode foreign key(code) references major(majorcode) 
);


create table major(
majorcode number,
majorname varchar2(20) not null,
constraint pk_major_code primary key(majorcode)
);


insert into student_table
values(100, '이정아', 30 , 50 , 70);



insert into major
values (10, '수학');

insert into major
values (20, '영어');

insert into major
values (30, '국어');

select * from major;
select * from student_table;
select * from user_constraints where table_name = 'student_table';

--------------------------제약 설정하기----------------------------
--view 객체(가상테이블) pdf교재 192page
/*

CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS
Subquery 
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY] 

<설명>
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
--ORA-01031: insufficient privileges
--생성권한이 없으므로 관리자 권한 받으라는 에러
--왼쪽 접속-> 관리자계정-> 다른 사용자-> BIT -> 오른쪽마우스 ->사용자 편집-> 시스템 권한-> CREATE VIEW
create view v_001
as
    select empno, ename from emp;
    
    select * from v_001; --> empno, ename 정보가 조회됨 --view는 sql문장을 가지고 있는 sql덩어리(객체) 이다.

--view는 객체이다. 쿼리문을 가지고 있는 객체 (create ....)
--create view ~(view이름) as sql문장 (select절~) => view를 통해서 볼 수 있는 데이터 목록을 나열
--view는 ` 자체가 테이블처럼 사용 가능하도록 되어있음 (가상테이블) -> 쓰는 방법은 emp나 dept처럼 동일하게 사용 할 수 있다.
--하지만 실제로는 데이터를 가지고 있는 것이 아니다. 메모리 상에서만 존재하는 가상의 테이블임. in line view가 이런 사례

--view 사용법
--일반 테이블과 동일하게 사용하면 된다. select 써도 되고 where로 조건 추가해도 되고...
--단, view의 쿼리문에 쓰여져있는 데이터만 볼 수 있다.
--DML(insert,update,delete)도 되는가? 된다! 하지만 view를 통해서 보고있는 데이터에 대해서만 가능하다.

--왜 쓸까?
--1. 개발자의 편리성을 위해(join하거나 subquery를 사용 할 때 실제 테이블이 있다면 (데이터의 일부분들을 모아서 필요한 데이터만 놓고 볼 때)
--2. 보안(권한처리)- > 노출하고 싶은 데이터만 모아서 view를 생성 할 수 있다.
--3. 편리성 (복잡한 query를 모아서 view를 생성하면 다음에 같이 똑같은 query를 칠 필요가 없음.) 미리 만들어두기 때문 

--인사테이블 작업이 필요 할 때 인사테이블의 모든 정보(급여정보라던지...?)를 줘버리면 문제가 생길 수 있으므로
--그 때 view를 만들어서 제공

create view v_emp
as
select empno, ename, job, hiredate from emp;


--생성 후 v_emp 사용하도록(보안성)
select * from v_emp;
select * from v_emp where empno = 7788; --이르킈~


--편리성(view로 만들어두고 계속 쓰기,복잡한 쿼리를 단순화)
create view v_002
as
select e.empno, e.ename, d.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;

select * from v_002;
select * from v_002 where deptno=20;

--
--자기 부서의 평균 월급보다  더 많은 월급을 급여를 받는 사원의 사번, 이름, 급여를 출력
--부서별 평균 급여를 가지고 있는 가상테이블을 만든다. 이전까지는 일회성으로, 지금은 계속 남아있음 >> in line view는 소멸함.
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

--테이블이 1개 이상 있으면
--join 을 사용해보고, 안되면 서브쿼리, 또 안되면 view(가상테이블)

--view 삭제
drop view v_007;


create or replace view v_007 --생성하거나 덮어쓰겠다.
as 
select avg(sal) as AVGSAL from emp; --만약 만들고 수정 할 일이 생기면 구문 그대로 수정해서 다시 실행하면 덮어씀 --avs(sal) 컬럼명 수정을 해줘야 한다. 얼리어스명 추가

select * from v_007;


--view를 통한 DML작업이 가능하지만 가장 까다롭다 ! (insert , update, delete 도 가능) 되도록이면 DML은 하지 않는게 좋고 select 목적으로 하는게 좋음
--단 view가 가지는 구문이 한 테이블을 기준으로 해야한다. 테이블 1개짜리만 가능하다. 복합 view는 DML불가
--복합 view란 테이블이 1개 이상으로 구성된 쿼리문(join 됐거나...)
--단순 view만 가능하다. 테이블 1개로 만든 view

select * from v_emp; --볼 수 있는 데이터는(empno, ename, job, hiredate)

update v_emp
set sal = 0; --에러 sal은 view가 볼 수 있는 데이터가 아니기 때문에 DML불가능

update v_emp
set job = 'IT';

select * from emp;

rollback;

create or replace view v_emp2
as
select * from emp where deptno= 20;

select * from v_emp2;

update v_emp2
set sal = 0; --원래 sal 데이터는 총 14건이 있지만, 모든 sal 데이터를 0으로 만드는 것이 아닌, 현재 view에서 보여지고 있는 데이터 = 사원번호가 20인 사람들의 sal 만 바뀐다.


select * from emp;

rollback;


--view가 있는지 없는지 목록 보는 방법

select * from user_views;


--1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.


create or replace view view001_2
as
select ename, sal, job from emp where deptno = 30;
 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
create or replace view view001 ("직위" ," 사원이름", " 월급")
as
select job, ename, sal from emp where sal >= 300 and deptno = 30;

select * from view001;
 
 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
create or replace view view002
as
select deptno, max(sal) as maxsal ,min(sal) as minsal, avg(sal) as avgsal from emp
group by deptno;

select * from view002;

       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.

 create or replace view view003
 as
 select deptno, avg(sal) as avgsal
 from emp
 group by deptno
having avg(sal) >= 2000;

select * from view003;

 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.

create or replace view view004
as
select job, sum(sal) as "총월급" 
from emp where job != 'MANAGER'
group by job
having sum(sal) >= 3000;

select * from view004;















