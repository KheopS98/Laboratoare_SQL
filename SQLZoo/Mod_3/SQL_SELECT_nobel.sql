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
Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.
*/

SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'Physics' AND yr = 1980) OR (subject = 'Chemistry' AND yr = 1984);

Problema 9.
/* 
Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
*/

SELECT yr, subject, winner 
FROM nobel
WHERE subject NOT IN('Chemistry', 'Medicine') AND yr = 1980;

Problema 10.
/*
Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together
with winners of a 'Literature' prize in a later year (after 2004, including 2004).
*/

SELECT yr, subject, winner 
FROM nobel
WHERE (lower(subject) = 'medicine' AND yr < 1910)  OR  (lower(subject) = 'literature' AND  yr >= 2004);

Problema 11.
/*
Find all details of the prize won by PETER GRÜNBERG

Non-ASCII characters
The u in his name has an umlaut. You may find this link useful https://en.wikipedia.org/wiki/%C3%9C#Keyboarding
*/

SELECT yr, subject, winner
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

Problema 12.
/*
Find all details of the prize won by EUGENE O'NEILL

Escaping single quotes
You can't put a single quote in a quote string directly. You can use two single quotes within a quoted string.
*/

SELECT yr, subject, winner
FROM nobel
WHERE winner = "EUGENE O'NEILL";

Problema 13.
/*
List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.
*/

SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner;

Problema 14.
/*

*/





