--직종별 평균 급여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요.
select job, avg(sal) as "평균급여"
from emp
--where
group by job
having avg(sal) >= 3000;
--from -> where -> group by -> select 순서라서 where절에 avg(sal)이 적용될 수 없음
--group by 조건절 >> having 절

/*
from 조건절 >> where(있어도 되고 없어도 됨) 
group by 조건절 >> having
*/

/*
하나의 테이블을 대상으로 쓸수 있는 모든 구문 ...
select      5
from        1
where       2
group by    3
having      4
order by    6
*/

--Quiz, 0도 수당을 받는걸로..
select * from emp;
/* 1번 사원테이블에서 직종별 급여합을 출력하되 수당은 지급 받고 급여의 합이 5000 이상인 
    사원들의 목록을 출력하세요 급여의 합이 낮은 순으로 출력하세요 */
select job, sum(sal)
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sum(sal);
--만약 select와 group by에 empno를 추가하면
--job으로 먼저 묶어도 고유성있는 empno로 묶기 다시 묶기 때문에 결국 한행씩 검사하는것

/* 2번 사원테이블에서 부서 인원이 4명보다 많은 부서의 부서번호 ,
 인원수 , 급여의 합을 출력하세요 */
select deptno, sum(sal), count(deptno)
from emp
group by deptno
having count(deptno) > 4;

/* 3번 사원테이블에서 직종별 급여의 합이 5000를 초과하는 직종과 급여의 합을 출력하세요
단 판매직종(salesman) 은 제외하고 급여합으로 내림차순 정렬하세요 */
select job, sum(sal) 
from emp
where job not in('SALESMAN')
group by job
having sum(sal) > 5000
order by sum(sal) desc;

----------------------------------------------------------------
-- JOIN : pdf 6장 85page 
-- 관계형 데이터 베이스(RDBMS) >> ORDB(x) >> Framework(객체매핑) ex)mybatis, JPA, Hiberate... >> NoSQL
-- NoSQL은 객체단위로 DB에 저장 ex) HBase,몽고DB, 카산드라 등 (객체를 저장)
-- 선생님 욕심 : 최소 3차때 NoSQL 한개 / Vue,react,Nodejs 중 한개 
/* 다른 기수들 ex) 조원이 6명일시 1~2명이 공부하고 부분적으로 끼워놓음, 그리고 나머지 4명에게 하는방법과 원리를 풀어줌(면접시 질문을 하면 답할 수 있을정도로)
   2차때부터 별도로 공부한 친구들이 있음, 이걸 3차때 적용 ... 
   망한조 ex) 조장이 밀어붙였지만 비전공자의 나머지 조원들이 따라오질 못함(수업도 따라오지 못하는 조원들..)
*/
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

select * from m;
select * from s;
select * from x;

--종류
--1.등가조인(equl join)
--원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
--JOIN 문법
--1. SQL JOIN 문법(제품...)
--2. ANSI 문법(권장)(표준)

--SQL JOIN 문법(비추, 허나 알긴 알아야됨)
select *
from m, s
where m.m1 = s.s1;

select m.m1, m.m2, s.s1, s.s2
from m, s
where m.m1 = s.s1;

--ANSI 문법(권장)
--where (from절의 조건절)
--where join 조건과 일반 조건을 혼재하면 혼란...
--JOIN 조건 분리 >> ON 절
select M.M1, M.M2, S.S2
from m inner join s --INNER 생략
on m.m1 = s.s1;
--JOIN의 요령은 select를 나중에 하는 것

/*
1개 테이블 vs 2개 테이블
조회 성능 : 1개 테이블 승
CUD 성능 : 2개 테이블 승
*/

--사원번호, 사원이름, 사원부서번호, 사원 부서명

select EMP.EMPNO, EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
from emp JOIN dept
on emp.deptno = dept.deptno;
--현업은 컬럼명과 테이블명이 길다, 그래서 가명칭을 붙힘
--join 테이블에 가명칭 부여 >> 그 이름으로 접근
select E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
from emp e JOIN dept d
on e.deptno = d.deptno;

