for $i (111..999) { for $j ($i..999) { $mul=$i*$j; if ($mul eq reverse $mul) { $pal = $mul if $mul > $pal }}} say $pal
