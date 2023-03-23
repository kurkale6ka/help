```sh
cd ~/.mozilla/firefox/g3iwn869.default
sqlite3 places.sqlite
```

```sql
sqlite> .databases
sqlite> .tables
sqlite> .schema moz_places
sqlite> SELECT url FROM moz_places WHERE url LIKE '%dailymotion%broca%';
sqlite> SELECT url FROM moz_places WHERE url LIKE '%ulozto%medved%';
```
