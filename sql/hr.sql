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

select employee_id,department_name
from employees,departments;
-- 공통컬럼을 명시하지 않으면,count = 2889, 크로스 조인

-- EQUI JOIN, 등가조인

select employees.employee_id "사원번호",
        departments.department_name "부서명"
from employees, departments
where employees.department_id = departments.department_id;

-- 사원테이블과 부서테이블을 조인해서 사원ID가 100인 사람의 사원ID와 근무 
-- 지ID를 출력해라.
select employees.employee_id "사원번호",
        departments.location_id "근무ID"
from employees, departments
where employees.department_id = departments.department_id 
and employees.employee_id=100;

-- 사원테이블과 부서테이블을 조인해서 사원번호와 부서명을 출력하라.
select e.employee_id 사원번호, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id;

-- 사원테이블과 부서테이블을 조인해서 사원ID가 100인 사람의 사원ID와 근무 
-- 지ID를 출력해라.
select e.employee_id "사원번호",
        d.location_id "근무ID"
from employees e, departments d
where e.department_id = d.department_id 
and e.employee_id=100;

-- 표준 조인(ANSI JOIN)
select e.first_name 사원번호, d.department_name 부서명
from employees e join departments d
on e.department_id =d.department_id;

-- 사원테이블과 부서테이블을 조인해서 사원ID가 100인 사람의 사원ID와 근무 
-- 지ID를 출력해라.
select e.employee_id 사원ID, d.location_id "근무ID"
from employees e join departments d
on e.department_id=d.department_id  and e.employee_id=100;

-- 세 테이블일 때도 가능 일치하는 컬럼값으로 조인
-- 사원테이블과 부서테이블, 업무테이블을 조인해서 사원번호와 부서명, 업무제목을 출력하라.
select e.employee_id 사원번호, d.department_name 근무부서, j.job_title 업무제목
from employees e, departments d, jobs j
where e.department_id =d.department_id 
and e.job_id = j.job_id;

-- 사원테이블과 부서테이블,업무테이블을 조인해서 사원ID가 100인 사람의 사원ID 
-- 와 근무지ID,업무제목를 출력해라.
select e.employee_id 사원ID, d.location_id 근무ID, j.job_title 업무제목
from employees e, departments d, jobs j 
where e.department_id =d.department_id 
and e.job_id = j.job_id
and e.employee_id=100;

-- 세 테이블일때도 표준 조인(ANSI JOIN)
-- 사원테이블과 부서테이블,업무테이블을 조인해서 사원명과 부서명,업무제목을 출력하라.
select e.employee_id 사원번호, d.department_name 근무부서, j.job_title 업무제목
from employees e join departments d
on e.department_id =d.department_id
join  jobs j
on e.job_id = j.job_id;

-- 사원테이블과 부서테이블,업무테이블을 조인해서 사원ID가 100인 사람의 사원ID 
-- 와 근무지ID,업무제목를 출력해라.
select e.employee_id 사원ID, d.location_id 근무ID, j.job_title 업무제목
from employees e join departments d
on e.department_id =d.department_id and e.employee_id=100
join jobs j
on e.job_id = j.job_id;

-- employees 와 departments 테이블을 조인하여 사원이름이 ‘Steven’인 
-- 사원의 이름과 성, 부서명을 출력하되 부서명이 Executive일때는 행정 
-- 부, Shipping일때는 발송부라고 출력하라.
select e.last_name 성, e.first_name 이름, decode(d.department_name,'Executive','행정부','Shipping','발송부')
from employees e , departments d
where e.department_id =d.department_id
and e.first_name = 'Steven';

-- employees 와 departments 테이블을 조인하여 급여가 12000이상인 
-- 사원의 부서ID,부서명,이름,급여를 출력하라.(급여의 내림차순으로 정렬)
select e.department_id 부서ID, d.department_name 부서명, e.last_name 성, e.first_name 이름, e.salary 급여
from employees e , departments d
where e.department_id =d.department_id
and e.salary >=12000
order by e.salary desc;

