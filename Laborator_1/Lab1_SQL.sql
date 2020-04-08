/*
CE ESTE UN SGBD?
    - Softwaare care asigura interactiunea cu o baza de date.
    - Asigura :  
        -- Interactiunea cu baza de date.
        -- Permite Definirea , Consultarea si Actualizarea datelor din Baza de Date.
*/
-----------------------------------------------------------------------------------------------
/*
CE ESTE SQL?
    - Este un limbaj neprocedural pentru interogarea si prelucrarea informatiilor din Baza de Date.
    - Compilatorul SQL genereaza automat o procedura care acceseeaza Baza de  Date si executa comanda dorita.
    - SQL permite Definirea, Actualizarea cat si Interogarea datelor cat si controlul acestora.
    - Comenzile SQL pot fi integrate in programre scrise in alte limbaje precum : Cobol, Java, C++ etc.
*/
-----------------------------------------------------------------------------------------------
/*
CARE SUNT LIMBAJELE SQL? 
    - Acestea se imprat in mai multe categorii:
        -- LIMBAJUL DE DEFINIRE A DATELOR(LDD - Language Data Definition):
            --- CREATE :
                CREATE nume_tabel;
            --- ALTER : 
                ALTER nume_tabel;
            --- DROP :
                DROP nume_tabel;
        
        -- LIMBAJUL DE PRELUCRARE A DATELOR (LMD - Language Data Manipulation) : 
            --- INSERT 
                INSERT INTO nume_tabel(n1_col, n2_col, n3_col ) VALUES (m, k , j);
            --- UPDATE
                UPDATE TABEL SET nume_coloana = valoare;
            --- DELETE 
                DELETE nume_coloana;
            --- SELECT 
                SELECT * FROM nume_tabel;
                
        -- LIMBAJUL DE CONTROL AL  DATELOR (LCD - Language Data Control) :
            --- COMMIT; - commit or push into the database
            --- ROLLBACK; -- rollback take last commit;
*/

-----------------------------------------------------------------------------------------------

/* Retunraza coloanele tabelului solicitat si tipul de date al acestora.
Syntaxa: DESC nume_tabel;
*/
DESC departments;
-----------------------------------------------------------------------------------------------

/*
1.  S? se listeze con?inutul tabelelor din schema considerat?, afi?ând valorile tuturor
câmpurilor.
*/
DESC REGIONS;
SELECT * FROM REGIONS;

DESC COUNTRIES;
SELECT * FROM COUNTRIES;

DESC LOCATIONS;
SELECT * FROM LOCATIONS;

DESC DEPARTMENTS;
SELECT * FROM DEPARTMENTS;

DESC EMPLOYEES;
SELECT * FROM EMPLOYEES;

DESC JOBS;
SELECT * FROM JOBS;

DESC JOB_HISTRORY;
SELECT * FROM JOB_HISTORY;

-----------------------------------------------------------------------------------------------

/*
2.  S? se afi?eze codul angajatului, numele, codul job-ului, data angajarii. Ce fel de
opera?ie este aceasta (selec?ie sau proiec?ie)?.
    Sytaxa: SELECT N1 AS nume1 ,N2 AS nume2 ,N3 as  nume3 FROM nume_tabel;
*/

SELECT 
employee_id as Cod_Angajat ,
last_name as Nume_Angajat,
job_id as Cod_job,
hire_date as Data_Ang
FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------

/*
3.  S? se listeze, cu Si fArA duplicate, codurile job-urilor din tabelul EMPLOYEES.
    Syntaxa: SELECT DISTINCT N1, N2,N3 FROM nume_tabel;
    INTREBARE?
        DISTINCT se aplica pentru toate coloanele mentionate in select sau doar o anumita coloana? 
        RASP : DA PENTRU TOATE COLOANELE OBLIGATORIU PENTRU CA NR DE DATE REZULTAT NU TREBUIE SA DIFERE.
    INTREBARE? 
    DISTINCT = UNIQUE
    
*/
SELECT job_id as Cod_jobs
FROM EMPLOYEES;

SELECT DISTINCT job_id as Cod_jobs
FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------

