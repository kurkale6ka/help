```sql
SELECT ...
FROM Table1 JOIN Table2
ON id1=id2;
```

      (INNER) JOIN: records that have matching values in both tables
 LEFT (OUTER) JOIN: all from  left table, plus matched from right
RIGHT (OUTER) JOIN: all from right table, plus matched from  left
 FULL (OUTER) JOIN: all when there is a match in either
