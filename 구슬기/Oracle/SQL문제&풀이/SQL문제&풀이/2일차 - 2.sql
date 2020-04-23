1. 직급이 부장 혹은 과장이면서 03월에 입사한 직원의 이름, 직급, 급여, 입사일을 조회하시오.
select name, title, salary, start_date
  from s_emp 
 where (title like '%부장' or title = '과장')
   and TO_CHAR(START_DATE, 'mm') = '03'
   
2. lower, upper, substr, || 연산자를 사용하여 각 사원의 메일아이디(mailid)의 첫글자는 대문자
   나머지는 소문자로 출력하시오
select upper(substr(mailid, 1, 1)) || lower(substr(mailid, 2)) 
  from s_emp; 
  
3. 이름의 길이가 2보다 큰 사람들의 이름을 출력하시오
select name 
  from s_emp
 where length(name) > 2;
 
4. 각 사원의 입사한 날부터 지금까지 받은 총급여와 이름을 출력하시오
select name, 
       trunc(months_between(sysdate, start_date)) * salary as 총급여
  from s_emp; 
  
5. 각사원의 이름과 커미션을 출력하시오
   단, 커미션이 없는 사원에 대하여 아래와 같은 형식으로 출력하시오
   박구곤    커미션없음
   최정선           10
select name, nvl(commission_pct || '', '커미션 없음')
  from s_emp; 
  
6. 각 사원의 원급을 출력하시오
   단, 직책이 사원이면 10% 인상, 과장이면 20% 인상 나머지는 5% 인상.
select name, 
       case when title = '사원' then salary * 1.1
            when title = '과장' then salary * 1.2
            else salary * 1.05
        end as 급여    
  from s_emp;  
   
7. 각사원의 월급을 * 로 표시하시오( * 하나가 100을 표시)
   예> 사원의 월급이 1000 이면 별이 10개 표시
      만약, 월급이 2350이면 23개 표시
      아래와 같이 출력
      박구곤 1200 ************
      손명성 350  ***  
select name, lpad('*', trunc(salary / 100), '*') 
  from s_emp;      