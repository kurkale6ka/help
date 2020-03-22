#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';

my $sum = 0;

for my $i (1..999)
{
   $sum += $i unless ($i % 3 and $i % 5);
}

say $sum;