-- 비등가 조인테스트를 위한 테이블 생성
CREATE TABLE SAL_GRADE 
(
  GRADE NUMBER NOT NULL 
, MIN_SAL NUMBER NOT NULL 
, MAX_SAL NUMBER NOT NULL 
, CONSTRAINT SAL_GRADE_PK PRIMARY KEY 
  (
    GRADE 
  )
  ENABLE 
);

----------------------------------------
-- 사원테이블에서 30번 부서사원들의 급여정보
select employee_id, salary
from employees
where department_id=30;

-- 사원테이블에서 30번 부서사원들의 급여정보
-- 급여등급 테이블과 조인하여 등급별 표기...
select employee_id, salary, grade
from employees e join sal_grade s
on e.salary between s.min_sal and s.max_sal
and e.department_id=30;

-- SELF JOIN
select e1.employee_id, e1.first_name||'의 매니저'||e2.first_name 매니저
from employees e1, employees e2
where e1.manager_id = e2.employee_id
order by e1.employee_id;

select * from employees
where first_name = 'Steven';

-- 오라클 아우터 조인
-- 매니저가 없는 사원정보도 출력되도록 하기.
select e1.employee_id, e1.first_name||'의 매니저'||e2.first_name 매니저
from employees e1 join employees e2
on e1.manager_id = e2.employee_id(+)
order by e1.employee_id;

-- 부서테이블과 사원테이블을 조인시
-- 부서가 없는 사원도 출력되도록 하세요
SELECT e.employee_id, e.first_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) ;

-- 부서테이블과 사원테이블을 조인시
-- 사원이 없는 부서도 출력되도록 하세요
SELECT e.employee_id, e.first_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id ;

-- join using 사용하기
SELECT employee_id, department_id, department_name 
FROM employees join departments 
using(department_id);

-- 표준 outer join
SELECT employee_id, department_id, department_name 
FROM employees left join departments 
using(department_id);

SELECT employee_id, department_id, department_name 
FROM employees right join departments 
using(department_id);

SELECT employee_id, department_id, department_name 
FROM employees full join departments 
using(department_id);

-- NATURAL JOIN (시험문제용)
select employee_id, department_name
from employees natural join departments;

select department_id, department_name,
        location_id,city
from departments natural join locations;

-- 1.사원 테이블과 부서 테이블을 조인하여 모든 사원ID,사원이름,급여,부서명을 
-- 출력하라.(부서명 내림차순 정렬)
select e.employee_id "사원ID", e.first_name "사원이름", e.salary "급여", d.department_name "부서명"
from employees e, departments d
where e.department_id(+) = d.department_id
order by d.department_name desc;

-- 2. 사원 테이블과 부서 테이블을 조인하여 직업ID가 ‘IT_PROG‘ 인 사원들의 
-- 사원이름, 직업ID,부서명, 위치ID를 출력하세요.
select e.first_name "사원이름", e.job_id "직업ID",d.department_name "부서명",d.location_id "위치ID"
from employees e, departments d
where e.department_id(+) = d.department_id
and e.job_id ='IT_PROG';

-- 3. 부서 테이블과 사원 테이블에서 사번, 사원명, 업무, 급여 , 부서명을 
-- 검색하시오. 단, 업무명이 '%Manager' 이며 급여가 8000 이상인 
-- 사원에 대하여 사번을 기준으로 오름차순 정렬할 것.
select e.employee_id "사번", e.first_name "사원명",j.job_title "업무",e.salary "급여",d.department_name "부서명"
from employees e, departments d, jobs j
where e.department_id = d.department_id
and j.job_title like '%Manager'
and e.salary >=8000
order by  e.employee_id asc;

--sub query 사원테이블에서 평균급여보다 급여가 많은 사원들을 출력
select * from employees where salary < 
(select round(avg(salary)) from employees);


-- David Austin 보다 월급이 작은 사원들만 출력
select * from employees where salary <
(select  salary from employees 
where first_name = 'David' and last_name = 'Austin');

-- David Austin 보다 입사가 늦은 사원들만 출력
select * from employees where hire_date >
(select  hire_date from employees 
where last_name = 'Austin');

