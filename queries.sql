Get even numbered records from a table
select * from emp where rowid in (select decode(mod(rownum,2),0,rowid, null) from emp);

Get Odd numbered records from a table
select * from emp where rowid in (select decode(mod(rownum,2),0,null ,rowid) from emp);

Get 3rd max salary from employees table
select distinct sal from emp e1 where 3 = (select count(distinct sal) from emp e2 where e1.sal <= e2.sal);

Get 3rd min salary 
select distinct sal from emp e1 where 3 = (select count(distinct sal) from emp e2where e1.sal >= e2.sal);

To find last n records from a table
select * from emp minus select * from emp where rownum <= (select count(*) - &n from emp);

find departments where there are no employees:
select * from dept a where not exists (select * from emp b where a.deptno = b.deptno);