--JOIN (2, 3, 4...) 여러개 테이블 조인 가능
--SQL 문법
select m.m1, s.s1, x.x1
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
-- A == B, B == C, A == C

--ANSI 문법(여기에 익숙해져라) 이거안됨 
select *
from m JOIN s ON m.m1 = s.s1
       JOIN x ON s.s1 = x.x1;
--       JOIN y ON x.x1 = y.y1;



--[HR로 이동]
select * from employees;
select * from departments;
select * from locations;

--1.사번, 이름(last_name), 부서번호, 부서이름 출력
select *
from employees e JOIN departments d 
on e.department_id = d.department_id;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e JOIN departments d 
on e.department_id = d.department_id;
--106명
--107명인데 why >> 106명
select count(*) from employees; --107
--JOIN은 NULL 포함하지 X
select * from employees where department_id is null;
--178번 사원이 부서id >> NULL
--등가조인으로 해결불가(outer join) 사용 ...해결

--2.사번, 이름(last_name), 부서번호, 부서명, 지역코두, 도시명을 출력

select e.employee_id, e.last_name, e.department_id, d.department_name, l.location_id, l.city 
from employees e join departments d
on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;
-------------------------------------------------------------------------------
--[BIT로 이동]
--2. 비등가 조인(non-equi join) => 의미만 존재 => 등가조인과 문법이 같음
--원테이블과 대응되는 테이블 있는 컬럼이 1:1 매핑되지 않는 경우
select * from emp;
select * from salgrade;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e JOIN  departments d
on e.department_id = d.department_id;
--1:1매핑이 되지않는다는 거 빼고는 문법적으로 등가와 같음
--실제로는 비등가를 안쓰는게 좋음 / 비등가를 사용할 테이블설계도 거의 없음

---------------------------------------------------------------

--3. outer join(equi join + null)
--outer join(주 종관계 파악) >> 주가 되는 테이블에 있는 남은 데이터 가져오기
--문법적으로 3가지로 나뉨
--left outer join(왼쪽 주인)
--right outer join(오른쪽 주인)
--full outer join(왼쪽 주인 + 오른쪽 주인 >> union)

select * 
from m JOIN s
on m.m1 = s.s1;

--outer는 생략 가능
select *
from m left outer join s
on m.m1 = s.s1;
--내부적 가지고 있는 정렬 방법이 있음

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;
-----------------------------------------
--[HR 계정]

select *
from employees;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
--178번 사원이 부서id >> NULL 출력되게..
select * from employees where deparement_id is null;
--------------------------------------------------
--self join(자기참조) -> 의미 -> 문법(등가조인)
--하나의 테이블에서 특정 컬럼이 다른 컬럼을 참조하는 경우
--조인(테이블 1개 이상)
--테이블의 가명칭 달리해서 여러개 테이블 처럼
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m
on e.mgr = m.empno;
--문제 : 14명 >> 13명

--king도 출력
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno;

--JOIN TEST
-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
 select e.ename, e.deptno, d.dname
 from emp e join dept d
 on e.deptno = d.deptno;
 
-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%'; 

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
select e.ename, e.sal, d.dname
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
select e.empno as "사원번호", e.ename as "이름", e.sal*12 as "연봉", e.sal*12+comm as "실급여", s.grade as "급여등급"
from emp e inner join salgrade s on e.sal between s.losal and s.hisal
where e.comm is not null;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
on e.deptno = d.deptno
join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10;
 
-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
on e.deptno = d.deptno
join salgrade s on e.sal between s.losal and s.hisal
where e.deptno in(10,20)
order by e.deptno, e.sal desc;
 
-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
select e.empno as "사원번호", e.ename as "사원이름", m.empno as "관리자번호", m.ename as "관리자이름"
from emp e left join emp m
on e.mgr = m.empno;
------------------------------------------------------
--초보 개발자는 JOIN까지 가 보통
--서브쿼리(pdf 100page) 정말 유익한 query / sql의 꽃 / sql의 만능 해결사
--함수 >> 조인 >> subquery : 함수도안되 조인도안되면 서브쿼리써라

