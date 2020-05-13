--������ ��� �޿��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���.
select job, avg(sal) as "��ձ޿�"
from emp
--where
group by job
having avg(sal) >= 3000;
--from -> where -> group by -> select ������ where���� avg(sal)�� ����� �� ����
--group by ������ >> having ��

/*
from ������ >> where(�־ �ǰ� ��� ��) 
group by ������ >> having
*/

/*
�ϳ��� ���̺��� ������� ���� �ִ� ��� ���� ...
select      5
from        1
where       2
group by    3
having      4
order by    6
*/

--Quiz, 0�� ������ �޴°ɷ�..
select * from emp;
/* 1�� ������̺��� ������ �޿����� ����ϵ� ������ ���� �ް� �޿��� ���� 5000 �̻��� 
    ������� ����� ����ϼ��� �޿��� ���� ���� ������ ����ϼ��� */
select job, sum(sal)
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sum(sal);
--���� select�� group by�� empno�� �߰��ϸ�
--job���� ���� ��� �������ִ� empno�� ���� �ٽ� ���� ������ �ᱹ ���྿ �˻��ϴ°�

/* 2�� ������̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ ,
 �ο��� , �޿��� ���� ����ϼ��� */
select deptno, sum(sal), count(deptno)
from emp
group by deptno
having count(deptno) > 4;

/* 3�� ������̺��� ������ �޿��� ���� 5000�� �ʰ��ϴ� ������ �޿��� ���� ����ϼ���
�� �Ǹ�����(salesman) �� �����ϰ� �޿������� �������� �����ϼ��� */
select job, sum(sal) 
from emp
where job not in('SALESMAN')
group by job
having sum(sal) > 5000
order by sum(sal) desc;

----------------------------------------------------------------
-- JOIN : pdf 6�� 85page 
-- ������ ������ ���̽�(RDBMS) >> ORDB(x) >> Framework(��ü����) ex)mybatis, JPA, Hiberate... >> NoSQL
-- NoSQL�� ��ü������ DB�� ���� ex) HBase,����DB, ī���� �� (��ü�� ����)
-- ������ ��� : �ּ� 3���� NoSQL �Ѱ� / Vue,react,Nodejs �� �Ѱ� 
/* �ٸ� ����� ex) ������ 6���Ͻ� 1~2���� �����ϰ� �κ������� ��������, �׸��� ������ 4���� �ϴ¹���� ������ Ǯ����(������ ������ �ϸ� ���� �� ����������)
   2�������� ������ ������ ģ������ ����, �̰� 3���� ���� ... 
   ������ ex) ������ �о�ٿ����� ���������� ������ �������� ������� ����(������ ������� ���ϴ� ������..)
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

--����
--1.�����(equl join)
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 ����
--JOIN ����
--1. SQL JOIN ����(��ǰ...)
--2. ANSI ����(����)(ǥ��)

--SQL JOIN ����(����, �㳪 �˱� �˾ƾߵ�)
select *
from m, s
where m.m1 = s.s1;

select m.m1, m.m2, s.s1, s.s2
from m, s
where m.m1 = s.s1;

--ANSI ����(����)
--where (from���� ������)
--where join ���ǰ� �Ϲ� ������ ȥ���ϸ� ȥ��...
--JOIN ���� �и� >> ON ��
select M.M1, M.M2, S.S2
from m inner join s --INNER ����
on m.m1 = s.s1;
--JOIN�� ����� select�� ���߿� �ϴ� ��

/*
1�� ���̺� vs 2�� ���̺�
��ȸ ���� : 1�� ���̺� ��
CUD ���� : 2�� ���̺� ��
*/

--�����ȣ, ����̸�, ����μ���ȣ, ��� �μ���

select EMP.EMPNO, EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
from emp JOIN dept
on emp.deptno = dept.deptno;
--������ �÷���� ���̺���� ���, �׷��� ����Ī�� ����
--join ���̺� ����Ī �ο� >> �� �̸����� ����
select E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
from emp e JOIN dept d
on e.deptno = d.deptno;

--JOIN (2, 3, 4...) ������ ���̺� ���� ����
--SQL ����
select m.m1, s.s1, x.x1
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;
-- A == B, B == C, A == C

