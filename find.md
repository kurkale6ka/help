# Examples

```bash
find . -name '*.gz' -delete
find . -name '*.gz' -exec rm {} + # means 'in bulk', {} must precede +

find /usr -perm -o=r -print   # permissions
find /tmp -mtime +30 -print   # modification time
find . ! -user dimitar -print # user
```

# Exclude stuff

`find [path] [conditions to prune] -prune -o [usual conditions] -print`

`-name goo -prune` without a `-print`, includes an explicit `-print`:
only files or directories matching _goo_ are printed, but not descended, thus a
second folder goo under the first one won't be printed

`-type d -name goo -prune -o -print`:
because of the explicit `-o -print`: we either exclude (without printing) or
print when we don't exclude
