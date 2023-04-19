# Disk usage

```bash
du -ah -d1
#   ││  └─ depth
#   │└─ human readable
#   └─ all files, not only dirs
```

du -sh *
        \
         .files/folders would be missed!

du -ah -d1 -t100m | sort -hr
     \       \
      \       min 100M
       include files

# pretty
du -ah0 -d1 -t100m | sort -hrz | perl -0lane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'

notes:
* remove/increase -d1 in order to descend into directories
* skip files/folders with --exclude

# total
du -sh /etc
     \
      same as -d0

## old versions of du/sort
du -a --max-depth 1 | sort -nr

# pretty
du -a --max-depth 1 | sort -nr | head | perl -ane 's:^\./:: for @F; print shift @F, " ", `ls -d --color "@F"`'
