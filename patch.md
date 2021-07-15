# Hunks are read from STDIN or a patch file

## Patch one or many files

The filename can be omitted if it can be deduced from within the hunks.  
It must be omitted when patching multiple files.

_These 3 commands are equivalent:_
```sh
patch [pf.conf] -i pf.patch # --input
```
```sh
patch [pf.conf] < pf.patch
```
```sh
patch [pf.conf]
   paste on STDIN
^d
```

## Patch a single file
```sh
patch pf.conf pf.patch
```

# Paths in hunks must correspond to real files

```diff
--- /home/user/project.pl
+++ /home/user/project.pl
```
```sh
# if user is unknown locally, remove /home/user by stripping 3 leading /s
patch -p3 < project.patch
```

*_NB_*: relative paths in hunks need `-p0`

# Create a patch

```sh
diff -u orig new > orig.patch
        git diff > orig.patch
    svn di -x -u > orig.patch
```
