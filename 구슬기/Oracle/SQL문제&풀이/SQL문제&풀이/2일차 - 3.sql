1. 

select rpad( department_name, 10, substr('1234567890', length(department_name) + 1) )
  from departments
 where length(department_name) < 10;


문제 2.

select dept_id, 
       sum(decode(title, '사원', salary, 0)) as 사원,
       sum(decode(title, '과장', salary, 0)) as 과장,
       sum(decode(title, '사원', 0, '과장', 0, salary)) as 기타,
       sum(salary) as 부서합계
  from s_emp
 group by dept_id
 order by dept_id;


문제 3. 

select id, 
       max(type1) type1,
       max(type2) type2,
       max(type3) type3 
  from testdb
 group by id;


문제. 4

select rownum, 
       ceil(rownum / 3),
       employee_id, first_name
  from employees


문제. 5

select *
  from (  
select ceil(rownum / 2) 순번
       ,max(decode(mod(rownum, 2), 1, employee_id, null)) 사원번호1
       ,max(decode(mod(rownum, 2), 1, first_name, null)) 사원명1
       ,max(decode(mod(rownum, 2), 0, employee_id, null)) 사원번호2
       ,max(decode(mod(rownum, 2), 0, first_name, null)) 사원명2                           
  from employees
 group by ceil(rownum /2) )
 order by 순번;