-- 1번 문제 | 사원의 이름과 부서 이름을 같이 조회하세요.

-- 전체 사원 이름: EMP - EMP_NAME
-- 부서 이름: DEPT - DEPT_NAME

SELECT e.emp_name, d.dept_name
  FROM emp e, dept d
 WHERE e.dept_id = d.dept_id;

SELECT *
  FROM emp;

SELECT *
  FROM dept;

-- 2번 문제 | DEV 부서에 속한 사원의 이름과 급여를 조회하시오.

-- 전체 사원 이름: EMP - EMP_NAME
-- DEV 부서의 아이디: DEPT - DEPT_ID
-- DEV 부서 사원의 급여 조회: EMP - SALARY

SELECT d.dept_id, e.emp_name, e.salary
  FROM dept d, emp e
 WHERE e.dept_id = d.dept_id
   AND d.dept_id = 10;

-- 3번 문제 | 부서별 사원 수를 조회하시오.

-- 부서별 사원 번호: DEPT - DEPT_ID
-- 사원 전체 데이터: EMP
-- 

SELECT e.dept_id, count(*) AS EMP_COUNT
  FROM dept d, emp e
 WHERE e.dept_id = d.dept_id
 GROUP BY e.dept_id 
 ORDER BY e.dept_id;

-- 4번 문제 | 전체 평균 급여보다 높은 급여를 받는 사원을 조회하시오.

SELECT e.emp_name, e.salary
  FROM emp e
 WHERE salary > (SELECT avg(salary)
  		 		   FROM emp);


-- 5번 문제 | 프로젝트에 참여하는 사원의 이름과 프로젝트 이름을 조회하시오.

-- 모든 사원의 이름은 EMP - EMP_NAME에 있음
-- 프로젝트 이름은 PROJECT - PROJ_NAME에 있음

SELECT *
  FROM emp;

SELECT *
  FROM dept;

SELECT *
  FROM project;

SELECT *
  FROM emp_project;

SELECT e.emp_name, p.proj_name
  FROM emp e, project p
 WHERE e.dept_id = p.dept_id;


