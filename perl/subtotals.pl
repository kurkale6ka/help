#! /usr/bin/env perl

while (<DATA>)
{
   ($col1, $col2) = split;
   $db{$col1}{$col2}++;
}

while (($key, $val) = each %db)
{
   while (($key2, $val2) = each %$val)
   {
      printf "%8s: %d %s\n", $key, $val2, $key2;
   }
}

__DATA__
apples   blue
berries  red
tomatoes green
apples   red
apples   blue
berries  red
tomatoes green
berries  red
apples   blue
berries  green
