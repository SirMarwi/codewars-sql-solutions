select
	d.dname,
	e.ename
from dept d left outer join emp e 
 on d.deptno = e.deptno