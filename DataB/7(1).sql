drop table r;
drop table s;
create table r (x number,y number);
create table s (x number,y number);
insert into r values(1,2);
insert into r values(3,4);
insert into r values(1,2);
insert into r values(1,2);
insert into r values(1,2);
select * from r;
insert into s values(1,2);
insert into s values(7,8);
insert into s values(1,2);
select * from s;

-- Ismétlődések megszüntetése
select * from r;

select distinct * from r;

select unique * from r;

-- Összesítési műveletek
select sum(x) from r;
select sum(y) from r;

select avg(x) from r;
select avg(y) from r;

select min(x) from r;
select min(y) from r;

select max(x) from r;
select max(y) from r;

select count(x) from r;
select count(y) from r;

-- A csoportosítási művelet
select * from r;
select x from r group by x; -- select distinct x from r;
select x,sum(y),max(y) from r group by x;

-- A vetítés művelet kiterjesztése

select X,Y,x+y Z from r;

-- Rendezési művelet

select * from r order by x;





select * from r union select * from s;
select * from r intersect select * from s;
select * from r minus select * from s;
select * from r union all select * from s;

-- Külső összekapcsolások

select * from emp;
select * from dept;
select * from emp,dept;
select * from emp cross join dept;

select * from emp natural join dept;


select * from emp cross join dept where emp.deptno=dept.deptno;

select emp.deptno, dept.deptno from emp cross join dept where emp.deptno=dept.deptno;



select * from emp left outer join dept using(deptno);

select * from emp right outer join dept using(deptno);


select * from emp full outer join dept using(deptno);


select * from emp left outer join dept on(emp.deptno=dept.deptno);

select * from emp right outer join dept on(emp.deptno=dept.deptno);

select * from emp full outer join dept on(emp.deptno=dept.deptno);



select * from emp , dept where emp.deptno (+) =dept.deptno;

select * from emp , dept where emp.deptno =  dept.deptno (+);
select * from emp , dept where emp.deptno (+) =  dept.deptno (+);

select * from sz natural join dept;

select * from sz natural join (select * from sz);

select * from emp natural join (select * from emp);

select * from emp , (select * from emp);

select * from emp x, (select * from emp) y where x.empno=y.empno;
select * from emp x, (select * from emp) y where x.empno=y.empno and x.ename=y.ename and x.job=y.job and x.mgr=y.mgr;

select * from emp x, (select * from emp) y where x.empno=y.empno and x.ename=y.ename and x.job=y.job and x.mgr=y.mgr and x.comm=y.comm;


select * from emp;
select comm from emp;
select distinct comm from emp;

select comm,count(*) from emp group by comm;

