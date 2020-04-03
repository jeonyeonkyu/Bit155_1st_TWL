/*

CREATE TABLE s_emp(
 id             NUMBER(7) primary key,
 name           VARCHAR2(25),
 mailid         VARCHAR2(8),
 start_date     DATE,
 manager_id     NUMBER(7),
 title          VARCHAR2(25),
 dept_id        NUMBER(7),
 salary         NUMBER(11, 2),
 commission_pct NUMBER(4, 2)
);

INSERT INTO s_emp VALUES (
  1, '�ڱ���', 'sky98',
   to_date('03-05-1990','dd-mm-yyyy'), NULL, '����',
   118, 5000, NULL);
INSERT INTO s_emp VALUES (
   2, '�ո�', '2xxsig',
   to_date('08-05-1990','dd-mm-yyyy'), 1, '��ȹ����',
   110, 3000, NULL);
INSERT INTO s_emp VALUES (
   3, '������', 'ch21175',
   to_date('17-06-1991','dd-mm-yyyy'), 1, '��������',
   102, 3500, NULL);
INSERT INTO s_emp VALUES (
   4, '����ȫ', 'mquickto',
   to_date('07-04-1990','dd-mm-yyyy'), 1, '�ѹ�����',
   101, 3000, NULL);
INSERT INTO s_emp VALUES (
   5, '��ɼ�', 'aropebur',
   to_date('04-05-1990','dd-mm-yyyy'), 1, '�λ����',
   118, 3200, NULL);
INSERT INTO s_emp VALUES (
   6, '������', 'murguhar',
   to_date('18-01-1991','dd-mm-yyyy'), 2, '����',
   110, 2400, NULL);
INSERT INTO s_emp VALUES (
   7, '������', 'enchu',
   to_date('14-05-1990','dd-mm-yyyy'), 2, '����',
   111, 2400, NULL);
INSERT INTO s_emp VALUES (
   8, '�ű��', 'bbiri',
   to_date('07-04-1990','dd-mm-yyyy'), 2, '����',
   112, 2100, NULL);
INSERT INTO s_emp VALUES (
   9, '�̻���', 'acatchpo',
   to_date('09-02-1992','dd-mm-yyyy'), 2, '����',
   113, 2300, NULL);
INSERT INTO s_emp VALUES (
   10, '�ּ�ö', 'mhavel',
   to_date('27-02-1991','dd-mm-yyyy'), 2, '����',
   113, 2300, NULL);
INSERT INTO s_emp VALUES (
   11, '������', 'cmagee',
   to_date('14-05-1990','dd-mm-yyyy'), 3, '������ǥ�̻�',
   102, 2450, 10);
INSERT INTO s_emp VALUES (
   12, '������', 'hgiljum',
   to_date('18-01-1992','dd-mm-yyyy'), 3, '������ǥ�̻�',
   103, 2500, 12.5);
INSERT INTO s_emp VALUES (
   13, '�輮��', 'ysedeghi',
   to_date('18-02-1991','dd-mm-yyyy'), 3, '������ǥ�̻�',
   104, 2650, 10);
INSERT INTO s_emp VALUES (
   14, '�ڼ���', 'mnguyen',
   to_date('22-01-1992','dd-mm-yyyy'), 3, '������ǥ�̻�',
   105, 2650, 15);
INSERT INTO s_emp VALUES (
   15, '������', 'adumas',
   to_date('09-10-1991','dd-mm-yyyy'), 3, '������ǥ�̻�',
   106, 2400, 17.5);
INSERT INTO s_emp VALUES (
   16, '�̱�ö', 'emaduro',
   to_date('07-02-1992','dd-mm-yyyy'), 6, '���',
   110, 2400, NULL);
INSERT INTO s_emp VALUES (
   17, '������', 'gsmith',
   to_date('08-05-1990','dd-mm-yyyy'), 6, '���',
   110, 940, NULL);
INSERT INTO s_emp VALUES (
   18, '������', 'anozaki',
   to_date('09-02-1991','dd-mm-yyyy'), 7, '���',
   111, 1200, NULL);
INSERT INTO s_emp VALUES (
   19, '��âȯ', 'vpatel',
   to_date('06-08-1991','dd-mm-yyyy'), 7, '���',
   111, 795, NULL);
INSERT INTO s_emp VALUES (
   20, '������', 'cnewman',
   to_date('21-07-1991','dd-mm-yyyy'), 8, '���',
   112, 750, NULL);
INSERT INTO s_emp VALUES (
   21, '����ö','amarkari',
   to_date('26-05-1991','dd-mm-yyyy'), 8, '���',
   112, 850, NULL);
INSERT INTO s_emp VALUES (
   22, '������', 'echang',
   to_date('30-11-1990','dd-mm-yyyy'), 9, '���',
   113, 800, NULL);
INSERT INTO s_emp VALUES (
   23, '������', 'rpatel',
   to_date('17-10-1990','dd-mm-yyyy'), 9, '���',
   106, 795, NULL);
INSERT INTO s_emp VALUES (
   24, '������', 'bdancs',
   to_date('17-05-1991','dd-mm-yyyy'), 10, '���',
   113, 860, NULL);
INSERT INTO s_emp VALUES (
   25, '�̿�ȣ', 'sschwart',
   to_date('09-05-1991','dd-mm-yyyy'), 10, '���',
   113, 1100, NULL);
COMMIT;

1. 112, 118�μ��� ������� ����� ����� �̸�, ����, �޿�, �μ�ID�� ��ȸ�ϵ�, �޿��� 1500 �̻� 4000 ������ ������ 
   ��µǵ��� �Ͻÿ�. 
   ��, �޿��� ���� ������� ȭ�鿡 ����մϴ�.
*/

