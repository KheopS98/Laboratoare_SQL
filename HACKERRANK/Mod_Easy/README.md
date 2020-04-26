<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<table>
  <tr>
    <th>Field</th>
    <th>Type</th>
  </tr>
  <tr>
    <td>Alfreds Futterkiste</td>
    <td>Maria Anders</td>
  </tr>
</table>

## Problema 1
<p>Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.</p>
<p><b>SOLUTION</b></p>
<code>
SELECT * FROM city
WHERE population > 100000 AND countrycode = 'USA';
</code>
<p><b>OUTPUT</b></p>
<pre>
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
</pre>