-- David Austin 과 같은 부서사원들만 출력
select * from employees where department_id =
(select  department_id from employees 
where last_name = 'Austin');

-- 사원테이블에서 급여가 제일 많은 사원의 정보를 출력하시오.
select * from employees where salary = 
(select max(salary) from employees);


select salary from employees
where department_id=60;

--60번 부서 사원들과 같은 급여를 받는 사원들을 출력
select * from employees
where salary in (9000,6000,4800,4800,4200);

-- ANY: 60번 부서 사원들의 급여중 가장 작은 급여보다 큰(이상) 급여를 받는 사원들을 출력
select * from employees
where salary >any (select salary from employees where department_id=60)
order by salary;


-- ALL: 60번 부서 사원들의 급여중 가장 작은 급여보다 작은(이하) 급여를 받는 사원들을 출력
select * from employees
where salary <all (select salary from employees where department_id=60)
order by salary;

-- 사원테이블에서 업무 별로 최소 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라.
select min(salary) from employees 
group by job_id;

select first_name||' '||last_name "이름", job_id, hire_date, salary, department_id
from employees
where salary in (select min(salary) from employees 
group by job_id);

-- 사원 테이블에서 업무 별로 평균 급여가 14000이상인 사원의 최소급여보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라.
select first_name||' '||last_name "이름", job_id, hire_date, salary, department_id
from employees
where salary >any (select avg(salary) from employees
where salary>=14000
group by job_id);


-- 사원 테이블에서 업무 별로 평균 급여가 14000이상인 사원의 최대급여보다 적은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라.
select first_name||' '||last_name "이름", job_id, hire_date, salary, department_id
from employees
where salary <any (select avg(salary) from employees
where salary>=14000
group by job_id);

-- 80번 부서 사원들의 급여보다 많은 급여를 받는 사원을 출력하라.
select employee_id,first_name||' '||last_name "이름", job_id, hire_date, salary, department_id
from employees
where salary >all(select salary from employees
where department_id=80);

-- 80번 부서 사원들의 급여보다 적은 급여를 받는 사원을 출력하라.
select employee_id,first_name||' '||last_name "이름", job_id, hire_date, salary, department_id
from employees
where salary <all(select salary from employees
where department_id=80);

-- 사원테이블에 존재하는 부서코드와 부서이름을 출력하라. (exists)
select department_id, department_name
from departments
where exists(select distinct department_id from employees where departments.department_id = employees.department_id);

-- 사원 테이블에서 부하직원이 없는 사원의 모든 정보를 exists를 이용하여 작성하라.
select employee_id, first_name
from employees e1
where not exists(select employee_id from employees e2 where e1.employee_id = e2.manager_id);

-- 업무별로 최소급여를 받는 사원의 정보를 사원번호, 이름, 업무, 급여, 부서번호를 출력하라.
select employee_id,first_name||' '||last_name "이름", job_id,salary, department_id
from employees
where (job_id,salary) in(select job_id,min(salary) from employees group by job_id);

-- 테이블에서 적어도 한 명의 사원으로부터 보고를 받을 수 있는 사원의 정보를 사원번호, 이름, 업무, 입사일자, 급여를 출력하라.
select employee_id,first_name||' '||last_name "이름", job_id, hire_date, salary
from employees e
where exists(select * from employees where e.employee_id = manager_id);

-- 소속부서의 평균 급여보다 많은 급여를 받는 사원을 출력하라.
select * from employees e
where salary > (select avg(salary) from employees where department_id = e.department_id);

-- 'David Austin'의 직업을 'John Chen'인 사람의 직업과 같은 직업으로 변경
update employees set job_id = (select job_id from employees where first_name='John' and last_name='Chen') where first_name = 'David' and last_name = 'Austin';

select job_id from employees where first_name = 'David' and last_name = 'Austin';

--최소급여를 받는 사원들을 삭제 하라.
select employee_id,first_name||' '||last_name, salary from employees
where salary = (select min(salary) from employees);

delete from employees where salary = (select min(salary) from employees);

