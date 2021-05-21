# Andrew’s Santa Claus Golf Apocalypse

## Hole 1 (head)
-p 11..& # call to undefined function

## Hole 2 (tail)
print+(<>)[~9..-1] # ~9 is -10

## Hole 3 (rev)
```perl
# while (<>) {
#   prefill $\ with all the lines in reverse order
# }
# {
#     ();
# }
# continue {
#   print $_;
#   then do a single print: 
# }
-p $\=$_.$\}{ # 

print reverse<>
```

## mid
-p0 $_=$1while/.(^.+)^/ms
@n=<>;print@n[$#n/2..@n/2]

## wc
-p }{$_=$.+1e9.$/^v1
printf"%010d\n",$.,<>