--ANSI ����(���⿡ �ͼ�������) �̰žȵ� 
select *
from m JOIN s ON m.m1 = s.s1
       JOIN x ON s.s1 = x.x1;
--       JOIN y ON x.x1 = y.y1;



--[HR�� �̵�]
select * from employees;
select * from departments;
select * from locations;

--1.���, �̸�(last_name), �μ���ȣ, �μ��̸� ���
select *
from employees e JOIN departments d 
on e.department_id = d.department_id;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e JOIN departments d 
on e.department_id = d.department_id;
--106��
--107���ε� why >> 106��
select count(*) from employees; --107
--JOIN�� NULL �������� X
select * from employees where department_id is null;
--178�� ����� �μ�id >> NULL
--��������� �ذ�Ұ�(outer join) ��� ...�ذ�

--2.���, �̸�(last_name), �μ���ȣ, �μ���, �����ڵ�, ���ø��� ���

select e.employee_id, e.last_name, e.department_id, d.department_name, l.location_id, l.city 
from employees e join departments d
on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;
-------------------------------------------------------------------------------
--[BIT�� �̵�]
--2. �� ����(non-equi join) => �ǹ̸� ���� => ����ΰ� ������ ����
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� 1:1 ���ε��� �ʴ� ���
select * from emp;
select * from salgrade;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e JOIN  departments d
on e.department_id = d.department_id;
--1:1������ �����ʴ´ٴ� �� ����� ���������� ��� ����
--�����δ� ���� �Ⱦ��°� ���� / ���� ����� ���̺��赵 ���� ����

---------------------------------------------------------------

--3. outer join(equi join + null)
--outer join(�� ������ �ľ�) >> �ְ� �Ǵ� ���̺� �ִ� ���� ������ ��������
--���������� 3������ ����
--left outer join(���� ����)
--right outer join(������ ����)
--full outer join(���� ���� + ������ ���� >> union)

select * 
from m JOIN s
on m.m1 = s.s1;

--outer�� ���� ����
select *
from m left outer join s
on m.m1 = s.s1;
--������ ������ �ִ� ���� ����� ����

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;
-----------------------------------------
--[HR ����]

select *
from employees;

select e.employee_id, e.last_name, e.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;
--178�� ����� �μ�id >> NULL ��µǰ�..
select * from employees where deparement_id is null;
--------------------------------------------------
--self join(�ڱ�����) -> �ǹ� -> ����(�����)
--�ϳ��� ���̺��� Ư�� �÷��� �ٸ� �÷��� �����ϴ� ���
--����(���̺� 1�� �̻�)
--���̺��� ����Ī �޸��ؼ� ������ ���̺� ó��
select e.empno, e.ename, m.empno, m.ename
from emp e join emp m
on e.mgr = m.empno;
--���� : 14�� >> 13��

--king�� ���
select e.empno, e.ename, m.empno, m.ename
from emp e left join emp m
on e.mgr = m.empno;

--JOIN TEST
-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
 select e.ename, e.deptno, d.dname
 from emp e join dept d
 on e.deptno = d.deptno;
 
-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.ename like '%A%'; 

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
select e.ename, e.sal, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.sal >= 3000; 
 
-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
select e.job, e.ename, d.dname
from emp e join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select e.empno as "�����ȣ", e.ename as "�̸�", e.sal*12 as "����", e.sal*12+comm as "�Ǳ޿�", s.grade as "�޿����"
from emp e inner join salgrade s on e.sal between s.losal and s.hisal
where e.comm is not null;

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
on e.deptno = d.deptno
join salgrade s on e.sal between s.losal and s.hisal
where e.deptno = 10;
 
-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
select e.deptno, d.dname, e.ename, e.sal, s.grade
from emp e join dept d
on e.deptno = d.deptno
join salgrade s on e.sal between s.losal and s.hisal
where e.deptno in(10,20)
order by e.deptno, e.sal desc;
 
-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
select e.empno as "�����ȣ", e.ename as "����̸�", m.empno as "�����ڹ�ȣ", m.ename as "�������̸�"
from emp e left join emp m
on e.mgr = m.empno;
------------------------------------------------------
--�ʺ� �����ڴ� JOIN���� �� ����
--��������(pdf 100page) ���� ������ query / sql�� �� / sql�� ���� �ذ��
--�Լ� >> ���� >> subquery : �Լ����ȵ� ���ε��ȵǸ� �����������

