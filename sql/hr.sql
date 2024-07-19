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

select employee_id,department_name
from employees,departments;
-- �����÷��� ������� ������,count = 2889, ũ�ν� ����

-- EQUI JOIN, �����

select employees.employee_id "�����ȣ",
        departments.department_name "�μ���"
from employees, departments
where employees.department_id = departments.department_id;

-- ������̺�� �μ����̺��� �����ؼ� ���ID�� 100�� ����� ���ID�� �ٹ� 
-- ��ID�� ����ض�.
select employees.employee_id "�����ȣ",
        departments.location_id "�ٹ�ID"
from employees, departments
where employees.department_id = departments.department_id 
and employees.employee_id=100;

-- ������̺�� �μ����̺��� �����ؼ� �����ȣ�� �μ����� ����϶�.
select e.employee_id �����ȣ, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id;

-- ������̺�� �μ����̺��� �����ؼ� ���ID�� 100�� ����� ���ID�� �ٹ� 
-- ��ID�� ����ض�.
select e.employee_id "�����ȣ",
        d.location_id "�ٹ�ID"
from employees e, departments d
where e.department_id = d.department_id 
and e.employee_id=100;

-- ǥ�� ����(ANSI JOIN)
select e.first_name �����ȣ, d.department_name �μ���
from employees e join departments d
on e.department_id =d.department_id;

-- ������̺�� �μ����̺��� �����ؼ� ���ID�� 100�� ����� ���ID�� �ٹ� 
-- ��ID�� ����ض�.
select e.employee_id ���ID, d.location_id "�ٹ�ID"
from employees e join departments d
on e.department_id=d.department_id  and e.employee_id=100;

-- �� ���̺��� ���� ���� ��ġ�ϴ� �÷������� ����
-- ������̺�� �μ����̺�, �������̺��� �����ؼ� �����ȣ�� �μ���, ���������� ����϶�.
select e.employee_id �����ȣ, d.department_name �ٹ��μ�, j.job_title ��������
from employees e, departments d, jobs j
where e.department_id =d.department_id 
and e.job_id = j.job_id;

-- ������̺�� �μ����̺�,�������̺��� �����ؼ� ���ID�� 100�� ����� ���ID 
-- �� �ٹ���ID,�������� ����ض�.
select e.employee_id ���ID, d.location_id �ٹ�ID, j.job_title ��������
from employees e, departments d, jobs j 
where e.department_id =d.department_id 
and e.job_id = j.job_id
and e.employee_id=100;

-- �� ���̺��϶��� ǥ�� ����(ANSI JOIN)
-- ������̺�� �μ����̺�,�������̺��� �����ؼ� ������ �μ���,���������� ����϶�.
select e.employee_id �����ȣ, d.department_name �ٹ��μ�, j.job_title ��������
from employees e join departments d
on e.department_id =d.department_id
join  jobs j
on e.job_id = j.job_id;

-- ������̺�� �μ����̺�,�������̺��� �����ؼ� ���ID�� 100�� ����� ���ID 
-- �� �ٹ���ID,�������� ����ض�.
select e.employee_id ���ID, d.location_id �ٹ�ID, j.job_title ��������
from employees e join departments d
on e.department_id =d.department_id and e.employee_id=100
join jobs j
on e.job_id = j.job_id;

-- employees �� departments ���̺��� �����Ͽ� ����̸��� ��Steven���� 
-- ����� �̸��� ��, �μ����� ����ϵ� �μ����� Executive�϶��� ���� 
-- ��, Shipping�϶��� �߼ۺζ�� ����϶�.
select e.last_name ��, e.first_name �̸�, decode(d.department_name,'Executive','������','Shipping','�߼ۺ�')
from employees e , departments d
where e.department_id =d.department_id
and e.first_name = 'Steven';

-- employees �� departments ���̺��� �����Ͽ� �޿��� 12000�̻��� 
-- ����� �μ�ID,�μ���,�̸�,�޿��� ����϶�.(�޿��� ������������ ����)
select e.department_id �μ�ID, d.department_name �μ���, e.last_name ��, e.first_name �̸�, e.salary �޿�
from employees e , departments d
where e.department_id =d.department_id
and e.salary >=12000
order by e.salary desc;

-- �� �����׽�Ʈ�� ���� ���̺� ����
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
-- ������̺��� 30�� �μ�������� �޿�����
select employee_id, salary
from employees
where department_id=30;

-- ������̺��� 30�� �μ�������� �޿�����
-- �޿���� ���̺�� �����Ͽ� ��޺� ǥ��...
select employee_id, salary, grade
from employees e join sal_grade s
on e.salary between s.min_sal and s.max_sal
and e.department_id=30;

