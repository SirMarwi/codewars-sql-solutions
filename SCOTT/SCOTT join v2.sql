 select
    e.ename,
    d.loc
from emp e inner join dept d
    on e.deptno = d.deptno
order by e.ename 