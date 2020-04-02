no strict;
for 111..999 -> $i { for $i..999 -> $j { $mul=$i*$j; if $mul eq $mul.flip { $pal max= $mul }}}; say $pal
