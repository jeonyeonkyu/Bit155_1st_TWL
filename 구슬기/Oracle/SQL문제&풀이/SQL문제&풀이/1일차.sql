1. 112, 118부서를 대상으로 과장과 사원의 이름, 직급, 급여, 부서ID를 조회하되, 급여는 1500 이상 4000 이하인 직원만 
   출력되도록 하시오. 
   단, 급여가 많은 사람부터 화면에 출력합니다.
select name, title, salary, dept_id
  from s_emp 
 where title in ('과장', '사원')
   and dept_id in (112, 118)
   and salary between 1500 and 4000;

2. 관리자가 없는 직원의 이름, 직급, 급여를 조회하시오. 
select name, title, salary
  from s_emp 
 where manager_id is null;

3. 직급이 부장이어야 하고 급여는 3000 이상을 받는 직원의 이름, 직급, 급여를 조회하시오. 
select name, title, salary
  from s_emp 
 where title like '%부장'
   and salary >= 3000;

4. 직급이 부장과 과장인 사람들을 대상을 이름, 직급, 급여를 조회하시오. 
   단, 부서는 112, 113, 117, 118 부서중에서 조회해야 하며, 
   급여는 2300 이상 3000 사이인 직원만 조회되도록 하시오. 
select name, title, salary, dept_id
  from s_emp 
 where (title like '%부장' or title = '과장')
   and dept_id in (112, 113, 117, 118)
   and salary between 2300 and 3000;


5. 직원의 연봉에 1000 을 더한 값을 조회하시오. 연봉은 급여에 16을 곱하면 된다. 
   단, 연봉은 ALIAS를 지정하여 출력되도록 한다. 
select name, (salary*16) + 1000 "직원연봉"
  from s_emp;

7. 출력결과가 다음과 같도록 조회하시오. 
	직원 급여 
	--------------------------------- 
	박구곤 사장의 급여 5000 
	손명성 기획부장의 급여 3000 
	이은선 영업부장의 급여 3500 
	서의홍 총무부장의 급여 3000 
	김심선 인사부장의 급여 3200 
	... 
	...
select name||' '||title||'의 급여 '||salary "직원 급여"
  from s_emp;

8. 커미션을 받는 직원과 관리자가 있는 직원을 대상으로 급여를 2500이상 받는 직원만 조회하시오. 
select name, salary, commission_pct, manager_id
  from s_emp 
 where (commission_pct is not null or manager_id is not null)
   and salary >= 2500;
   
9. 각 부서별 월급의 최솟값 구하기
select dept_id, min(salary)
  from s_emp
 group by dept_id;

10. 직책별 최소 월급을 구하는데 부장(기획, 영업, 총무, 인사)은 제외하고 구하시오
select title, min(salary)
  from s_emp 
 where title not like '%부장' 
 group by title;

11. 직책별 평균 월급 구하기
select title, avg(salary)
  from s_emp  
 group by title;

12. 직책별 인원수 구하기
select title, count(*)
  from s_emp  
 group by title;

13. 직책별 최대 월급을 구하는데 그 최대 월급이 2000 이상인 것만 출력하시오
select title, max(salary)
  from s_emp  
 group by title
having max(salary) >= 2000;

14. 직책별 최소 월급을 구하는데 부장(기획, 영업, 총무, 인사)은 제외하고 월급이 높은 사람부터 출력하시오
select title, min(salary) as min_sal
  from s_emp 
 where title not like '%부장' 
 group by title
 order by min_sal desc;

15. 직책별 평균 월급을 구하는데 사원은 제외하고 월급이 낮은 사람부터 출력하시오
select title, avg(salary) as avg_sal
  from s_emp 
 where title != '사원' 
 group by title
 order by avg_sal;

16. 직책별 급여의 합을 출력하는데 사원은 제외하고 또 그 급여의 합이 2000 이상인 것만 나오게 하고 직책별 급여의 합이 높은 순으로 출력하시오
select title, sum(salary) as sum_sal
  from s_emp 
 where title != '사원' 
 group by title
having sum(salary) >= 2000 
 order by sum_sal desc;