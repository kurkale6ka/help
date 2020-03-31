# perl
for $i (111..999) { for $j ($i..999) { $mul=$i*$j; if ("$mul" eq reverse "$mul") { $pal = $mul if $mul > $pal }}} say $pal

# perl6
no strict
for 111..999 -> $i { for $i..999 -> $j { $mul=$i*$j; if $mul eq $mul.flip { $pal max= $mul }}}; say $pal
