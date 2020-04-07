--시퀀스(page 185)★★
--많이 쓰임

--순번 추출기
--자동으로
--


--CREATE SEQUENCE sequence_name
--[INCREMENT BY n]
--[START WITH n]
--[{MAXVALUE n | NOMAXVALUE}]
--[{MINVALUE n | NOMINVALUE}]
--[{CYCLE | NOCYCLE}]
--[{CACHE | NOCACHE}];
--sequence_name SEQUENCE 의 이름입니다.
--INCREMENT BY n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
--이 절이 생략되면 SEQUENCE 는 1 씩 증가.
--START WITH n 생성하기 위해 첫번째 SEQUENCE 를 지정.
--이 절이 생략되면 SEQUENCE 는 1 로 시작.
--MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
--NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
--MINVALUE n 최소 SEQUENCE 값을 지정.
--NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
--CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
--지정. NOCYCLE 이 디폴트.
--CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
--하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE.

select * from tab where tname = 'BOARD';

drop table board;
--drop은 복원 불가

create table board(
    boardid number constraint pk_bard_id primary key,
    title nvarchar2(100) -- n이 붙으면 바이트가 아니라 글자수
);

select * from board;
--boardid 컬럼(not null, unique, index가 내부적으로 구성)
--개발자가 보는 boardid >> where boardid=? >> 데이터가 있다면 무조껀 1건은 리턴받을 수 있다는 보장을 받음

--insert, update
--insert into board(boardid, title) values()
--넣는 데이터가 중복값이 아니고 null이 아니다를 보장해야 에러가 안남

--조건 : 처음 글을 쓰면 1 이라는 값을 insert ....그다음부터의 글은 2,3,4
--?? insert문을 구성 ...
--subquery >> values 안에 사용 가능

insert into board(boardid, title)
values((
        select count(boardid)+1
        from board),'안녕');

----------------------------
--다른방법
insert into board(boardid, title)
values((
        select nvl(max(boardid),0)+1
        from board),'안녕');

select * from board;
commit;
----------------------------------------
--sequence 번호 추출 : 중복값이 없고 순차적인 값을 리턴 >> 공유객체(static같은 존재)
--create로 만든건 껐다켜도 없어지지않음

create sequence board_num;

select * from sys.user_sequences; --만든 시퀀스 조회

/*
1.4.1 NEXTVAL 과 CURRVAL 의사열
1) NEXTVAL 는 다음 사용 가능한 SEQUENCE 값을 반환 한다.
2) SEQUENCE 가 참조될 때 마다, 다른 사용자에게 조차도 유일한 값을 반환한다.
3) CURRVAL 은 현재 SEQUENCE 값을 얻는다.
4) CURRVAL 이 참조되기 전에 NEXTVAL 이 사용되어야 한다.(주의 사항)
*/
--실제 번호를 추출하는 것은 nextval
select board_num.nextval from dual;

--몇번까지 추출했지? (마지막에 추출한 값을 확인)
select board_num.currval from dual;

----------------------------------------------------------
create sequence kboard_num;

create table kboard(
    num number constraint pk_kboard_num primary key,
    title varchar2(100)
);

insert into kboard(num, title) values(kboard_num.nextval, 'ss');

select kboard_num.currval from dual;

delete from kboard where num=4;

