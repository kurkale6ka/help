# Manual examples
```vim
%Ea:ar      " right align around :
%Ea\ arl    " align right then left affecting the first 2 spaces only - pyramid!
%Ea\ arl**  " same as above but repeat: rl rl ...
%Ea**\ arl  " same as above
%Ea\ arl*   " align right then always left
%Ea*\ arl   " same as above
%Ea,iu1     " align around , ignoring unmatched lines
%Ea*|       " align around all |s, not the 1st one only
%Ea*|<l0r2  " align around all |s, stick delimiter to the left with 0 margin before it and 2 after
%Ea*/=\+/dr " align around regexes with delimiters right aligned
```

_NB_: regarding the `arl**` and `arl*` examples above, the meaning of `*/**` is different than when not using `a` (see point 3. below)

1. `gaip`

2. Return key to select alignment mode (left, right, or center)

3. N-th delimiter (default: 1)
   - `2`  Around the 2nd occurrences of delimiters
   - `*`  Around all occurrences of delimiters
   - `**` Left-right alternating alignment around all delimiters
   - `-`  Around the last occurrences of delimiters (-1)
   - `-2` Around the second to last occurrences of delimiters

4. a) Predefined delimiter rule
```
<space> : General alignment around whitespaces
   =    : Operators containing equals sign ( =, ==, !=, +=, &&=, ...)
   :    : Suitable for formatting JSON or YAML
   .    : Multi-line method chaining
   ,    : Multi-line method arguments
   &    : LaTeX tables (matches & and \\)
   #    : Ruby/Python comments
   "    : Vim comments
   |    : Table markdown
   >    : Arrows (defined in $MYVIMRC)
```

   b) Or regex delimiter with `Ctrl-x` or `Ctrl-/`

# Interactive mode
```
Ctrl-f | filter          | [gv]/.*/? (limit lines around which we align)
Ctrl-i | indentation     | shallow, deep, none, keep
Ctrl-l | left_margin     | number or string (margin before delimiter)
Ctrl-r | right_margin    | number or string (margin after delimiter)
Ctrl-d | delimiter_align | left, center, right (the way we want the delimiter aligned)
Ctrl-a | align           | string: /[lrc]+\*{0,2}/
<left> | stick_to_left   | { 'stick_to_left': 1, 'left_margin': 0 }
       | stick to right  | set right margin to 0 while left aligning
<down> | *_margin        | { 'left_margin': 0, 'right_margin': 0 } (no margins around delimiter)
```

# Examples

- `Ctrl-a` with `llr*`
```
aa = bb = cc = dd = ee
a = b = c = d = e
aaa = bbb = ccc = ddd = eee

gaip * Ctrl-a llr* =

aa  = bb  =  cc =  dd =  ee
a   = b   =   c =   d =   e
aaa = bbb = ccc = ddd = eee
```

- Pyramid
```
aa bb
a b
aaa bbb

gaap ** <return> <space>
or
gaap Ctrl-a rl <space>

aa bb
a b
aaa bbb
```

_Note_: if aligning doesn't work, `:se ft&`
