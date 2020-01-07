#! /usr/bin/env perl

# List files in which a given pattern occurs after another pattern

use strict;
use warnings;

my $fh;

for my $file (`fd -tf -E'*~' '^httpd\.conf'`)
{
   chomp $file;
   open $fh, $file;
   while (<$fh>)
   {
      next if 1 .. /worker\.c/;
      next unless /^maxclients\s+(.+)/i;
      print "$file: $1\n";
      last;
   }
   close $fh;
}
