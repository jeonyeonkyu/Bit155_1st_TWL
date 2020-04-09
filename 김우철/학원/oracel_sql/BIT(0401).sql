--새로 접속할 때마다 실행
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual

insert into board(boardID, boardTitle, boardContent, hp)
values(300,'오라클','수업중','010-0000-0000');

select * from board;
commit;

select boardID, nvl(hp,'EMP')as "hp" from board;
--hp는 숫자 타입이라도 nvl함수는 숫자 -> 문자열도 가능

--문자열 검색
--주소 검색 : [역] 입력 >> 역삼동, 역동, .... (Like 패턴 검색)
--문자열 패턴 검색 연산자 : Like
--Like 연산자 도움(와일드 카드 문자 (% : 모든것, _ : 한문자) 결합

select ename
from emp 
where ename like '%A%'; --ename 컬럼의 데이터 중에서 A가 들어있는 이름

select ename 
from emp where ename like '%a'; --문자열 데이터 대소문자 구별(엄격)

select ename
from emp where ename like 'A%'; --이름의 첫 글자가 A인 사람

select ename
from emp where ename like '%S'; --이름의 첫 글자가 A인 사람

select *
from member
where name like '%수한무%'; --수한무가 이름에 들어있는 사우너

select ename
from emp where ename like '%LL%'; --LL 붙어 있어야

select ename
from emp where ename like '%L%L%'; --L 2개 있으면

select ename
from emp where ename Like '_A%'; --첫글자는 어떤것이 와도 상관없고 두번째 글자는 반드시 A

--정규 표현식
--regexp_like
select * from emp where regexp_like(ename, '^[A-C]');
--정규 표현 예제 5개 만들기(추후 카페)
-----------------------------------------
--데이터 정렬하기
--order by 컬럼명 : 문자열, 숫자, 날짜 
--오름차순 : asc(default)
--내림차순 : desc
select *
from emp
order by sal;

select *
from emp
order by sal asc;

--급여를 많이 받는 순으로 정렬하시오
select *
from emp
order by sal desc;

--입사일이 가장 늦은 순으로 정렬해서 사번과 이름과 급여와 입사일을 출력
select empno, ename, sal, hiredate
from emp
order by hiredate desc;

/*★
select   3
from     1   
where    2
order by 4 (select 결과를 정렬) >> DB는 정렬작업이 가장 힘들어함
★*/

select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;

--order by 컬럼명 desc, 컬럼명 asc, 컬럼명 desc
select job, deptno
from emp
order by job asc, deptno desc; --가장 많이 쓰임(게시판에서..)★

-----------------------------------------------------
--연산자
--합집합(union) : 테이블과 테이블의 데이터를 합치는 것(기본 : 중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것(기본 : 중복값 허용)

create table uta(
    name varchar2(20)
);

insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;

create table ut(
    name varchar2(20)
);

insert into ut(name) values('AAA');
insert into ut(name) values('BBB');
insert into ut(name) values('CCC');
commit;

select * from uta;
select * from ut;

select * from ut
union
select * from uta;

select * from ut
union all
select * from uta;

--union 규칙
--1.대응되는 컬럼의 ★타입★이 동일
select empno, ename
from emp
union
select dname, deptno
from dept;
--expression must have same datatype as corresponding expression

select empno, ename
from emp
union
select deptno, dname
from dept;

--2. 대응되는 컬럼의 개수가 동일(null 착한일)
select empno, ename, job, sal 
from emp
union
select deptno, dname, loc, null 
from dept;
--query block has incorrect number of result columns

--실무 >> subquery (in line view)
select empno, ename
from (
    select empno, ename from emp
    UNION
    select deptno, dname from dept
    )  --메모리상에서 만들어지는 가상 테이블
order by empno desc; 
  
--여기까지 초보 걸음마... 의무적으로... 테이블 한개...(단일테이블)
------------------------------------------------------------
/*오라클 함수(보조교재(pdf) 50page)

1)문자형 함수
2)숫자형 함수..
*/

/* 한글 문제... 인지 ... 추후변경 가능
select * from SYS.nls_database_parameters;
--NLS_CHARACTEREST AL32UTF8 한글 3바이트 인식
--ko16ksc5601 2Byte(현재 변환하면 한글 다깨짐)
select * from SYS.nls_database_parameters where parameter like '%CHAR
*/

--문자열 함수(암기!!)
select initcap('the super man') from dual; --첫글자만 대문자

select lower('AAA'), upper('aaa') from dual;

select ename, lower(ename) as "ename" from emp;
select * from emp where lower(ename) = 'king';

--문자열 개수
select length('abcd') from dual;

select length('홍길동') from dual; --3개

select length(' 홍 a길 동') from dual;

--결합 연산자|| ->이게 좀더 유연
--concat() ->파라미터 개수 제한(2개)

select 'a' || 'b' || 'c' as "data" from dual; --abc
select concat('a','b') from dual; --ab

select concat(ename, job) as "sss"
from emp;

--부분문자열추출
--java(substring)
--oracle(substr)
--1부터 셈
select substr('ABCDE',2,3) from dual; --BCD
select substr('ABCDE',1,1) from dual; --자기자신A
select substr('ABCDE',3,1) from dual; --C

select substr('ABCDE',3) from dual; --C

select substr('ABCDE',-2,1) from dual; --D
select substr('ABCDE',-2,2) from dual; --DE

/*
Quiz
사원테이블에서 ename 칼럼 데이터에 대해서 첫글자는 소문자로 나머지 문자는 대문자로 출력
단)위 결과를 하나의 컬럼(컬럼의 이름은 fullname), 
첫글자와 나머지 문자 사이에 공백하나 넣어서 출력
SMITH -> s MITH 
*/
select concat(lower(substr(ename,1,1)) || ' ', upper(substr(ename,2))) as "fullname"
from emp;
/*
자작 퀴즈
사원테이블에서 
*/

--lpad, rpad(채우기)
select lpad('ABC',10,'*') from dual; --*******ABC
select rpad('ABC',10,'^') from dual; --ABC^^^^^^^

--Quiz
--사용자 비번 : hong1006
--화면 : ho****** 출력하고 싶음(비번 : 1004 > 10**)

select rpad(substr('1004',1,2),length('1004'),'*') as "ename"
from dual;

--emp테이블에서 ename 컬럼의 데이터를 출력하는데 첫글자만 출력하고 나머지 *로
select rpad(substr(ename,1,1),length(ename),'*') as "ename"
from emp;

create table member2(
    id number,
    jumin varchar2(14)
)

insert into member2(id, jumin) values(100, '123456-1234567');
insert into member2(id, jumin) values(100, '234567-1234567');
commit;
select * from member2;

--하나의 컬럼으로 결과값을 출력
--100 : 123456-*******
--200 : 234567-*******
--컬럼명은 "juminnumber"
select id || ' : ' || rpad(substr(jumin,1,7),length(jumin),'*') as "juminnumber"
from member2;

--rtrim 함수
--[오른쪽 문자를 지워라]
select rtrim('MILLER', 'ER') from dual; --MILL
--ltrim 함수
--[왼쪽 문자를 지워라]
select ltrim('MILLLLLLLER', 'MIL') from dual; -- ER

select '>' || rtrim('MILLER       ', ' ') || '<' from dual;
-->MILLER<

--치환함수(replace)
select ename, replace(ename, 'A', '와우^^') from emp;
--SMITH SMITH
--ALLEN 와우^^LLEN
----문자열 함수(END)------------------

--[숫자 함수]
--round(반올림 함수)
--trunc(절삭함수)
--mod() 나머지 구하는 함수

select round(12.345,0) as "r" from dual; -- 정수부분만 남겨라 12
select round(12.567,0) as "r" from dual; -- 13
select round(12.345,1) as "r" from dual; -- 12.3
select round(12.567,1) as "r" from dual; -- 12.6

select round(12.345,-1) as "r" from dual; -- 10
select round(15.345,-1) as "r" from dual; -- 20
select round(15.345,-2) as "r" from dual; -- 0
select round(65.345,-2) as "r" from dual; -- 100


select trunc(12.345,0) as "r" from dual; -- 12
select trunc(12.567,0) as "r" from dual; -- 12
select trunc(12.345,1) as "r" from dual; -- 12.3
select trunc(12.567,1) as "r" from dual; -- 12.5

select trunc(12.345,-1) as "r" from dual; -- 10
select trunc(15.345,-1) as "r" from dual; -- 10
select trunc(15.345,-2) as "r" from dual; -- 0
select trunc(65.345,-2) as "r" from dual; -- 0

--나머지
select 12/10 from dual; --1.2
select mod(12,10) from dual; --2 나머지(함수)

select mod(0,0) from dual;

-------------------------[숫자 함수 END]
--[날짜 함수]
select sysdate from dual; --2020-04-01 12:16:14
--날짜 연산(POINT)
--Date + Number >> Date
--Date - Number >> Date
--Date - Date >> Number(일수)


select hiredate from emp; --1981-02-20 00:00:00

select months_between('2018-01-01', '2010-01-01') from dual; --96개월

select round(months_between(sysdate, '2010-01-15'),1) from dual; --122.6
select truncasd(months_between(sysdate, '2010-01-15'),1) from dual; --122.5

--POINT
--날짜 형식의 문자열을 날짜로 바꾸는 함수(to_date)
select to_date('2020-04-01') + 100 from dual; --2020-07-10 00:00:00

select sysdate + 1000 from dual; --2022-12-27 12:26

--Quiz
--1.사원테이블에서 사원들의 입사일에서 현재날짜까지 근속월수를 구하세요
--단, 근속월수는 정수부분만 출력하세요(반올림 하지 마세요, 함수 사용)
select trunc(months_between(sysdate, to_date(hiredate)),0) as "근속월수"
from emp;

--2.한달이 31일이라는 기준에서 근속월수를 구하세요(반올림 하지 마세요)
--함수 사용하지 말고 연산>> (날짜 - 날짜 >> 150일)
select trunc((to_date(sysdate) - hiredate)/31,0) as"근속월수"
from emp;

-------------------------[날짜 함수 END]

--[변환함수] : TODAY POINT
--오라클 : 문자, 숫자, 날짜
--to_char() : 숫자 -> 문자(1000 -> $1000), 날짜 -> 문자(2020-01-01 -> 2020년01월01일) format ★
--to_date() : 문자 -> 날짜 >> select '2020-12-12' + 100
                             select to_date('2020-12-12') + 100
--to_number() : 문자 -> 숫자(내부 자동 형변환)
select '100' + 100 from dual;
select to_number('100') + 100 from dual; --to_number는 자동으로 붙여져서 잘 안씀

--to_char 문자형 날짜를 date형식으로 바꿀때 사용  (을 제일 많이 한다 거의70% 정도)
--숫자나 날짜를 특수한 형태의 문자로 변환

--to_number (문자 -> 숫자) 자동 형변환
select '1' + 100 from dual;  -- 
select to_number('1') + 100 from dual;

--to_char() : format >> 숫자, 날짜 (형식문자)
select to_char(sysdate)  || '일' from dual;  --이건 문자로 바꾼 것 ( 문자니깐 다른친구들과 결합이 가능하다)


select sysdate , to_char(sysdate, 'YYYY') || '년' as "YYYY",
                to_char(sysdate, 'YEAR') ,
                to_char(sysdate, 'MM') ,
                to_char(sysdate, 'DD') ,
                to_char(sysdate, 'DY')   --이게 날짜 데이터 뽑는 방법 표를 찾으면 됨 --pdf 69page(형식문자표)(강사님 pdf파일 안에 있음)
from dual;                

--입사월이 12월인 사원들의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요

select empno, ename,  to_char(hiredate , 'YYYY') as "입사년도", to_char(hiredate , 'MM') as"입사월", to_char(hiredate , 'DD') as"입사일"
from emp
where to_char(hiredate , 'MM') = '12';

select to_char(hiredate, 'YYYY MM DD') from emp;
--1980 12 17
select to_char(hiredate, 'YYYY"년" MM"월" DD"일"') from emp; --싱글쿼터 주의★★(선생님도 고생했음)
--1980년 12월 17일

--to_char() 숫자 -> 문자로(형식문자)
--pdf 파일 71page 표(이부분은 암기X)
--100000 >> 출력 >> $1,000,000(문자)

select '>' || to_char(12345, '99999') || '<' from dual;
--> 12345<
select '>' || to_char(02345, '099999') || '<' from dual;
--> 002345<
select '>' || to_char(12345, '$9,999,999,999') || '<' from dual;
-->        $12,345<
select sal, to_char(sal,'$999,999') from emp;

--HR 계정으로 전환
select * from employees;
/*
사원테이블(employees)에서 사원의 이름은 last_name , first_name 합쳐서 fullname 별칭 부여해서 출력하고
입사일은  YYYY-MM-DD 형식으로 출력하고 연봉(급여 *12)을 구하고 연봉의 10%(연봉 * 1.1)인상한 값을
출력하고 그 결과는 1000단위 콤마 처리해서 출력하세요
단 2005년 이후 입사자들만 출력하세요 그리고 연봉이 높은 순으로  출력하세요
*/
select concat(last_name,first_name) as "fullname", to_char(hire_date, 'YYYY-MM-DD') as "입사일", to_char(salary*12*1.1,'999,999') as "연봉인상"
from employees
where substr(hire_date,1,2) >= 05
order by 연봉인상 desc; 

--BIT 계정으로 전환

--[일반함수(프로그래밍적인 성격)]
--nvl(), nvl2() >> null 처리 담당
--decode() 함수 >> java if문(switch)과 비슷
--case() 함수 >> java if문(switch)과 비슷

select comm, nvl(comm, 0) from emp;

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

--decode 많이 쓰임
select deptno, decode(deptno,10,'인사부',
                                20,'관리부',
                                30,'회계부',
                                '기타부서') AS "부서"
                                FROM EMP;
                                
select id, decode(id,100,'인사부',
                                200,'관리부',
                                300,'회계부',
                                '기타부서') AS "부서"
                                FROM t_emp;

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

select id, decode(substr(jumin,1,1),1,'남성',
                        2,'여성',
                        3,'중성',
                        '외계인') AS "gender"
                        FROM t_emp2;

select * from emp;

select ename, deptno, decode(deptno,20,decode(ename,'SMITH','HELLO',
                                'WORLD'),
                                'ETC') as "ss"
                    from emp;
                                
--CASE 문
--java switch
/* --옛날 구문이라 트렌드 하지못함
case 조건식 when 결과1 then 출력1
           when 결과2 then 출력2
           when 결과3 then 출력3
            ELSE 출력4
    END "컬럼명"
조건이 결과1에 해당되면 출력1을 출력하겠다
*/

CREATE table t_zip(
    zipcode number(10)
);

insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(33);
insert into t_zip(zipcode) values(41);
commit

select * from t_zip;

select '0' || to_char(zipcode), 
    case zipcode when 2 then '서울'
                when 31 then '경기'
                when 32 then '강원'
                when 41 then '제주'
                else '기타지역'
        end "regionname" --컬럼을 만듬
    from t_zip;
--decode보다 case문이 직관적으로 보기 편함

/*emp
사원테이블에서 사원급여가 1000달러 이하면 '4급'
1001달러 2000달러 이하면 '3급'
2001달러 3000달러 이하면 '2급'
3001달러 4000달러 이하면 '1급'
4001달러 이상이면 '특급' 이라는 데이터를 출력하세요
*/
select sal, case when sal>= 1001 and sal<=2000  then '3급'
                when  sal>= 2001 and sal<=3000 then '2급'
                when sal>= 3001 and sal<=4000 then '1급'
                when sal >=4001 then '특급'
                else '4급'
            end "급여등급"
from emp;

--1.case 컬럼명 when 결과 then 출력(= 조건)
--2.비교조건 
/*
    case when 컬럼명 조건 비교식 then ..
*/

------------------------[기본 함수 끝]

--[집계함수] 75page
/*
1.count(*) > row 줄수, count(컬럼명) >> 데이터 건수(null을 포함하지 않는다)
2.sum()
3.avg()
4.max()
5.min()
등등 ...

집계함수(어려움)
1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 값을 무시
3. select 절에 집계함수 이외 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시
*/

select count(*) from emp; --14건, row를 셈
select count(comm) from emp; --6건(null을 빼고 샘), 데이터 건수를 셈
select count(empno) from emp; --14건

select count(nvl(comm,0)) from emp; -- null >> nvl()

--급여의 합
select sum(sal) as "급여합" from emp; --29025

select round(avg(sal),0) as "평균급여" from emp; --2073.214285714285714285714285714285714286

--사장님이 회사 총 수당 얼마나 지급되고 있나?(수당의 평균)
select * from emp

select trunc(avg(comm),0) from emp; --721
select trunc(sum(comm) / count(comm)) from emp; --721, 사원의 수 6명, null값 무시

select trunc(avg(nvl(comm,0)),0) from emp; --309

--회사의 규정이 (전체 사원수로 나눈다 ... 309)
--회사의 규정이 (받는 사원수로 나눈다 ... 721)
--★ 둘다 풀줄 알아야 됨..

--검증 : 코드 
select count(*) from emp where comm is null; --8

select count(*) from emp where empno is null; --0

select max(sal) from emp;

select min(sal) from emp;

--POINT
select empno, count(empno) from emp;
--집계함수의 결과는 1건, empno는 데이터가 여러개

select empno, count(empno) from emp group by empno;

select sum(sal), avg(sal), max(sal), min(sal), count(sal), count(*)
from emp;

--부서별 평균 급여를 출력하세요
select deptno, trunc(avg(sal),0) from emp group by deptno;

--직종별 평균 급여를 구하세요.
select job, avg(sal)
from emp
group by job;

--직종별 평균 급여, 급여합, 최대급여, 최소급여, 건수를 출력하세요
select * from emp;

select job, avg(nvl(sal,0)), sum(sal), max(sal), min(sal), count(job)
from emp
group by job;
/*
grouping 원리 
distinct 컬럼명1, 컬럼명2
order by -> 컬럼명1, 컬럼명2
group by -> 컬럼명1, 컬럼명2, 컬럼명3..
*/

--부서별, 직종별 급여의 합을 구하세요.
select * from emp;

select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job
order by deptno;

/*
select
from 
where
group by
order by
*/