select employee_id,first_name||' '||last_name, salary from employees
where salary = (select min(salary) from employees);


-- Q1) 입사번호(사원ID)가 103인 사원과 같은 직업(job_ID)을 가진 사원들의 정보를 출력하시오.
select * from employees
where job_id =(select job_id from employees where employee_id=103);

-- Q2) Diana Lorentz와 같은 부서의 사원들의 정보를 출력하시오.
select * from employees
where department_id = (select department_id from employees where first_name='Diana' and last_name='Lorentz');

-- Q3) 사원 테이블에서 110번 부서의 최고 급여를 받는 사원보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라.
select employee_id 사원번호, first_name||' '||last_name 이름, job_id 업무, hire_date 입사일자, salary 급여, department_id 부서번호
from employees
where salary > (select max(salary) from employees where department_id=110);

------------------------------------------------- 문제풀이

-- Q1) 사원과 부서 TABLE을 JOIN하여 부서ID,부서명,이름,급여를 출력하라. (단, ANSI JOIN을 사용하라.)
select d.department_id 부서ID, d.department_name 부서명, first_name||' '||last_name 이름, salary 급여
from employees e join departments d
on e.department_id = d.department_id;

-- Q2) 이름이 'Steven'인 사원의 부서명을 출력하라.
select department_name
from departments
where department_id in (select department_id from employees where first_name='Steven');

-- Q3) 부서TABLE에 있는 모든 부서를 출력하고, 사원 TABLE에 있는 DATA와 JOIN하여 모든 사원의 이름,부서ID,부서명,급여를 출력하라.
select department_name from departments;

select first_name||' '||last_name 이름,d.department_id 부서ID,d.department_name 부서명,salary 급여
from employees e left join departments d
on e.department_id = d.department_id;

-- Q4)사원 TABLE에 있는 모든 employee_id와 manager_id을 이용하여 서로의 관계를 다음과 같이 출력하라.
-- (예: Neena의 매니저는 Steven이다. 단, 매니저가 없으면 없음으로 표시할 것.)
select e1.employee_id, e1.first_name || '의 매니저는 ' || NVL(e2.first_name, '없음')
from employees e1 , employees e2
where e1.manager_id = e2.employee_id(+)
order by e1.employee_id;

-- Q5-1)'Neena'의 직무와 같은 사원이름,부서ID,급여,직무를 출력하라.
select first_name||' '||last_name 이름,department_id 부서ID, salary 급여, job_id
from employees
where job_id = (select job_id from employees where first_name='Neena');

-- Q5-2)'Neena'의 직무와 같은 사원이름,부서명,급여,직무를 출력하라.
select e.first_name||' '||e.last_name 이름,d.department_name 부서명, e.salary 급여, e.job_id
from employees e , departments d
where e.department_id = d.department_id
and job_id = (select job_id from employees where first_name='Neena');

-- Q6) 'John'이 속해있는 부서의 모든 사람의 부서번호, 사원ID, 이름, 입사일, 급여를 출력하라.
select employee_id, first_name||' '||last_name, department_id, hire_date, salary
from employees
where department_id in(select department_id from employees where first_name='John');

-- Q7-1) 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일 , 급여를 출력하라.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,e.salary
from employees e join departments d
on e.department_id=d.department_id
and (salary > (select avg(salary) from employees));


select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,e.salary
from employees e , departments d
where salary > (select avg(salary) from employees)
and  e.department_id=d.department_id;



-- Q7-2) 전체 사원의 평균임금보다 많은 사원의 사원번호, 이름, 부서명, 입사일 ,지역명 ,급여를 출력하라.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,loc.city ,e.salary
from employees e, departments d, locations loc
where salary > (select avg(salary) from employees)
and e.department_id=d.department_id
and d.location_id = loc.location_id;