--������̺��� ������� ��� ���޺��� �� ���� �޿��� �޴� �����
--���, �̸�, �޿��� ����ϼ���.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                    from emp);
            
select sal from emp;

--subquery
/*
1.single row subquery : subquery ��� row 1��(�����÷� ���ϰ�)
2.multi row subquery : ��� row 1�� �̻�(�����÷��� �������� ��)
�����ϴ� ������ : ���Ǵ� ������....
multi row : IN, NOT IN (ANY, ALL)
ALL(and) : sal > 1000 and sal > 2000 and sal ...
ANY(or) : sal > 1000 or sal > 2000 or sal ...

����(subquery)
1. ��ȣ�ȿ� �־�� �Ѵ�>> (select sal from emp)
2. ���� �÷����� ���� >> (select sal, deptno from emp) (x)
3. �ܵ����� ���� ����

�������
1. ������ subquery ���� ����
2. subquery�� ������� ������ main query ����
*/
--������̺��� jones �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿�
--����ϼ���.

select sal from emp where ename = 'JONES';

select * 
from emp 
where sal > (select sal from emp where ename = 'JONES');

--subquery �޿��� 2000 �̻�
select * 
from emp 
--where sal > (select sal from emp where sal > 2000);
where sal in (select sal from emp where sal > 2000); --��Ƽ row�϶��� in�� ����
--"single-row subquery returns more than one row"

select * 
from emp 
--where sal > (select sal from emp where sal > 2000);
where sal not in (select sal from emp where sal > 2000); 
--NOT IN (������ and)
--2975 2850 2450 3000 5000 3000
--where sal != 2975 and sal != 2850 and ...

--���������� �ִ� ����� ����� �̸��� ����ϼ���.
select * from emp;

select empno, ename
from emp
where empno in (select mgr from emp);

--���������� ���� ����� ����� �̸��� ����ϼ���.
select * from emp;

select empno, ename
from emp
where empno not in (select mgr from emp);
--empno != 7902 and empno !=7788 and empno != null
--and�� �ϳ��� null�̸� ����� null

--����1
select empno, ename
from emp
where empno not in (select nvl(mgr,0) from emp);

select empno, ename
from emp
where empno not in (select mgr from emp where mgr is not null);

--king���� �����ϴ� ��, ���ӻ���� king�� ����� ���, �̸�, ����, ������ ����� ����ϼ���
select * from emp;

select empno, ename, job, mgr
from emp
where mgr in (select empno
                from emp
                where ename ='KING');

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� 
--���, �̸�, �޿�, �μ���ȣ�� ����ϼ���.
select * from emp;

select empno, ename, sal, deptno
from emp
where sal > (select max(sal)
                from emp
                where deptno = 20);

--POINT
--subquery >> select ����
--         >> from
--         >> where

select *
from emp 
where deptno in (select deptno from emp where job='SALESMAN')
      and sal in (select sal from emp where job='SALESMAN');
          
--QUIZ
--�ǹ����� Ȱ��(�̷� ����� ���� ���� ���� ����)
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴�
--����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���
select * from emp;
--1�ܰ� ��Ʈ : �μ���ȣ�� �μ��� ��տ����� ��� �ִ� ���̺��� �����Ѵٸ�..
--2�ܰ� ��Ʈ : from���� ���������� �� �� �ִ�.
--3�ܰ� ��Ʈ : emp e join
select e.empno, e.ename, e.deptno, e.sal, s.avgsal
from emp e join (select deptno, round(avg(sal),0) as avgsal from emp group by deptno) s
on e.deptno = s.deptno
where e.sal > s.avgsal
order by ename;
--group by empno, ename, deptno;


--QUIZ
--�ǹ����� Ȱ��(�̷� ����� ���� ���� ���� ����)
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴�
--����� ���, �̸�, �μ���ȣ, �μ��� ��� ������ ����ϼ���
select e.empno, e.ename, e.deptno, e.sal, avg(sal)
from emp e
where e.sal > (select round(avg(sal),0) from emp s where e.deptno = s.deptno)
group by e.empno, e.ename, e.deptno, e.sal
order by ename;