-- SELF JOIN
select e1.employee_id, e1.first_name||'�� �Ŵ���'||e2.first_name �Ŵ���
from employees e1, employees e2
where e1.manager_id = e2.employee_id
order by e1.employee_id;

select * from employees
where first_name = 'Steven';

-- ����Ŭ �ƿ��� ����
-- �Ŵ����� ���� ��������� ��µǵ��� �ϱ�.
select e1.employee_id, e1.first_name||'�� �Ŵ���'||e2.first_name �Ŵ���
from employees e1 join employees e2
on e1.manager_id = e2.employee_id(+)
order by e1.employee_id;

-- �μ����̺�� ������̺��� ���ν�
-- �μ��� ���� ����� ��µǵ��� �ϼ���
SELECT e.employee_id, e.first_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) ;

-- �μ����̺�� ������̺��� ���ν�
-- ����� ���� �μ��� ��µǵ��� �ϼ���
SELECT e.employee_id, e.first_name, d.department_name 
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id ;

-- join using ����ϱ�
SELECT employee_id, department_id, department_name 
FROM employees join departments 
using(department_id);

-- ǥ�� outer join
SELECT employee_id, department_id, department_name 
FROM employees left join departments 
using(department_id);

SELECT employee_id, department_id, department_name 
FROM employees right join departments 
using(department_id);

SELECT employee_id, department_id, department_name 
FROM employees full join departments 
using(department_id);

-- NATURAL JOIN (���蹮����)
select employee_id, department_name
from employees natural join departments;

select department_id, department_name,
        location_id,city
from departments natural join locations;

-- 1.��� ���̺�� �μ� ���̺��� �����Ͽ� ��� ���ID,����̸�,�޿�,�μ����� 
-- ����϶�.(�μ��� �������� ����)
select e.employee_id "���ID", e.first_name "����̸�", e.salary "�޿�", d.department_name "�μ���"
from employees e, departments d
where e.department_id(+) = d.department_id
order by d.department_name desc;

-- 2. ��� ���̺�� �μ� ���̺��� �����Ͽ� ����ID�� ��IT_PROG�� �� ������� 
-- ����̸�, ����ID,�μ���, ��ġID�� ����ϼ���.
select e.first_name "����̸�", e.job_id "����ID",d.department_name "�μ���",d.location_id "��ġID"
from employees e, departments d
where e.department_id(+) = d.department_id
and e.job_id ='IT_PROG';

-- 3. �μ� ���̺�� ��� ���̺��� ���, �����, ����, �޿� , �μ����� 
-- �˻��Ͻÿ�. ��, �������� '%Manager' �̸� �޿��� 8000 �̻��� 
-- ����� ���Ͽ� ����� �������� �������� ������ ��.
select e.employee_id "���", e.first_name "�����",j.job_title "����",e.salary "�޿�",d.department_name "�μ���"
from employees e, departments d, jobs j
where e.department_id = d.department_id
and j.job_title like '%Manager'
and e.salary >=8000
order by  e.employee_id asc;

--sub query ������̺��� ��ձ޿����� �޿��� ���� ������� ���
select * from employees where salary < 
(select round(avg(salary)) from employees);


-- David Austin ���� ������ ���� ����鸸 ���
select * from employees where salary <
(select  salary from employees 
where first_name = 'David' and last_name = 'Austin');

-- David Austin ���� �Ի簡 ���� ����鸸 ���
select * from employees where hire_date >
(select  hire_date from employees 
where last_name = 'Austin');

-- David Austin �� ���� �μ�����鸸 ���
select * from employees where department_id =
(select  department_id from employees 
where last_name = 'Austin');

-- ������̺��� �޿��� ���� ���� ����� ������ ����Ͻÿ�.
select * from employees where salary = 
(select max(salary) from employees);


select salary from employees
where department_id=60;

--60�� �μ� ������ ���� �޿��� �޴� ������� ���
select * from employees
where salary in (9000,6000,4800,4800,4200);

-- ANY: 60�� �μ� ������� �޿��� ���� ���� �޿����� ū(�̻�) �޿��� �޴� ������� ���
select * from employees
where salary >any (select salary from employees where department_id=60)
order by salary;


-- ALL: 60�� �μ� ������� �޿��� ���� ���� �޿����� ����(����) �޿��� �޴� ������� ���
select * from employees
where salary <all (select salary from employees where department_id=60)
order by salary;

-- ������̺��� ���� ���� �ּ� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�.
select min(salary) from employees 
group by job_id;

select first_name||' '||last_name "�̸�", job_id, hire_date, salary, department_id
from employees
where salary in (select min(salary) from employees 
group by job_id);

