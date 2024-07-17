-- hr������ ��� ���̺��� �÷����� �˻�(���)
select * from tab;

-- *(����÷�) : �μ����̺��� ��� �����˻�
select * from departments;

-- �μ����̺��� ��� �����˻�-�μ���
select department_name from departments;

-- �μ����̺��� ��� �����˻�-�μ���ȣ,�μ���
select department_id,department_name from departments;

-- ���̺� �������
desc employees;

-- ������̺��� �����ڵ� ����ϱ�(�ߺ�����)
select distinct JOB_ID from employees;

select EMPLOYEE_ID,SALARY from employees;

select EMPLOYEE_ID,SALARY from employees order by SALARY;

select EMPLOYEE_ID,SALARY from employees order by SALARY asc;

select EMPLOYEE_ID,SALARY from employees order by SALARY desc;

select JOB_ID,SALARY from employees order by JOB_ID,salary;

select JOB_ID,SALARY from employees order by JOB_ID,salary;

select JOB_ID,SALARY from employees order by JOB_ID asc,salary asc;

select JOB_ID,SALARY from employees order by JOB_ID,salary desc;

-- ������̺��� �����ڵ�� �޿� ���(�����ڵ�� �޿��� ������)
select JOB_ID,SALARY 
from employees 
order by JOB_ID desc,salary desc;

-- ������̺��� ���� ,������ ��� (as�� ������ �Ǿ���.)
select job_id "����",salary "����" from employees;
select job_id "����",salary "���� \õ��" from employees;

-- ������̺��� �����ȣ,�μ���ȣ�� ���, ��� �μ���ȣ�� 10�� �͸�
select employee_id,department_id from employees where department_id=10;

-- ������̺��� ����,�����ȣ�� ���, ��� �����ȣ�� 30�ΰ͸�
select salary, employee_id from employees where employee_id=30;

-- ������̺��� ����,�����ȣ�� ���, ��� �����ȣ�� 30�� �͸� ����ϰ� ������ ��������
select salary, employee_id from employees where employee_id=30 order by salary desc;

-- ������̺��� �����ڵ�,���� ���, ��� �����ڵ尡 'IT_PROG' �͸� ����ϱ�
select job_id,first_name from employees where job_id='IT_PROG';

select employee_id,first_name,hire_date from employees where hire_date='07/12/07';


-- ������̺��� ����̸�, ���� *1.1
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


-- UNION�� �ߺ�����
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

-- in�� 10,20,100�� �� ��� ����Ѵ�.
select department_id, salary from employees
where department_id in (10,20,100);

-- ANY�� ()���� ��8000,20000���� �̻��̳� ���ϳ�
select department_id, salary from employees
where salary >= ANY(8000,12000,20000);

select job_id, first_name, salary from employees
where salary >=10000 and salary <=12000;

-- between�� and�� ��Ʈ��.
select job_id, first_name, salary from employees
where salary between 10000 and 12000;

-- ���ڵ� between ��밡��
SELECT last_name FROM employees WHERE last_name 
BETWEEN 'Chen' AND 'Dilly' ORDER BY last_name;

SELECT last_name FROM employees
WHERE NOT last_name = 'Dilly' ORDER BY last_name;

-- Like ''
select last_name from employees
where last_name LIKE 't%';

-- �߰��� y�� ������ �� ���
select last_name from employees
where last_name LIKE '%y%';

-- __e�� �տ� �α��� ���� ����°�� e�� �;��Ѵ�.
select last_name from employees
where last_name LIKE '__e%';

select last_name from employees
where last_name LIKE '%es';

select last_name from employees
where last_name LIKE '%Di%';

select last_name, commission_pct from employees
where commission_pct is null;

-- commission_pct�� null�� �ƴ� �͸� ���
select last_name, commission_pct from employees
where commission_pct is not null;

-- ���տ�����
SELECT first_name||''||last_name ||'�� ����['|| SALARY ||']'
FROM employees ;

-- ������ �켱����: ()���� �񱳿����� �����ϰ� and�ϰ� not
SELECT EMPLOYEE_ID FROM employees
WHERE NOT (SALARY > 1000 AND SALARY < 12000); 

-- >1000�ϰ� not�ϰ� and
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

-- ���迡 ���� ���� decode
select last_name,job_id,salary,
    decode(job_id,'IT_PROG',salary*1.1) AS "�Ǽ��ɾ�"
