no strict;

for 111..999 -> $i
{
   for $i..999 -> $j
   {
      $mul=$i*$j;
      $pal max= $mul if $mul eq $mul.flip;
   }
}

say $pal;
