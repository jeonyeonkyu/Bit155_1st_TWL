--������(page 185)�ڡ�
--���� ����

--���� �����
--�ڵ�����
--


--CREATE SEQUENCE sequence_name
--[INCREMENT BY n]
--[START WITH n]
--[{MAXVALUE n | NOMAXVALUE}]
--[{MINVALUE n | NOMINVALUE}]
--[{CYCLE | NOCYCLE}]
--[{CACHE | NOCACHE}];
--sequence_name SEQUENCE �� �̸��Դϴ�.
--INCREMENT BY n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
--�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
--START WITH n �����ϱ� ���� ù��° SEQUENCE �� ����.
--�� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
--MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
--NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
--MINVALUE n �ּ� SEQUENCE ���� ����.
--NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
--CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
--����. NOCYCLE �� ����Ʈ.
--CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
--�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE.

select * from tab where tname = 'BOARD';

drop table board;
--drop�� ���� �Ұ�

create table board(
    boardid number constraint pk_bard_id primary key,
    title nvarchar2(100) -- n�� ������ ����Ʈ�� �ƴ϶� ���ڼ�
);

select * from board;
--boardid �÷�(not null, unique, index�� ���������� ����)
--�����ڰ� ���� boardid >> where boardid=? >> �����Ͱ� �ִٸ� ������ 1���� ���Ϲ��� �� �ִٴ� ������ ����

--insert, update
--insert into board(boardid, title) values()
--�ִ� �����Ͱ� �ߺ����� �ƴϰ� null�� �ƴϴٸ� �����ؾ� ������ �ȳ�

--���� : ó�� ���� ���� 1 �̶�� ���� insert ....�״��������� ���� 2,3,4
--?? insert���� ���� ...
--subquery >> values �ȿ� ��� ����

insert into board(boardid, title)
values((
        select count(boardid)+1
        from board),'�ȳ�');

----------------------------
--�ٸ����
insert into board(boardid, title)
values((
        select nvl(max(boardid),0)+1
        from board),'�ȳ�');

select * from board;
commit;
----------------------------------------
--sequence ��ȣ ���� : �ߺ����� ���� �������� ���� ���� >> ������ü(static���� ����)
--create�� ����� �����ѵ� ������������

create sequence board_num;

select * from sys.user_sequences; --���� ������ ��ȸ

/*
1.4.1 NEXTVAL �� CURRVAL �ǻ翭
1) NEXTVAL �� ���� ��� ������ SEQUENCE ���� ��ȯ �Ѵ�.
2) SEQUENCE �� ������ �� ����, �ٸ� ����ڿ��� ������ ������ ���� ��ȯ�Ѵ�.
3) CURRVAL �� ���� SEQUENCE ���� ��´�.
4) CURRVAL �� �����Ǳ� ���� NEXTVAL �� ���Ǿ�� �Ѵ�.(���� ����)
*/
--���� ��ȣ�� �����ϴ� ���� nextval
select board_num.nextval from dual;

