create table dept as select * from departments;
create table emp as select * from employees;
create table job as select * from jobs;

--PK 추가
ALTER TABLE DEPT MODIFY (DEPARTMENT_ID NOT NULL);
ALTER TABLE DEPT ADD CONSTRAINT DEPT_PK PRIMARY KEY (DEPARTMENT_ID)ENABLE;
ALTER TABLE EMP MODIFY (EMPLOYEE_ID NOT NULL);
ALTER TABLE EMP ADD CONSTRAINT EMP_PK PRIMARY KEY(EMPLOYEE_ID )ENABLE;
ALTER TABLE JOB MODIFY (JOB_ID NOT NULL);
ALTER TABLE JOB ADD CONSTRAINT JOB_PK PRIMARY KEY (JOB_ID)ENABLE;
--FK 추가
ALTER TABLE EMP ADD CONSTRAINT EMP_FK1 FOREIGN KEY
(DEPARTMENT_ID)REFERENCES DEPT(DEPARTMENT_ID )ENABLE;
ALTER TABLE EMP ADD CONSTRAINT EMP_FK2 FOREIGN KEY
(JOB_ID )REFERENCES JOB(JOB_ID )ENABLE;

select * from dept order by department_id asc;
select * from job order by job_id asc;
select * from emp order by employee_id desc;



CREATE OR REPLACE VIEW view_dept_emp AS
SELECT emp.employee_id, emp.first_name, emp.last_name, emp.email
, emp.phone_number, emp.hire_date, emp.job_id, emp.salary, emp.commission_pct
, emp.manager_id , emp.department_id , dept.department_name, dept.location_id
FROM dept
JOIN emp
ON dept.department_id = emp.department_id;

select * from view_dept_emp order by employee_id desc;

create or replace view view_job_emp as
select emp.employee_id, emp.first_name, emp.last_name, emp.email
, emp.phone_number, emp.hire_date, emp.job_id, job.job_title, job.min_salary, job.max_salary
, emp.salary, emp.commission_pct, emp.manager_id , emp.department_id
from job join emp
on job.job_id = emp.job_id;

select * from view_job_emp order by employee_id desc;