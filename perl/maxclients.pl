#! /usr/bin/env perl

# List files in which a given pattern occurs after another pattern
#
# Ex:
# in httpd.conf find MaxClients when occuring after worker.c

use strict;
use warnings;
use feature 'say';

open my $find, '-|', qw/fd -tf -E*~ ^httpd\.conf/ or die "$!\n";

while (my $file = <$find>)
{
   chomp $file;
   open (my $fh, $file) or die "$!\n";
   while (<$fh>)
   {
      next if 1 .. /worker\.c/;
      next unless /^maxclients\s+(.+)/i;
      say "$file: $1";
      last;
   }
   close $fh;
}
