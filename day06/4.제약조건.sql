-- 제약조건

-- 1. NOT NULL

CREATE TABLE tbl_nn(
	login_id	varchar2(20) NOT NULL,
	login_pwd	varchar2(20) NOT NULL,
	tel			varchar2(20)
);

SELECT * FROM tbl_nn;

INSERT INTO tbl_nn (login_id, login_pwd, tel)
VALUES ('hugo95', '12345', NULL);

INSERT INTO tbl_nn (login_id, login_pwd, tel)
VALUES ('ashely', NULL , '010-9999-6666');

INSERT INTO tbl_nn (login_id, login_pwd)
VALUES ('hugo', '12345');

INSERT INTO tbl_nn (login_pwd, tel)
VALUES ('99999' , '010-3456-0000');

UPDATE tbl_nn SET
  login_pwd = NULL
 WHERE login_id = 'hugo95';

ALTER TABLE tbl_nn
RENAME CONSTRAINT SYS_C008531 TO NN_tblnn_loginid;

-- 제약조건 삭제 (노 실행)

ALTER TABLE tbl_nn
DROP CONSTRAINT NN_tblnn_loginid;

-- 2. UNIQUE 중복을 허용 안함

CREATE TABLE TBL_UNQ   (
	login_id   varchar2(20) UNIQUE,
	login_pwd  varchar2(20) NOT NULL,
	tel		   varchar2(20)
);

INSERT INTO TBL_UNQ (login_id, login_pwd, tel)
VALUES ('hugo95', '12345', NULL);

INSERT INTO TBL_UNQ (login_id, login_pwd, tel)
VALUES (null, '12345', '010-9999-0000');

SELECT * FROM tbl_unq;

-- 3.PRIMARY KEY, UNIQUE에 NOT NULL

CREATE TABLE TBL_PK   (
	login_id   varchar2(20) PRIMARY KEY,
	login_pwd  varchar2(20) NOT NULL,
	tel		   varchar2(20)
);

INSERT INTO TBL_PK (login_id, login_pwd, tel)
VALUES ('hugo95', '12345', NULL);

INSERT INTO TBL_PK (login_id, login_pwd, tel)
VALUES (null, '12345', '010-9999-0000');

SELECT * FROM TBL_PK;

-- PK 생성 2
-- 하나 이상의 컬럼에 PK를 지정할 때 방법

CREATE TABLE TBL_INFO (
	idx   NUMBER,
	code  NUMBER,
	cnt	  varchar2(20),
	regdate  DATE DEFAULT sysdate,
	CONSTRAINT pk_tbl_info PRIMARY KEY (idx, code)
);

INSERT INTO tbl_info (idx, code, cnt)
VALUES (1, 10, 'test1');

INSERT INTO tbl_info (idx, code, cnt)
VALUES (1, 20, 'test1');

INSERT INTO tbl_info (idx, code, cnt)
VALUES (2, 10, 'test1');

SELECT * FROM tbl_info
 WHERE idx = 1
   AND code = 10;

-- 4. Foreign key - 타 테이블의 PK와 연관짓는 제약조건

SELECT * FROM dept;
SELECT * FROM emp;

-- FK를 참조하는 열에 존재하지 않는 데이터 입력

INSERT INTO emp (empno, ename, deptno)
VALUES (9999, '홍길동', NULL);

INSERT INTO emp (empno, ename, deptno)
VALUES (9998, '홍길순', 90);

UPDATE emp
SET deptno = 90
WHERE ename = '홍길순';