/*
4.  S? se afi?eze numele concatenat cu job_id-ul, separate prin virgula si spatiu, si
etichetati coloana “Angajat si titlu”.
    TIP: Concatenare in comparatie cu alte limbaje nu se face cu opreatorul '+', se face cu ||
    TIP: MENTIONAREA UNOR ALIASURI SE POATE FACE CU AJUTORUL KEY(AS):
        - In cazul in care cerem doar un singur cuvant se poate folosi ' ' (single_quotes)
        - In cazul in care dorim mai n>1 cuvinte se pot folosi " "
        EX: 
        SELECT valoare1 as Alias_nume FROM nume_tabel;
        SELECT valoare1 ,valoare2 "Alias cu mai multe cuvinte" FROM TABEL;
        
    INTREBARE?
        SPRE EX: Avem 4 coloane, col 1 (un alias), col 2,3(alias grupat), col 4 (un alias)
    INTREBARE?
    
      RASP:
    SELECT last_name || salary "sursa 1" , first_name AS "Prim nume"
    FROM employees;
*/
SELECT last_name || ' , ' || job_id "Angajat si Titlu"
FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------

/*
5. Creati o cerere prin care sa se afiseze toate datele din tabelul EMPLOYEES. Separa?i
fiecare coloan? printr-o virgul?. Etichetati coloana ”Informatii complete”.
    INTREBARE?
        Acest EX se putea rezolva cumva fara sa enumer toate coloanele? Sau doar prin folosirea lui SELECT *  "Informatii Complete" FROM EMPLOYEES;;
    INTREBARE?
    

*/

DESC EMPLOYEES;
SELECT employee_id || ' , ' || first_name|| ' , ' || last_name || ' , ' || email || ' , ' || phone_number|| ' , ' ||
hire_date || ' , ' || job_id || ' , ' || salary || ' , ' || commission_pct || ' , ' || manager_id 
|| ' , ' ||department_id "Informatii Complete"
FROM EMPLOYEES;


-- SELECT * "Informatii Complete" FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------

/*
6. Sa se listeze numele si salariul angaja?ilor care câ?tig? mai mult de 2850 $.
    INTREBARE?
       Din nou revin cu aceasi intrebare cum as putea sa atribui un alias intregului SELECT ?
       In cazul de fata singurul alias pe care il returnez este pentru SALARY "Salariu Angajat"
    INTREBARE?
    
    RASP:
    SELECT last_name || salary "sursa 1" , first_name AS "Prim nume"
    FROM employees;
*/

SELECT last_name,salary "Salariu Ang > 2850$"
FROM EMPLOYEES 
WHERE salary > 2850;

-----------------------------------------------------------------------------------------------

/*
7. S? se creeze o cerere pentru a afi?a numele angajatului ?i num?rul departamentului
pentru angajatul nr. 104.
*/
SELECT  last_name,job_id 
FROM  EMPLOYEES
WHERE employee_id = 104;

-----------------------------------------------------------------------------------------------

/*
8. S? se afi?eze numele ?i salariul pentru to?i angaja?ii al c?ror salariu nu se afl? în
domeniul 1500-2850$.
*/
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary BETWEEN 1500 AND 2850;
--sau
SELECT last_name, salary
FROM EMPLOYEES
WHERE salary >= 1500 and salary <= 2850;
-- TEST APARTENENTA [NOT] BETWEEN Val_1 AND Val_2

-----------------------------------------------------------------------------------------------

/*
9.
Sa se afiseze numele, job-ul si data la care au început lucrul salaria?ii angaja?i între 20 Februarie 1987 si 1 Mai 1989. 
Rezultatul va fi ordonat cresc?tor dup? data de început.
    INTREBARE?
       no rows selected ?? Nu prea imi dau seama daca am gresit acest SELECT
    INTREBARE?
*/


SELECT last_name, job_id, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '20-FEB-1987' AND '1-MAY-1989'
ORDER BY hire_date ASC;

-----------------------------------------------------------------------------------------------

/*
10. S? se afi?eze numele salaria?ilor ?i codul departamentelor pentru toti angaja?ii din
departamentele 10 ?i 30 în ordine alfabetic? a numelor.
    TIP :  Apartenenta la o multime de valori finita se poate realiza cu EXPRESIE IN(val_1, val_2,val_n)

*/
DESC EMPLOYEES;
SELECT last_name, department_id
FROM  EMPLOYEES
WHERE department_id IN (10,30)
ORDER  BY department_id;

SELECT last_name, department_id
FROM  EMPLOYEES
WHERE department_id NOT IN (10,30)
ORDER  BY department_id;
-----------------------------------------------------------------------------------------------

