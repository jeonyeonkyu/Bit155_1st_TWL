--DDL 테이블 다루기(pdf 138page)


--DDL 테이블 다루기(부가적으로 알면 좋은것, 굳이 외울 필요는 없음(선생님도 안외움))
--1. 테이블 생성하기
create table temp6(id number);

--2.테이블을 생성했는데 컬럼 추가하기
desc temp6;

alter table temp6
add ename varchar2(20);

--3.기존 테이블에 있는 컬럼의 이름을 잘못 표기(ename -> username)
--기존 테이블에 있는 컬럼의 이름 바꾸기(rename)
alter table temp6
rename column ename to username;

--4.기존 테이블에 있는 기존 컬럼의 타입 수정하기
--(modify)
alter table temp6
modify(username varchar2(100));

--5.기존 테이블에 있는 기존 컬럼 삭제하기
alter table temp6
drop column username;

--6.테이블 삭제
--6.1 데이터 삭제 : delete
--테이블 처음 만들면 처음 크기(20평) -> 20평보다 큰 데이터를 넣으면 >> 자동으로 늘림(오라클의 OS 디스크만큼..)
--ex) 처음 테이블 크기 1M >> 10만건 >> 100M만큼 테이블 증가 >> delete 10만건 삭제 >> 테이블 크기 100M

--테이블의 데이터를 삭제하면서 공간의 크기도 줄일 수 있다
--truncate (where 절 사용을 하지 못함) 한번에 처음 만들었을 때의 크기로 줄어듬(내가 원하는 부분만큼의 크기로 줄이진 못함)
--ex) 처음 테이블 크기 1M >> 10만건 >> 100M만큼 테이블 증가 >> truncate 10만건 삭제 >> 테이블 크기 1M
--개발자가 trunacte를 쓸 필요는 없음, 실무에서는 DBA가 함

--7.테이블 삭제(drop)
--백업하지 않는 이상 복구 불가
drop table temp6;

-----------------------------------------------------------------------
--테이블 제약 설정하기(pdf 144page)
--★데이터[무결성] 확보
--select(연관성 X)
--제약(constraint : insert, update, delete(FK)) 
/*
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL 과 UNIQUE 조건을 만족)
--테이블에 한개만 걸수 있음(테이블당 한개(컬럼을 여러개 묶어서 가능 : 복합키))
--내부적으로 검색의 향상을 위해서 (index) 자동 생성(select 향상) 
index의 단점
1.용량이 적을때 비용이 더듬
2.

FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다.
--참조제약[테이블]과 [테이블]간의 관계 설정

★UNIQUE key(UK) 테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL 을 허용)
NOT NULL(NN) 열은 NULL 값을 포함할 수 없습니다.
CHECK(CK) 참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
설정한 범위의 값만 받겠다 컬럼에 gender in ('님','여') 하면 ...
ex) where gender in ('남','여')
*/

--제약을 만드는 시점
--1.테이블 만들면서 바로 생성(create table ...)
--2.테이블 생성 이후 추가(제약)(alter table add constraint) ...)(어쩌면 이 방법이 많이 쓰일 수 있음)
--  2번은 자동화된 툴 들이 사용하는 방법

--1.제약 정보 확인하기(이것은 암기하면 편함)
select * from user_constraints where table_name='EMP'; --테이블 명은 대문자
--SYS_C006997 내부적으로 생성된 제약 이름
--"EMPNO" IS NOT NUL

create table temp7(
    --id NUMBER PRIMARY KEY 줄임표현(제약이름 : SYS_C006997), PRIMARY KEY란 이름을 지울때 제약이름을 알아야 지울 수 있음) -> 불편
    id number constraint pk_temp7_id primary key, --권장사항, pk_테이블명_컬럼명(관례적)
    name varchar2(20) not null,
    addr varchar2(50)
);

select * from user_constraints where table_name='TEMP7';
--우리가 지정한 가독성 좋은 제약이름이 들어감 (제약 수정, 삭제) 쉽게 사용 가능

insert into temp7(name,addr) values('홍길동','서울시 강남구');
--null값 불가
--자바코드에서 막는것보다 DB에서 막는게 제일 중요

insert into temp7(id,name,addr) values(10, '홍길동','서울시 강남구');
commit;
select * from temp7;

insert into temp7(id,name,addr) values(10, '아무개','서울시 강남구');
--중복 데이터 불가

--1.테이블에 primary key를 몇개까지 걸수 있을까 1개
--(name, num) 여러개의 컬럼을 묶어서 1개 ... >> 복합키