--������� ��������? (�������� ������ ���� Ȯ��)
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
--1.sequence ��ü(���̺� �����ڿ� >> �������� ���̺��� �ϳ��� ����⸦ ���(���̹� ī�䰡 �׷��� �ϰ�����)
--A.���̺� >> 1, 2, 8
--B.���̺� >> 3, 4, 5
--C.���̺� >> 6, 7

--����Ʈ(�Խ���) 10��
--��ǰ�Խ���, ������ �Խ���, ȸ���Խ���
--1.�ϳ��� sequence ����
--2.�Խ��Ǹ��� �۹�ȣ�� �����ְ������ �������� ������ ���� ����ϸ� �ȴ�(���迡 ���� �ٸ�.. / ������ ����)
--������ : �ϳ��� �������� �����ؼ� ����ϴ°��� ��������..?

--ms-sql : create table board(boardnum int indentity(1,1)...
--insert into board(title) values('�氡')  -> �۹�ȣ�� ���� ����
--ms-sql 2012 ���� ... sequence ����

--my-sql : num int(10) not null auto_increment primary key

--my-sql ���׷��̵� -> ������DB(mysql�� �������� ����ȭ�� �������� ȸ�翡�� ���ͼ� ���¼ҽ�������� ���� �� ����)

--2��������Ʈ : ����Ŭ
--3��������Ʈ : mysql or ������DB and nosql 1��(����DB)
------------------------------------------------------
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;

--�Խ��� ������ insert ...
--�Խ��� �ۺ��� (�ֽű� ������ ...�۹�ȣ ū��)
--select * from board order by boardnum desc

--sequence�� �ʼ��� �˾Ƶα�

--�ڡڡ�rownum �ǻ��÷� : ���� ���������� �����ϴ� �÷��� �ƴϰ� ������ ����
--ROWNUM : ���� ���̺� �÷����� �������� ������ ���������� ���ȣ�� �ο��� �� �ִ� �ǻ��÷�
--ROWID : �ּҰ�(���� ������ ����Ǵ� �����ּҰ�) -> �ε��� ������ ���

select * from emp;
select rownum as ����, empno, ename from emp;
--rownum�� selec�� ����� ������ �ٿ���

--Top-n ����
--���̺��� ���ǿ� �´� ����(top) ���ڵ� n�� ����

--MS-SQL(Oracle���� ����)
--select top 10, * from emp order by sal desc

--Oracle
--rownum�̶�� �ǻ��÷��� ����ؼ� ������ ���� / ����¡ ó������ ���

--rownum ���
--1. ������ ������ ����(����)
--2. ���ĵ� ��Ȳ���� �տ� ������ ���̰� ������ �����ؼ� �����͸� ����

--1�ܰ�
select * 
from (select *
        from emp 
        order by sal desc) e;

--2�ܰ�
select rownum as "num", e.* 
from (select *
        from emp 
        order by sal desc) e;

--3�ܰ�(�޿��� ���� �޴� ��� 5��)
select rownum as "num", e.* 
from (select *
        from emp 
        order by sal desc) e
        where rownum <= 5;
--rownum as "num", �̰� ��� ��
--���������� ���Ǵ� rownum�� ���
--rownum�� top-n������ ���ʸ� ����
--rownum>6�ϸ� ����� �ȵ�(�׷��� �Ʒ��� ����� ���)
---------------------------------------------
--�Խ��� ����� ����¡ ó���� �ʼ��� ���Ǵ� ����(rownum �����÷�)
select * from emp order by sal desc; --������ ���

select *
from(
    select rownum as "num", e.*
    from (select * 
            from emp 
            order by sal desc) e 
    )
where "num" < 10; --���������� �� ������ �������� ������ num�� �� �� ���� 
--�̰Դ� ���Ҽ� ����
--rownum�� �ִ� ���� ���̺��� ���� ��
--"num"�� rownum���� �ٲٰ� rownum > 10�ϸ� ��¾ȵ�
------------------------------------------------
--�Խ���(����¡ ó��)
--100�� ������
--10�Ǿ� ����� �����ֱ�

--�� 100��
--pagesize = 10(�� ȭ�鿡 ������(������) �������� �Ǽ� = row�� ��)
--page count = 10��
--[1][2][3]~[9][10]
--[1] Ŭ�� -> 1~10��
--[2] Ŭ�� -> 11~20��
--[10] Ŭ�� -> 91~100��
--------------------------------------
--HR �������� �̵�
select * from employees order by employee_id asc; --����(����)
---------------------
--����¡ ó�� �⺻ �ҽ��ڵ�(sql ����)
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
--���2
--between A and B
--where rownum between 10 and 20

--������� �⺻���� ��

--sql ��ް���(3�� ������Ʈ)
--PL-SQL (����, ���, Ŀ��, �Լ�, ���ν���, Ʈ����, ������)
--�̷��ͱ��� ��� ����� ����



--���չ���(50��) (Ȧ�� / ¦�� �����ؼ� Ǯ��) --BIT������ emp, dept, salgrade
--1> �μ����̺��� ��� �����͸� ����϶�.
select * from emp;
 
--2> EMP���̺��� �� ����� ����, �����ȣ, �̸�, �Ի����� ����϶�.
select job, empno, ename, hiredate
from emp;
 
--3> EMP���̺��� ������ ����ϵ�, �� �׸�(ROW)�� �ߺ����� �ʰ�
-- ����϶�.
select distinct job
from emp;

 
--4> �޿��� 2850 �̻��� ����� �̸� �� �޿��� ����϶�.
select ename, sal
from emp
where sal >= 2850;
 
--5> �����ȣ�� 7566�� ����� �̸� �� �μ���ȣ�� ����϶�.
select ename, deptno
from emp
where empno = 7566;
  
--6> �޿��� 1500�̻� ~ 2850������ ������ ������ �ʴ� ��� ����� �̸� 
-- �� �޿��� ����϶�.
select ename, sal
from emp
where sal not between 1500 and 2850;
 
--7> 1981�� 2�� 20�� ~ 1981�� 5�� 1�Ͽ� �Ի��� ����� �̸�,���� �� �ڡ�
--�Ի����� ����϶�. �Ի����� �������� �ؼ� ������������ �����϶�.
select ename, job, hiredate
from emp
where to_date(hiredate) between '1981-02-20' and '1981-05-10'
order by hiredate asc;

--8> 10�� �� 30�� �μ��� ���ϴ� ��� ����� �̸��� �μ� ��ȣ��
-- ����ϵ�, �̸��� ���ĺ������� �����Ͽ� ����϶�.
select ename, deptno
from emp
where deptno in(10,30)
order by ename asc;

--9> 10�� �� 30�� �μ��� ���ϴ� ��� ��� �� �޿��� 1500�� �Ѵ�
-- ����� �̸� �� �޿��� ����϶�.
--(�� �÷����� ���� employee �� Monthly Salary�� �����Ͻÿ�)
select ename as "employee", sal "Monthly Salary"
from emp
where deptno in(10,30) and sal > 1500;
 
--10> �����ڰ� ���� ��� ����� �̸� �� ������ ����϶�. �ڡ�
select * from emp
where mgr is null;
 
--11> Ŀ�̼��� �޴� ��� ����� �̸�, �޿� �� Ŀ�̼��� ����ϵ�, 
-- �޿��� �������� ������������ �����Ͽ� ����϶�.
select * from emp
where comm is not null
order by sal desc; 
 
--12> �̸��� �� ��° ���ڰ� A�� ��� ����� �̸��� ����϶�.
select * from emp
where ename like '__A%';
 
--13> �̸��� L�� �� �� ���� �μ� 30�� �����ִ� ����� �̸��� 
--����϶�.
select * from emp
where ename like '%L%L%' and deptno = 30;
 
--14> ������ Clerk �Ǵ� Analyst �̸鼭 �޿��� 1000,3000,5000 �� 
-- �ƴ� ��� ����� �̸�, ���� �� �޿��� ����϶�.
select * from emp
where job in('CLERK','ANALYST') and sal not in(1000,3000,5000);
 
--15> �����ȣ, �̸�, �޿� �׸��� 15%�λ�� �޿��� ������ ǥ���ϵ� 
--�÷����� New Salary�� �����Ͽ� ����϶�.
 select empno, ename, sal, sal*1.15 as "New Salary" from emp;

 
--16> 15�� ������ ������ ����Ÿ���� �޿� �λ��(�� �޿����� ���� 
-- �޿��� �� ��)�� �߰��ؼ� ����϶�.(�÷����� Increase�� �϶�). 
  select empno, ename, sal, sal*1.15 as "New Salary", (sal*1.15)-sal as "Increase" from emp;
 

--18> ��� ����� �̸�(ù ���ڴ� 
-- �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸� ���̸� ǥ���ϴ�
-- ������ �ۼ��ϰ� �÷� ��Ī�� ������ �־ ����϶�.
 
select upper(substr(ename,1,1)) || lower(substr(ename,2,length(ename))) as "�̸�", length(ename) as "�̸�����"
from emp;
 
--19> ����� �̸��� Ŀ�̼��� ����ϵ�, Ŀ�̼��� å������ ���� �ڡ�
-- ����� Ŀ�̼��� 'no commission'���� ����϶�.

select ename, decode(comm, null, 'no commission', comm) as "s"
from emp;

 
--20> ��� ����� �̸�,�μ���ȣ,�μ��̸��� ǥ���ϴ� ���Ǹ� �ۼ��϶�.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno;
 
--21> 30�� �μ��� ���� ����� �̸��� �μ���ȣ �׸��� �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.deptno = 30;
 
--22> 30�� �μ��� ���� ������� ��� ������ �μ���ġ�� ����϶�.
--(��, ���� ����� �ߺ����� �ʰ� �϶�.)
select distinct e.job, d.loc
from emp e join dept d
on e.deptno = d.deptno
where d.deptno = 30;
 
--23> Ŀ�̼��� å���Ǿ� �ִ� ��� ����� �̸�, �μ��̸� �� ��ġ�� ����϶�.
select e.ename, d.dname, d.loc
from emp e join dept d
on e.deptno = d.deptno
where e.comm is not null;
 
--24> �̸��� A�� ���� ��� ����� �̸��� �μ� �̸��� ����϶�.
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%';
 
--25> Dallas���� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ��̸��� 
-- ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
--26> ����̸� �� �����ȣ, �ش� �������̸� �� ������ ��ȣ�� ����ϵ�, �ڡڡ�(100% ���ش� �ȵ�)
-- �� �÷����� employee,emp#,manager,mgr#���� ǥ���Ͽ� ����϶�.
select e.ename as "employee", e.empno as "emp", d.ename as "manager", d.empno as "mgr" 
from emp e join emp d
on e.mgr = d.empno;
  
--27> ��� ����� �̸�,����,�μ��̸�,�޿� �� ����� ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';
 
--28> Smith���� �ʰ� �Ի��� ����� �̸� �� �Ի����� ����϶�.
select ename, hiredate
from emp
where to_date(hiredate) > (select to_date(hiredate)
                            from emp
                            where ename = 'SMITH');

--29> �ڽ��� �����ں��� ���� �Ի��� ��� ����� �̸�, �Ի���, �ڡڡ�
-- �������� �̸�, �������� �Ի����� ����ϵ� ���� �÷����� 
-- Employee,EmpHiredate, Manager,MgrHiredate�� ǥ���Ͽ� 
-- ����϶�.
--select e.ename, e.hiredate, d.ename, d.hiredate ->��ư� Ǯ����(��������)
--from emp
--where to_date(hiredate) < (select to_date(d.hiredate)
--                            from emp e join emp d
--                            on e.mgr = d.empno);
                            
select e.ename as Employee, e.hiredate as EmpHiredate, m.ename as Manager, m.hiredate as MgrHiredate
from emp e
join emp m
on e.mgr = m.empno
where e.hiredate < m.hiredate;

 
--30> ��� ����� �޿� �ְ��,������,�Ѿ� �� ��վ��� ����ϵ� 
-- �� �÷����� Maximum,Minimum,Sum,Average�� �����Ͽ� ����϶�.
select max(sal)as"Maximum", min(sal)as"Minimum", sum(sal)as"Sum", round(avg(sal),0)as"Average"
from emp;
 
--31> �� �������� �޿� ������.�ְ��,�Ѿ� �� ��վ��� ����϶�.
select job, max(sal)as"Maximum", min(sal)as"Minimum", sum(sal)as"Sum", round(avg(sal),0)as"Average"
from emp
group by job;
 
--32> ������ ������ ��� ���� ������ ���� ����϶�.
select job, count(job) 
from emp
group by job; 

--33> �������� ���� ����ϵ�, ������ ��ȣ�� �ߺ����� �ʰ��϶�.
-- �׸���, �÷����� Number of Manager�� �����Ͽ� ����϶�.
select count(distinct mgr) as "Number of Manager"
from emp;
 
--34> �ְ� �޿��� ���� �޿��� ������ ����϶�.
select max(sal) - min(sal)
from emp;
 
--35> ������ ��ȣ �� �ش� �����ڿ� ���� ������� ���� �޿��� ����϶�. �ڡڡ�???
-- ��, �����ڰ� ���� ��� �� ���� �޿��� 1000 �̸��� �׷��� ���ܽ�Ű�� 
-- �޿��� �������� ��� ����� ������������ �����϶�.
select d.empno as "mgr", min(e.sal) as "����� �����޿�"
from emp e join emp d
on e.mgr = d.empno
group by d.empno
having min(e.sal) >= 1000
order by min(e.sal) desc; 

  
--36> �μ����� �μ��̸�, �μ���ġ, ��� �� �� ��� �޿��� ����϶�.
-- �׸��� ������ �÷����� �μ���,��ġ,����� ��,��ձ޿��� ǥ���϶�.
select e.deptno, d.dname, d.loc, count(e.empno), round(avg(e.sal),0)
from emp e join dept d
on e.deptno = d.deptno
group by e.deptno, d.dname, d.loc;

--37> Smith�� ������ �μ��� ���� ��� ����� �̸� �� �Ի����� ����϶�.
-- ��, Smith�� �����ϰ� ����Ͻÿ�
select ename, hiredate
from emp
where ename != 'SMITH' and 
        deptno = (select deptno
                from emp
                where ename='SMITH');

 
--38> �ڽ��� �޿��� ��� �޿����� ���� ��� ����� ��� ��ȣ, �̸�, �޿��� 
--    ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �޿��� �������� ����� ������������ �����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                from emp)
order by sal desc;
 
--39> �̸��� T�� ���� ����� ���� �μ����� �ٹ��ϴ� ��� ����� �����ȣ
-- �� �̸��� ����϶�.
select empno, ename
from emp
where deptno in (select deptno
                from emp
                where ename like '%T%');
 
--40> �μ���ġ�� Dallas�� ��� ����� �̸�,�μ���ȣ �� ������ ����϶�.
select e.ename, e.deptno, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';


--41> KING���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�.
select ename, sal
from emp
where mgr = (select empno
                from emp
                where ename ='KING');

--42> Sales �μ��� ��� ����� ���� �μ���ȣ, �̸� �� ������ ����϶�.
select e.deptno, e.ename, e.job
from emp e join dept d
on e.deptno = d.deptno
where d.dname = 'SALES';

 
--43> �ڽ��� �޿��� ��� �޿����� ���� �̸��� T�� ���� ����� ������
-- �μ��� �ٹ��ϴ� ��� ����� ��� ��ȣ, �̸� �� �޿��� ����϶�.
select empno, ename, sal
from emp e 
where sal > (select avg(sal)
            from emp)
            and deptno in (select deptno
                            from emp
                            where ename like '%T%');
 
--44> Ŀ�̼��� �޴� ����� �޿��� ��ġ�ϴ� ����� �̸�,�μ���ȣ,�޿��� �ڡڡ�
-- ����϶�.
select ename, deptno, sal
from emp
where sal in (select sal
                from emp
                where comm is not null);
 
select * from emp;
 
--45> Dallas���� �ٹ��ϴ� ����� ������ ��ġ�ϴ� ����� �̸�,�μ��̸�, �ڡڡ�(�ణ ����� ǰ)
--     �� �޿��� ����Ͻÿ�
select ename, job, deptno, sal
from emp 
where job in (select e.job
                from emp e join dept d
                on d.deptno = e.deptno
                where d.loc = 'DALLAS');

--46> Scott�� ������ �޿� �� Ŀ�̼��� �޴� ��� ����� �̸�, �Ի��� ��  //��
-- �޿��� ����Ͻÿ�
select e.ename, e.hiredate, e.sal
from emp e, (select sal, comm from emp where ename = 'SCOTT') d
where e.sal = d.sal; and e.comm = d.comm;

 
--47> ������ Clerk �� ����麸�� �� ���� �޿��� �޴� ����� �����ȣ,
-- �̸�, �޿��� ����ϵ�, ����� �޿��� ���� ������ �����϶�.
 select empno, ename, sal
 from emp
 where sal > (select max(sal)
                     from emp
                     where job = 'CLERK');
 
--48> �̸��� A�� ���� ����� ���� ������ ���� ����� �̸���
-- ����, �μ���ȣ�� ����϶�.
 select ename, sal, deptno
 from emp
 where job in (select job
                from emp
                where ename like '%A%');
 
--49> New  York ���� �ٹ��ϴ� ����� �޿� �� Ŀ�̼��� ���� ����� �ڡڡ�??
-- ����̸��� �μ����� ����϶�.
 select e.ename, s.dname
 from emp e, (select e.sal, e.comm, d.dname
                from emp e join dept d 
                on e.deptno = d.deptno
                where d.loc = 'NEW YORK') s
where e.sal = s.sal and e.comm = s.comm;
 
--50> Dallas���� �ٹ��ϴ� ����� ���� �� �����ڰ� ���� ����� �����ȣ,����̸�,
--    ����,����,�μ���,Ŀ�̼��� ����ϵ� Ŀ�̼��� å������ ���� ����� NoCommission
--    ���� ǥ���ϰ�, Ŀ�̼��� �÷����� Comm���� ������ ����Ͻÿ�.
--    ��, �ְ���޺��� ��µǰ� �Ͻÿ�






