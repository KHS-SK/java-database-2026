-- 예외처리
DECLARE	
	v_wrong NUMBER;
BEGIN
	SELECT dname INTO v_wrong
	FROM dept
	WHERE deptno = 10;
EXCEPTION
--	WHEN value_error THEN
--		dbms_output.put_line('예외처리 : 수치/값 오류 발생');
	WHEN OTHERS THEN
		dbms_output.put_line('예외처리 : 기타 오류 발생');
		dbms_output.put_line('SQLCODE: ' || TO_Char(SQLCODE));
		dbms_output.put_line('SQLERRM: ' || SQLERRM);
END;
