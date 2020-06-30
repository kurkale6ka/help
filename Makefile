# Rule
target: prerequisites (sub targets)
<tab>recipe # uses prerequisites to make the target

# substitute variables for the above
$@: $<
	@echo compiling...
	${CC} ...

.DEFAULT_GOAL := the 1st target, often called 'all'

.PHONY: all clean # not actual files, run regardless of mtime

-include Makefile # '-' for no errors

# this is a 1 line recipe thus we need the ;s
# $$ is used as $variables are valid in Makefiles
setup:
	@for d in *.db; \
         do \
            [[ -f $$d ]] && ln -sf "$${d%.db}" "$${d%.db}.in"; \
         done

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

privileges.c mtime has changed => rebuild
privileges.o => relink
hack