select * from kboard;
------------------------
--1.sequence 객체(테이블간 공유자원 >> 여러개의 테이블이 하나의 추출기를 사용(네이버 카페가 그렇게 하고있음)
--A.테이블 >> 1, 2, 8
--B.테이블 >> 3, 4, 5
--C.테이블 >> 6, 7

--사이트(게시판) 10개
--상품게시판, 관리자 게시판, 회원게시판
--1.하나의 sequence 공유
--2.게시판마다 글번호를 따로주고싶으면 시퀀스를 더만들어서 각각 사용하면 된다(설계에 따라 다름.. / 정답은 없음)
--내생각 : 하나의 시퀀스를 공유해서 사용하는것이 낳을지도..?

--ms-sql : create table board(boardnum int indentity(1,1)...
--insert into board(title) values('방가')  -> 글번호를 넣지 않음
--ms-sql 2012 버전 ... sequence 만듬

--my-sql : num int(10) not null auto_increment primary key

--my-sql 업그레이드 -> 마리아DB(mysql을 만든사람이 유료화에 참지못해 회사에서 나와서 오픈소스기반으로 제작 및 배포)

--2차프로젝트 : 오라클
--3차프로젝트 : mysql or 마리아DB and nosql 1개(몽고DB)
------------------------------------------------------
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;

--게시판 데이터 insert ...
--게시판 글보기 (최신글 순으로 ...글번호 큰것)
--select * from board order by boardnum desc

--sequence는 필수로 알아두기

--★★★rownum 의사컬럼 : 실제 물리적으로 존재하는 컬럼이 아니고 논리적인 존재
--ROWNUM : 실제 테이블에 컬럼으로 존재하지 않지만 내부적으로 행번호를 부여할 수 있는 의사컬럼
--ROWID : 주소값(행이 실제로 저장되는 내부주소값) -> 인덱스 생성시 사용

select * from emp;
select rownum as 순번, empno, ename from emp;
--rownum은 selec한 결과에 순번을 붙여줌

--Top-n 쿼리
--테이블에서 조건에 맞는 상위(top) 레코드 n개 추출

--MS-SQL(Oracle에는 없음)
--select top 10, * from emp order by sal desc

--Oracle
--rownum이라는 의사컬럼을 사용해서 기준을 정의 / 페이징 처리에서 사용

--rownum 사용
--1. 정렬의 기준을 정의(선행)
--2. 정렬된 상황에서 앞에 순번을 붙이고 조건을 제시해서 데이터를 추출

--1단계
select * 
from (select *
        from emp 
        order by sal desc) e;

--2단계
select rownum as "num", e.* 
from (select *
        from emp 
        order by sal desc) e;

--3단계(급여를 많이 받는 사원 5명)
select rownum as "num", e.* 
from (select *
        from emp 
        order by sal desc) e
        where rownum <= 5;
--rownum as "num", 이거 없어도 됨
--내부적으로 사용되는 rownum을 사용
--rownum은 top-n쿼리라 위쪽만 가능
--rownum>6하면 출력이 안됨(그래서 아래의 방법을 사용)
---------------------------------------------
--게시판 만들기 페이징 처리에 필수로 사용되는 쿼리(rownum 가상컬럼)
select * from emp order by sal desc; --기준점 잡기

select *
from(
    select rownum as "num", e.*
    from (select * 
            from emp 
            order by sal desc) e 
    )
where "num" < 10; --서브쿼리로 또 묶으면 별명으로 지어준 num을 쓸 수 있음 
--이게더 편할수 있음
--rownum이 있는 가상 테이블을 만든 것
--"num"을 rownum으로 바꾸고 rownum > 10하면 출력안됨
------------------------------------------------
--게시판(페이징 처리)
--100건 데이터
--10건씩 나누어서 보여주기

--총 100건
--pagesize = 10(한 화면에 보여줄(페이지) 데이터의 건수 = row의 수)
--page count = 10개
--[1][2][3]~[9][10]
--[1] 클릭 -> 1~10번
--[2] 클릭 -> 11~20번
--[10] 클릭 -> 91~100번
--------------------------------------
--HR 계정으로 이동
select * from employees order by employee_id asc; --기준(정렬)
---------------------
--페이징 처리 기본 소스코드(sql 쿼리)
select num, employee_id, last_name, email
from(
        select rownum as num, e.*
        from (
            select *
            from employees
            order by employee_id asc
            ) e
        where rownum <= 50
    ) s
where num > 40;

select num, employee_id, last_name, email
from(
        select rownum as num, e.*
        from (
            select *
            from employees
            order by employee_id asc
            ) e
        where rownum <= 10
    ) s
where num > 0;
---------------------------------------
--방법2
--between A and B
--where rownum between 10 and 20

--여기까지 기본과정 끝

--sql 고급과정(3차 프로젝트)
--PL-SQL (변수, 제어문, 커서, 함수, 프로시저, 트리거, 스케줄)
--이런것까지 써야 취업에 유리



--종합문제(50개) (홀수 / 짝수 선택해서 풀기) --BIT계정의 emp, dept, salgrade
--1> 부서테이블의 모든 데이터를 출력하라.
select * from emp;
 
--2> EMP테이블에서 각 사원의 직업, 사원번호, 이름, 입사일을 출력하라.
select job, empno, ename, hiredate
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
select ename, sal
from emp
where sal not between 1500 and 2850;
 
--7> 1981년 2월 20일 ~ 1981년 5월 1일에 입사한 사원의 이름,직업 및 ★★
--입사일을 출력하라. 입사일을 기준으로 해서 오름차순으로 정렬하라.
select ename, job, hiredate
from emp
where to_date(hiredate) between '1981-02-20' and '1981-05-10'
order by hiredate asc;

--8> 10번 및 30번 부서에 속하는 모든 사원의 이름과 부서 번호를
-- 출력하되, 이름을 알파벳순으로 정렬하여 출력하라.
select ename, deptno
from emp
where deptno in(10,30)
order by ename asc;

--9> 10번 및 30번 부서에 속하는 모든 사원 중 급여가 1500을 넘는
-- 사원의 이름 및 급여를 출력하라.
--(단 컬럼명을 각각 employee 및 Monthly Salary로 지정하시오)
select ename as "employee", sal "Monthly Salary"
from emp
where deptno in(10,30) and sal > 1500;
 
--10> 관리자가 없는 모든 사원의 이름 및 직위를 출력하라. ★★
select * from emp
where mgr is null;
 
--11> 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 출력하되, 
-- 급여를 기준으로 내림차순으로 정렬하여 출력하라.
select * from emp
where comm is not null
order by sal desc; 
 
--12> 이름의 세 번째 문자가 A인 모든 사원의 이름을 출력하라.
select * from emp
where ename like '__A%';
 
--13> 이름에 L이 두 번 들어가며 부서 30에 속해있는 사원의 이름을 
--출력하라.
select * from emp
where ename like '%L%L%' and deptno = 30;
 
--14> 직업이 Clerk 또는 Analyst 이면서 급여가 1000,3000,5000 이 
-- 아닌 모든 사원의 이름, 직업 및 급여를 출력하라.
select * from emp
where job in('CLERK','ANALYST') and sal not in(1000,3000,5000);
 
--15> 사원번호, 이름, 급여 그리고 15%인상된 급여를 정수로 표시하되 
--컬럼명을 New Salary로 지정하여 출력하라.
 select empno, ename, sal, sal*1.15 as "New Salary" from emp;

 
--16> 15번 문제와 동일한 데이타에서 급여 인상분(새 급여에서 이전 
-- 급여를 뺀 값)을 추가해서 출력하라.(컬럼명은 Increase로 하라). 
  select empno, ename, sal, sal*1.15 as "New Salary", (sal*1.15)-sal as "Increase" from emp;
 

--18> 모든 사원의 이름(첫 글자는 
-- 대문자로, 나머지 글자는 소문자로 표시) 및 이름 길이를 표시하는
-- 쿼리를 작성하고 컬럼 별칭은 적당히 넣어서 출력하라.
 
select upper(substr(ename,1,1)) || lower(substr(ename,2,length(ename))) as "이름", length(ename) as "이름길이"
from emp;
 
--19> 사원의 이름과 커미션을 출력하되, 커미션이 책정되지 않은 ★★
-- 사원의 커미션은 'no commission'으로 출력하라.

select ename, decode(comm, null, 'no commission', comm) as "s"
from emp;

 
--20> 모든 사원의 이름,부서번호,부서이름을 표시하는 질의를 작성하라.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;
 
--21> 30번 부서에 속한 사원의 이름과 부서번호 그리고 부서이름을 출력하라.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.deptno = 30;
 
--22> 30번 부서에 속한 사원들의 모든 직업과 부서위치를 출력하라.
--(단, 직업 목록이 중복되지 않게 하라.)
select distinct e.job, d.loc
from emp e join dept d
on e.deptno = d.deptno
where d.deptno = 30;
 
--23> 커미션이 책정되어 있는 모든 사원의 이름, 부서이름 및 위치를 출력하라.
select e.ename, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.comm is not null;
 
--24> 이름에 A가 들어가는 모든 사원의 이름과 부서 이름을 출력하라.
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';
 
--25> Dallas에서 근무하는 모든 사원의 이름, 직업, 부서번호 및 부서이름을 
-- 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
--26> 사원이름 및 사원번호, 해당 관리자이름 및 관리자 번호를 출력하되, ★★★(100% 이해는 안됨)
-- 각 컬럼명을 employee,emp#,manager,mgr#으로 표시하여 출력하라.
select e.ename as "employee", e.empno as "emp", d.ename as "manager", d.empno as "mgr" 
from emp e join emp d
on e.mgr = d.empno;
  
--27> 모든 사원의 이름,직업,부서이름,급여 및 등급을 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
--28> Smith보다 늦게 입사한 사원의 이름 및 입사일을 출력하라.
select ename, hiredate
from emp
where to_date(hiredate) > (select to_date(hiredate)
                            from emp
                            where ename = 'SMITH');

--29> 자신의 관리자보다 먼저 입사한 모든 사원의 이름, 입사일, ★★★
-- 관리자의 이름, 관리자의 입사일을 출력하되 각각 컬럼명을 
-- Employee,EmpHiredate, Manager,MgrHiredate로 표시하여 
-- 출력하라.
--select e.ename, e.hiredate, d.ename, d.hiredate ->어렵게 풀라함(서브쿼리)
--from emp
--where to_date(hiredate) < (select to_date(d.hiredate)
--                            from emp e join emp d
--                            on e.mgr = d.empno);
                            
select e.ename as Employee, e.hiredate as EmpHiredate, m.ename as Manager, m.hiredate as MgrHiredate
from emp e
join emp m
on e.mgr = m.empno
where e.hiredate < m.hiredate;

 
--30> 모든 사원의 급여 최고액,최저액,총액 및 평균액을 출력하되 
-- 각 컬럼명을 Maximum,Minimum,Sum,Average로 지정하여 출력하라.
select max(sal)as"Maximum", min(sal)as"Minimum", sum(sal)as"Sum", round(avg(sal),0)as"Average"
from emp;
 
--31> 각 직업별로 급여 최저액.최고액,총액 및 평균액을 출력하라.
select job, max(sal)as"Maximum", min(sal)as"Minimum", sum(sal)as"Sum", round(avg(sal),0)as"Average"
from emp
group by job;
 
--32> 직업이 동일한 사람 수를 직업과 같이 출력하라.
select job, count(job) 
from emp
group by job; 

--33> 관리자의 수를 출력하되, 관리자 번호가 중복되지 않게하라.
-- 그리고, 컬럼명을 Number of Manager로 지정하여 출력하라.
select count(distinct mgr) as "Number of Manager"
from emp;
 
--34> 최고 급여와 최저 급여의 차액을 출력하라.
select max(sal) - min(sal)
from emp;
 
--35> 관리자 번호 및 해당 관리자에 속한 사원들의 최저 급여를 출력하라. ★★★???
-- 단, 관리자가 없는 사원 및 최저 급여가 1000 미만인 그룹은 제외시키고 
-- 급여를 기준으로 출력 결과를 내림차순으로 정렬하라.
select d.empno as "mgr", min(e.sal) as "사원의 최저급여"
from emp e join emp d
on e.mgr = d.empno
group by d.empno
having min(e.sal) >= 1000
order by min(e.sal) desc; 

  
--36> 부서별로 부서이름, 부서위치, 사원 수 및 평균 급여를 출력하라.
-- 그리고 각각의 컬럼명을 부서명,위치,사원의 수,평균급여로 표시하라.
select e.deptno, d.dname, d.loc, count(e.empno), round(avg(e.sal),0)
from emp e join dept d
on e.deptno = d.deptno
group by e.deptno, d.dname, d.loc;

--37> Smith와 동일한 부서에 속한 모든 사원의 이름 및 입사일을 출력하라.
-- 단, Smith는 제외하고 출력하시오
select ename, hiredate
from emp
where ename != 'SMITH' and 
        deptno = (select deptno
                from emp
                where ename='SMITH');

 
--38> 자신의 급여가 평균 급여보다 많은 모든 사원의 사원 번호, 이름, 급여를 
--    표시하는 질의를 작성하고 급여를 기준으로 결과를 내림차순으로 정렬하라.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                from emp)
order by sal desc;
 
--39> 이름에 T가 들어가는 사원의 속한 부서에서 근무하는 모든 사원의 사원번호
-- 및 이름을 출력하라.
select empno, ename
from emp
where deptno in (select deptno
                from emp
                where ename like '%T%');
 
--40> 부서위치가 Dallas인 모든 사원의 이름,부서번호 및 직위를 출력하라.
select e.ename, e.deptno, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';


--41> KING에게 보고하는 모든 사원의 이름과 급여를 출력하라.
select ename, sal
from emp
where mgr = (select empno
                from emp
                where ename ='KING');

--42> Sales 부서의 모든 사원에 대한 부서번호, 이름 및 직위를 출력하라.
select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.dname = 'SALES';

 
--43> 자신의 급여가 평균 급여보다 많고 이름에 T가 들어가는 사원과 동일한
-- 부서에 근무하는 모든 사원의 사원 번호, 이름 및 급여를 출력하라.
select empno, ename, sal
from emp e 
where sal > (select avg(sal)
            from emp)
            and deptno in (select deptno
                            from emp
                            where ename like '%T%');
 
--44> 커미션을 받는 사원과 급여가 일치하는 사원의 이름,부서번호,급여를 ★★★
-- 출력하라.
select ename, deptno, sal
from emp
where sal in (select sal
                from emp
                where comm is not null);
 
select * from emp;
 
--45> Dallas에서 근무하는 사원과 직업이 일치하는 사원의 이름,부서이름, ★★★(약간 힘겹게 품)
--     및 급여를 출력하시오
select ename, job, deptno, sal
from emp 
where job in (select e.job
                from emp e join dept d
                on d.deptno = e.deptno
                where d.loc = 'DALLAS');

--46> Scott과 동일한 급여 및 커미션을 받는 모든 사원의 이름, 입사일 및  //★
-- 급여를 출력하시오
select e.ename, e.hiredate, e.sal
from emp e, (select sal, comm from emp where ename = 'SCOTT') d
where e.sal = d.sal; and e.comm = d.comm;

 
--47> 직업이 Clerk 인 사원들보다 더 많은 급여를 받는 사원의 사원번호,
-- 이름, 급여를 출력하되, 결과를 급여가 높은 순으로 정렬하라.
 select empno, ename, sal
 from emp
 where sal > (select max(sal)
                     from emp
                     where job = 'CLERK');
 
--48> 이름에 A가 들어가는 사원과 같은 직업을 가진 사원의 이름과
-- 월급, 부서번호를 출력하라.
 select ename, sal, deptno
 from emp
 where job in (select job
                from emp
                where ename like '%A%');
 
--49> New  York 에서 근무하는 사원과 급여 및 커미션이 같은 사원의 ★★★??
-- 사원이름과 부서명을 출력하라.
 select e.ename, s.dname
 from emp e, (select e.sal, e.comm, d.dname
                from emp e join dept d 
                on e.deptno = d.deptno
                where d.loc = 'NEW YORK') s
where e.sal = s.sal and e.comm = s.comm;
 
--50> Dallas에서 근무하는 사원과 직업 및 관리자가 같은 사원의 사원번호,사원이름,
--    직업,월급,부서명,커미션을 출력하되 커미션이 책정되지 않은 사원은 NoCommission
--    으로 표시하고, 커미션의 컬럼명은 Comm으로 나오게 출력하시오.
--    단, 최고월급부터 출력되게 하시오






