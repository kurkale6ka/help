# Broken link

```bash
ln -s ad.1 /man/man1/active-dir # /man/man1/: active-dir -> ad.1
```

We now have a broken link since `ad.1` isn't a valid path from within `man1/`,  
_ln_ stores the path we give literally, without any check

_Solution:_ use `~/ad.1` which is resolvable from within `man1/`

# Make sure we create a link named _man1_, NOT a link within a folder named `man1/`

```bash
ln -sT ~/ad.1 /man/man1 # /man/: man1 -> ~/ad.1
```

_Race condition:_ if `man1/` gets created before _ln_ finishes, ensure _ln_ fails, we don't want a link inside `man1/`

# We do now want our link to go inside `man1/`

```bash
ln -st /man/man1/ ~/ad.1 # /man/man1/: ad.1 -> ~/ad.1
```

_Race condition:_ if `man1/` gets deleted before _ln_ finishes, ensure _ln_ fails, we don't want a link named _man1_
