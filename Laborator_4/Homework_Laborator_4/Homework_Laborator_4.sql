-- Ce este Gresit 
SELECT * FROM EMPLOYEES LEFT JOIN departments ON (column1) WHERE B.column2=10; 

SELECT * FROM A tab1 LEFT JOIN B tab2 ON (tab1.column1 = tab2.colum2) WHERE B.column2=10; 




--Sa se afiseze codul, numele departamentului si numarul de angajati pentru departamentele in care lucreaza mai putin de 4 angajati. 


select department_id, department_name, count(employee_id)
from employees join departments using(department_id)
group by department_id, department_name
having count(employee_id) <= 4
ORDER BY department_id;

--dep care nu au  ang ? 

select department_id, department_name, count(employee_id)
from employees right outer join departments using(department_id)
group by department_id, department_name
having count(employee_id) < 4
ORDER BY department_id;