-- 1. 현재 반남되지 않은 책의 정보를 조회하시오.

-- 회원명 from membertbl
-- 책 제목 from bookstbl
-- 대여번호 & 대여일 from rentaltbl

SELECT *
  FROM bookstbl;

SELECT *
  FROM membertbl;

SELECT *
  FROM rentaltbl;

SELECT r.IDX AS "대여번호"
     , m.NAMES AS "회원명"
     , b.NAMES AS "책제목"
     , r.RENTALDATE AS "대여일"
  FROM BOOKSTBL B, MEMBERTBL M, RENTALTBL R
 WHERE r.MEMBERIDX = m.IDX
   AND r.BOOKIDX = b.IDX
   AND r.IDX IN (2, 4, 6, 12);

-- 2. 각 분류별 도서 수를 조회하시오.
-- 책이 한 권도 없는 분류도 포함하시오.  

-- 분류코드, 분류명 from DIVTBL
-- 도서수 from BOOKSTBL

SELECT *
  FROM DIVTBL;

SELECT *
  FROM BOOKSTBL;

SELECT DISTINCT d.DIVISION AS "분류코드"
     , d.NAMES AS "분류명"
     , count(b.DIVISION) AS "도서수"
  FROM DIVTBL d, BOOKSTBL b
 WHERE d.DIVISION = b.DIVISION(+)
 GROUP BY d.DIVISION, d.NAMES, b.DIVISION
 ORDER BY d.DIVISION;

-- 3. 대여 이력을 기준으로 가장 많이 대여된 책 순서대로 조회하시오. 

-- 책번호, 책제목 from BOOKSTBL
-- 대여횟수 = BOOKIDX from RENTALTBL

SELECT *
  FROM BOOKSTBL;

SELECT *
  FROM RENTALTBL;

SELECT b.IDX AS "책번호"
     , b.NAMES AS "책제목"
     , count(r.BOOKIDX) AS "대여횟수"
  FROM BOOKSTBL b, RENTALTBL r
 WHERE b.IDX = r.BOOKIDX
 GROUP BY b.IDX, b.NAMES, r.BOOKIDX
 ORDER BY count(r.BOOKIDX) DESC;

-- 대여횟수 다음으로 책번호 정렬을 어떻게 해야 할 지 모르겠어요..
  
-- 4. 회원 중 총 대여 횟수가 1회 초과인 회원을 조회하시오 

-- 회원번호, 회원명, 등급 from MEMBERTBL
-- 대여횟수 = BOOKIDK from RENTALTBL

SELECT m.IDX AS "회원번호", m.NAMES AS "회원명", m.LEVELS AS "등급", count(r.BOOKIDX) AS "대여횟수"
  FROM MEMBERTBL m, RENTALTBL r
 WHERE m.IDX = r.MEMBERIDX
 GROUP BY m.IDX, m.NAMES, m.LEVELS
HAVING count(r.BOOKIDX) > 1;

-- 5. 대여일보다 반납일이 더 빠른 이상 데이터를 조회하시오.

-- 대여번호, 대여일, 반납일 from RENTALTBL
-- 회원명 from MEMBERTBL
-- 책제목 from BOOKSTBL

SELECT *
  FROM BOOKSTBL;

SELECT *
  FROM MEMBERTBL;

SELECT *
  FROM RENTALTBL;

 SELECT r.MEMBERIDX AS "대여번호"
      , m.NAMES AS "회원명"
      , b.NAMES AS "책제목"
      , to_char(r.RENTALDATE, 'yyyy-mm-dd') AS "대여일"
      , to_char(r.RETURNDATE, 'yyyy-mm-dd') AS "반납일"
  FROM BOOKSTBL b, MEMBERTBL m, RENTALTBL r
 WHERE r.MEMBERIDX = m.IDX
   AND r.BOOKIDX = b.IDX
 GROUP BY r.MEMBERIDX, m.NAMES, b.NAMES, r.RENTALDATE, r.RETURNDATE
HAVING r.RENTALDATE > r.RETURNDATE;