create table temp8(
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin char(6) constraint uk_temp8_jumin unique,
    addr varchar2(20)
);

select * from user_constraints where table_name='TEMP8';
insert into temp8(id,name,jumin,addr) values(10,'홍길동','123456','경기도 성남시');
commit;
select * from temp8;

insert into temp8(id,name,jumin,addr) values(20,'아무개','123456','경기도 성남시');
--ORA-00001: unique constraint (BIT.UK_TEMP8_JUMIN) violated

--★null ....unique 허용(null도 중복체크를 할까) -> 안함
--result : null 허용(null은 중복체크의 대상이 아니다)
insert into temp8(id,name,addr) values(30,'김씨','경기도 성남시');
insert into temp8(id,name,addr) values(40,'박씨','경기도 성남시');

--create table temp9(
--    jumin not null constraint .. unique --not null하면서 unique도 검
--)
--unique제약은 테이블에 몇개 : 컬럼개수만큼 ...
----------------------------------------------------------------------------
create table temp9(
    id number
);

--기존 테이블에 제약 추가하기
--주의) 기존 데이터가 있는 경우 제약을 위반하는 데이터가 있으면 제약은 추가되지 않음
--제약 걸기전에 데이터 검사 작접 선행

--★
alter table temp9
add constraint pk_temp9_id primary key(id);
select * from user_constraints where table_name='TEMP9';
--테이블을 만들고 추가로 제약을 거는 방법도 많음(처음 테이블 설계시 제약을 설정하는 것은 어려움)

--여러개 컬럼(복합키)
--add constraint pk_temp9_id primary key(id, name);

alter table temp9
add ename varchar2(20);

desc temp9;

--not null 추가하기(이방법은 잘 안씀)
alter table temp9
modify(ename not null);


--데이터 모델링 툴
--exerd(한국제품)

---------------------------------------
--[check 제약]
--where 조건과 동일한 형태의 제약 >> where age > 19
--컬럼이름 age > 19

create table temp10(
    id number constraint pk_temp10_id primary key,
    name varchar2(20) not null,
    jumin char(6) constraint uk_temp10_jumin unique,
    addr varchar2(20),
    age number constraint ck_temp10_age check(age >= 19) --search_condition
);

select * from user_constraints where table_name='TEMP10';

insert into temp10(id,name,jumin,addr,age) values(100,'홍길동','123456','서울시 강남구',20);

select * from temp10;
commit;

insert into temp10(id,name,jumin,addr,age) values(200,'홍길동','123456','서울시 강남구',18);
--ORA-02290: check constraint (BIT.CK_TEMP10_AGE) violated
----------------------------------------------------------------------------------
--참조 제약 : RDBMS : 테이블과 테이블간의 관계 설정(★)
--emp 테이블에 있는 deptno 컬럼은 dept 테이블에 있는 deptno를 참조한다.
--참조하는 쪽에 거는 제약 : FK
--참조를 당하는 쪽에 거는 제약 : PK

create table c_emp 
as 
    select empno, ename, deptno from emp where 1=2;
    
create table c_dept
as
    select deptno, dname from dept where 1=2;

select * from c_emp;
select * from c_dept;

--★

--c_emp(deptno) >> c_deptno(deptno)를 빌려 쓸거야
--c_dept(deptno) 다른 사람에게 빌려주기 위해서 신용을 확보(primary key)
--c_dept(deptno) primary key를 먼저 걸어줘야함
--1.
desc c_dept;

alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);
--2.
alter table c_emp 
add constraint fk_c_emp_empno foreign key(deptno) references c_dept(deptno);
--c_emp(deptno) --- c_dept(deptno) 관계가 설정(1:N) / 다대다는 별로 없음
--1:1예시 
--회원에 5가지 정보중 2가지 정보(id,이름)만 사용하면 나머지 3개의 정보(id,나이,주소)는 다른 테이블에 넣고 일대일 관계(id - id)를 맺어줌
--책과 저자(다대다관계)

insert into c_dept(deptno,dname) values(100,'인사팀');
insert into c_dept(deptno,dname) values(200,'관리팀');
insert into c_dept(deptno,dname) values(300,'회계팀');
commit;
select * from c_dept;

