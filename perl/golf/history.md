* [Andrew’s Santa Claus Golf Apocalypse](#santa)
    * [head](#head)
    * [tail](#tail)
    * [rev](#rev)
    * [mid](#mid)
    * [wc](#wc)

# Andrew’s Santa Claus Golf Apocalypse <a name="santa"></a>

## Hole 1 (head) <a name="head"></a>
```perl
-p 11..& # call to undefined function
```

## Hole 2 (tail) <a name="tail"></a>
```perl
print+(<>)[~9..-1] # ~9 is -10
```

## Hole 3 (rev) <a name="rev"></a>
```perl
# while (<>) {
#   # prefill $\ with all the lines in reverse order
# }
# {
#   ();
# }
# continue {
#   print $_; # then do a single print
# }
-p $\=$_.$\}{

print reverse<>
```

## Hole 4 (mid) <a name="mid"></a>
```perl
-p0 $_=$1while/.(^.+)^/ms
@n=<>;print@n[$#n/2..@n/2]
```

## Hole 5 (wc) <a name="wc"></a>
```perl
-p }{$_=$.+1e9.$/^v1 # binary xor ^
printf"%010d\n",$.,<>
```
