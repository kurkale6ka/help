```bash
cmd1 | xargs cmd2
```

execute cmd2 on cmd1's output lines in bulk (and in parallel with `-P0`)

```bash
printf '%s ' 1 2 3 4 | xargs -n2 # default command is echo
# 1 2
# 3 4
```
