# Rule
target: prerequisites
<tab>recipe # uses prerequisites to make the target

$@: $<
	${CC} ...

       .PHONY := all clean # not actual files, run regardless of mtime
.DEFAULT_GOAL := the 1st target, often called 'all'

Example

CC := gcc

hack: privileges.o intrusion.o
	linker ...

privileges.o: privileges.c
	${CC} ...

intrusion.o: intrusion.c
	${CC} ...

hack
    depends on
*.o
    which in turn depend on
*.c

.c mtime has changed =>
gcc will update the corresponding .o =>
linker will rebuild hack
