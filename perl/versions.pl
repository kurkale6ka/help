#! /usr/bin/env perl

# Find max release
# by comparing maj, min and patch components in versions

use strict;
use warnings;
use feature 'say';

my @release = (0, 0, 0);

RELEASE: while (<DATA>)
{
   next unless /^\d+\.\d+\.\d+$/;

   chomp;
   my @rel = split /\./;

   # - maj (rel) = maj (release): continue with min component
   # - maj (rel) > maj (release): upgrade release, test next rel
   # - maj (rel) < maj (release): test next rel
   for my $i (0..$#release)
   {
      unless ($rel[$i] == $release[$i])
      {
         @release = @rel if $rel[$i] > $release[$i];
         next RELEASE;
      }
   }
}

my $release = join '.', @release;

say $release;

__DATA__

11.3.2
12.4.8
10.0.1
13.0.10
13.0.11
13.1.11
1.1.1
0.0.0
11.3.3
