Problema 1.
/*
Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.
*/

SELECT * FROM city
WHERE population > 100000 AND countrycode = 'USA';


Problema 2.
SELECT name FROM city 
WHERE population > 120000 AND countrycode = 'USA';

Problema 3.
DESC city;
SELECT * FROM city;

Problema 4.
SELECT * FROM city
WHERE ID = 1661;

Problema 5.
SELECT * FROM city
WHERE countrycode = 'JPN';

Problema 6.
SELECT name FROM city
WHERE countrycode = 'JPN';