-- Q8) 10번 부서 사람들 중에 20번 부서의 사원과 같은 업무를 하는 사원의 사원번호,업무,이름,부서명,입사일,지역명을 출력하라.
-- select job_id from employees where department_id = 10; -- AD_ASST
-- select job_id from employees where department_id = 20; -- MK_MAN. MK_REP
--select e.employee_id, job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, loc.city
--from employees e, departments d, locations loc
--where job_id in (select job_id from employees where department_id = 20 )
--and e.department_id=d.department_id
--and e.department_id =10
--and d.location_id = loc.location_id; 
select e.employee_id, job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, loc.city
from employees e join departments d
on e.department_id=d.department_id
join locations loc
on d.location_id = loc.location_id
and e.department_id =10
and job_id in (select job_id from employees where department_id = 20 );


-- Q9) 10번 부서 중에서 30번 부서에는 없는 업무를 하는 사원의 사원번호, 업무, 이름, 부서명, 입사일, 지역을 출력하라.
select e.employee_id, job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, loc.city
from employees e, departments d, locations loc
where job_id not in (select job_id from employees where department_id =30)
and e.department_id=d.department_id
and e.department_id =10
and d.location_id = loc.location_id; 

select e.employee_id, job_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date, loc.city
from employees e join departments d
on e.department_id=d.department_id
join locations loc
on d.location_id = loc.location_id
and e.department_id =10
and job_id not in (select job_id from employees where department_id = 20 );

-- Q10) 10번 부서와 같은 일을 하는 사원의 사원번호, 업무, 이름, 부서번호, 부서명, 지역, 급여를 출력하라.
select e.employee_id, job_id, e.first_name||' '||e.last_name, e.department_id, d.department_name,loc.city, e.salary
from employees e join departments d
on e.department_id=d.department_id
join locations loc
on d.location_id = loc.location_id
and (job_id in (select job_id from employees where e.department_id=10));

-- Q11) 'Neena' 혹은 'David'의 급여와 같은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '|| last_name, salary
from employees
where salary in (select salary from employees where first_name='Neena' or (first_name='David' and last_name = 'Austin'));

-- Q12) 급여가 30번 부서의 최고 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '||last_name, salary
from employees
where salary >all (select salary from employees where department_id=30);

-- Q13) 급여가 30번 부서의 최저 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '||last_name, salary
from employees
where salary <all (select salary from employees where department_id=30);

-- Q14) 급여가 90번 부서의 최저 급여보다 높은 사원의 사원번호, 이름, 급여를 출력하라.
select salary from employees where department_id=90;

select employee_id, first_name||' '||last_name, salary
from employees
where salary >any (select salary from employees where department_id=90);

-- Q15) 급여가 90번 부서의 최고 급여보다 낮은 사원의 사원번호, 이름, 급여를 출력하라.
select employee_id, first_name||' '||last_name, salary
from employees
where salary <any (select salary from employees where department_id=90);

-- Q16) 사원이름과 부서명을 출력하라.(단, 뷰나 조인을 사용하지 말고 서브쿼리 쓸 것)
select e.first_name||' '||e.last_name, (select d.department_name from departments d where e.department_id=d.department_id)
from employees e;

select * from employees;
select * from departments;

create table emp as select * from employees;
create table dept as select * from departments
where 1=2;

create table loc as select * from locations;
create table job as select * from jobs;

CREATE TABLE TEST_TCL AS SELECT * FROM DEPARTMENTS;
SELECT * FROM TEST_TCL;
COMMIT; --//트랜잭션 시작
UPDATE TEST_TCL SET DEPARTMENT_ID=50;
savepoint aaa;
UPDATE TEST_TCL SET LOCATION_ID=1004 WHERE DEPARTMENT_NAME='IT';
savepoint bbb;
DELETE FROM TEST_TCL WHERE DEPARTMENT_NAME='Marketing';
ROLLBACK to bbb;

SELECT * FROM TEST_TCL;
ROLLBACK;
SELECT * FROM TEST_TCL;

select * from emp_details_view order by salary desc;

create or replace noforce view test_view_emp
as
select employee_id,first_name,salary from employees;

select * from test_view_emp;

select * from tab;

select e.first_name, d.department_name
from employees e join departments d
on d.department_id = e.department_id;

