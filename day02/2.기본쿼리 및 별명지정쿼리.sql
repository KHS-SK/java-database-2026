-- 품목 전체 열 출력 - 최초 조회

SELECT * 
  FROM product;

-- 풀목 전체 열 조회 2 - 실제 작업 시
SELECT prod_id, prod_name, price FROM product;

-- 품목 열이름을 변경하고 싶어요~
-- alias 1

SELECT prod_id AS "품목 아이디"
	 , prod_name AS "품목 명"
	 , price AS "가격"
  FROM product;

-- alias 2 - AS 키워드를 생략해도 됨

SELECT prod_id "품목 아이디"
	 , prod_name "품목 명"
	 , price "가격"
  FROM product;

-- alias 3 - 테이블 명을 동일하게 쓰면 (테이블 명.) 으로 컬럼을 지정해도 되고 안해도 됨

SELECT product.prod_id "품목 아이디"
	 , product.prod_name "품목 명"
	 , price "가격"
  FROM product;

-- alias 4 - 테이블 명에 별명을 지정하면, 컬럼 명 사용 시 반드시 (별명.)으로 사용해야 함

SELECT prd.prod_id "품목 아이디"
	 , prd.prod_name "품목 명"
	 , prd.price "가격"
  FROM product prd;

-- 별명 5
SELECT emp_id
	 , emp_name
	 , salary
	 , salary * 12 AS "ANNUAL_SALARY"
	 , hire_date
	 , dept_id
  FROM employee;