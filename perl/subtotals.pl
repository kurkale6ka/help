#! /usr/bin/env perl

use strict;
use warnings;

# hash of hashes:
#
# apples
#   +- blue => 3
#   +- red  => 1

my %db;

while (<DATA>)
{
   my ($col1, $col2) = split;
   $db{$col1}{$col2}++;
}

while (my ($key, $val_ref) = each %db)
{
   while (my ($key2, $val2) = each %$val_ref)
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
