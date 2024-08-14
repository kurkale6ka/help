# Set a breakpoint
`breakpoint()`

# Move through code
- *n* will move to the _next_ logical line
- *unt* will move to a line greater than the current one (it will exit the loop)
- *s* will _step_ inside `get_path()`
- *c* will _continue_ to the next breakpoint
```python
   for dir in dirs:
->     path = get_path()
   print("done")
```
