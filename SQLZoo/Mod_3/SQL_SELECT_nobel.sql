/*
nobel(yr, subject, winner)
*/

Problema 1.
/*
Winners from 1950.
*/

SELECT yr, subject, winner 
FROM nobel
WHERE yr = 1950;

Problema 2.
/*
Show who won the 1962 prize for Literature.
*/

SELECT winner
FROM nobel
WHERE yr = 1962 AND subject = 'Literature';

Problema 3.
/*
Show the year and subject that won 'Albert Einstein' his prize.
*/

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

Problema 4.
/*
Give the name of the 'Peace' winners since the year 2000, including 2000.
*/

SELECT winner 
FROM nobel
WHERE subject = 'Peace' AND yr >= 2000;

Problema 5.
/*
Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
*/

SELECT yr, subject, winner 
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

Problema 6.
/*
Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama
*/

SELECT yr, subject, winner 
FROM nobel
WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter' , 'Barack Obama');

Problema 7.
/*
Show the winners with first name John
*/

SELECT winner 
FROM nobel
WHERE winner LIKE 'John%';

Problema 8.
/*

*/








