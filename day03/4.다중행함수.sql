-- sum 합산 함수

SELECT SUM(SALARY)
  FROM EMPLOYEE;

-- 아무 의미 없음
SELECT SUM(DEPT_ID)
  FROM EMPLOYEE;

-- 각 레코드(한 줄, 로우, 행)로 개수를 구할 수 있음
SELECT count(*)
  FROM EMPLOYEE;

-- 특정 컬럼의 갯수로 구할 수 있음
SELECT count(DISTINCT dept_id)
  FROM EMPLOYEE;

-- salary 합산 616,943
-- salary 개수 97
-- 전체 데이터 100

SELECT AVG(SALARY)
  FROM EMPLOYEE;

SELECT MIN(SALARY), MAX(SALARY)
  FROM EMPLOYEE;

-- min, max는 날짜도 가능

SELECT MIN(HIRE_DATE), MAX(HIRE_DATE)
  FROM EMPLOYEE;

SELECT MIN(EMP_NAME), MAX(EMP_NAME)
  FROM EMPLOYEE;