-- ��� ���̺��� ���� ���� ��� �޿��� 14000�̻��� ����� �ּұ޿����� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�.
select first_name||' '||last_name "�̸�", job_id, hire_date, salary, department_id
from employees
where salary >any (select avg(salary) from employees
where salary>=14000
group by job_id);


-- ��� ���̺��� ���� ���� ��� �޿��� 14000�̻��� ����� �ִ�޿����� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�.
select first_name||' '||last_name "�̸�", job_id, hire_date, salary, department_id
from employees
where salary <any (select avg(salary) from employees
where salary>=14000
group by job_id);

-- 80�� �μ� ������� �޿����� ���� �޿��� �޴� ����� ����϶�.
select employee_id,first_name||' '||last_name "�̸�", job_id, hire_date, salary, department_id
from employees
where salary >all(select salary from employees
where department_id=80);

-- 80�� �μ� ������� �޿����� ���� �޿��� �޴� ����� ����϶�.
select employee_id,first_name||' '||last_name "�̸�", job_id, hire_date, salary, department_id
from employees
where salary <all(select salary from employees
where department_id=80);

-- ������̺� �����ϴ� �μ��ڵ�� �μ��̸��� ����϶�. (exists)
select department_id, department_name
from departments
where exists(select distinct department_id from employees where departments.department_id = employees.department_id);

-- ��� ���̺��� ���������� ���� ����� ��� ������ exists�� �̿��Ͽ� �ۼ��϶�.
select employee_id, first_name
from employees e1
where not exists(select employee_id from employees e2 where e1.employee_id = e2.manager_id);

-- �������� �ּұ޿��� �޴� ����� ������ �����ȣ, �̸�, ����, �޿�, �μ���ȣ�� ����϶�.
select employee_id,first_name||' '||last_name "�̸�", job_id,salary, department_id
from employees
where (job_id,salary) in(select job_id,min(salary) from employees group by job_id);

-- ���̺��� ��� �� ���� ������κ��� ���� ���� �� �ִ� ����� ������ �����ȣ, �̸�, ����, �Ի�����, �޿��� ����϶�.
select employee_id,first_name||' '||last_name "�̸�", job_id, hire_date, salary
from employees e
where exists(select * from employees where e.employee_id = manager_id);

-- �ҼӺμ��� ��� �޿����� ���� �޿��� �޴� ����� ����϶�.
select * from employees e
where salary > (select avg(salary) from employees where department_id = e.department_id);

-- 'David Austin'�� ������ 'John Chen'�� ����� ������ ���� �������� ����
update employees set job_id = (select job_id from employees where first_name='John' and last_name='Chen') where first_name = 'David' and last_name = 'Austin';

select job_id from employees where first_name = 'David' and last_name = 'Austin';

--�ּұ޿��� �޴� ������� ���� �϶�.
select employee_id,first_name||' '||last_name, salary from employees
where salary = (select min(salary) from employees);

delete from employees where salary = (select min(salary) from employees);

select employee_id,first_name||' '||last_name, salary from employees
where salary = (select min(salary) from employees);


-- Q1) �Ի��ȣ(���ID)�� 103�� ����� ���� ����(job_ID)�� ���� ������� ������ ����Ͻÿ�.
select * from employees
where job_id =(select job_id from employees where employee_id=103);

-- Q2) Diana Lorentz�� ���� �μ��� ������� ������ ����Ͻÿ�.
select * from employees
where department_id = (select department_id from employees where first_name='Diana' and last_name='Lorentz');

-- Q3) ��� ���̺��� 110�� �μ��� �ְ� �޿��� �޴� ������� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�.
select employee_id �����ȣ, first_name||' '||last_name �̸�, job_id ����, hire_date �Ի�����, salary �޿�, department_id �μ���ȣ
from employees
where salary > (select max(salary) from employees where department_id=110);

------------------------------------------------- ����Ǯ��

-- Q1) ����� �μ� TABLE�� JOIN�Ͽ� �μ�ID,�μ���,�̸�,�޿��� ����϶�. (��, ANSI JOIN�� ����϶�.)
select d.department_id �μ�ID, d.department_name �μ���, first_name||' '||last_name �̸�, salary �޿�
from employees e join departments d
on e.department_id = d.department_id;

-- Q2) �̸��� 'Steven'�� ����� �μ����� ����϶�.
select department_name
from departments
where department_id in (select department_id from employees where first_name='Steven');

-- Q3) �μ�TABLE�� �ִ� ��� �μ��� ����ϰ�, ��� TABLE�� �ִ� DATA�� JOIN�Ͽ� ��� ����� �̸�,�μ�ID,�μ���,�޿��� ����϶�.
select department_name from departments;

