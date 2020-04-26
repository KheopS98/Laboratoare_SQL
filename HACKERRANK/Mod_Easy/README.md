<table>
  <caption><b>CITY</b></caption>
  <tr>
    <th>Field</th>
    <th>Type</th>
  </tr>
  
  <tr>
    <td>ID</td>
    <td>NUMBER</td>
  </tr>
  
  <tr>
    <td>NAME</td>
    <td>VARCHAR2(17)</td>
  </tr>
  <tr>
    <td>COUNTRYCODE</td>
    <td>VARCHAR2(3)</td>
  </tr>
  
  <tr>
    <td>DISTRICT</td>
    <td>VARCHAR2(20)</td>
  </tr>
  
  <tr>
    <td>POPULATION</td>
    <td>NUMBER</td>
  </tr>
</table>

## Problema 1
<p>Query <b>all columns</b> for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.</p>
<p><b>SOLUTION</b></p>
<pre><code>
SELECT * FROM city
WHERE population > 100000 AND countrycode = 'USA';
</code></pre>

<p><b>OUTPUT</b></p>

<pre>
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
</pre>

## Problema 2
<p>Query the <b>names</b> of all American cities in CITY with populations larger than 120000. The CountryCode for America is USA.</p>
<p><b>SOLUTION</b></p>
<pre><code>
SELECT name FROM city 
WHERE population > 120000 AND countrycode = 'USA';
</code></pre>

<p><b>OUTPUT</b></p>
<pre>
Scottsdale
Corona
Concord
Cedar Rapids
</pre>

## Problema 3
<p>Query <b>all columns (attributes)</b> for every row in the CITY table.</p>
<p><b>SOLUTION</b></p>
<pre><code>
DESC city;
SELECT * FROM city;
</code></pre>

<p><b>OUTPUT</b></p>
<pre>
6 Rotterdam NLD Zuid-Holland 593321 
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
4054 Fairfield USA California 92256 
4058 Boulder USA Colorado 91238 
4061 Fall River USA Massachusetts 90555 
</pre>

## Problema 4
<p>Query <b>all columns</b> for a city in CITY with the <b>ID</b> 1661.</p>
<p><b>SOLUTION</b></p>
<pre><code>
SELECT * FROM city
WHERE ID = 1661;
</code></pre>

<p><b>OUTPUT</b></p>
<pre>
1661 Sayama JPN Saitama 162472
</pre>

## Problema 5
<p>Query <b>all attributes</b> of every Japanese city in the CITY table. The <b>COUNTRYCODE</b> for Japan is JPN.</p>
<p><b>SOLUTION</b></p>
<pre><code>
SELECT * FROM city
WHERE countrycode = 'JPN';
</code></pre>

<p><b>OUTPUT</b></p>
<pre>
1613 Neyagawa JPN Osaka 257315 
1630 Ageo JPN Saitama 209442 
1661 Sayama JPN Saitama 162472 
1681 Omuta JPN Fukuoka 142889 
1739 Tokuyama JPN Yamaguchi 107078
</pre>

## Problema 6
<p>Query the <b>names</b> of all the Japanese cities in the CITY table. The <b>COUNTRYCODE</b> for Japan is JPN.</p>
<p><b>SOLUTION</b></p>
<pre><code>
SELECT name FROM city
WHERE countrycode = 'JPN';
</code></pre>

<p><b>OUTPUT</b></p>
<pre>
Neyagawa 
Ageo 
Sayama 
Omuta 
Tokuyama 
</pre>
<hr>
<br>

<table>
  <caption><b>STATION</b></caption>
  <tr>
    <th>Field</th>
    <th>Type</th>
  </tr>
  
  <tr>
    <td>ID</td>
    <td>NUMBER</td>
  </tr>
  
  <tr>
    <td>CITY</td>
    <td>VARCHAR2(21)</td>
  </tr>
  <tr>
    <td>STATE</td>
    <td>VARCHAR2(2)</td>
  </tr>
  
  <tr>
    <td>LAT_N</td>
    <td>NUMBER</td>
  </tr>
  
  <tr>
    <td>LONG_W</td>
    <td>NUMBER</td>
  </tr>
</table>
<p> Where <b>LAT_N</b> is the northern latitude and <b>LONG_W</b> is the western longitude. </p>

