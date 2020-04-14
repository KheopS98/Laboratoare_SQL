--lab 3 ex 1
--luna in litere gates e exclus
--join employee cu employee
--inca un tabel de emplyee sa l gasim pe gates si dep lui
select ang.last_name, to_char(ang.hire_date, 'month-yyyy'),ang.employee_id,ang.department_id
from employees ang join employees gates on (ang.department_id = ang.department_id)
where lower(ang.last_name) like '%a%' and lower(gates.last_name) = 'gates'and lower(ang.last_name) != 'gates';


--lab 3 ex 2

select  distinct ang.employee_id, ang.last_name, ang.department_id, d.department_name

from employees ang join employees t on (ang.department_id = t.department_id)
join departments d on (ang.department_id = ang.department_id)
where lower(t.last_name)  like '%t%' and
ang.employee_id <> t.employee_id
order by ang.last_name;

--4,5,6 discutabile 
--7 , 8 ,9 rezolvate

--operatori pe multimi
--reuninule union
--reuninune cu dublicate union all
--intesectare intersect
-- diferenta minus
--sa concida nr de coloane si tipuri de date compatibile
-- ; se pune la sfarsit
--- ex operaorti pe multimi ex 10- .....
daca faacem reunuini si  nr de coloane nu e  identic putem adauga coalena cu  nul
select c1,c2,c3
from log1
union 
select c1,null, c2
from log2

select to_char (c3 number)
from log1
union
select c6 varchar
log2;

-- ex 10

select department_id 
from departments 
where lower(department_name) like '%re%'
union 
select department_id 
from employees
where upper(job_id) = 'SA_REP' and department_id is not null;

-- ex 11
--union all reuleaza mai rpd ca union
select department_id 
from departments 
where lower(department_name) like '%re%'
union all
select department_id 
from employees
where upper(job_id) = 'SA_REP' and department_id is not null;



-- 13
--cand avem SI in enenunt aveam operatorul INTERSECT
select department_id 
from departments 
where lower(department_name) like '%re%'
intersect
select department_id 
from employees
where upper(job_id) = 'HR_REP';

--ex 4,5,6 tema pt vineri
