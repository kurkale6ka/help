# Variables
Variables are pointers to objects and objects can be of arbitrary data type,  
thus variables cannot have types associated with them

```python
x = 11, y = x
id(x) == id(y) # True: y is x
```

# Quotes
`'` and `"` are equivalent

# Tips
In interactive mode, the last printed expression is assigned to `_`

## comprehensions
whenever a list needs to be modified in a loop (e.g with `.append()`/`.remove()`),  
assess if using a comprehension wouldn't be easier/clearer

## misc
```python
# 1.
str.index # raises  ValueError ~
str.find  # returns -1

# 2.
if 'yellow' in colors: # shorter/easier than
any(c == 'yellow' for c in colors)

# 3. check map/filter
filter(str.isalpha, text)

# 4.
return True if a > b else False # True if True False if False :-)
return a > b                    # just return the boolean expression
```

## sequences
```python
zip('abs', '@&$') # strings are sequences
<=>
zip(['a', 'b', 's'], ['@', '&', '$'])
-------------------------------------
list(...) => [('a', '@'), ('b', '&'), ('s', '$')]
```

## packing
```
  packing: assign to *t, we get a single tuple
unpacking:       use *t, we get all items
```

# Decorators
Pass my function to a _decorator_ function, so it can apply it AND add extra  
functionality, then return a new function to replace my initial one:

```python
my_func = decorator(my_func) # which is what happens with:

@decorator
my_func(...)
```

so now `my_func` executes:
* own code
* _decorator_'s code, which is part of `my_func` now

# Iterators
- iterables implement `__iter__` to return an _iterator_
- an _iterator_ implements `__next__` to get elements + raises `StopIteration`
- a _generator_ helps to create an _iterator_ thanks to the `yield` statement

## generator expression
`(n**2 for n in seq)`:
* create items as needed => little RAM, infinite sequences
* iterate once, no access to list methods

## list comprehension
`[n**2 for n in seq]`:
* create whole list in RAM

## itertools
`islice()` parameters act similarly to `range()`'s ones,  
the difference is we get an _iterator_, not a range.

```python
groupby(iterable, key=None) # define a key per item (identity by default)
                            # -> (key1, iterator1), ..., (keyN, iteratorN)

operator.itemgetter(0) # same as lambda g: g[0]
```

# Regex
- `^match`
- `^fullmatch$`
- `/search/`
- `findall` -> list/groups

# Resource vs Client in AWS SDK boto3
https://stackoverflow.com/questions/42809096/difference-in-boto3-between-resource-client-and-session

# Virtual environments
Create isolated working copies of python with their own site packages

```bash
python3 -mvenv .venv
. .venv/bin/activate
# pip installs
deactivate
```

**NB**: else use: `pip install --user ...`
