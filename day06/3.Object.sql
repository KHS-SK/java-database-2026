-- 객체

-- 인덱스

SELECT *
  FROM user_indexes;

SELECT *
  FROM user_tables; -- 스키마 SYS 내 위치

-- USER_OBJECTS, USER_RULES, USER_TABLES, USER_INDEXES, USER_VIEWS

SELECT *
  FROM dictionary
 WHERE table_name LIKE 'USER_%'
 ORDER BY table_name;

-- 인덱스 생성
-- IDX(인덱스 접두어)_테이블_인덱스 컬럼

CREATE INDEX IDX_EMP_SAL
    ON emp(sal);

-- 인덱스 삭제

DROP INDEX idx_emp_sal;

-- 뷰

CREATE VIEW VW_EMP_20
    AS (
		SELECT empno, ename, job, deptno
		  FROM emp
		 WHERE deptno = 20);

SELECT * FROM vw_emp_20;

SELECT *
  FROM vw_emp_20 v, dept d
 WHERE v.deptno = d.deptno;

-- 삭제

DROP VIEW VW_EMP_20;

-- 뷰2

CREATE OR REPLACE VIEW vw_dept_all
	AS (SELECT * FROM dept);

SELECT * FROM vw_dept_all;

INSERT INTO vw_dept_all (deptno, dname, loc)
 VALUES ('90', 'TEST', 'NONE');

COMMIT;

-- 시퀀스
-- 생성

CREATE SEQUENCE SEQ_BOARD
START WITH 1     -- 보통 1부터 시작
INCREMENT BY 1   -- 보통 1씩 증가
MAXVALUE 9999999 -- 또는 NOMAXVALUE까지 가면 끝.
NOCYCLE          -- MAXVALUE까지 가면 끝. CYCLE - MAX까지가면 다시 1
NOCACHE;

-- 게시판 테이블 생성

CREATE TABLE boardtbl (
    board_id    NUMBER(7)    PRIMARY KEY,
    title       VARCHAR2(200)    NOT NULL,
    writer      VARCHAR2(50)     NOT NULL,
    contents    VARCHAR2(4000),
    regdate     DATE DEFAULT SYSDATE
);

-- 현재 시퀀스 확인

SELECT seq_board.currval FROM dual;