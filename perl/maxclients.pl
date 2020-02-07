#! /usr/bin/env perl

# List files in which a given pattern occurs after another pattern

use strict;
use warnings;
use feature qw/say/;

my $fh;

for my $file (`fd -tf -E'*~' '^httpd\.conf'`)
{
   chomp $file;
   open $fh, $file;
   while (<$fh>)
   {
      next if 1 .. /worker\.c/;
      next unless /^maxclients\s+(.+)/i;
      say "$file: $1";
      last;
   }
   close $fh;
}
