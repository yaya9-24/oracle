-- hr계정의 모든 테이블의 컬럼정보 검색(출력)
select * from tab;

-- *(모든컬럼) : 부서테이블의 모든 정보검색
select * from departments;

-- 부서테이블의 모든 정보검색-부서명만
select department_name from departments;

-- 부서테이블의 모든 정보검색-부서번호,부서명
select department_id,department_name from departments;

-- 테이블 정보얻기
desc employees;

-- 사원테이블에서 업무코드 출력하기(중복배제)
select distinct JOB_ID from employees;

select EMPLOYEE_ID,SALARY from employees;

select EMPLOYEE_ID,SALARY from employees order by SALARY;

select EMPLOYEE_ID,SALARY from employees order by SALARY asc;

select EMPLOYEE_ID,SALARY from employees order by SALARY desc;

select JOB_ID,SALARY from employees order by JOB_ID,salary;

select JOB_ID,SALARY from employees order by JOB_ID,salary;

select JOB_ID,SALARY from employees order by JOB_ID asc,salary asc;

select JOB_ID,SALARY from employees order by JOB_ID,salary desc;

-- 사원테이블에서 업무코드와 급여 출력(업무코드와 급여는 역정렬)
select JOB_ID,SALARY 
from employees 
order by JOB_ID desc,salary desc;

-- 사원테이블에서 직업 ,봉급을 출력 (as는 생략이 되었다.)
select job_id "직업",salary "봉급" from employees;
select job_id "직업",salary "봉급 \천원" from employees;

-- 사원테이블에서 사원번호,부서번호를 출력, 대신 부서번호가 10인 것만
select employee_id,department_id from employees where department_id=10;

-- 사원테이블에서 봉급,사원번호를 출력, 대신 사원번호가 30인것만
select salary, employee_id from employees where employee_id=30;

-- 사원테이블에서 봉급,사원번호를 출력, 대신 사원번호가 30인 것만 출력하고 봉급은 내림차순
select salary, employee_id from employees where employee_id=30 order by salary desc;

-- 사원테이블에서 업무코드,성을 출력, 대신 업무코드가 'IT_PROG' 것만 출력하기
select job_id,first_name from employees where job_id='IT_PROG';

select employee_id,first_name,hire_date from employees where hire_date='07/12/07';


-- 사원테이블에서 사원이름, 봉급 *1.1
select first_name, salary*1.1 from employees where department_id=10;

SELECT ename, sal FROM employees WHERE sal=950;
SELECT ename, sal FROM employees WHERE sal>=3000;
SELECT ename, sal FROM employees WHERE sal<3000;
SELECT deptno, sal FROM employees WHERE deptno!=30;

SELECT deptno, ename, sal FROM employees 
WHERE deptno=20 AND sal>=3000;

SELECT job, deptno FROM employees
WHERE job='SALESMAN' AND deptno=30; 

SELECT ename, sal FROM employees
WHERE sal<1000 OR sal>=4000; 

SELECT ename, sal FROM employees
WHERE NOT (sal<1000 OR sal>=4000); 

SELECT deptno, ename, sal FROM employees
WHERE NOT deptno=30;


-- UNION은 중복제거
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY>=20000 OR SALARY <=2100
UNION
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY<=2200;

-- UNION ALL
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY>=20000 OR SALARY <=2100
UNION ALL
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY<=2200;

-- INTERSECT
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY>=20000 OR SALARY <=2100
INTERSECT
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY<=2200;

-- MINUS
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY>=20000 OR SALARY <=2100
MINUS
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY<=2200;

SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY<=2200
MINUS
SELECT EMPLOYEE_ID,SALARY FROM EMPLOYEES 
WHERE SALARY>=20000 OR SALARY <=2100;

-- in은 10,20,100인 걸 모두 출력한다.
select department_id, salary from employees
where department_id in (10,20,100);

-- ANY는 ()안의 값8000,20000보다 이상이냐 이하냐
select department_id, salary from employees
where salary >= ANY(8000,12000,20000);

select job_id, first_name, salary from employees
where salary >=10000 and salary <=12000;

