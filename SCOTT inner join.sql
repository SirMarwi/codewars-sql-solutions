select
	e.ename,
	d.dname
from emp e inner join dept d 
	on e.deptno = d.deptno