-- scott 계정!

SELECT deptno
     , job
     , count(*)
  FROM emp
 GROUP BY deptno, job
 ORDER BY deptno;

-- ROLLUP 첫번째 컬럼의 값으로 소계, 전체 총계를 도출

SELECT deptno, job
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY ROLLUP(deptno, job)
 ORDER BY deptno;

SELECT deptno, job
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY ROLLUP(deptno), job
 ORDER BY deptno;

SELECT deptno, job
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY deptno, ROLLUP(job)
 ORDER BY deptno;

-- 각각의 컬럼별로 소계 전체 총계를 도출

SELECT deptno, job
     , count(*)
     , MAX(sal)
     , AVG(sal)
  FROM emp
 GROUP BY CUBE(deptno, job)
 ORDER BY deptno;

-- GROUPING SETS - 차후
-- GROUPING 함수: SELECT절에 GROUPING 적용
-- 실무에서는 각 그룹(다중행)함수에 별명을 지정사용

SELECT deptno, job
     , count(*) AS "직원수"
     , max(sal) AS "최고 급여"
     , avg(sal) AS "최소 급여"
     , GROUPING(job) AS "JOB_GRID"
     , GROUPING(deptno) AS "DEP_GRID"
     , GROUPING_ID(deptno, job) AS "DEP_JOB_GRID"
  FROM EMP
 GROUP BY CUBE(deptno, job)
 ORDER BY deptno;
  
-- PIVOT
-- 부서별, 직책별로 그룹화 최고 급여 조회, PIVOT없이 일반적

SELECT deptno, job, MAX(sal)
  FROM EMP
 GROUP BY deptno, job
 ORDER BY deptno, job;

-- PIVOT 함수 사용

SELECT *
  FROM (SELECT deptno, job, sal
          FROM EMP) --subquery
 PIVOT (MAX(SAL) FOR deptno IN (10, 20, 30))
  ORDER BY job;

-- PIVOT 몰라도 CASE - WHEN으로 구현 가능