--신입사원 입사
insert into c_emp(empno, ename) values(100,'홍길동');
--deptno에 not null이 안걸려서 오류가 안뜸
--not null 걸어서 쓰는 것이 맞다(100~300), 아니다(null허용)(100~300_
--null 이유 : 신입사원이 부서배치를 늦게 받을 수도 있다.
--not null 이유 : 입사하는 모든 사원은 반드시 부서를 가져야 한다.
--DB 설계는 정답이 없음..
select * from c_emp;

update c_emp
set deptno = 500;
where empno = 100;
--무결성 제약 조건

update c_emp
set deptno = 100;
where empno = 100;

select * from c_emp;
commit;

insert into c_emp(empno, ename, deptno)
values(200,'아무개','100');
commit;
select * from c_emp;
--------------------------------------------------------------------------------
--두개의 테이블
--(부모와 자식 관계)
--(master , detail)

--emp(deptno) 과 dept(deptno) 관계에서 주테이블(부모)
--부모(PK를 가지고 있는쪽이 부모다) > dept     

select * from c_dept;
select * from c_emp;


delete from c_dept where deptno = 300;
delete from c_dept where deptno = 100;
--ORA-02292: integrity constraint (BIT.FK_C_EMP_EMPNO) violated - child record found
--★★★
--integrity constraint (BIT.FK_C_EMP_EMPNO) violated 
-- child record found
--저 지우고 싶어요 ....
--child (100 번 부서를 삭제 , 수정) ...
--자식을 먼저 삭제하고 부모 삭제 .....
COMMIT;

/*
--★cascade 옵션
--on delete cascade : 부모테이블과 생명을 같이 하겠다
--mysql, mssal은 on update cascade도 있음

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
drop constraint fk_c_emp_empno; --제약을 지움

alter table c_emp
add constraint fk_emp_deptno foreign key(deptno) 
references c_dept(deptno) ON DELETE CASCADE;
--부모쪽에 있는 데이터를 지우면 자식쪽에 있는 데이터도 없어짐

select * from c_emp;
select * from c_dept;

delete from c_dept where deptno=100;
rollback;


/*
--학생 성적 테이블
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--는 값을 입력하지 않으면  default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다 (평균은 소수이하2자리까지 / 반올림)
--학과코드는 학과 테이블에 학과코드를 참조한다

--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드(영어로.)

--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다

--학과코드 , 학과명

--그리고 select 결과는
--샘플 데이터 3건 정도
--학번 , 이름  총점, 평균 , 학과코드 , 학과명 을 출력하세요
*/

create table score(
    id number(10),
    name varchar2(10) not null,
    korea number(10) default 0,
    english number(10) default 0,
    math number(10) default 0,
    sum number generated always as (korea + english + math) virtual,
    avg number generated always as ( round((korea + english + math)/3,2) ) virtual,
    majorCode number(10)
);

alter table score
add constraint pk_score_id primary key(id);

create table major(
    majorCode number(10) constraint pk_major_majorCode primary key,
    majorName varchar2(10) not null
);

alter table score
add constraint fk_score_majorCode foreign key(majorCode) references major(majorCode);

--인서트 데이터

insert into major(majorCode,majorName)
values(1000,'컴퓨터');

insert into major(majorCode,majorName)
values(2000,'전기');

insert into major(majorCode,majorName)
values(3000,'기계');


insert into score(id,name,korea,english,math,majorCode)
values(1,'김우철',50,50,50,1000);

insert into score(id,korea,english,math,majorCode)
values(1,50,50,50,1000);
--에러, 이름 NULL값 허용 X

insert into score(id,name,korea,english,math,majorCode)
values(2,'장민봉',70,80,90,2000);

insert into score(id,name,korea,english,math,majorCode)
values(3,'전연규',10,20,15,4000);
--에러 발생, major의 학과코드에 4000이 없기 때문.

insert into score(id,name,majorCode)
values(4,'이정아',2000);
--국,영,수 디폴트 데이터 0 들어감

--select한 데이터
select * from score;
select * from major;

commit;

--3번쨰 방법
create table major(
    m_code number,
    m_name varchar2(20) not null,
    constraint pk_major_mcode primary key(m_code),
    constraint fk_grade_mcode foreign key(m_code) references major(m_code)
);


---------------제약 설정하기--------------------------
--view 객체(가상 테이블), 오라클.pdf (192page) 

create view v_001 --vie는 테이블이 아니라 객체일뿐
as
    select empno,ename from emp;
--view 는 권한이 있어야 생성이 가능하다

select * from v_001; --view는 sql 문장을 가지고 있는 객체

--view는 객체(create ...)
--create view 뷰이름 as [sql문장] (view를 통해서 볼 수 있는 데이터 목록을 나열)
--view는 테이블처럼 사용가능 (가상 테이블) -> 쓰는 방법(emp, dept) 동일하게
--view 메모리에상에서 존재하는 가상테이블 (ex) in-line-view

--view 사용법
--일반 테이블과 동일...(select, where ...) 
--DML(insert, update, delete) -> view를 통해서 볼 수 있는 데이터 -> DML
--view가 볼 수 있는 데이터만..

--view 사용 목적
--1.보안(권한 처리) -> 노출하고 싶은 데이터만 모아서 view를 생성 ...
--★2.편리성(복잡한 쿼리를 모아서 view를 생성하면 나중에 안쳐도 됨)

--1.보안 예시
--인사 테이블
--Emp 바로 노출 ...Sal 정보
create view v_emp
as 
    select empno, ename, job,hiredate from emp;
    
--v_emp 사용하시면 돼요
select * from v_emp;

--신입사원은 view만 볼수있는 권한을 가짐.

--2.편리성 예시(복잡한 쿼리를 단순화)
create view v_002
as 
    select e.empno, e.ename, d.deptno, d.dname
    from emp e join dept d
    on e.deptno = d.deptno;

select * from v_002;
select * from v_002 where deptno=20;


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

--테이블이 1개 이상
--JOIN ... 안되면 ... subquery ... 안되면 view(가상테이블)

--view는 성능하고 전혀 상관이 없음(오히려 떨어뜨림), 성능적인 측면에서만 따지면 select만 사용하는게 좋음
--주 목적은 개발자의 편리성

--view 삭제
drop view v_007;

create or replace view v_007 --or replace는 기존에 있는 것을 덮어쓴다는 것
as
    select avg(sal) as "ss" from emp;
--as "ss"가 없으면 에러(컬럼명을 alias 해주지 않으면 에러발생)

select * from v_007;

--View를 통한 DML 가능 (근데 안하는게 좋음 / view는 select할때만 쓰는게 좋음)
--단 view가 가지는 구문이 테이블 1개인 경우만 가능(복합 View는 DML 불가)
--*복합 view란 테이블 2개이상 구성된 query)
--단순 view(테이블 1개)만 DML 작업 가능

