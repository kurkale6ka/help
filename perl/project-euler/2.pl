#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $sum = 0;

sub fib
{
   my ($a, $b) = @_;
   $sum += $a unless $a % 2;
   return unless $a <= 4_000_000;
   fib ($b, $a + $b);
}

fib 1, 1;

say $sum;
