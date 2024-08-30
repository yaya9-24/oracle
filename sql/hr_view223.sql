-- 부서+사원 조인=뷰-view_dept_emp
select employee_id,first_name,last_name,salary,d.department_id,department_name
from emp e join dept d
on e.department_id = d.department_id;

CREATE or replace VIEW VIEW_DEPT_EMP
AS select employee_id,first_name,last_name,salary,d.department_id,department_name
from emp e join dept d
on e.department_id = d.department_id;


-- 업무+사원 조인=뷰-view_job_emp
select employee_id,first_name,last_name,salary,j.job_id,job_title
from emp e join job j
on e.job_id = j.job_id;

create or replace view view_job_emp as
select employee_id,first_name,last_name,salary,j.job_id,job_title
from emp e join job j
on e.job_id = j.job_id;