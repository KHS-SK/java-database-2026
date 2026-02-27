-- 문자열 함수
SELECT c.CUST_NAME 
     , lower(c.CUST_NAME) AS "고객명"
     , INITCAP(lower(c.CUST_NAME)) AS "고객명"
	 , c.CITY 
	 , upper(c.CITY) AS "도시명"
  FROM CUSTOMER c;

-- where절에도 사용가능
SELECT *
  FROM CUSTOMER c 
 WHERE lower(c.CITY) = 'seoul';

-- 문자열 길이
SELECT c.CITY, length(c.CITY) AS "글자길이"
  FROM CUSTOMER c;

-- 문자열 추출

SELECT e.EMP_NAME, SUBSTR(e.EMP_NAME, 4, 2)
  FROM EMPLOYEE e;

-- 문자열에서 찾기

SELECT INSTR('HELLO, ORACLE!', 'L') AS "첫번째 L의 위치"
     , INSTR('HELLO, ORACLE!', 'L', 5) AS "5번째 이후 L의 위치"
     , INSTR('HELLO, ORACLE!', 'L', 2, 2) AS "2번째 위치 이후 두번째에 나타나는 L위치"
  FROM dual;