select * from v_emp; --볼수 있는 데이터(empno, ename, job, hiredate)

update v_emp --v_emp 너는 sal이라 컬럼을 볼 수 없어 ..... 변경 할수 없어
set sal = 0;
--불가능, v_emp는 sql을 들고 있는 객체임(테이블이 아님)

update v_emp
set job = 'IT';

select * from v_emp;
--실제로는 emp테이블이 바뀐것!!!!!!!!!!!!!!★★★★★★★★★★★★ v_emp는 emp의 주소를 가지고 있다고 생각하면 될듯
select * from emp;

create or replace view v_emp2 --or replace는 기존에 있는 것을 덮어쓴다는 것
as
    select * from emp where deptno=20;
select * from v_emp2;

update v_em2
set sal = 0;
--v_emp2가 가리키는건 deptno=20만 가리키니 deptno가 20인것만 sal이 바뀜

select * from user_views; --view 목록보기


select * from emp;




--1. 30번 부서 사원들의 직위, 이름, 월급을 담는 VIEW를 만들어라.
create or replace view view_test
as
    select job, ename, sal from emp where deptno=30;
select * from view_test; 
 
--2. 30번 부서 사원들의  직위, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직위, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.
-- create or replace view view001 (컬럼명, 컬럼명, .....)  
create or replace view view_test2
as
    select job as "직위", ename as "사원이름", sal as "월급" from emp where sal>300 and deptno=30;
select * from view_test2; 
 
--3. 부서별 최대월급, 최소월급, 평균월급을 담는 VIEW를 만들어라.
create or replace view view_test3
as
    select max(sal) as "최대월급", min(sal) as "최소월급", round(avg(sal),0) as "평균월급" from emp;
    
select * from view_test3; 

       
--4. 부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
-- 부서만 출력하도록 하라.
create or replace view view_test4
as
    select deptno, round(avg(sal),0) as "평균월급" from emp group by deptno having avg(sal) > 2000;
    
select * from view_test4; 
 
 
--5. 직위별 총월급을 담는 VIEW를 만들되, 직위가 MANAGER인
-- 사원들은 제외하고 총월급이 3000이상인 직위만 출력하도록 하라.
create or replace view view_test5
as
    select job, sum(sal) as "총 월급" from emp where job != 'MANAGER' group by job having sum(sal) > 3000;
    
select * from view_test5; 

