--사원테이블에서 사원들의 평균 월급보다 더 많은 급여를 받는 사원의
--사번, 이름, 급여를 출력하세요.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                    from emp);
            
select sal from emp;

--subquery
/*
1.single row subquery : subquery 결과 row 1개(단일컬럼 단일값)
2.multi row subquery : 결과 row 1개 이상(단일컬럼의 여러개의 값)
구별하는 이유는 : 사용되는 연산자....
multi row : IN, NOT IN (ANY, ALL)
ALL(and) : sal > 1000 and sal > 2000 and sal ...
ANY(or) : sal > 1000 or sal > 2000 or sal ...

정의(subquery)
1. 괄호안에 있어야 한다>> (select sal from emp)
2. 단일 컬럼으로 구성 >> (select sal, deptno from emp) (x)
3. 단독으로 실행 가능

실행순서
1. 무조건 subquery 먼저 실행
2. subquery의 결과값을 가지고 main query 실행
*/
--사원테이블에서 jones 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여
--출력하세요.

select sal from emp where ename = 'JONES';

select * 
from emp 
where sal > (select sal from emp where ename = 'JONES');

--subquery 급여가 2000 이상
select * 
from emp 
--where sal > (select sal from emp where sal > 2000);
where sal in (select sal from emp where sal > 2000); --멀티 row일때는 in을 쓴다
--"single-row subquery returns more than one row"

select * 
from emp 
--where sal > (select sal from emp where sal > 2000);
where sal not in (select sal from emp where sal > 2000); 
--NOT IN (부정의 and)
--2975 2850 2450 3000 5000 3000
--where sal != 2975 and sal != 2850 and ...

--부하직원이 있는 사원의 사번과 이름을 출력하세요.
select * from emp;

select empno, ename
from emp
where empno in (select mgr from emp);

--부하직원이 없는 사원의 사번과 이름을 출력하세요.
select * from emp;

select empno, ename
from emp
where empno not in (select mgr from emp);
--empno != 7902 and empno !=7788 and empno != null
--and는 하나라도 null이면 결과는 null

--정답1
select empno, ename
from emp
where empno not in (select nvl(mgr,0) from emp);

select empno, ename
from emp
where empno not in (select mgr from emp where mgr is not null);

--king에게 보고하는 즉, 직속상관이 king인 사원의 사번, 이름, 직종, 관리자 사번을 출력하세요
select * from emp;

select empno, ename, job, mgr
from emp
where mgr in (select empno
                from emp
                where ename ='KING');

--20번 부서의 사원중에서 가장 많은 급여를 받는 사원보다 더 많은 급여를 받는 사원의 
--사번, 이름, 급여, 부서번호를 출력하세요.
select * from emp;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal)
                from emp
                where deptno = 20);

--POINT
--subquery >> select 절에
--         >> from
--         >> where

select *
from emp 
where deptno in (select deptno from emp where job='SALESMAN')
      and sal in (select sal from emp where job='SALESMAN');
          
--QUIZ
--실무에서 활용(이런 방식의 쿼리 가장 많이 쓰임)
--자기 부서의 평균 월급보다 더 많은 월급을 받는
--사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요
select * from emp;
--1단계 힌트 : 부서번호와 부서의 평균월급을 담고 있는 테이블이 존재한다면..
--2단계 힌트 : from절에 서브쿼리를 쓸 수 있다.
--3단계 힌트 : emp e join
select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal
order by ename;
--group by empno, ename, deptno;


--QUIZ
--실무에서 활용(이런 방식의 쿼리 가장 많이 쓰임)
--자기 부서의 평균 월급보다 더 많은 월급을 받는
--사원의 사번, 이름, 부서번호, 부서별 평균 월급을 출력하세요
select e.empno, e.ename, e.deptno, e.sal, avg(sal)
from emp e
where e.sal > (select round(avg(sal),0) from emp s where e.deptno = s.deptno)
group by e.empno, e.ename, e.deptno, e.sal
order by ename;






