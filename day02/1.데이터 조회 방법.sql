-- 현재 날짜
-- dual은 테이블이 아님

SELECT sysdate FROM dual;

-- 고객정보 조회
-- 셀렉트 올 -> select *
-- * 전부 다

-- 셀렉션
SELECT * FROM EMPLOYEE;

SELECT * FROM department;

-- 프로젝션
SELECT emp_name, salary FROM employee; 

-- 두 테이블을 조인

SELECT * FROM EMPLOYEE e 
INNER JOIN DEPARTMENT d 
ON e.DEPT_ID = d.DEPT_ID;