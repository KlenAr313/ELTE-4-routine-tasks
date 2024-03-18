select abs(-1.5) from dual;
select ceil(123.45), ceil(-123.45), floor(123.45), floor(-123.45) from dual;

select exp(3) from dual;
select log(10,100) from dual;
select ln(100) from dual;

select mod(12345,3) from dual;
select mod(12347,3) from dual;

select round(163.45) from dual;
select round(163.54) from dual;

select round(163.456,2) from dual;
select round(163.45,-2) from dual;

select trunc(163.45) from dual;
select trunc(163.456,2) from dual;
select trunc(163.45,-2) from dual;

select power(10,2) from dual;

select sqrt(100) from dual;

select sin(1) from dual;


select chr(100) from dual;
select ascii('Hello') from dual;
select chr(72) from dual;

select concat('alma','fa') , 'alma'||'lekvár' from dual;


select initcap('alma fa') from dual;

select lower('AlMaFa'),  upper('AlMaFa') from dual;
select lower('NeSZe NeKed'),  upper('NeSZe NeKed') from dual;


select lpad('szia',12,'xyz') , rpad('szia',12,'xyz') from dual;
select lpad('szia',3,'xyz') , rpad('szia',3,'xyz') from dual;

select lpad('szia',6),rpad('szia',6) from dual;
select lpad('szia',6),rpad('szia',6) x from dual;

select lpad('123',15,'*') , lpad('123',15,'0') from dual;

select ltrim('xxyzyyyyyyzyzzyszia','xyz'), rtrim('sziaxxzzzyzy','xyz') from dual;

select trim('         szia        ') from dual;

select trim('         szia       ') x from dual;
select trim('  ez egy mondat        ') x from dual;
select length(trim('      szia     ')) from dual;

select substr('kutyafüle',6,3) from dual;

select substr('kutyafüle',6) from dual;

select substr('kutyafüle',-6,3) from dual;

select substr('kutyafüle',-6) from dual;
select substr('kutyafüle',-6,-3) from dual;

select instr('0011101100110001001010100100','10') from dual;

select instr('0011101100110001001010100100','10',10) from dual;

select instr('0011101100110001001010100100','10',5,6) from dual;

select instr('0011101100110001001010100100','2') from dual;

select instr('0011101100110001001010100100','10',5,10) from dual;
select instr('0011101100110001001010100100','10',5,15) from dual;
select instr('0011101100110001001010100100','00',1,5) from dual;
-------------------------------------------------------------------------
select current_date from dual;
select current_timestamp from dual;
select sysdate from dual;
select systimestamp from dual;


select current_date+5 from dual;
select current_date+5.7 from dual;
select current_date+270 from dual;
select ADD_MONTHS(current_date,9) from dual;

select extract(year from CURRENT_TIMESTAMP) from dual;

select extract(minute from CURRENT_TIMESTAMP) from dual;
select extract(timezone_region from CURRENT_TIMESTAMP) from dual;

select extract(year from sysdate) from dual;

select extract(minute from sysdate) from dual;
select extract(minute from systimestamp) from dual;



SELECT MONTHS_BETWEEN
       (TO_DATE('02-02-2020','MM-DD-YYYY'),TO_DATE('01-30-2021','MM-DD-YYYY') ) "Months"
  FROM DUAL;

SELECT MONTHS_BETWEEN
       (TO_DATE('01-30-2021','MM-DD-YYYY'),TO_DATE('02-02-2020','MM-DD-YYYY') ) "Months"
  FROM DUAL;
  
SELECT MONTHS_BETWEEN
       ('18-máj.-30','17-febr.-2') "Months"
  FROM DUAL;
SELECT next_day('21-márc.-23','hétfõ') holnap  FROM DUAL;

SELECT last_day('21-márc.-23')   FROM DUAL;

select ename,sin(sal) eredmény from emp;


select 1+1 from dual;
select to_number('1') +to_number('1') from dual;

select '1'||'1' from dual;

select '1'+'1' from dual;
select 'a'+'1' from dual;


select '1'+1 from dual;
select 'a'+1 from dual;
select 'a'||1 from dual;
select '1e1'+1 from dual;
select '1e2'+1 from dual;

select to_char(1)||to_char(1) from dual;
select to_char(current_date)||0 from dual;

select to_char(current_date,'year') from dual;
select to_char(current_date,'YEAR') from dual;
select to_char(current_date,'Year') from dual;
select to_char(current_date,'mon') from dual;
select to_char(current_date,'Mon') from dual;
select to_char(current_date,'MON') from dual;
select to_char(current_date,'Day') from dual;
select to_char(current_date,'Dy') from dual;

select to_char(current_date,'D') from dual;
select to_char(current_date,'DD') from dual;
select to_char(current_date,'DDD') from dual;

select to_char(current_date,'HH') from dual;
select to_char(current_date+.5,'HH24') from dual;

select to_char(current_date,'day') from dual;

select to_char(current_date,'day') from dual where to_char(current_date,'day')='kedd';
select to_char(current_date,'day') from dual where to_char(current_date,'day')='kedd     ';
select to_char(current_date,'day') x from dual;

select to_char(12345,'000999999') x from dual;
select to_char(12345,'000000999999') x from dual;
select to_char(12345678,'09999') x from dual;

