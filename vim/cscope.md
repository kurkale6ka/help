# Generate `cscope.out`
`cscope -b -q -i <(find . -name '*.vim' -print)`

# Vim
```sh
cs add cscope.out
cs find s symbol
```
