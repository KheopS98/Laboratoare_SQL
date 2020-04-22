Problema 1
/*
AVG ignora null ? 
  - DA
count ignira ?  
  - DA
*/

SELECT ROUND(sum(commission_pct)/COUNT(employee_id),2)
FROM EMPLOYEES;


 Problema 2.

 SELECT MIN(salary) Minim, MAX(salary) Maxim,
       SUM(salary) Suma, ROUND(AVG(salary)) Media
FROM   EMPLOYEES



Problema 5
/*
Să se determine numărul de angajaţi care sunt şefi. Etichetati coloana “Nr. manageri”.
*/                                  

SELECT COUNT(DISTINCT manager_id) Manageri
FROM EMPLOYEES;



Problema  7
/*
Scrieţi o cerere pentru a se afişa numele departamentului, locaţia, numărul de angajaţi şi salariul mediu pentru angajaţii
din acel departament. Coloanele vor fi etichetate corespunzător.
*/
                                   
--Caz Gresit
SELECT department_name,location_id,COUNT(employee_id) nr,
ROUND(AVG(salary),2) medie
from EMPLOYEES JOIN departments using(department_id)
GROUP BY department_name,location_id;

--Caz Corect


Problema 8
/*
Să se afişeze codul şi numele angajaţilor care câstiga mai mult decât salariul mediu din firmă. 
Se va sorta rezultatul în ordine descrescătoare a salariilor. 
*/

SELECT employee_id,last_name,AVG(salary) medie
FROM EMPLOYEES
-- WHERE filtreaza liniile.
GROUP BY employee_id,last_name,salary
-- Clauza  HAVING imi filtreaza grupurile.
HAVING salary>avg(salary);


Problema 10
/*
Pentru departamentele in care salariul maxim depăşeşte 3000$, să se obţină codul, numele acestor departamente
şi salariul maxim pe departament.
                                   
*/
SELECT department_id, department_name, max(salary)
FROM EMPLOYEES JOIN departments using(department_id)
--WHERE max(salary)>3000 Fundamental GRESIT!!!
GROUP BY department_id, department_name
HAVING max(salary)>3000;


Problema 14
/*
Să se obtina codul, titlul şi salariul mediu al job-ului pentru care salariul mediu este  minim. 
*/
SELECT job_id, job_title, AVG(salary) medie
FROM EMPLOYEES JOIN jobs using(job_id)
GROUP BY job_id, job_title
HAVING AVG(salary) = (SELECT MIN(AVG(salary))
                      FROM EMPLOYEES
                      GROUP BY job_id);

-- SAU
SELECT job_id,job_title,AVG(salary) medie
FROM EMPLOYEES JOIN jobs using(job_id)
GROUP BY job_id,job_title
HAVING AVG(salary)=(SELECT min(avg(salary))
                    FROM EMPLOYEES
                    GROUP BY job_id);

/*27
 * sub cerer in select = o valoare(1linie, 1 coloana)
 * sub in from = doar nesinc
	- grija la col folosita in join
	- col calc in from primesc nume
*/
Problema 27
/*
Scrieţi o cerere pentru a afişa job-ul, salariul total pentru job-ul respectiv pe departamente 
 si salariul total pentru job-ul respectiv pe departamentele 30, 50, 80.
Se vor eticheta coloanele corespunzător. Rezultatul va apărea sub forma de mai jos:  
       Job             Dep30          Dep50   Dep80      Total       
 */
SELECT c1, (subcerere),c3
FROM tabel;

SELECT department_id,job_id Job, 
 (SELECT sum(salary)
  FROM EMPLOYEES
  WHERE department_id=30 AND job_id=e.job_id) Dep30,
   (SELECT sum(salary)
  FROM EMPLOYEES
  WHERE department_id=50 AND job_id=e.job_id) Dep50,
   (SELECT sum(salary)
  FROM EMPLOYEES
   WHERE department_id=80 AND job_id=e.job_id) Dep80,
SUM(salary) total
FROM EMPLOYEES e
GROUP BY department_id, job_id
GROUP BY department_id, job_id;




