# psql

## set pager
`\setenv PAGER less`

### disable line wrapping
`-S` to chop lines in `less`

## check database activity
```sql
SELECT * FROM pg_stat_activity;
```