select * from s_emp;

select salary , name, title , dept_id
from s_emp
where dept_id in(112,118) and salary >= 1500 and salary <=4000
order by salary desc;

--2. �����ڰ� ���� ������ �̸�, ����, �޿��� ��ȸ�Ͻÿ�.

select name, title, salary 
from s_emp
where manager_id is null;

--3. ������ �����̾�� �ϰ� �޿��� 3000 �̻��� �޴� ������ �̸�, ����, �޿��� ��ȸ�Ͻÿ�.
select name ,title, salary
from s_emp
where salary >= 3000 and title like'%����';

--4. ������ ����� ������ ������� ������� �̸�, ����, �޿��� ��ȸ�Ͻÿ�. 
--   ��, �μ��� 112, 113, 117, 118 �μ��߿��� ��ȸ�ؾ� �ϸ�, 
--�޿��� 2300 �̻� 3000 ������ ������ ��ȸ�ǵ��� �Ͻÿ�. 

select * from s_emp;      



select name, title, salary 
from s_emp
where dept_id in(112,113,117,118)
          and salary between 2300 and 3000 and title like '%����' or title like '%����';

--5. ������ ������ 1000 �� ���� ���� ��ȸ�Ͻÿ�. ������ �޿��� 12�� ���ϸ� �ȴ�. 
--��, ������ ALIAS�� �����Ͽ� ��µǵ��� �Ѵ�. 

select salary*12 + 1000 as "����"
from s_emp;

--7. ��°���� ������ ������ ��ȸ�Ͻÿ�. 
--	���� �޿� 
--	--------------------------------- 
--	�ڱ��� ������ �޿� 5000 
--	�ո� ��ȹ������ �޿� 3000 
--	������ ���������� �޿� 3500 
--	����ȫ �ѹ������� �޿� 3000 
--	��ɼ� �λ������ �޿� 3200 
--	... 
--	..
select name || ' '|| title || '�� �޿� ' || salary as "���� �޿�"
from s_emp;



--8. Ŀ�̼��� �޴� ������ �����ڰ� �ִ� ������ ������� �޿��� 2500�̻� �޴� ������ ��ȸ�Ͻÿ�. 
select * from s_emp;
select name
from s_emp
where commission_pct is not null and manager_id is not null and salary >= 2500;
   
   
   
--9. �� �μ��� ������ �ּڰ� ���ϱ�

select dept_id,min(salary) 
from s_emp
group by dept_id;


--10. ��å�� �ּ� ������ ���ϴµ� ����(��ȹ, ����, �ѹ�, �λ�)�� �����ϰ� ���Ͻÿ�

select title, min(salary)
from s_emp
where title != '��ȹ����' and  title != '��������' and title != '�ѹ�����' and title != '�λ����'
group by title;

--11. ��å�� ��� ���� ���ϱ�

select title,  round(avg(salary)) 
from s_emp
group by title;

--12. ��å�� �ο��� ���ϱ�
select title,  count(salary)
from s_emp
group by title;


--13. ��å�� �ִ� ������ ���ϴµ� �� �ִ� ������ 2000 �̻��� �͸� ����Ͻÿ�    ??

select title, max(salary)
from s_emp
group by title
having sum(salary) >= 2000;


--14. ��å�� �ּ� ������ ���ϴµ� ����(��ȹ, ����, �ѹ�, �λ�)�� �����ϰ� ������ ���� ������� ����Ͻÿ�

select title, min(salary)
from s_emp
where title not in('��ȹ����',   '��������', '�ѹ�����' , '�λ����')
group by title
order by min(salary) desc ;


--15. ��å�� ��� ������ ���ϴµ� ����� �����ϰ� ������ ���� ������� ����Ͻÿ�

select title,  round(avg(salary)) 
from s_emp
where title != '���' 
group by title
order by round(avg(salary)) ;


--16. ��å�� �޿��� ���� ����ϴµ� ����� �����ϰ� �� �� �޿��� ���� 2000 �̻��� �͸� ������ �ϰ� ��å�� �޿��� ���� ���� ������ ����Ͻÿ�

select title, sum(salary) 
from s_emp
where title != '���' 
group by title
having sum(salary) >= 2000
order by sum(salary) desc ;

