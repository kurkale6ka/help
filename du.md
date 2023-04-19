# Disk usage

## basic
```bash
du -ah -d1
#   ││  └─ depth
#   │└─ human readable
#   └─ all files, not only dirs
```

> **Warning**
> ```bash
> du -sh * # .files/folders would be missed!
> #   └─ summarize (same as -d0)
> ```

## filtered and sorted
```bash
du -ah -d1 -t100m | sort -hr
#           │             └┴─ human, reverse
#           └─ min threshold
```

> **Note**
>
> with old versions of `du`/`sort`, use:<br>
> `du -a --max-depth 1 | sort -nr`

## filtered, sorted and pretty output
```bash
du -ah0 -d1 -t100m | sort -hrz | perl -0lane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'
```

> **Note**
> * `du`: remove/increase `-d1` in order to descend into directories
> * `du`: skip files/folders with `--exclude`
>
> with old versions of `du`/`sort`, use:
> ```bash
> du -a --max-depth 1 | sort -nr | head | perl -ane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'
> ```

# Total
`du -sh /folder`