-- between은 and랑 세트다.
select job_id, first_name, salary from employees
where salary between 10000 and 12000;

-- 문자도 between 사용가능
SELECT last_name FROM employees WHERE last_name 
BETWEEN 'Chen' AND 'Dilly' ORDER BY last_name;

SELECT last_name FROM employees
WHERE NOT last_name = 'Dilly' ORDER BY last_name;

-- Like ''
select last_name from employees
where last_name LIKE 't%';

-- 중간에 y가 있으면 다 출력
select last_name from employees
where last_name LIKE '%y%';

-- __e는 앞에 두글자 이후 세번째에 e가 와야한다.
select last_name from employees
where last_name LIKE '__e%';

select last_name from employees
where last_name LIKE '%es';

select last_name from employees
where last_name LIKE '%Di%';

select last_name, commission_pct from employees
where commission_pct is null;

-- commission_pct이 null이 아닌 것만 출력
select last_name, commission_pct from employees
where commission_pct is not null;

-- 결합연산자
SELECT first_name||''||last_name ||'의 연봉['|| SALARY ||']'
FROM employees ;

-- 연산자 우선순위: ()안의 비교연산자 먼저하고 and하고 not
SELECT EMPLOYEE_ID FROM employees
WHERE NOT (SALARY > 1000 AND SALARY < 12000); 

-- >1000하고 not하고 and
SELECT EMPLOYEE_ID FROM employees
WHERE NOT SALARY > 1000 AND SALARY < 12000;

select chr(65) from dual;
select chr(65), employee_id from employees;

select 25*25 from dual;

select concat(first_name,'is a'), job_id from employees;
select INITCAP('the lion') from dual;
select LOWER('MY NAME IS KHS')
  FROM DUAL;

select upper('the lion') from dual;
select lpad('yangsem',13,'*#')from dual;
select lpad('\200,000',13,' ') from dual;
select rpad('yangssem',13,'@') from dual;

select ltrim('aa123456aa','aa') from dual;
select rtrim('aa123456aa','aa') from dual;

select replace('yang and sam','sa','sse') from dual;

select first_name from employees where substr(first_name,2,1) = 'i';

select instr('CORPORATE FLOOR','OR',1,2) from dual;

select length('yangssem') from dual;

select greatest(12,132,34) from dual;

select least(12,3,35) from dual;

select commission_pct from employees;
select nvl(commission_pct,0),nvl(commission_pct,0.1)*salary, salary from employees;
select nvl(commission_pct,0),nvl2(commission_pct,0.1,2)*salary, salary from employees;

-- 시험에 자주 나옴 decode
select last_name,job_id,salary,
    decode(job_id,'IT_PROG',salary*1.1) AS "실수령액"
from employees;

select last_name,job_id,salary,
    decode(job_id,'IT_PROG',salary*1.1, salary) AS "실수령액"
from employees;

select last_name,job_id,salary,
    decode(job_id, 'IT_PROG', salary*1.1,
                    'AD_PRES',salary*1.2,
                    'AD_VP',salary*1.3, salary) as "실수령액"
from employees;

-- case ~then 시험에 자주 나옴
select last_name,job_id,salary,
    case job_id when 'IT_PROG' then salary*1.1
                when 'AD_PRES' then salary*1.2
                when 'AD_VP' then salary*1.3
    else salary
    end as "실수령액"
from employees;

-- sysdate 현재 날짜를 알려준다.
select sysdate from dual;

-- to_char
select sysdate, to_char(sysdate,'D') from dual; -- 4
select sysdate, to_char(sysdate,'DAY') from dual; -- 수요일
select sysdate, to_char(sysdate,'DY') from dual; -- 수
select sysdate, to_char(sysdate,'dd') from dual;
select sysdate, to_char(sysdate,'mm') from dual;
select sysdate, to_char(sysdate,'month') from dual;
select sysdate, to_char(sysdate,'yy') from dual;
select sysdate, to_char(sysdate,'yyyy') from dual;
select hire_date,to_char(hire_date,'yyyy') from employees;
select sysdate, to_char(sysdate,'hh') from dual;
select sysdate, to_char(sysdate,'hh24') from dual;
select sysdate, to_char(sysdate,'mi') from dual;
select sysdate, to_char(sysdate,'am hh:mi:ss') from dual;
select sysdate, to_char(sysdate,'yyyy-mm-dd day am hh:mi:ss') from dual;

