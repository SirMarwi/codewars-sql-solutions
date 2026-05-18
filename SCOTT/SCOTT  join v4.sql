select
	e.ename,
	m.empno as mgr
from emp e left join emp m
	on e.mgr = m.empno