/*
11. S? se afi?eze numele ?i salariile angajatilor care câ?tig? mai mult de 3500 $ ?i
lucreaz? în departamentul 10 sau 30. Se vor eticheta coloanele drept Angajat si Salariu
lunar.

*/
SELECT last_name || ' , ' ||  salary "Angajat si Salariu" 
FROM  EMPLOYEES
WHERE department_id IN(10,30) AND salary >= 3500;

-----------------------------------------------------------------------------------------------

/*
12. Care este data curent?? Afi?a?i diferite formate ale acesteia.
    Afisarea Dateo curente din pc se afiseaza cu SYSDATE
    DUAL ??
*/
SELECT SYSDATE FROM DUAL;
DESC DUAL;

-----------------------------------------------------------------------------------------------

/*
13. Sa se afiseze numele ?i data angaj?rii pentru fiecare salariat care a fost angajat in
1987. Se cer 2 solu?ii: una în care se lucreaz? cu formatul implicit al datei ?i alta prin
care se formateaz? data.
*/

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE (‘%87%’); -- NU MERGE DC ? 

SELECT first_name, last_name, hire_date
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'YYYY') = '1987'; -- NU MERGE FARA ' '

-----------------------------------------------------------------------------------------------

/*
14. S? se afi?eze numele ?i job-ul pentru to?i angaja?ii care nu au manager.

*/
SELECT last_name , job_id
FROM  EMPLOYEEs
WHERE manager_id = null;

SELECT last_name , job_id
FROM  EMPLOYEEs
WHERE manager_id IS NOT NULL;

select * from employees;

-----------------------------------------------------------------------------------------------

/*
15. Sa se afiseze numele, salariul si comisionul pentru toti salariatii care castiga
comisioane. Sa se sorteze datele in ordine descrescatoare a salariilor si comisioanelor.

*/

SELECT last_name, salary, commission_pct
FROM EMPLOYEES
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

-----------------------------------------------------------------------------------------------

/*
16. Elimina?i clauza WHERE din cererea anterioar?. Unde sunt plasate valorile NULL în
ordinea descresc?toare?
    RASP: LA SFARSIT
*/

SELECT last_name, salary, commission_pct
FROM EMPLOYEES;

-----------------------------------------------------------------------------------------------

/*
17. S? se listeze numele tuturor angajatilor care au a treia liter? din nume ‘A’.
SUBSTR( string, start_position [, length ] )
SELECT LAST_NAME FROM EMPLOYEES WHERE SUBSTR(FIRST_NAME, 2, 3) = 'o';
*/
--Mai bine decat exemplu cu like
SELECT last_name AS "A-3a litera A"
FROM  EMPLOYEES
WHERE SUBSTR( last_name, 3,1) = 'a';

--OR

SELECT last_name AS "A-3a litera A"
FROM  EMPLOYEES
WHERE last_name LIKE '__a%';

-----------------------------------------------------------------------------------------------

/*
18. S? se listeze numele tuturor angajatilor care au 2 litere ‘L’ in nume ?i lucreaz? în
departamentul 30 sau managerul lor este 101.
*/

SELECT  last_name 
FROM EMPLOYEES
WHERE last_name LIKE '%l%l%' AND (department_id =30 OR manager_id = 101);

SELECT  last_name 
FROM EMPLOYEES
WHERE last_name LIKE '%l%l%';

-----------------------------------------------------------------------------------------------

/*
19. S? se afiseze numele, job-ul si salariul pentru toti salariatii al caror job con?ine ?irul
“clerk” sau “rep” si salariul nu este egal cu 1000, 2000 sau 3000 $. (operatorul NOT IN)
*/
SELECT job_id FROM EMPLOYEES;

SELECT last_name, job_id,salary
FROM EMPLOYEES
WHERE (job_id LIKE '%clerk%' OR job_id LIKE '%rep%') AND salary NOT IN(1000,2000, 3000);

-----------------------------------------------------------------------------------------------

/*
20. S? se afiseze numele, salariul si comisionul pentru toti angajatii al caror salariu este
mai mare decat comisionul (salary*commission_pct) marit de 5 ori.
*/
SELECT last_name, salary, commission_pct, 5*(salary*commission_pct) "Salariu marit de 5 ori"
FROM EMPLOYEES
WHERE salary > 5*(salary*commission_pct);
-----------------------------------END------------------------------------------------------------------------------------------
/*
SAGEATA DE LA EMPLOYEE LA EL INSUSI, EX CA SA VAD CARE ESTE SEFUL UNNUI ANAGAT SI SEFUL LA RANDUL LUI TREBUIE SA FIE UN ANG
*/
