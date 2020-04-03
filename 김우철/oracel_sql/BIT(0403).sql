--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
select ename, sal
from emp
where sal > (select sal
                from emp
                where ename='SMITH');
 
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.
select ename, sal, deptno
from emp
where sal in (select sal
                from emp
                where deptno=10);
 
--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
select ename, hiredate
from emp
where ename != 'BLAKE' and deptno in (select deptno
                from emp
                where ename='BLAKE');

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������ ** �ǹ����� �̷� ������ ���������� ����(����� ����� ��)
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
select empno, ename, sal
from emp
where sal > (select round(avg(sal),0)
                from emp)
order by sal desc;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
select empno, ename
from emp
where deptno in (select deptno
                from emp
                where ename like '%T%');

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
select ename, deptno, sal
from emp
where sal > all(select sal
                from emp
                where deptno = 30);

--�ι�° ���(�׳� �̰ž���, all�� �� �Ⱦ�)
select ename, deptno, sal
from emp
where sal > (select max(sal)
                from emp
                where deptno = 30);
 
--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.
select ename, deptno, job
from emp
where deptno in (select deptno
                from dept
                where loc = 'DALLAS');

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
select deptno, ename, job
from emp
where deptno in (select deptno
                from dept
                where dname = 'SALES');

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
select ename, sal
from emp
where mgr in (select empno
                from emp
                where ename = 'KING');
                
--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ���� ???????
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal)
                from emp) and deptno in (select deptno
                                        from emp
                                        where ename like '%S%');

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����(0�� Ŀ�̼��� ����) ???
-- �̸�, ����, �μ���ȣ�� ����϶�.
/*
select DISTINCT e.ename, e.sal, s.deptno
from emp e join (select deptno, sal from emp where comm is not null) s
on e.deptno = s.deptno
where e.deptno = s.deptno; 
���� Ǭ�� ����*/

select ename, sal, deptno
from emp
where deptno in (select deptno from emp where comm is not null)
and sal in (select sal from emp where comm is not null);

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����(0�� Ŀ�̼��� ����) ???
-- ������� �̸�, ����, Ŀ�̼��� ����϶�.
--30���μ���� ������ ���� �ʰ�, 30�� �μ���� Ŀ�̼��� ���� ����...
/*select e.ename, e.sal, e.comm
from emp e join (select sal, comm, deptno from emp where deptno = 30) s
on e.deptno = s.deptno
where e.sal != s.sal and e.comm != s.sal;
���� �Ѱ� ����*/
select ename, sal, comm
from emp
where sal not in(select sal from emp where deptno=30)
and comm not in(select nvl(comm,0) from emp where deptno=30 and comm is not null);

/*
join (�ϳ� �̻��� ���̺��� ������ �������� : ���� ���̺� : ����)
subquery
�ʱ� ������ �⺻ �Ҿ�....
*/
----------------------------
--[INSERT], [UPDATE], [DELETE] >> �ϱ�
/*
����Ŭ ����
DDL(������ ���Ǿ�) : create, alter, drop, truncate(�޸� �������� ����), rename, modify
DML(������ ���۾�) : insert, update, delete : 20%
DQL(������ ���Ǿ�) : select                 : 70%
DCL(������ �����) : ����(grant, revoke) ->�̰Ŵ� �����ڰ� ���� ����, DBA�� ��(������ : ����͸� : ��� ����)
TCL(Ʈ�����)     : commit, rollback, savepoint
������ : CRUD(create���ƴϰ� insert(������ ���忡�� ����), select, update, delete)
*/

--DML(Ʈ����� : �ϳ��� ������ �۾� ����) > LOCK �ڡڡڡ�(���� �߿�, ���������� ���� ����) ex)������û, �¶��� ���� �ý���
--A��� ���࿡�� �� ���� B��� ���࿡ �Ա�
--A : update ... 1000 > 500
--B : update ... 1000 > 1500
--�Ѵ� ���� : commit
--���߿� �ϳ��� ���� : rollback

select * from tab; --������ ����ڰ� ���� ��� ���̺��� �� �� ����
select * from tab where tname='BOARD'; --BOARD���̺��� ���������� Ȯ��

select * from col; --���� �÷�
select * from col where tname='EMP'; --emp��� ���̺��� �÷��� ����ʹ�, ������ DB ���� ���鶧 �̷����� ���� ��

select * from user_tables; --�����ڰ� ���ֺ�
select * from user_tables where table_name='DEPT';
--tab�� col������ �˾Ƶ� ����
-----------------------------------------------------------------
--pdf 10��, 168page

create table temp(
    id NUMBER primary key, --not null �ϰ� unique�� �����͸� �� �� �ִ�.
    name varchar2(20) --default null �� ���
);

/*
���� Ÿ��
char(20) >> 20byte >> �ѱ�10��, ������20�� >> �������� ���ڿ�
varchar2(20) >> 20byte >> �ѱ�10��, ������20�� >>�������� ���ڿ�

char(20)    >> 'ȫ�浿' >> 6byte >> [ȫ�浿    ] >> 20byte
varchar(20) >> 'ȫ�浿' >> 6byte >> [ȫ�浿] >> 6byte
ex)
�������� ������ : ��, ��
�������� ������ : �̸�...

���ɻ��� ���� : char() > varchar() �켱..
�׷�....�������� ������ char() .... ����, �ֹι�ȣ, �����ȣ

�ѱ۹���(unicode : 2byte) >> �ѱ�,������,Ư������,����

nchar(20) >> 20 >> ���ڼ� >> ��byte >> 2 * 20 >> 40byte
nvarchar(10) >> 10����

*/



--1.���� �Ϲ����� insert
insert into temp(id,name)
values(100,'ȫ�浿');

select * from temp;
--�ǹݿ�
commit;

--2.�÷� ��� ����(�ǵ��� ���� ���� / ������ ������)
insert into temp 
values(200,'������'); --�����Ͱ� �÷��� ����, ������ ��ġ�ؾ� �Ѵ�








