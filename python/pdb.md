# Start the debugger
- `python -mpdb code.py args...`
- `breakpoint()` in code
- set a br: `(Pdb) b line, condition`, list all: `(Pdb) b`

# Pdb repl
```python
  example.py(2)<module>()
-> print("one")

  example_1.py(4)get_abs_path()
-> print("two")

> example_2.py(5)get_path()    # file(line)function()
-> print(f"path = {filename}") # code where we paused (to be executed)
(Pdb)
```
- `w` will print the stack trace
- `u` will move a frame up in the stack trace ( `>` will move between `example|example_1|example_2`)
- `d` will move a frame down in the stack trace

# Move through code
```python
> example.py(7)<module>()
   for dir in dirs:
->     path = get_path()
   print("done")
(Pdb)
```
- `n` will continue to the _next_ **logical** line (next iteration in this example)
- `unt` will continue to a line greater than the current one (it will exit the loop here)
- `s` will _step_ inside `get_path()`
- `c` will _continue_ to the next breakpoint

# Show code
- print: `p`, `pp`
- list: `l`, `ll`, `l.` (recentre to current)
- monitor `<expr>` for changes: `display <expr>`, list all: `display`