-- join하고 view로 만들기
create or replace view test_join_view
as
select e.first_name, d.department_name
from employees e join departments d
on d.department_id = e.department_id;

select * from test_join_view;

-- self join하고 view로 만들기
select e1.employee_id, e1.first_name||'의 매니저'||e2.first_name 매니저
from employees e1 join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id asc;

create or replace view test_self_join_view
as
select e1.employee_id, e1.first_name||'의 매니저'||e2.first_name 매니저
from employees e1 join employees e2
on e1.manager_id = e2.employee_id
order by e1.employee_id asc;

select * from test_self_join_view;


-- 아래와 같은 테이블 생성

drop TABLE test4_dept CASCADE CONSTRAINTS PURGE; -- // 제약조건 무시하고 삭제
    CREATE TABLE test4_dept(
    deptno NUMBER(2), 
    dname VARCHAR2(15) default '개발부', 
    loc_id CHAR(1), 
    CONSTRAINT test4_dept_deptno_pk PRIMARY KEY (deptno), 
    CONSTRAINT test4_dept_loc_ck CHECK(loc_id IN('1', '2'))
    );
drop TABLE test4_emp CASCADE CONSTRAINTS PURGE; 
CREATE TABLE test4_emp( 
empno NUMBER(4), 
ename VARCHAR2(10) CONSTRAINT test4_emp_ename_nn NOT NULL, 
loc_name VARCHAR2(6), 
jumin CHAR(13), 
deptno NUMBER(2), 
sal NUMBER, 
CONSTRAINT test4_emp_no_pk PRIMARY KEY (empno), 
CONSTRAINT test4_emp_jumin_uq UNIQUE (jumin), 
CONSTRAINT test4_emp_deptno_fk FOREIGN KEY (deptno) REFERENCES test4_dept(deptno)
);
INSERT INTO test4_dept VALUES(10, '영업부', '1'); 
INSERT INTO test4_dept VALUES(20, '기획부', '1'); 
INSERT INTO test4_dept VALUES(30, '홍보부', '2'); 
INSERT INTO test4_dept VALUES(40, '관리부', '2'); 
INSERT INTO test4_emp VALUES(1001, '홍길동', '서울', '1234561234567', 10,3000); 
INSERT INTO test4_emp VALUES(1002, '최길동', '서울', '1234561234568', 10,4000); 
INSERT INTO test4_emp VALUES(1003, '박길동', '경기', '1234561234569', 20,5000); 
INSERT INTO test4_emp VALUES(1004, '양길동', '경기', '1234561234571', 30,6000); 
INSERT INTO test4_emp VALUES(1005, '한길동', '서울', '1234561234572', 40,7000); 
INSERT INTO test4_emp VALUES(1006, '강길동', '서울', '1234561234573', 40,8000); 
Commit;

-- Q1) 부서ID가 10번인 사원데이터를 갖는 이름이 test4_emp_view인 뷰를 생성시 
-- empno, ename 두 개 컬럼만으로 생성후,뷰검색,뷰구조를 확인하라.
select * from test4_emp
where deptno =10;

create or replace view test4_emp_view
as
select empno, ename from test4_emp
where deptno =10;

select * from test4_emp_view;

-- Q2) 부서ID가 20번인 부서데이터를 갖는 이름이 test4_dept_view인 뷰를 생성시 
-- deptno, dname 두 개 컬럼만으로 생성후,뷰검색,뷰구조를 확인하라.
select * from test4_dept
where deptno =20;

create or replace view test4_dept_view as
select deptno, dname from test4_dept
where deptno =20;

select * from test4_dept_view;

-- Q3) 부서ID가 10번인 사원데이터를 갖는 이름이 test4_emp_view인 뷰를 생성시 
-- empno를 employee_id, ename을 employee_name으로 별칭 설정하라.
select * from test4_emp
where deptno =10; 

create or replace view test4_emp_view(employee_id,employee_name) as
select empno ,ename from test4_emp
where deptno =10;

select * from test4_emp_view;