select sysdate from dual;
select to_date('2021-03-17','YYYY-MM-DD') from dual;
select to_date('21.03.17','DD.MM.YY') from dual;
ALTER SESSION SET NLS_DATE_FORMAT ='YYYY-MON-DD';
ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;
ALTER SESSION SET NLS_DATE_FORMAT ='YY-Mon-DD';
ALTER SESSION SET NLS_DATE_LANGUAGE = ENGLISH;

select to_date('17-DEC.-17','DD-Mon-YY') from dual;
ALTER SESSION SET NLS_DATE_LANGUAGE = HUNGARIAN;

select * from emp;



select * from emp;
select ename,job from emp;
select ename,length(job) from emp;
select ename,length(job) hossz from emp;


select ename, job,case job
        when 'PRESIDENT' then 'Elnök'
        when 'CLERK' then 'Titkár'
        else 'egyéb'
        end  eredmény from emp;

select ename,job, case 
        when job='PRESIDENT' then 'Elnök'
        when job='CLERK' then 'Titkár'
        else 'egyéb'
        end  from emp;

select ename,sal,case 
      when sal<1000 then 'kevés'
      when sal<3000 then 'közepes'
      else 'sok'
      end from emp;
select * from(
select ename,sal,case 
      when sal<1000 then 'kevés'
      when sal<3000 then 'közepes'
      else 'sok'
      end  eredmény from emp) where eredmény='kevés';
      
select ename,job,decode(job,'PRESIDENT','Elnök','CLERK', 'Titkár', 'egyéb') eredmény from emp;
select job,decode(job,'PRESIDENT','Elnök','CLERK', 'Titkár', 'SALESMAN','Üzletkotõ') eredmény
from emp;
select ename,decode(job,'PRESIDENT','Elnök','CLERK', 'Titkár') eredmény
from emp;
select ename,decode(kifejezés0,kifejezés1,kifejezés1_új,
kifejezés2,kifejezés2_új[,nemkötelezõ alapérték] ) oszlopnév
from emp;
select 1+1 from dual;
select 1*null from dual;
select 'hello'||null from dual;

select ename,sal,comm,sal+comm from emp;

select ename,sal,comm,sal+comm from emp where comm is not null
union
select ename,sal,comm,sal+0 from emp where comm is null;

select ename,sal,comm,sal+nvl(comm,0) from emp;

select ename,sal,comm,sal+nvl(comm,-500) from emp;
select ename,sal,comm,sal+coalesce(comm,0) from emp;

select coalesce(a,b,c,-1) from dual;

select * from sz;
insert into sz values(null,'banán');
insert into sz values('null','barack');

select * from sz;
select N from sz;
select NVL(N,'AKÁRKI') from sz;

select ename , vsize(ename),sal,vsize(sal) from emp;
select user from dual;

SELECT UID FROM DUAL;

-----------------------------------------------------
select * from emp;

select ename from emp;
select rownum,ename from emp;
select rownum,ename,job,sal from emp;

select rownum,* from emp;


select rownum,emp.* from emp;

select rownum,emp.* from emp where rownum<=5;


select rownum,emp.* from emp where rownum=5;


select * from (select rownum,emp.* from emp) where rownum=5;
select * from (select rownum x ,emp.* from emp) where x=5;


select rownum,emp.* from emp where rownum<=5;

select rownum,emp.* from emp where rownum<=4;


select rownum,emp.* from emp where rownum<=5
minus
select rownum,emp.* from emp where rownum<=4;

select * from (select rownum x,emp.* from emp) where x=5;

select rowid,emp.* from emp;


select * from sz order by 1;
select * from (select * from sz order by 1) where rownum=1;



select n from sz order by 1
union
select ename from emp order by 1;


select n from sz 
union
select ename from emp order by 1;

-------------------------------------------------
select * from emp;
select level szint,empno,ename,mgr from emp
connect by mgr = prior empno
start with job='PRESIDENT';

select level szint,empno,ename,mgr from emp
connect by empno = prior mgr
start with ename='ADAMS';

select level szint,empno,ename,mgr from emp
connect by prior mgr = empno
start with ename='ADAMS';

-- Adjuk meg az ORAUSER.VAGYONOK tábla alapján KAIN unokáinak az össz-vagyonát.
select * from nikovits.vagyonok;
SELECT   SUM(vagyon) -- LPAD(' ', 4*(LEVEL-1)) || nev, apja, vagyon
FROM nikovits.vagyonok
WHERE LEVEL = 3
START WITH  nev='KAIN'
CONNECT BY  PRIOR nev = apja;

SELECT * FROM nikovits.vagyonok;
SELECT level,nev,apja FROM nikovits.vagyonok connect by prior nev=apja 
start with nev='ADAM';
  
SELECT level,nev,apja FROM nikovits.vagyonok connect by prior nev=apja 
start with nev='KAIN';

SELECT level,nev,apja,vagyon,varos FROM nikovits.vagyonok 
where level=3
connect by prior nev=apja 
start with nev='KAIN';

SELECT sum(vagyon),avg(vagyon) FROM nikovits.vagyonok 
where level=3
connect by prior nev=apja 
start with nev='KAIN';

