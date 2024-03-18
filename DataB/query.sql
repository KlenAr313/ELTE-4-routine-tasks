/*select distinct n from Sz
except
select distinct n from (
	select distinct * from Sz
	except
	select distinct * from (select distinct n from Sz) as x
			cross join
			(select distinct gy from Sz where n='Micimackó') as y
) as z*/

/*(select distinct n from Sz
except
select distinct n from (
	select distinct * from Sz
	except
	select distinct * from (select distinct n from Sz) as x
			cross join
			(select distinct gy from Sz where n='Micimackó') as y
) as z)

intersect

(select distinct n from Sz
except
select distinct n from (
	select distinct n from  Sz
	except
	select))*/
	
/*select distinct n from Sz where gy='alma' intersect select distinct n from Sz where gy='dió'*/

/*select distinct n from Sz where gy='alma' union select distinct n from Sz where gy='dió'*/

/*select distinct n from Sz where gy='alma' or gy='dió'*/

/*select distinct n from Sz where gy='alma' except select distinct n from Sz where gy='dió'*/

select distinct sz1.n from Sz as sz1, Sz as sz2 where sz1.n = sz2.n and sz1.gy != sz2.gy
