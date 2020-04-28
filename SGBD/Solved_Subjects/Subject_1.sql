/*INTALNIRE_2 PREGATIRE SAPTAMANA 28/2/2020 */
--------------------------------------------------------------------------------------------------------------------------------
Subiect DIRECTOR NU POATE LUCRA PE UN UTILAJ MAI MIC DE 100000

Problema 1
-- SE CERE O FUNCTIE CARE PRIMESTE CA PARAMETRU O DATA SI UN NUMBER SI RETURNEAZA CHELTUIELITE PE SALARII SI UTILAJE PE LUNA RESPECTIVA

create or replace function pb1(d1 date, cf number) return number is
s1 number;
s2 number;
begin
select nvl(sum(valoare),0) into s1
from (select distinct u.id_utilaj, valoare, data_achizitie,cod_firma
          from utilaj u join lucreaza l on (u.id_utilaj=l.id_utilaj)
          join angajat a on (l.cod_angajat=a.cod_ang)
          where cod_firma=cf and to_char(data_achizitie,'MM-YYYY')=to_char(d1,'MM-YYYY'));
          
select nvl(sum(salariu),0) into s2
from angajat
where cod_firma=cf;
return s1+s2;
end;
/*
- FOLOSIM NVL , DACA UNUL DINTRE SELECTURI AR INTOARCE NULL ATUNCI O VALAORE NULL + O VALOARE AR DA NULL
- ATUNCI INDIFERENT DACA UN SELECT INTOARCE NULL IN INLOCUIM CU 0 IAR VALOAREA PE CARE O INTOARCEM VA FI VALIDA.
*/
select pb1(to_date('02-05-2012'), 'dd-mm-yyyy'), 4) from dual;


PROBLEMA 2. 
/*       
INSERT IN TABELUL INFO DIN CARE O COLOANA ESTE DE TIP UTILAJE, MARE ATENTIE UITATE LA TYPESS

(A3, ((U3,7), (U4,7))
DESC INFO;
CREATE OR REPLACE TYPE UTILAJE IS TABLE OF PERECHE; 
    UTILAJE ESTE UN TABLOU DE TIP PERECHE
create or replace type pereche is object(id_u number, ore number);
    IAR PERECHE ESTE UN OBJECT FORMAT DINTR-UN ID NUMBER SI ORE NUMBER
*/

INSERT INTO INFO 
VALUES (101, UTILAJE(PERCHE(21,10)));
--     COD, UTILAJE_TABLOU(PERECHE_OBJECT(ID NUMBER, ORE NUMBER))




create or replace procedure pb2 is
aux utilaje; 
begin
for ang in (select * from angajat) loop
    select pereche(id_utilaj, sum(nr_ore)) bulk collect into aux
    from lucreaza
    where cod_angajat=ang.cod_ang
    group by cod_angajat, id_utilaj;
    insert into info
    values(ang.cod_ang,aux);
end loop;
end;


Problema 3.
/*
Se cere sa se creeze un trigger care sa nu lase un director sa lucreze pe un utilaj mai ieftin de 10.000$.
*/

INSERT INTO LUCREAZA
VALUES (301, 31,2,SYSDATE); 

create or replace trigger pb3
before insert or update of id_utilaj,cod_angajat on lucreaza
for each row
declare
 v_dir number:=0;
 v_val number:=0;
begin
select count(*) into v_dir
from firma
where director= :new.cod_angajat;

select valoare into v_val
from utilaj
where id_utilaj=:new.id_utilaj;
if v_dir>0 and v_val < 100000 then
  raise_application_error(-20457,'Directorul nu poate lucra pe acest utilaj');
end if;
end;