from employees;

select last_name,job_id,salary,
    decode(job_id,'IT_PROG',salary*1.1, salary) AS "�Ǽ��ɾ�"
from employees;

select last_name,job_id,salary,
    decode(job_id, 'IT_PROG', salary*1.1,
                    'AD_PRES',salary*1.2,
                    'AD_VP',salary*1.3, salary) as "�Ǽ��ɾ�"
from employees;

-- case ~then ���迡 ���� ����
select last_name,job_id,salary,
    case job_id when 'IT_PROG' then salary*1.1
                when 'AD_PRES' then salary*1.2
                when 'AD_VP' then salary*1.3
    else salary
    end as "�Ǽ��ɾ�"
from employees;

-- sysdate ���� ��¥�� �˷��ش�.
select sysdate from dual;

-- to_char
select sysdate, to_char(sysdate,'D') from dual; -- 4
select sysdate, to_char(sysdate,'DAY') from dual; -- ������
select sysdate, to_char(sysdate,'DY') from dual; -- ��
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

-- ��¥ ��ȯ �Լ� to_date
select to_date(sysdate,'yy/mm/dd') from dual;
select to_date('13-03-20','dd/mm/yy') from dual;

-- �ý��� �Լ�
select user from dual;

-- abs
select abs(-30) from dual;

-- mod: �������� ���Ѵ�.
select MOD(11,4) from dual;

-- power()�ŵ�����
select power(2,7) from dual;
select power(2,10) from dual;

-- trunc : ������
select trunc(99.123456,3) from dual; -- 99.123

-- ������ �Լ� *****
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
select avg(salary) "������ ���", department_id from employees
group by department_id;

select round(avg(salary)) "������ ���", department_id from employees
group by department_id;

select round(avg(salary)) "������ ���", department_id from employees
group by department_id
having department_id is not null;

-- Q1:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø����� ����϶�.
select round(avg(salary)),department_id from employees
where salary >=8000
group by department_id;

-- Q2:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø����� 
-- �μ���ȣ�� ������������ �����϶�
select round(avg(salary)),department_id from employees
where salary >=8000
group by department_id
order by department_id desc;

-- Q3:���� 8000�̻��� ������� �μ��� ��տ����� �ݿø�����
-- ��տ����� �ݿø������� �������� �����϶�
select round(avg(salary)) "��տ���",department_id from employees
where salary >= 8000
group by department_id
order by "��տ���" asc;

-- Q4:���� 10000�̻��� ������� �μ��� ��տ����� �ݿø�����
-- �μ���ȣ�� �������� �����϶�
select department_id, round(avg(salary)) as "��տ���" from employees
where salary >=10000
group by department_id
order by department_id asc;

-- Q5:�� �μ��� ���� ������ �ϴ� ����� �ο����� ���Ͽ� 
-- �μ���ȣ,������,�ο����� ����϶�.
-- (��, �μ���ȣ�� ���������� ���� �������� ����!)
select department_id,job_id,count(*) as "�ο���"
from employees
group by department_id, job_id
order by department_id desc, job_id desc;

-- Q6:��� ���̺��� ������ ���ID�� ����ϵ�
-- ������ 12000�� ����� ��׿����ڶ�� ����϶�.
select salary, employee_id,decode(salary,12000,'��׿�����') as "��׿�����"
from employees;

-- Q7:��� ���̺��� ������ ���ID�� ����ϵ�
-- ������ 12000�̻��� ����� ��� ��׿����ڶ�� 
-- ����϶�.  (��, �ְ������� 24000�̴�.)
select salary, employee_id, case when salary between 12000 and 24000 then '��׿�����'end as "���" 
from employees;

-- Q8:��� ���̺��� ������ ���ID�� ����ϵ� 
-- ������ 20000�̻��� ����� 1�޿�����,
-- ������ 15000 ���� 19000 ������ ����� 2�޿�����, 
-- ������ ��Ÿ������ ����� 3�޿����� ��� ����϶�. 
-- (��, �ְ������� 24000�̴�.)
select salary, employee_id,
case when salary between 20000 and 24000 then '1�޿�����'
     when salary between 15000 and 19000 then '2�޿�����'
     else '3�޿�����'
     end as "���"
from employees;