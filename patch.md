# Patches are read from STDIN unless called with 2 arguments or -i

## patch file orig:

```sh
patch       < orig.patch # if orig can be deduced from within orig.patch
patch orig  < orig.patch
patch orig -i orig.patch
patch orig
   paste on STDIN
^d
patch orig orig.patch

patch orig.patch # WRONG: trying to patch orig.patch from STDIN
```

# Paths in hunks must correspond to real files

```diff
--- /home/user/project.pl
+++ /home/user/project.pl
```
```sh
# if user is unknown locally, remove /home/user by removing 3 leading /s
patch -p3 < project.patch
```

# Create a patch

```sh
diff -u orig new > orig.patch
        git diff > orig.patch
    svn di -x -u > orig.patch
```
