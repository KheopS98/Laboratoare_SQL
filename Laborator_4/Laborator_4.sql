
--25 lab 4
--avg ignora null ? DA
select round(avg(commission_pct),2)
from employees;

select round(avg(nvl(commission_pct,0)),2)
from employees;

--count ignira ?  DA

select round(sum(commission_pct)/count(employee_id),2)
 from employees;


 Problema 2.

 SELECT MIN(salary) Minim, MAX(salary) Maxim,
       SUM(salary) Suma, ROUND(AVG(salary)) Media
FROM   employees;



problema 5 ->  numar de sefi 

select count(distinct manager_id) Manageri
from employees;

-----------------------------

Problema 6 
-------------------------------

Problema  7

--gresit
select department_name,location_id,count(employee_id) nr,
round(avg(salary),2) medie
from employees  join departments using(department_id)
group by department_name,location_id;

--corect


Problema 8

select employee_id,last_name,avg(salary) medie
from employees
-- where filtreaza linii
group by employee_id,last_name,salary
-- having clauza care imi filtreaza grupuri
having salary>avg(salary);


Problema 10

select department_id, department_name, max(salary)
from employees join departments using(department_id)
--where max(salary)>3000 Fundamental GRESIT!!!
group by department_id, department_name
having max(salary)>3000;

Problema 9




