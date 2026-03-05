SELECT * FROM dept_tcl;

update DEPT_TCL
   SET loc = 'SEOUL'
 WHERE deptno = 50;

 DELETE FROM dept_tcl
  WHERE deptno = 60;

 INSERT INTO dept_tcl (deptno, dname, loc)
 VALUES (90, 'TEST', 'TEST');