-- Q4) 부서ID가 20번인 부서데이터를 갖는 이름이 test4_dept_view인 뷰를 생성시 
-- deptno를 department_id, dname을 department_name으로 별칭 설정하라.
select * from test4_dept
where deptno =20; 

create or replace view test4_dept_view(department_id,department_name) as
select deptno ,dname from test4_dept
where deptno =20;

select * from test4_dept_view;

-- Q5) test4_emp 테이블과 test4_dept 테이블을 조인하여 empno를 사원번호로, ename을 사원명으로, 
-- dname을 부서명으로, loc_name을 지역명으로 바꾸는 test4_emp_join_dept_view를 생성하시오.
select * from
test4_emp join test4_dept
on test4_emp.deptno = test4_dept.deptno;

create or replace view test4_emp_join_dept_view(사원번호,사원명,부서명,지역명) as
select e.empno , e.ename, d.dname, e.loc_name 
from test4_emp e join test4_dept d
on e.deptno = d.deptno;

select * from test4_emp_join_dept_view;

-- Q6) test4_emp 테이블과 test4_dept 테이블을 조인하여 dname을 부서명으로,
-- min(e.sal)을 최저급여로, max(e.sal)을 최고급여로, avg(e.sal)을 평균급여로 바꾸고
-- 부서이름별로 test4_emp_join_dept_view를 생성하시오.
select * from
test4_emp e join test4_dept d
on e.deptno = d.deptno;

create or replace view test4_emp_join_dept_view(부서명,최저급여,최고급여,평균급여) as
select d.dname, min(e.sal), max(e.sal),avg(e.sal)
from test4_emp e join test4_dept d
on e.deptno = d.deptno
group by d.dname;

select * from test4_emp_join_dept_view;

-- 10 개행씩 잘라서 검색되도록 DQL을 작성하세요. -----------------------
-- 예:1,10(100-109)-11,20(110,119)
select * from employees;

select *
from (select e.* ,rownum rnum from employees e )
where rnum between 1 and 10;

select *
from (select e.* ,rownum rnum from employees e)
where rnum>10 and rnum<=20;

-- 웹페이지에서 1 2 3 4 5 페이지블럭 구현시 자주 사용됨.


-- rollup 
-- 예) 부서번호가 40번이하인 사원들에 대해 부서별, 직급별, 월급이 얼마인지 조회하라.
select department_id,job_id,sum(salary)
from employees
where department_id <=40
group by rollup(department_id, job_id)
order by department_id;

select department_id,job_id,sum(salary)
from employees
where department_id <=40
group by cube(department_id, job_id)
order by department_id;

--with 쿼리 절
with e as
    (select employee_id,manager_id,salary,last_name
    from employees
    where department_id=50),
    d as
    (select avg(salary) avg_salary
    from employees
    where department_id=50)
select e.employee_id, e.last_name, e.salary
from e,d
where e.salary < d.avg_salary;

-- 전체 부서별 평균 급여액보다 부서별 급여합계액이 큰 부서의 명단을 추출하라.
with dept_costs as
    (select department_name,sum(salary) sum_sal
    from employees e join departments d
    on e.department_id = d.department_id
    group by department_name),
    avg_cost as(select sum(sum_sal)/count(*) avg from dept_costs)
select dept_costs.*
from dept_costs, avg_cost
where dept_costs.sum_sal > avg_cost.avg;

-- mission 
-- 0.프로젝트명 java22jdbc_hr, 패키지명(test.com.emp,test.com.dept,test.com.job,test.com.main)
-- 1.테이블 복제 employees->emp, departments->dept, jobs->job 원본데이터 유지
create table emp as select * from employees;
create table dept as select * from departments;
create table job as select * from jobs;

drop sequence seq_emp;
create sequence seq_emp;
drop sequence seq_dept;
create sequence seq_dept;
-- 2.제약조건설정(pk,fk)
-- 3.객체생성(EmpVO,DeptVO,JobVO)
-- 4.각 객체에 따른 CRUD처리객체(~~DAO<---~DAOimpl)
-- 5.jdbc연동해서 각 메인클래스(EmpMain,DeptMain,JobMain) 에서 입력처리 완성하기.