-- to_number
select to_number('100'+1) from dual; -- 101
select to_number('3.14') from dual; -- 3.14

-- 날짜 변환 함수 to_date
select to_date(sysdate,'yy/mm/dd') from dual;
select to_date('13-03-20','dd/mm/yy') from dual;

-- 시스템 함수
select user from dual;

-- abs
select abs(-30) from dual;

-- mod: 나머지를 구한다.
select MOD(11,4) from dual;

-- power()거듭제곱
select power(2,7) from dual;
select power(2,10) from dual;

-- trunc : 버리기
select trunc(99.123456,3) from dual; -- 99.123

-- 복수행 함수 *****
-- count
select count(first_name) from employees;
select count(employee_id) from employees;
select count(*) from employees;
select count(commission_pct) from employees;

-- sum
select sum(salary) from employees where job_id = 'PU_CLERK';
select sum(commission_pct) from employees;

-- avg
select avg(commission_pct) from employees;
select avg(nvl(commission_pct,0)) from employees;

-- max, min
select max(salary) from employees;
select min(salary) from employees;

-- group by , having *****
select avg(salary) "연봉의 평균", department_id from employees
group by department_id;

select round(avg(salary)) "연봉의 평균", department_id from employees
group by department_id;

select round(avg(salary)) "연봉의 평균", department_id from employees
group by department_id
having department_id is not null;

-- Q1:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을 출력하라.
select round(avg(salary)),department_id from employees
where salary >=8000
group by department_id;

-- Q2:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을 
-- 부서번호의 내림차순으로 정렬하라
select round(avg(salary)),department_id from employees
where salary >=8000
group by department_id
order by department_id desc;

-- Q3:연봉 8000이상인 사원들의 부서별 평균연봉의 반올림값을
-- 평균연봉의 반올림값으로 오름차순 정렬하라
select round(avg(salary)) "평균연봉",department_id from employees
where salary >= 8000
group by department_id
order by "평균연봉" asc;

-- Q4:연봉 10000이상인 사원들의 부서별 평균연봉의 반올림값을
-- 부서번호로 오름차순 정렬하라
select department_id, round(avg(salary)) as "평균연봉" from employees
where salary >=10000
group by department_id
order by department_id asc;

-- Q5:각 부서별 같은 업무를 하는 사람의 인원수를 구하여 
-- 부서번호,업무명,인원수를 출력하라.
-- (단, 부서번호와 업무명으로 각각 내림차순 정렬!)
select department_id,job_id,count(*) as "인원수"
from employees
group by department_id, job_id
order by department_id desc, job_id desc;

-- Q6:사원 테이블에서 연봉과 사원ID를 출력하되
-- 연봉이 12000인 사원은 고액연봉자라고 출력하라.
select salary, employee_id,decode(salary,12000,'고액연봉자') as "고액연봉자"
from employees;

-- Q7:사원 테이블에서 연봉과 사원ID를 출력하되
-- 연봉이 12000이상인 사원은 비고에 고액연봉자라고 
-- 출력하라.  (단, 최고연봉액은 24000이다.)
select salary, employee_id, case when salary between 12000 and 24000 then '고액연봉자'end as "비고" 
from employees;

-- Q8:사원 테이블에서 연봉과 사원ID를 출력하되 
-- 연봉이 20000이상인 사원은 1급연봉자,
-- 연봉이 15000 에서 19000 이하인 사원은 2급연봉자, 
-- 연봉이 기타연봉인 사원은 3급연봉자 라고 출력하라. 
-- (단, 최고연봉액은 24000이다.)
select salary, employee_id,
case when salary between 20000 and 24000 then '1급연봉자'
     when salary between 15000 and 19000 then '2급연봉자'
     else '3급연봉자'
     end as "비고"
from employees;