select first_name||' '||last_name �̸�,d.department_id �μ�ID,d.department_name �μ���,salary �޿�
from employees e left join departments d
on e.department_id = d.department_id;

-- Q4)��� TABLE�� �ִ� ��� employee_id�� manager_id�� �̿��Ͽ� ������ ���踦 ������ ���� ����϶�.
-- (��: Neena�� �Ŵ����� Steven�̴�. ��, �Ŵ����� ������ �������� ǥ���� ��.)
select e1.employee_id, e1.first_name || '�� �Ŵ����� ' || NVL(e2.first_name, '����')
from employees e1 , employees e2
where e1.manager_id = e2.employee_id(+)
order by e1.employee_id;

-- Q5-1)'Neena'�� ������ ���� ����̸�,�μ�ID,�޿�,������ ����϶�.
select first_name||' '||last_name �̸�,department_id �μ�ID, salary �޿�, job_id
from employees
where job_id = (select job_id from employees where first_name='Neena');

-- Q5-2)'Neena'�� ������ ���� ����̸�,�μ���,�޿�,������ ����϶�.
select e.first_name||' '||e.last_name �̸�,d.department_name �μ���, e.salary �޿�, e.job_id
from employees e , departments d
where e.department_id = d.department_id
and job_id = (select job_id from employees where first_name='Neena');

-- Q6) 'John'�� �����ִ� �μ��� ��� ����� �μ���ȣ, ���ID, �̸�, �Ի���, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, department_id, hire_date, salary
from employees
where department_id in(select department_id from employees where first_name='John');

-- Q7-1) ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի��� , �޿��� ����϶�.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,e.salary
from employees e join departments d
on e.department_id=d.department_id
and (salary > (select avg(salary) from employees));


select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,e.salary
from employees e , departments d
where salary > (select avg(salary) from employees)
and  e.department_id=d.department_id;



-- Q7-2) ��ü ����� ����ӱݺ��� ���� ����� �����ȣ, �̸�, �μ���, �Ի��� ,������ ,�޿��� ����϶�.
select e.employee_id, e.first_name||' '||e.last_name, d.department_name, e.hire_date,loc.city ,e.salary
from employees e, departments d, locations loc
where salary > (select avg(salary) from employees)
and e.department_id=d.department_id
and d.location_id = loc.location_id;

-- Q8) 10�� �μ� ����� �߿� 20�� �μ��� ����� ���� ������ �ϴ� ����� �����ȣ,����,�̸�,�μ���,�Ի���,�������� ����϶�.
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


-- Q9) 10�� �μ� �߿��� 30�� �μ����� ���� ������ �ϴ� ����� �����ȣ, ����, �̸�, �μ���, �Ի���, ������ ����϶�.
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

-- Q10) 10�� �μ��� ���� ���� �ϴ� ����� �����ȣ, ����, �̸�, �μ���ȣ, �μ���, ����, �޿��� ����϶�.
select e.employee_id, job_id, e.first_name||' '||e.last_name, e.department_id, d.department_name,loc.city, e.salary
from employees e join departments d
on e.department_id=d.department_id
join locations loc
on d.location_id = loc.location_id
and (job_id in (select job_id from employees where e.department_id=10));

-- Q11) 'Neena' Ȥ�� 'David'�� �޿��� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '|| last_name, salary
from employees
where salary in (select salary from employees where first_name='Neena' or (first_name='David' and last_name = 'Austin'));

-- Q12) �޿��� 30�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, salary
from employees
where salary >all (select salary from employees where department_id=30);

-- Q13) �޿��� 30�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, salary
from employees
where salary <all (select salary from employees where department_id=30);

-- Q14) �޿��� 90�� �μ��� ���� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select salary from employees where department_id=90;

select employee_id, first_name||' '||last_name, salary
from employees
where salary >any (select salary from employees where department_id=90);

-- Q15) �޿��� 90�� �μ��� �ְ� �޿����� ���� ����� �����ȣ, �̸�, �޿��� ����϶�.
select employee_id, first_name||' '||last_name, salary
from employees
where salary <any (select salary from employees where department_id=90);

-- Q16) ����̸��� �μ����� ����϶�.(��, �䳪 ������ ������� ���� �������� �� ��)
select e.first_name||' '||e.last_name, (select d.department_name from departments d where e.department_id=d.department_id)
from employees e;

select * from employees;
select * from departments;

create table emp as select * from employees;
create table dept as select * from departments
where 1=2;

create table loc as select * from locations;
create table job as select * from jobs;







