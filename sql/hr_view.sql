-- 부서+사원 조인=뷰-view_dept_emp
CREATE OR REPLACE VIEW view_dept_emp AS
SELECT emp.employee_id, emp.first_name, emp.last_name, emp.email
, emp.phone_number, emp.hire_date, emp.job_id, emp.salary, emp.commission_pct
, emp.manager_id , emp.department_id , dept.department_name
FROM dept right JOIN emp
ON dept.department_id = emp.department_id;

select * from view_dept_emp order by employee_id desc;

-- 업무+사원 조인=뷰-view_job_emp
create or replace view view_job_emp as
select emp.employee_id, emp.first_name, emp.last_name, emp.email
, emp.phone_number, emp.hire_date, emp.job_id, job.job_title, job.min_salary, job.max_salary
, emp.salary, emp.commission_pct, emp.manager_id , emp.department_id
from job join emp
on job.job_id = emp.job_id;

select * from view_job_emp order by employee_id desc;

select job_id from job;