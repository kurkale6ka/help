# ; in ranges
```vim
1
2
3
4    oge
5    [cursor]
6
7    oge
8
9

2,/oge/p " find the next occurrence of oge starting from the cursor's position
         " range printed: 2-7

2;/oge/p " find the next occurrence of oge starting from 2
         " range printed: 2-4

:h:;
```

# Buffer loading
```vim
:bun unload,           " :ls :ls!
:bd  unload,           "  ✗  :ls!
:bw  unload, del marks "  ✗   ✗
```

# Clipboard
```vim
cb^=unnamed     " y/d/c go to "" and "*
cb^=unnamedplus " y/d/c go to "" and "+
```

# for wasavi
`se is ic nu report=0 ai`

# Commands on range
```vim
:g    " exe ex commands on range
:norm " exe normal mode commands on range
      " use instead of :g/patt/norm when patt on adjacent lines
```

macro that updates every line in sequence - use one of the above

# `gf` and `'includeexpr`
`'includeexpr'` is used for gf if an unmodified file name can't be found
the problem is gf will always "find" and try to open an http(s):// URL,
which means `'includeexpr'` will never get a chance to modify it!

_Note_: disabling netrw doesn't help

_workaround_: `nmap <buffer> gf :e <cfile>:s###<cr>`

# Open a file by only changing some part in its PATH
`:e%:p:s/development/integration/`

# vimball
Invalid range fix: add newline to the end of file

# Generate a range of lines matching a pattern
```vim
function! easy#PipeRange(includepat) range

   let top = a:firstline
   let bot = a:lastline

   " No range has been given (top == bot), thus apply range extension logic
   if a:includepat != '' && top == bot
      if top < 0 || top > line('$') || getline(top) !~ a:includepat
         return
      endif
      " Extend range upwards while we match the pattern
      while top > 1 && getline(top-1) =~ a:includepat
         let top -= 1
      endwhile
      " Extend range downwards while we match the pattern
      while bot < line('$') && getline(bot+1) =~ a:includepat
         let bot += 1
      endwhile
   endif

   let lines = map(range(top, bot), 'getline(v:val)')

endfunction
```
