select * from reply;
commit;
desc reply;
select * from reply where idx_fk=13 order by no desc;

insert into reply values(16, 'ss', 'empty', 'ss', 'ss', sysdate, 13);
commit;
select * from reply;

update reply set content = 'wwwww' where no = 1 and idx_fk = 13;

delete from reply where no = 1;
rollback;

select to_char(writedate, 'yyyy-MM-dd') as cDate from reply where idx_fk=13;

select * from reply where idx_fk=13 order by no desc;

INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno) VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno)
values (7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP(empno, ename, job, mgr, hiredate, sal ,comm, deptno)
values (7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);


commit;
desc emp;
select * from emp;
delete from emp;
ALTER TABLE emp MODIFY (filename DEFAULT 'emp.jpg');

select data_default from filename;

