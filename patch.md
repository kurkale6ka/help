# Hunks are read from STDIN or a patch file

## patch a file named `orig`

```sh
# STDIN
# orig can be omitted if it can be deduced from within the hunks
patch orig < orig.patch
patch orig
   paste on STDIN
^d

# Patch file
patch orig orig.patch
patch -i orig.patch

# WRONG
# trying to patch orig.patch from STDIN
patch orig.patch
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

# Create a patch

```sh
diff -u orig new > orig.patch
        git diff > orig.patch
    svn di -x -u > orig.patch
```
