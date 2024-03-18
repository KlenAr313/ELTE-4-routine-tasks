select distinct n from Sz
minus
select distinct n from (
	select distinct * from Sz
	minus
	select distinct * from (select distinct n from Sz)
			cross join
			(select distinct gy from Sz where n='Micimackó')
);

select distinct n from Sz where gy='alma' intersect select distinct n from Sz where gy='dió';

select distinct n from (
	select * from Szm
	minus
	select szm1.n , szm1.gy , szm1.m from Szm szm1, Szm szm2 where szm1.m < szm2.m
) x;

select * from emp;

select count (SAL), count (COMM), count (SAL + COMM), count(*) from emp;

select * from emp natural join dept;    