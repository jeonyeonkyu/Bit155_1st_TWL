--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
select ename, sal
from emp
where sal > (select sal
                from emp
                where ename='SMITH');
 
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
select ename, sal, deptno
from emp
where sal in (select sal
                from emp
                where deptno=10);
 
--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
select ename, hiredate
from emp
where ename != 'BLAKE' and deptno in (select deptno
                from emp
                where ename='BLAKE');

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을 ** 실무에서 이런 유형의 서브쿼리가 많음(집계된 결과랑 비교)
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
select empno, ename, sal
from emp
where sal > (select round(avg(sal),0)
                from emp)
order by sal desc;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
select empno, ename
from emp
where deptno in (select deptno
                from emp
                where ename like '%T%');

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
select ename, deptno, sal
from emp
where sal > all(select sal
                from emp
                where deptno = 30);

--두번째 방법(그냥 이거쓰셈, all은 잘 안씀)
select ename, deptno, sal
from emp
where sal > (select max(sal)
                from emp
                where deptno = 30);
 
--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
select ename, deptno, job
from emp
where deptno in (select deptno
                from dept
                where loc = 'DALLAS');

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
select deptno, ename, job
from emp
where deptno in (select deptno
                from dept
                where dname = 'SALES');

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
select ename, sal
from emp
where mgr in (select empno
                from emp
                where ename = 'KING');
                
--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는 ???????
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                from emp) and deptno in (select deptno
                                        from emp
                                        where ename like '%S%');

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의(0도 커미션을 받음) ???
-- 이름, 월급, 부서번호를 출력하라.
/*
select DISTINCT e.ename, e.sal, s.deptno
from emp e join (select deptno, sal from emp where comm is not null) s
on e.deptno = s.deptno
where e.deptno = s.deptno; 
내가 푼것 망함*/

select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null);

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은(0도 커미션을 받음) ???
-- 사원들의 이름, 월급, 커미션을 출력하라.
--30번부서들과 월급이 같지 않고, 30번 부서들과 커미션이 같지 않은...
/*select e.ename, e.sal, e.comm
from emp e join (select sal, comm, deptno from emp where deptno = 30) s
on e.deptno = s.deptno
where e.sal != s.sal and e.comm != s.sal;
내가 한거 망함*/
select ename, sal, comm
from emp
where sal not in(select sal from emp where deptno=30)
and comm not in(select nvl(comm,0) from emp where deptno=30 and comm is not null);

/*
join (하나 이상의 테이블에서 데이터 가져오기 : 다중 테이블 : 관계)
subquery
초급 개발자 기본 소양....
*/
----------------------------
--[INSERT], [UPDATE], [DELETE] >> 암기
/*
오라클 기준
DDL(데이터 정의어) : create, alter, drop, truncate(메모리 공간까지 지움), rename, modify
DML(데이터 조작어) : insert, update, delete : 20%
DQL(데이터 질의어) : select                 : 70%
DCL(데이터 제어어) : 권한(grant, revoke) ->이거는 개발자가 거의 안함, DBA가 함(관리자 : 모니터링 : 백업 복원)
TCL(트랜잭션)     : commit, rollback, savepoint
개발자 : CRUD(create가아니고 insert(데이터 입장에서 본것), select, update, delete)
*/

--DML(트랜잭션 : 하나의 논리적인 작업 단위) > LOCK ★★★★(가장 중요, 면접에서도 많이 나옴) ex)수강신청, 온라인 결제 시스템
--A라는 은행에서 돈 인출 B라는 은행에 입금
--A : update ... 1000 > 500
--B : update ... 1000 > 1500
--둘다 성공 : commit
--둘중에 하나만 실패 : rollback

select * from tab; --접속한 사용자가 만든 모든 테이블을 볼 수 있음
select * from tab where tname='BOARD'; --BOARD테이블의 존재유무를 확인

select * from col; --만든 컬럼
select * from col where tname='EMP'; --emp라는 테이블의 컬럼만 보고싶다, 웹전용 DB 툴을 만들때 이런것을 많이 씀

select * from user_tables; --관리자가 자주봄
select * from user_tables where table_name='DEPT';
--tab나 col까지는 알아도 ㄱㅊ
-----------------------------------------------------------------
--pdf 10장, 168page

create table temp(
    id NUMBER primary key, --not null 하고 unique한 데이터만 들어갈 수 있다.
    name varchar2(20) --default null 값 허용
);

/*
문자 타입
char(20) >> 20byte >> 한글10자, 영문자20자 >> 고정길이 문자열
varchar2(20) >> 20byte >> 한글10자, 영문자20자 >>가변길이 문자열

char(20)    >> '홍길동' >> 6byte >> [홍길동    ] >> 20byte
varchar(20) >> '홍길동' >> 6byte >> [홍길동] >> 6byte
ex)
고정길이 데이터 : 남, 여
가변길이 데이터 : 이름...

성능상의 문제 : char() > varchar() 우선..
그럼....고정길이 데이터 char() .... 남여, 주민번호, 우편번호

한글문제(unicode : 2byte) >> 한글,영문자,특수문자,공백

nchar(20) >> 20 >> 글자수 >> 총byte >> 2 * 20 >> 40byte
nvarchar(10) >> 10글자

*/



--1.가장 일반적인 insert
insert into temp(id,name)
values(100,'홍길동');

select * from temp;
--실반영
commit;

--2.컬럼 목록 생략(되도록 하지 마셈 / 가독성 떨어짐)
insert into temp 
values(200,'김유신'); --데이터가 컬럼의 개수, 순서와 일치해야 한다








