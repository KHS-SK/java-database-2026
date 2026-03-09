-- DML트리거 AFTER 테이블 생성

CREATE TABLE emp_trg_log (
	tablename varchar2(20),   -- dml이 수행된 테이블 명
	dml_type varchar2(10),
	empno number(4),
	user_name varchar2(30),
	change_date DATE 		  -- dml 수행한 일시
);
